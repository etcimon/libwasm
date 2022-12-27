module libwasm.bindings.WebGPUExtras;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.WebGPU;

@safe:
nothrow:

struct WebGPUBufferBinding {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBufferBinding(libwasm_add__object());
  }
  void buffer()(scope ref WebGPUBuffer buffer) {
    Object_Call_Handle__void(this.handle, "buffer", buffer.handle);
  }
  auto buffer()() {
    return WebGPUBuffer(Object_Getter__Handle(this.handle, "buffer"));
  }
  void offset()(u32 offset) {
    Object_Call_uint__void(this.handle, "offset", offset);
  }
  u32 offset()() {
    return Object_Getter__uint(this.handle, "offset");
  }
  void size()(u32 size) {
    Object_Call_uint__void(this.handle, "size", size);
  }
  u32 size()() {
    return Object_Getter__uint(this.handle, "size");
  }
}


