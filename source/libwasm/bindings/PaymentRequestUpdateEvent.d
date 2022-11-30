module libwasm.bindings.PaymentRequestUpdateEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.PaymentRequest;

@safe:
nothrow:

struct PaymentRequestUpdateEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  void updateWith()(scope ref JsPromise!(PaymentDetailsUpdate) detailsPromise) {
    Object_Call_Handle__void(this._parent, "updateWith", detailsPromise.handle);
  }
}
struct PaymentRequestUpdateEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PaymentRequestUpdateEventInit(libwasm_add__object());
  }
}


