///
module spasm.rt.allocator;

nothrow:

import stdx.allocator.common : platformAlignment,roundUpToAlignment;
import std.typecons : Flag, Yes, No;

private __gshared void* begin, current, end;
struct WasmAllocator {
  import spasm.intrinsics;

  nothrow:
  static:
  
  enum wasmPageSize = 64 * 1024;
  enum uint alignment = platformAlignment;
  @trusted void init(uint heap_base) {
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

/**
   Returns `true` if `ptr` is aligned at `alignment`.
*/
@nogc nothrow pure bool alignedAt(T)(T* ptr, uint alignment)
{
  return cast(size_t) ptr % alignment == 0;
}
