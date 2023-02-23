module libwasm.bindings.StorageManager;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct StorageEstimate {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return StorageEstimate(libwasm_add__object());
  }
  void usage()(uint usage) {
    Object_Call_uint__void(this.handle, "usage", usage);
  }
  uint usage()() {
    return Object_Getter__uint(this.handle, "usage");
  }
  void quota()(uint quota) {
    Object_Call_uint__void(this.handle, "quota", quota);
  }
  uint quota()() {
    return Object_Getter__uint(this.handle, "quota");
  }
}
struct StorageManager {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto persisted()() {
    return JsPromise!(bool)(Object_Getter__Handle(this.handle, "persisted"));
  }
  auto persist()() {
    return JsPromise!(bool)(Object_Getter__Handle(this.handle, "persist"));
  }
  auto estimate()() {
    return JsPromise!(StorageEstimate)(Object_Getter__Handle(this.handle, "estimate"));
  }
}


