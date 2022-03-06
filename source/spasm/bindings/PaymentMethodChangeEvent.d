module spasm.bindings.PaymentMethodChangeEvent;

import spasm.types;
import spasm.bindings.PaymentRequestUpdateEvent;

@safe:
nothrow:

struct PaymentMethodChangeEvent {
  nothrow:
  spasm.bindings.PaymentRequestUpdateEvent.PaymentRequestUpdateEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentRequestUpdateEvent(h);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  auto methodDetails()() {
    return Object_Getter__OptionalHandle(this._parent, "methodDetails");
  }
}
struct PaymentMethodChangeEventInit {
  nothrow:
  spasm.bindings.PaymentRequestUpdateEvent.PaymentRequestUpdateEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentRequestUpdateEventInit(h);
  }
  static auto create() {
    return PaymentMethodChangeEventInit(spasm_add__object());
  }
  void methodName()(string methodName) {
    Object_Call_string__void(this._parent, "methodName", methodName);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  void methodDetails(T0)(scope auto ref Optional!(T0) methodDetails) if (isTOrPointer!(T0, JsObject)) {
    PaymentMethodChangeEventInit_methodDetails_Set(this._parent, !methodDetails.empty, methodDetails.front.handle);
  }
  auto methodDetails()() {
    return Object_Getter__OptionalHandle(this._parent, "methodDetails");
  }
}


extern (C) void PaymentMethodChangeEventInit_methodDetails_Set(Handle, bool, Handle);