module libwasm.bindings.CreateOfferRequest;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct CreateOfferRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint windowID()() {
    return Object_Getter__uint(this.handle, "windowID");
  }
  uint innerWindowID()() {
    return Object_Getter__uint(this.handle, "innerWindowID");
  }
  string callID()() {
    return Object_Getter__string(this.handle, "callID");
  }
  bool isSecure()() {
    return Object_Getter__bool(this.handle, "isSecure");
  }
}


