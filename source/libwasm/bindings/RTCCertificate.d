module libwasm.bindings.RTCCertificate;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct RTCCertificate {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto expires()() {
    return DOMTimeStamp(Object_Getter__Handle(this.handle, "expires"));
  }
}
struct RTCCertificateExpiration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCCertificateExpiration(libwasm_add__object());
  }
  void expires()(scope ref DOMTimeStamp expires) {
    Object_Call_Handle__void(this.handle, "expires", expires.handle);
  }
  auto expires()() {
    return DOMTimeStamp(Object_Getter__Handle(this.handle, "expires"));
  }
}


