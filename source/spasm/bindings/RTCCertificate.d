module spasm.bindings.RTCCertificate;

import spasm.types;
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
    return RTCCertificateExpiration(spasm_add__object());
  }
  void expires()(scope ref DOMTimeStamp expires) {
    Object_Call_Handle__void(this.handle, "expires", expires.handle);
  }
  auto expires()() {
    return DOMTimeStamp(Object_Getter__Handle(this.handle, "expires"));
  }
}


