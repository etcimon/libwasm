module spasm.bindings.RTCIceCandidate;

import spasm.types;
@safe:
nothrow:

struct RTCIceCandidate {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void candidate()(string candidate) {
    Object_Call_string__void(this.handle, "candidate", candidate);
  }
  string candidate()() {
    return Object_Getter__string(this.handle, "candidate");
  }
  void sdpMid(T0)(scope auto ref Optional!(T0) sdpMid) if (isTOrPointer!(T0, string)) {
    RTCIceCandidate_sdpMid_Set(this.handle, !sdpMid.empty, sdpMid.front);
  }
  Optional!(string) sdpMid()() {
    return Object_Getter__OptionalString(this.handle, "sdpMid");
  }
  void sdpMLineIndex(T0)(scope auto ref Optional!(T0) sdpMLineIndex) if (isTOrPointer!(T0, ushort)) {
    RTCIceCandidate_sdpMLineIndex_Set(this.handle, !sdpMLineIndex.empty, sdpMLineIndex.front);
  }
  Optional!(ushort) sdpMLineIndex()() {
    return RTCIceCandidate_sdpMLineIndex_Get(this.handle);
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}
struct RTCIceCandidateInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIceCandidateInit(spasm_add__object());
  }
  void candidate()(string candidate) {
    Object_Call_string__void(this.handle, "candidate", candidate);
  }
  string candidate()() {
    return Object_Getter__string(this.handle, "candidate");
  }
  void sdpMid(T0)(scope auto ref Optional!(T0) sdpMid) if (isTOrPointer!(T0, string)) {
    RTCIceCandidateInit_sdpMid_Set(this.handle, !sdpMid.empty, sdpMid.front);
  }
  Optional!(string) sdpMid()() {
    return Object_Getter__OptionalString(this.handle, "sdpMid");
  }
  void sdpMLineIndex(T0)(scope auto ref Optional!(T0) sdpMLineIndex) if (isTOrPointer!(T0, ushort)) {
    RTCIceCandidateInit_sdpMLineIndex_Set(this.handle, !sdpMLineIndex.empty, sdpMLineIndex.front);
  }
  Optional!(ushort) sdpMLineIndex()() {
    return RTCIceCandidateInit_sdpMLineIndex_Get(this.handle);
  }
}


extern (C) void RTCIceCandidate_sdpMid_Set(Handle, bool, string);
extern (C) void RTCIceCandidate_sdpMLineIndex_Set(Handle, bool, ushort);
extern (C) Optional!(ushort) RTCIceCandidate_sdpMLineIndex_Get(Handle);
extern (C) void RTCIceCandidateInit_sdpMid_Set(Handle, bool, string);
extern (C) void RTCIceCandidateInit_sdpMLineIndex_Set(Handle, bool, ushort);
extern (C) Optional!(ushort) RTCIceCandidateInit_sdpMLineIndex_Get(Handle);