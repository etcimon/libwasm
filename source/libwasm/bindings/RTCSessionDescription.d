module libwasm.bindings.RTCSessionDescription;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum RTCSdpType {
  offer,
  pranswer,
  answer,
  rollback
}
struct RTCSessionDescription {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void type()(RTCSdpType type) {
    Object_Call_int__void(this.handle, "type", type);
  }
  RTCSdpType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  void sdp()(string sdp) {
    Object_Call_string__void(this.handle, "sdp", sdp);
  }
  string sdp()() {
    return Object_Getter__string(this.handle, "sdp");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}
struct RTCSessionDescriptionInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCSessionDescriptionInit(libwasm_add__object());
  }
  void type()(RTCSdpType type) {
    Object_Call_int__void(this.handle, "type", type);
  }
  RTCSdpType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  void sdp()(string sdp) {
    Object_Call_string__void(this.handle, "sdp", sdp);
  }
  string sdp()() {
    return Object_Getter__string(this.handle, "sdp");
  }
}


