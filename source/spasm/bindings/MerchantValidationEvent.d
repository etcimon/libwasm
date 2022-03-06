module spasm.bindings.MerchantValidationEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MerchantValidationEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  void complete()(scope ref Promise!(Any) merchantSessionPromise) {
    Object_Call_Handle__void(this._parent, "complete", merchantSessionPromise.handle);
  }
}
struct MerchantValidationEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MerchantValidationEventInit(spasm_add__object());
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


