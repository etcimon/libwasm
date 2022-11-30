module libwasm.bindings.MerchantValidationEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MerchantValidationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  string validationURL()() {
    return Object_Getter__string(this._parent, "validationURL");
  }
  void complete()(scope ref JsPromise!(Any) merchantSessionPromise) {
    Object_Call_Handle__void(this._parent, "complete", merchantSessionPromise.handle);
  }
}
struct MerchantValidationEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MerchantValidationEventInit(libwasm_add__object());
  }
  void methodName()(string methodName) {
    Object_Call_string__void(this._parent, "methodName", methodName);
  }
  string methodName()() {
    return Object_Getter__string(this._parent, "methodName");
  }
  void validationURL()(string validationURL) {
    Object_Call_string__void(this._parent, "validationURL", validationURL);
  }
  string validationURL()() {
    return Object_Getter__string(this._parent, "validationURL");
  }
}


