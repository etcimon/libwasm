module libwasm.bindings.Promise;

import libwasm.types;

import memutils.ct: tuple;
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


