module libwasm.rt.memory;

import libwasm.rt.allocator : WasmAllocator;

version (LDC)
import ldc.attributes;
import libwasm.intrinsics;
nothrow:

@safe nothrow void alloc_init(uint heap_base) {
  WasmAllocator.init(heap_base);
}

extern (C) export void * wasm_malloc(size_t num) {
  return WasmAllocator.allocate(num).ptr;
}

extern (C) export void wasm_free(void* ptr, size_t size) {
  // this doesn't free. Try to un-grow?
  WasmAllocator.deallocate(ptr[0 .. size]);
  import ldc.intrinsics;
  memset(ptr, 0, size);
}

extern (C) export void* wasm_realloc(void* ptr, size_t oldsize, size_t size) {
  void* ret = WasmAllocator.allocate(size).ptr;
  import ldc.intrinsics;
  memcpy(ret, ptr, oldsize);
  memset(ptr, 0, oldsize);
  return ret;
}
