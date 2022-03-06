module spasm.bindings.RTCSessionDescription;

import spasm.types;
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
    RTCSessionDescription_type_Set(this.handle, type);
  }
  RTCSdpType type()() {
    return RTCSessionDescription_type_Get(this.handle);
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
    return RTCSessionDescriptionInit(spasm_add__object());
  }
  void type()(RTCSdpType type) {
    RTCSessionDescriptionInit_type_Set(this.handle, type);
  }
  RTCSdpType type()() {
    return RTCSessionDescriptionInit_type_Get(this.handle);
  }
  void sdp()(string sdp) {
    Object_Call_string__void(this.handle, "sdp", sdp);
  }
  string sdp()() {
    return Object_Getter__string(this.handle, "sdp");
  }
}


extern (C) void RTCSessionDescription_type_Set(Handle, RTCSdpType);
extern (C) RTCSdpType RTCSessionDescription_type_Get(Handle);
extern (C) void RTCSessionDescriptionInit_type_Set(Handle, RTCSdpType);
extern (C) RTCSdpType RTCSessionDescriptionInit_type_Get(Handle);