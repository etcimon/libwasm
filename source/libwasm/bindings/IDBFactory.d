module libwasm.bindings.IDBFactory;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.IDBOpenDBRequest;
import libwasm.bindings.StorageType;

@safe:
nothrow:

struct IDBFactory {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto open()(string name, uint version_) {
    return IDBOpenDBRequest(Object_Call_string_uint__Handle(this.handle, "open", name, version_));
  }
  auto open()(string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "open", "string;Handle", tuple(name, cast(Handle)options.handle)));
  }
  auto open()(string name) {
    return IDBOpenDBRequest(Object_Call_string__Handle(this.handle, "open", name));
  }
  auto deleteDatabase()(string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "deleteDatabase", "string;Handle", tuple(name, cast(Handle)options.handle)));
  }
  auto deleteDatabase()(string name) {
    return IDBOpenDBRequest(Object_Call_string__Handle(this.handle, "deleteDatabase", name));
  }
  short cmp(T0, T1)(scope auto ref T0 first, scope auto ref T1 second) {
    // Any
    Handle _handle_first = getOrCreateHandle(first);
    // Any
    Handle _handle_second = getOrCreateHandle(second);
    auto result = Serialize_Object_VarArgCall!short(this.handle, "cmp", "Handle;Handle", tuple(_handle_first, _handle_second));
    dropHandle!(T0)(_handle_first);
    dropHandle!(T1)(_handle_second);
    return result;
  }
  auto openForPrincipal()(scope ref Principal principal, string name, uint version_) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "openForPrincipal", "Handle;string;uint", tuple(cast(Handle)principal.handle, name, version_)));
  }
  auto openForPrincipal()(scope ref Principal principal, string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "openForPrincipal", "Handle;string;Handle", tuple(cast(Handle)principal.handle, name, cast(Handle)options.handle)));
  }
  auto openForPrincipal()(scope ref Principal principal, string name) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "openForPrincipal", "Handle;string", tuple(cast(Handle)principal.handle, name)));
  }
  auto deleteForPrincipal()(scope ref Principal principal, string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "deleteForPrincipal", "Handle;string;Handle", tuple(cast(Handle)principal.handle, name, cast(Handle)options.handle)));
  }
  auto deleteForPrincipal()(scope ref Principal principal, string name) {
    return IDBOpenDBRequest(Serialize_Object_VarArgCall!Handle(this.handle, "deleteForPrincipal", "Handle;string", tuple(cast(Handle)principal.handle, name)));
  }
}
struct IDBOpenDBOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IDBOpenDBOptions(libwasm_add__object());
  }
  void version_()(uint version_) {
    Object_Call_uint__void(this.handle, "version", version_);
  }
  uint version_()() {
    return Object_Getter__uint(this.handle, "version");
  }
  void storage()(StorageType storage) {
    Object_Call_int__void(this.handle, "storage", storage);
  }
  StorageType storage()() {
    return Object_Getter__int(this.handle, "storage");
  }
}


