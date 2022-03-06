module spasm.bindings.Worklet;

import spasm.types;
import spasm.bindings.Request;

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
    return Promise!(void)(Worklet_addModule(this.handle, moduleURL, options.handle));
  }
  auto addModule()(string moduleURL) {
    return Promise!(void)(Object_Call_string__Handle(this.handle, "addModule", moduleURL));
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
    return WorkletOptions(spasm_add__object());
  }
  void credentials()(RequestCredentials credentials) {
    WorkletOptions_credentials_Set(this.handle, credentials);
  }
  RequestCredentials credentials()() {
    return WorkletOptions_credentials_Get(this.handle);
  }
}


extern (C) Handle Worklet_addModule(Handle, string, Handle);
extern (C) void WorkletOptions_credentials_Set(Handle, RequestCredentials);
extern (C) RequestCredentials WorkletOptions_credentials_Get(Handle);