module libwasm.bindings.RTCIdentityAssertion;

import libwasm.types;

import std.typecons: tuple;
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
    return RTCIdentityAssertion(libwasm_add__object());
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


