module libwasm.bindings.PaymentMethodChangeEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.PaymentRequestUpdateEvent;

@safe:
nothrow:

struct PaymentMethodChangeEvent {
  nothrow:
  libwasm.bindings.PaymentRequestUpdateEvent.PaymentRequestUpdateEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentRequestUpdateEvent(h);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  auto methodDetails()() {
    return recastOpt!(JsObject)(Object_Getter__OptionalHandle(this._parent, "methodDetails"));
  }
}
struct PaymentMethodChangeEventInit {
  nothrow:
  libwasm.bindings.PaymentRequestUpdateEvent.PaymentRequestUpdateEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentRequestUpdateEventInit(h);
  }
  static auto create() {
    return PaymentMethodChangeEventInit(libwasm_add__object());
  }
  void methodName()(string methodName) {
    Object_Call_string__void(this._parent, "methodName", methodName);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  void methodDetails(T0)(scope auto ref Optional!(T0) methodDetails) if (isTOrPointer!(T0, JsObject)) {
    Serialize_Object_VarArgCall!void(this._parent, "methodDetails", "Optional!Handle", tuple(!methodDetails.empty, cast(Handle)methodDetails.front.handle));
  }
  auto methodDetails()() {
    return recastOpt!(JsObject)(Object_Getter__OptionalHandle(this._parent, "methodDetails"));
  }
}


