module libwasm.bindings.RTCRtpTransceiver;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.MediaStream;
import libwasm.bindings.RTCRtpReceiver;
import libwasm.bindings.RTCRtpSender;

@safe:
nothrow:

struct RTCRtpTransceiver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(string) mid()() {
    return Object_Getter__OptionalString(this.handle, "mid");
  }
  auto sender()() {
    return RTCRtpSender(Object_Getter__Handle(this.handle, "sender"));
  }
  auto receiver()() {
    return RTCRtpReceiver(Object_Getter__Handle(this.handle, "receiver"));
  }
  bool stopped()() {
    return Object_Getter__bool(this.handle, "stopped");
  }
  void direction()(RTCRtpTransceiverDirection direction) {
    Object_Call_int__void(this.handle, "direction", direction);
  }
  RTCRtpTransceiverDirection direction()() {
    return Object_Getter__int(this.handle, "direction");
  }
  Optional!(RTCRtpTransceiverDirection) currentDirection()() {
    return RTCRtpTransceiver_currentDirection_Get(this.handle);
  }
  void stop()() {
    Object_Call__void(this.handle, "stop");
  }
  void setRemoteTrackId()(string trackId) {
    Object_Call_string__void(this.handle, "setRemoteTrackId", trackId);
  }
  bool remoteTrackIdIs()(string trackId) {
    return Object_Call_string__bool(this.handle, "remoteTrackIdIs", trackId);
  }
  string getRemoteTrackId()() {
    return Object_Getter__string(this.handle, "getRemoteTrackId");
  }
  void setAddTrackMagic()() {
    Object_Call__void(this.handle, "setAddTrackMagic");
  }
  bool addTrackMagic()() {
    return Object_Getter__bool(this.handle, "addTrackMagic");
  }
  void shouldRemove()(bool shouldRemove) {
    Object_Call_bool__void(this.handle, "shouldRemove", shouldRemove);
  }
  bool shouldRemove()() {
    return Object_Getter__bool(this.handle, "shouldRemove");
  }
  void setCurrentDirection()(RTCRtpTransceiverDirection direction) {
    Object_Call_int__void(this.handle, "setCurrentDirection", direction);
  }
  void setDirectionInternal()(RTCRtpTransceiverDirection direction) {
    Object_Call_int__void(this.handle, "setDirectionInternal", direction);
  }
  void setMid()(string mid) {
    Object_Call_string__void(this.handle, "setMid", mid);
  }
  void unsetMid()() {
    Object_Call__void(this.handle, "unsetMid");
  }
  void setStopped()() {
    Object_Call__void(this.handle, "setStopped");
  }
  string getKind()() {
    return Object_Getter__string(this.handle, "getKind");
  }
  bool hasBeenUsedToSend()() {
    return Object_Getter__bool(this.handle, "hasBeenUsedToSend");
  }
  void sync()() {
    Object_Call__void(this.handle, "sync");
  }
  void insertDTMF()(string tones, uint duration /* = 100 */, uint interToneGap /* = 70 */) {
    Serialize_Object_VarArgCall!void(this.handle, "insertDTMF", "string;uint;uint", tuple(tones, duration, interToneGap));
  }
  void insertDTMF()(string tones, uint duration /* = 100 */) {
    Object_Call_string_uint__void(this.handle, "insertDTMF", tones, duration);
  }
  void insertDTMF()(string tones) {
    Object_Call_string__void(this.handle, "insertDTMF", tones);
  }
}
enum RTCRtpTransceiverDirection {
  sendrecv,
  sendonly,
  recvonly,
  inactive
}
struct RTCRtpTransceiverInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpTransceiverInit(libwasm_add__object());
  }
  void direction()(RTCRtpTransceiverDirection direction) {
    Object_Call_int__void(this.handle, "direction", direction);
  }
  RTCRtpTransceiverDirection direction()() {
    return Object_Getter__int(this.handle, "direction");
  }
  void streams()(scope ref Sequence!(MediaStream) streams) {
    Object_Call_Handle__void(this.handle, "streams", streams.handle);
  }
  auto streams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this.handle, "streams"));
  }
}


extern (C) Optional!(RTCRtpTransceiverDirection) RTCRtpTransceiver_currentDirection_Get(Handle);