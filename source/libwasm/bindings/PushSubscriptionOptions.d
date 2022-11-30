module libwasm.bindings.PushSubscriptionOptions;

import libwasm.types;

import std.typecons: tuple;
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
    return Optional!(ArrayBuffer)(Object_Getter__OptionalHandle(this.handle, "applicationServerKey"));
  }
}


