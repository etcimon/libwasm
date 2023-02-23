module libwasm.memory.debugger;
import libwasm.memory.allocators;
import libwasm.memory.hashmap;
import libwasm.memory.dictionarylist;
import libwasm.memory.utils : Malloc;
import std.conv : emplace, to;
nothrow @nogc:
/**
* Another proxy allocator used to aggregate statistics and to enforce correct usage.
*/
struct DebugAllocator(Base) {
	nothrow @nogc:
	private {
		HashMap!(size_t, size_t, Malloc) m_blocks;
		size_t m_bytes;
		size_t m_maxBytes;
		void function(size_t) m_allocSizeCallback;
		void function(size_t) m_freeSizeCallback;
	}
	package Base* m_baseAlloc;
	
	@trusted:
	public {
		void setAllocSizeCallbacks(void function(size_t) @nogc nothrow @trusted alloc_sz_cb, void function(size_t) @nogc nothrow @trusted free_sz_cb) {
			m_allocSizeCallback = alloc_sz_cb;
			m_freeSizeCallback = free_sz_cb;
		}
		@property size_t allocatedBlockCount() const { return m_blocks.length; }
		@property size_t bytesAllocated() const { return m_bytes; }
		@property size_t maxBytesAllocated() const { return m_maxBytes; }
		void printMap() {
			foreach(const ref size_t ptr, const ref size_t sz; m_blocks) {
				logDebug("{0} sz {1}", cast(void*)ptr, sz);
			}
		}
	}
	void[] alloc(size_t sz)
	{
		if (!m_baseAlloc)
			m_baseAlloc = getAllocator!Base();
		assert(sz > 0, "Cannot serve a zero-length allocation");

		//logTrace("Bytes allocated in ", Base.stringof, ": ", bytesAllocated());
		auto ret = m_baseAlloc.alloc(sz);
        assert(ret.length == sz, "base.alloc() returned block with wrong size.");
        assert( cast(size_t)ret.ptr !in m_blocks, "Returning already allocated pointer");
        m_blocks[cast(size_t)ret.ptr] = sz;
        m_bytes += sz;
        if (m_allocSizeCallback)
            m_allocSizeCallback(sz);
        if( m_bytes > m_maxBytes ){
            m_maxBytes = m_bytes;
            //logTrace("New allocation maximum: %d (%d blocks)", m_maxBytes, m_blocks.length);
        }
		//logDebug("Alloc ptr: ", ret.ptr, " sz: ", ret.length);
		
		return ret;
	}
	
	void[] realloc(void[] mem, size_t new_size, bool must_zeroise = false)
	{
		assert(new_size > 0 && mem.length > 0, "Cannot serve a zero-length reallocation");
		void[] ret;
		size_t sz;
        sz = m_blocks.get(cast(size_t)mem.ptr, size_t.max);
		if (sz == size_t.max) {
			printMap();
		}
        assert(sz != size_t.max, "realloc() called with non-allocated pointer.");
        assert(sz == mem.length, "realloc() called with block of wrong size.");
		ret = m_baseAlloc.realloc(mem, new_size, must_zeroise);
        //assert( cast(size_t)ret.ptr !in m_blocks, "Returning from realloc already allocated pointer");
        assert(ret.length == new_size, "base.realloc() returned block with wrong size.");
        //assert(ret.ptr is mem.ptr || m_blocks.get(ret.ptr, size_t.max) == size_t.max, "base.realloc() returned block that is already allocated.");
        m_bytes -= sz;
        m_blocks.remove(cast(size_t)mem.ptr);
        m_blocks[cast(size_t)ret.ptr] = new_size;
        m_bytes += new_size;
        if (m_freeSizeCallback)
            m_freeSizeCallback(sz);
        if (m_allocSizeCallback)
            m_allocSizeCallback(new_size);
		return ret;
	}
	
	void free(void[] mem, bool must_zeroise = false)
	{
		assert(mem.length > 0, "Cannot serve a zero-length deallocation");

		size_t sz;
        sz = m_blocks.get(cast(const size_t)mem.ptr, size_t.max);

        assert(sz != size_t.max, "free() called with non-allocated object");//. "~ mem.ptr.to!string ~ " (" ~ mem.length.to!string ~" B) m_blocks len: "~ m_blocks.length.to!string);
        assert(sz == mem.length, "free() called with block of wrong size"); //: got " ~ mem.length.to!string ~ "B but should be " ~ sz.to!string ~ "B");


		//logDebug("free ptr: ", mem.ptr, " sz: ", mem.length);
		m_baseAlloc.free(mem, must_zeroise);
    
        m_bytes -= sz;
        if (m_freeSizeCallback)
            m_freeSizeCallback(sz);
        m_blocks.remove(cast(size_t)mem.ptr);
		
	}

	package void ignore(void* ptr) {    
        size_t sz = m_blocks.get(cast(const size_t) ptr, size_t.max);
        m_bytes -= sz;
        m_blocks.remove(cast(size_t)ptr);
	}
}
