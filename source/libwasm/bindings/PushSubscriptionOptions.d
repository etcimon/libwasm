module libwasm.bindings.PushSubscriptionOptions;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct PushSubscriptionOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto applicationServerKey()() {
    return recastOpt!(ArrayBuffer)(Object_Getter__OptionalHandle(this.handle, "applicationServerKey"));
  }
}


