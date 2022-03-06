module spasm.bindings.PaymentRequestUpdateEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.PaymentRequest;

@safe:
nothrow:

struct PaymentRequestUpdateEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  void updateWith()(scope ref Promise!(PaymentDetailsUpdate) detailsPromise) {
    Object_Call_Handle__void(this._parent, "updateWith", detailsPromise.handle);
  }
}
struct PaymentRequestUpdateEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PaymentRequestUpdateEventInit(spasm_add__object());
  }
}


