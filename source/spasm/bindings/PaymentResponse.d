module spasm.bindings.PaymentResponse;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.PaymentAddress;
import spasm.bindings.PaymentRequest;

@safe:
nothrow:

enum PaymentComplete {
  success,
  fail,
  unknown
}
struct PaymentResponse {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this._parent, "toJSON"));
  }
  string requestId()() {
    return Object_Getter__string(this._parent, "requestId");
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  auto details()() {
    return JsObject(Object_Getter__Handle(this._parent, "details"));
  }
  auto shippingAddress()() {
    return Object_Getter__OptionalHandle(this._parent, "shippingAddress");
  }
  Optional!(string) shippingOption()() {
    return Object_Getter__OptionalString(this._parent, "shippingOption");
  }
  Optional!(string) payerName()() {
    return Object_Getter__OptionalString(this._parent, "payerName");
  }
  Optional!(string) payerEmail()() {
    return Object_Getter__OptionalString(this._parent, "payerEmail");
  }
  Optional!(string) payerPhone()() {
    return Object_Getter__OptionalString(this._parent, "payerPhone");
  }
  auto complete()(PaymentComplete result /* = "unknown" */) {
    return Promise!(void)(PaymentResponse_complete(this._parent, result));
  }
  auto complete()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "complete"));
  }
  auto retry()(scope ref PaymentValidationErrors errorFields) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "retry", errorFields.handle));
  }
  auto retry()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "retry"));
  }
  void onpayerdetailchange(T0)(scope auto ref Optional!(T0) onpayerdetailchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpayerdetailchange", !onpayerdetailchange.empty, onpayerdetailchange.front);
  }
  EventHandler onpayerdetailchange()() {
    return Object_Getter__EventHandler(this._parent, "onpayerdetailchange");
  }
}


extern (C) Handle PaymentResponse_complete(Handle, PaymentComplete);