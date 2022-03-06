module spasm.bindings.PushSubscriptionOptions;

import spasm.types;
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
    return Object_Getter__OptionalHandle(this.handle, "applicationServerKey");
  }
}


