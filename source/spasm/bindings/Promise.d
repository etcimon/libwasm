module spasm.bindings.Promise;

import spasm.types;
@safe:
nothrow:

alias AnyCallback = Any delegate(Any);
alias PromiseJobCallback = void delegate();
struct PromiseNativeHandler {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}


