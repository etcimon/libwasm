///
module spasm.rt.allocator;

nothrow:

import stdx.allocator.building_blocks.bitmapped_block : BitmappedBlock;
import stdx.allocator.building_blocks.allocator_list : AllocatorList;
import stdx.allocator.building_blocks.null_allocator : NullAllocator;
import stdx.allocator.internal : Ternary;
import stdx.allocator.common : chooseAtRuntime,reallocate,alignedReallocate,roundUpToMultipleOf,platformAlignment,divideRoundUp,trailingZeros,roundUpToAlignment;
import std.typecons : Flag, Yes, No;

alias Destructor = void function(void*);

version (WebAssembly) {
  private __gshared void* begin, current, end;
  struct WasmAllocator {
    import spasm.intrinsics;
    import spasm.rt.memory : wasmPageSize;
    enum uint alignment = platformAlignment;

    nothrow:
    static __gshared typeof(this) instance = WasmAllocator();

    Ternary owns(void[] b) {
      return Ternary(b.ptr >= begin);
    }

    @trusted static void init(uint heap_base) {
      begin = cast(void*)(heap_base.roundUpToAlignment(alignment));
      current = begin;
      end = cast(void*)(wasmMemorySize * wasmPageSize);
    }

    void[] allocate(size_t n) {
      const rounded = n.roundUpToAlignment(alignment);
      if (current + rounded > end)
        grow(1 + rounded / wasmPageSize);
      void* mem = current;
      current += rounded;
      return mem[0..rounded];
    }

    // NOTE: temporary until we front this with a FreeTree
    bool deallocate(void[] data) {
      return true;
    }

    private void grow(size_t pages) {
      auto currentPages = wasmMemoryGrow(0);
      current = cast(void*)(currentPages * wasmPageSize);
      wasmMemoryGrow(pages);
      end = cast(void*)((currentPages + pages) * wasmPageSize);
    }
  }
} else version (D_BetterC) {
  import stdx.allocator.mallocator;
  alias WasmAllocator = Mallocator;
} else {
  struct WasmAllocator {
    enum uint alignment = platformAlignment;

    static __gshared typeof(this) instance = WasmAllocator();

    nothrow:
    auto owns(void[] b) {
      return Ternary.yes;
    }

    bool deallocate(void[] b) nothrow {
      return true;
    }

    void[] allocate(size_t n) nothrow {
      return new ubyte[n];
    }
  }
}

/**
   Returns `true` if `ptr` is aligned at `alignment`.
*/
@nogc nothrow pure bool alignedAt(T)(T* ptr, uint alignment)
{
  return cast(size_t) ptr % alignment == 0;
}

// NOTE: had to copy this from the BitmappedBlock
pure nothrow @safe @nogc
private auto totalBitmappedBlockAllocation(size_t capacity, size_t blockSize) {
  import spasm.ct : tuple;
  auto blocks = cast(uint)capacity.divideRoundUp(blockSize);
  auto leadingUlongs = blocks.divideRoundUp(64);
  import std.algorithm.comparison : min;
  immutable initialAlignment = min(platformAlignment,
                                   1U << min(31U, trailingZeros(leadingUlongs * 8)));
  auto maxSlack = platformAlignment <= initialAlignment
    ? 0
    : platformAlignment - initialAlignment;
  return tuple!("leadingUlongs", "blocks","bytes")(leadingUlongs, blocks, leadingUlongs * 8 + maxSlack + blockSize * blocks);
}

nothrow
auto initPool(size_t blockSize, size_t capacity) {
  import spasm.ct : tuple;
  auto poolSize = totalBitmappedBlockAllocation(capacity, blockSize);
  size_t metaDataSize = (PoolAllocator.MetaData.sizeof + poolSize.leadingUlongs * ulong.sizeof).roundUpToMultipleOf(platformAlignment);
  return tuple!("markerUlongs", "blocks", "memory", "metaDataSize")(poolSize.leadingUlongs, poolSize.blocks, WasmAllocator.instance.allocate(metaDataSize + poolSize.bytes), metaDataSize);
}

struct PoolAllocatorBacking {
  nothrow:
  void* pool;

  MarkResult mark(void* ptr) {
    // TODO; we can get the marking a little bit faster by precalculating all this stuff
    uint blockSize = (cast(uint*)pool)[0];
    uint blockCount = (cast(uint*)pool)[1];
    size_t leadingMarkerUlongs = blockCount.divideRoundUp(64);
    size_t offset = (PoolAllocator.MetaData.sizeof + leadingMarkerUlongs * ulong.sizeof).roundUpToMultipleOf(platformAlignment);
    void* startOfBitmappedBlock = pool + offset;
    auto vector = BitVector((cast(ulong*)(pool + PoolAllocator.MetaData.sizeof))[0..leadingMarkerUlongs]);
    void* startOfBlocks = startOfBitmappedBlock + leadingMarkerUlongs * ulong.sizeof;
    auto index = cast(uint)(ptr - startOfBlocks) / blockSize;
    auto wasSet = vector.markBit(index);
    // NOTE: it is actually a little faster not to take this information into account (but maybe not with bigger sized objects. For now we assume that is true.)
    return wasSet ? MarkResult.AlreadyMarked : MarkResult.WasUnmarked;
  }

  void freeUnmarked() {
    // TODO; we can get the marking a little bit faster by precalculating all this stuff
    auto meta = cast(PoolAllocator.MetaData*)pool;
    size_t leadingMarkerUlongs = meta.blocks.divideRoundUp(64);
    size_t offset = (PoolAllocator.MetaData.sizeof + leadingMarkerUlongs * ulong.sizeof).roundUpToMultipleOf(platformAlignment);
    void* startOfBitmappedBlock = pool + offset;
    ulong[] markers = (cast(ulong*)(pool + PoolAllocator.MetaData.sizeof))[0..leadingMarkerUlongs];
    ulong[] control = (cast(ulong*)startOfBitmappedBlock)[0..leadingMarkerUlongs];
    if (meta.destructor !is null) {
      destruct(markers, control, meta.destructor, meta.blockSize, pool + offset + control.length*ulong.sizeof);
    }
    control[] = markers[];
    markers[] = 0;
  }

  private void destruct(ulong[] markers, ulong[] control, Destructor destructor, uint blockSize, void* offset) {
    import mir.bitop : cttz;
    for(uint i = 0; i < markers.length; i++) {
      ulong toFree = markers[i] ^ control[i];
      while(toFree != 0) {
        auto lsbset = cttz(toFree);
        void* item = offset + blockSize * ((i*64) + (63 - lsbset));
        destructor(item);
        toFree = toFree & (toFree-1);
      }
    }
  }
}

enum MarkResult {
  WasUnmarked,
  AlreadyMarked
}

struct PoolAllocatorIndex {
  nothrow:
  void*[] addresses;
  uint lastFree = 0;

  private void ensureSpace() {
    if (addresses.length > lastFree)
      return;
    if (addresses.length == 0) {
      addresses = (cast(void**)WasmAllocator.instance.allocate(32 * (void*).sizeof).ptr)[0..32];
      return;
    }
    size_t n = (void*).sizeof * addresses.length * 2;
    void*[] biggerList = (cast(void**)WasmAllocator.instance.allocate(n).ptr)[0..addresses.length*2];
    biggerList[0..lastFree] = addresses[0..lastFree];
    WasmAllocator.instance.deallocate(addresses);
    addresses = biggerList;
  }

  bool owns(void* ptr) {
    if (addresses.length == 0)
      return false;
    return addresses[0] <= ptr;
  }

  MarkResult mark(void* ptr) {
    if (owns(ptr)) {
      return findAllocator(ptr).mark(ptr);
    }
    return MarkResult.WasUnmarked;
  }

  auto findAllocator(void* ptr) {
    import std.range : assumeSorted;
    assert(addresses.length > 0);
    auto lower = addresses[0..lastFree].assumeSorted.lowerBound(ptr);
    return PoolAllocatorBacking(addresses[lower.length - 1]);
  }

  void freeUnmarked() {
    import std.algorithm : map, each;
    addresses[0..lastFree].map!(p => PoolAllocatorBacking(p)).each!(p => p.freeUnmarked());
  }

  void add(void* start) {
    import std.range : assumeSorted;
    ensureSpace();

    if (lastFree == 0 || addresses[lastFree-1] < start) {
      addresses[lastFree++] = start;
      return;
    }
    auto lower = addresses[0..lastFree].assumeSorted.lowerBound(start);

    if (lower.length == addresses.length) {
      addresses[lastFree++] = start;
    } else {
      auto offset = lower.length;
      addresses[offset+1 .. lastFree+1] = addresses[offset .. lastFree];
      addresses[offset] = start;
      lastFree++;
    }
  }

  void remove(void* start) {
    import std.range : assumeSorted;
    auto lower = addresses[0..lastFree].assumeSorted.lowerBound(start);
    auto offset = lower.length;
    if (offset == lastFree)
      return;
    addresses[offset .. lastFree-1] = addresses[offset+1 .. lastFree];
    lastFree--;
  }

  version (SPASM_GC_DEBUG) {
    static auto getAllocatorStats(void* ptr) {
      import spasm.ct : tuple;
      uint blockSize = (cast(uint*)ptr)[0];
      uint blockCount = (cast(uint*)ptr)[1];
      uint leadingMarkerUlongs = blockCount.divideRoundUp(64);
      uint offset = (PoolAllocator.MetaData.sizeof + leadingMarkerUlongs * ulong.sizeof).roundUpToMultipleOf(platformAlignment);
      void* startOfBitmappedBlock = ptr + offset;
      ulong[] markers = (cast(ulong*)(ptr + PoolAllocator.MetaData.sizeof))[0..leadingMarkerUlongs];
      ulong[] control = (cast(ulong*)startOfBitmappedBlock)[0..leadingMarkerUlongs];
      return tuple!("blockSize", "blockCount", "markers", "control")(blockSize, blockCount, markers, control);
    }

    auto getStats() {
      import std.algorithm : map;
      return addresses[0..lastFree].map!(PoolAllocatorIndex.getAllocatorStats);
    }
  }
}

static __gshared auto poolAllocatorIndex = PoolAllocatorIndex();

struct PoolAllocator {
  nothrow:
  static struct MetaData {
    uint blockSize;
    uint blocks;
    Destructor destructor;
  }
  import stdx.allocator.common : chooseAtRuntime;
  alias Block = BitmappedBlock!(chooseAtRuntime, platformAlignment, NullAllocator);
  alias alignment = platformAlignment;
  private Block block;
  void[] memory;
  this(uint blockSize, size_t capacity, Destructor destructor) {
    auto pool = initPool(blockSize, capacity);
    memory = pool.memory;
    auto metaData = cast(MetaData*)memory.ptr;
    metaData.blockSize = blockSize;
    metaData.blocks = pool.blocks;
    metaData.destructor = destructor;
    block = Block(cast(ubyte[])pool.memory[pool.metaDataSize..$], blockSize);
    poolAllocatorIndex.add(memory.ptr);
  }
  // TODO: need to figure out how to release this PoolAllocator when AllocatorList kills it
  // this destructor doesn't work since this object gets moved somewhere
  // ~this() {
  //   import spasm.types;
  //   doLog(-1);
  //   poolAllocatorIndex.remove(memory.ptr);
  // }
  void[] allocate(size_t n) {
    return block.allocate(n);
  }
  bool deallocate(void[] b) {
    return block.deallocate(b);
  }
  Ternary owns(void[] b) const {
    return block.owns(b);
  }
}

unittest {
  import stdx.allocator.common : chooseAtRuntime;
  alias Block = BitmappedBlock!(32, platformAlignment, NullAllocator);
  auto block = Block(new ubyte[128]);
  void[] mem = block.allocate(16);
  assert(block.owns(mem) == Ternary.yes);
  assert(block.deallocate(mem) == true);
}

unittest {
  auto allocator = PoolAllocator(32, 128, null);
  void[] mem = allocator.allocate(16);
  assert(allocator.owns(mem) == Ternary(true));
  assert(allocator.deallocate(mem) == true);
}

auto getGoodCapacity(uint blockSize) {
  return 8 * 1024;
}

static struct PoolAllocatorFactory {
  private uint blockSize;
  private Destructor destructor;
  this(uint blockSize, Destructor destructor = null) {
    this.blockSize = blockSize;
    this.destructor = destructor;
  }
  auto opCall(size_t n) {
    auto capacity = getGoodCapacity(blockSize);
    return PoolAllocator(blockSize, capacity, destructor);
  }
}

struct PoolAllocatorList(T) {
  enum blockSize = T.sizeof;
  static if (hasMember!(T,"__xdtor")) {
    static void destructor(void* item) nothrow {
      T* t = cast(T*)item;
      t.__xdtor();
    }
    auto allocator = AllocatorList!(PoolAllocatorFactory, WasmAllocator)(PoolAllocatorFactory(blockSize, &destructor));
  } else {
    auto allocator = AllocatorList!(PoolAllocatorFactory, WasmAllocator)(PoolAllocatorFactory(blockSize, null));
  }
  alias allocator this;
}

struct PoolAllocatorList(size_t blockSize) {
  auto allocator = AllocatorList!(PoolAllocatorFactory, WasmAllocator)(PoolAllocatorFactory(blockSize));
  alias allocator this;
}

import std.traits : hasMember;
static assert(hasMember!(WasmAllocator, "deallocate"));
static assert(hasMember!(PoolAllocatorList!8, "deallocate"));
static assert(hasMember!(PoolAllocatorList!16, "empty"));

private struct BitVector
{
  ulong[] _rep;

  @safe pure nothrow @nogc:

  this(ulong[] data) { _rep = data; }

  auto markBit(ulong x) {
    assert(x / 64 <= size_t.max);
    immutable i = cast(size_t) (x / 64);
    immutable j = 0x8000_0000_0000_0000UL >> (x % 64);
    const wasSet = (_rep[i] & j) > 0;

    _rep[i] |= j;
    return wasSet;
  }
}
