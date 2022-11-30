module libwasm.bindings.Worklet;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Request;

@safe:
nothrow:

struct Worklet {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto addModule()(string moduleURL, scope ref WorkletOptions options) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this.handle, "addModule", "string;Handle", tuple(moduleURL, cast(Handle)options.handle)));
  }
  auto addModule()(string moduleURL) {
    return JsPromise!(void)(Object_Call_string__Handle(this.handle, "addModule", moduleURL));
  }
}
struct WorkletOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WorkletOptions(libwasm_add__object());
  }
  void credentials()(RequestCredentials credentials) {
    Object_Call_int__void(this.handle, "credentials", credentials);
  }
  RequestCredentials credentials()() {
    return Object_Getter__int(this.handle, "credentials");
  }
}


