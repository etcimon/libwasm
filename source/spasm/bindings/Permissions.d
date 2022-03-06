module spasm.bindings.Permissions;

import spasm.types;
import spasm.bindings.PermissionStatus;

@safe:
nothrow:

struct PermissionDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PermissionDescriptor(spasm_add__object());
  }
  void name()(PermissionName name) {
    PermissionDescriptor_name_Set(this.handle, name);
  }
  PermissionName name()() {
    return PermissionDescriptor_name_Get(this.handle);
  }
}
enum PermissionName {
  geolocation,
  notifications,
  push,
  persistent_storage
}
struct Permissions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto query()(scope ref JsObject permission) {
    return Promise!(PermissionStatus)(Object_Call_Handle__Handle(this.handle, "query", permission.handle));
  }
  auto revoke()(scope ref JsObject permission) {
    return Promise!(PermissionStatus)(Object_Call_Handle__Handle(this.handle, "revoke", permission.handle));
  }
}


extern (C) void PermissionDescriptor_name_Set(Handle, PermissionName);
extern (C) PermissionName PermissionDescriptor_name_Get(Handle);