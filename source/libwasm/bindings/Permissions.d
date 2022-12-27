module libwasm.bindings.Permissions;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.PermissionStatus;

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
    return PermissionDescriptor(libwasm_add__object());
  }
  void name()(PermissionName name) {
    Object_Call_int__void(this.handle, "name", name);
  }
  PermissionName name()() {
    return Object_Getter__int(this.handle, "name");
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
    return JsPromise!(PermissionStatus)(Object_Call_Handle__Handle(this.handle, "query", permission.handle));
  }
  auto revoke()(scope ref JsObject permission) {
    return JsPromise!(PermissionStatus)(Object_Call_Handle__Handle(this.handle, "revoke", permission.handle));
  }
}


