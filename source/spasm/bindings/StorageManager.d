module spasm.bindings.StorageManager;

import spasm.types;
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
    return StorageEstimate(spasm_add__object());
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
    return Promise!(bool)(Object_Getter__Handle(this.handle, "persisted"));
  }
  auto persist()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "persist"));
  }
  auto estimate()() {
    return Promise!(StorageEstimate)(Object_Getter__Handle(this.handle, "estimate"));
  }
}


