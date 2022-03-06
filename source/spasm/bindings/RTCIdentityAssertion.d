module spasm.bindings.RTCIdentityAssertion;

import spasm.types;
@safe:
nothrow:

struct RTCIdentityAssertion {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityAssertion(spasm_add__object());
  }
  void idp()(string idp) {
    Object_Call_string__void(this.handle, "idp", idp);
  }
  string idp()() {
    return Object_Getter__string(this.handle, "idp");
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}


