module spasm.bindings.IDBFactory;

import spasm.types;
import spasm.bindings.IDBOpenDBRequest;
import spasm.bindings.StorageType;

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
    return IDBOpenDBRequest(IDBFactory_open__string_Handle(this.handle, name, options.handle));
  }
  auto open()(string name) {
    return IDBOpenDBRequest(Object_Call_string__Handle(this.handle, "open", name));
  }
  auto deleteDatabase()(string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(IDBFactory_deleteDatabase(this.handle, name, options.handle));
  }
  auto deleteDatabase()(string name) {
    return IDBOpenDBRequest(Object_Call_string__Handle(this.handle, "deleteDatabase", name));
  }
  short cmp(T0, T1)(scope auto ref T0 first, scope auto ref T1 second) {
    // Any
    Handle _handle_first = getOrCreateHandle(first);
    // Any
    Handle _handle_second = getOrCreateHandle(second);
    auto result = IDBFactory_cmp(this.handle, _handle_first, _handle_second);
    dropHandle!(T0)(_handle_first);
    dropHandle!(T1)(_handle_second);
    return result;
  }
  auto openForPrincipal()(scope ref Principal principal, string name, uint version_) {
    return IDBOpenDBRequest(IDBFactory_openForPrincipal__Handle_string_uint(this.handle, principal.handle, name, version_));
  }
  auto openForPrincipal()(scope ref Principal principal, string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(IDBFactory_openForPrincipal__Handle_string_Handle(this.handle, principal.handle, name, options.handle));
  }
  auto openForPrincipal()(scope ref Principal principal, string name) {
    return IDBOpenDBRequest(IDBFactory_openForPrincipal_0(this.handle, principal.handle, name));
  }
  auto deleteForPrincipal()(scope ref Principal principal, string name, scope ref IDBOpenDBOptions options) {
    return IDBOpenDBRequest(IDBFactory_deleteForPrincipal(this.handle, principal.handle, name, options.handle));
  }
  auto deleteForPrincipal()(scope ref Principal principal, string name) {
    return IDBOpenDBRequest(IDBFactory_deleteForPrincipal_0(this.handle, principal.handle, name));
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
    return IDBOpenDBOptions(spasm_add__object());
  }
  void version_()(uint version_) {
    Object_Call_uint__void(this.handle, "version", version_);
  }
  uint version_()() {
    return Object_Getter__uint(this.handle, "version");
  }
  void storage()(StorageType storage) {
    IDBOpenDBOptions_storage_Set(this.handle, storage);
  }
  StorageType storage()() {
    return IDBOpenDBOptions_storage_Get(this.handle);
  }
}


extern (C) Handle IDBFactory_open__string_Handle(Handle, string, Handle);
extern (C) Handle IDBFactory_deleteDatabase(Handle, string, Handle);
extern (C) short IDBFactory_cmp(Handle, Handle, Handle);
extern (C) Handle IDBFactory_openForPrincipal__Handle_string_uint(Handle, Handle, string, uint);
extern (C) Handle IDBFactory_openForPrincipal__Handle_string_Handle(Handle, Handle, string, Handle);
extern (C) Handle IDBFactory_openForPrincipal_0(Handle, Handle, string);
extern (C) Handle IDBFactory_deleteForPrincipal(Handle, Handle, string, Handle);
extern (C) Handle IDBFactory_deleteForPrincipal_0(Handle, Handle, string);
extern (C) void IDBOpenDBOptions_storage_Set(Handle, StorageType);
extern (C) StorageType IDBOpenDBOptions_storage_Get(Handle);