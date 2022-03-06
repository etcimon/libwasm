module spasm.bindings.WebGPUExtras;

import spasm.types;
import spasm.bindings.WebGPU;

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
    return WebGPUBufferBinding(spasm_add__object());
  }
  void buffer()(scope ref WebGPUBuffer buffer) {
    Object_Call_Handle__void(this.handle, "buffer", buffer.handle);
  }
  auto buffer()() {
    return WebGPUBuffer(Object_Getter__Handle(this.handle, "buffer"));
  }
  void offset()(u32 offset) {
    WebGPUBufferBinding_offset_Set(this.handle, offset);
  }
  u32 offset()() {
    return WebGPUBufferBinding_offset_Get(this.handle);
  }
  void size()(u32 size) {
    WebGPUBufferBinding_size_Set(this.handle, size);
  }
  u32 size()() {
    return WebGPUBufferBinding_size_Get(this.handle);
  }
}


extern (C) void WebGPUBufferBinding_offset_Set(Handle, u32);
extern (C) u32 WebGPUBufferBinding_offset_Get(Handle);
extern (C) void WebGPUBufferBinding_size_Set(Handle, u32);
extern (C) u32 WebGPUBufferBinding_size_Get(Handle);