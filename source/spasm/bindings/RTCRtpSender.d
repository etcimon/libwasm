module spasm.bindings.RTCRtpSender;

import spasm.types;
import spasm.bindings.MediaStream;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.RTCDTMFSender;
import spasm.bindings.RTCPeerConnection;
import spasm.bindings.RTCStatsReport;

@safe:
nothrow:

enum RTCDegradationPreference {
  maintain_framerate,
  maintain_resolution,
  balanced
}
struct RTCFecParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCFecParameters(spasm_add__object());
  }
  void ssrc()(uint ssrc) {
    Object_Call_uint__void(this.handle, "ssrc", ssrc);
  }
  uint ssrc()() {
    return Object_Getter__uint(this.handle, "ssrc");
  }
}
enum RTCPriorityType {
  very_low,
  low,
  medium,
  high
}
struct RTCRtcpParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtcpParameters(spasm_add__object());
  }
  void cname()(string cname) {
    Object_Call_string__void(this.handle, "cname", cname);
  }
  string cname()() {
    return Object_Getter__string(this.handle, "cname");
  }
  void reducedSize()(bool reducedSize) {
    Object_Call_bool__void(this.handle, "reducedSize", reducedSize);
  }
  bool reducedSize()() {
    return Object_Getter__bool(this.handle, "reducedSize");
  }
}
struct RTCRtpCodecParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpCodecParameters(spasm_add__object());
  }
  void payloadType()(ushort payloadType) {
    RTCRtpCodecParameters_payloadType_Set(this.handle, payloadType);
  }
  ushort payloadType()() {
    return Object_Getter__ushort(this.handle, "payloadType");
  }
  void mimeType()(string mimeType) {
    Object_Call_string__void(this.handle, "mimeType", mimeType);
  }
  string mimeType()() {
    return Object_Getter__string(this.handle, "mimeType");
  }
  void clockRate()(uint clockRate) {
    Object_Call_uint__void(this.handle, "clockRate", clockRate);
  }
  uint clockRate()() {
    return Object_Getter__uint(this.handle, "clockRate");
  }
  void channels()(ushort channels) {
    RTCRtpCodecParameters_channels_Set(this.handle, channels);
  }
  ushort channels()() {
    return Object_Getter__ushort(this.handle, "channels");
  }
  void sdpFmtpLine()(string sdpFmtpLine) {
    Object_Call_string__void(this.handle, "sdpFmtpLine", sdpFmtpLine);
  }
  string sdpFmtpLine()() {
    return Object_Getter__string(this.handle, "sdpFmtpLine");
  }
}
struct RTCRtpEncodingParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpEncodingParameters(spasm_add__object());
  }
  void ssrc()(uint ssrc) {
    Object_Call_uint__void(this.handle, "ssrc", ssrc);
  }
  uint ssrc()() {
    return Object_Getter__uint(this.handle, "ssrc");
  }
  void rtx()(scope ref RTCRtxParameters rtx) {
    Object_Call_Handle__void(this.handle, "rtx", rtx.handle);
  }
  auto rtx()() {
    return RTCRtxParameters(Object_Getter__Handle(this.handle, "rtx"));
  }
  void fec()(scope ref RTCFecParameters fec) {
    Object_Call_Handle__void(this.handle, "fec", fec.handle);
  }
  auto fec()() {
    return RTCFecParameters(Object_Getter__Handle(this.handle, "fec"));
  }
  void active()(bool active) {
    Object_Call_bool__void(this.handle, "active", active);
  }
  bool active()() {
    return Object_Getter__bool(this.handle, "active");
  }
  void priority()(RTCPriorityType priority) {
    RTCRtpEncodingParameters_priority_Set(this.handle, priority);
  }
  RTCPriorityType priority()() {
    return RTCRtpEncodingParameters_priority_Get(this.handle);
  }
  void maxBitrate()(uint maxBitrate) {
    Object_Call_uint__void(this.handle, "maxBitrate", maxBitrate);
  }
  uint maxBitrate()() {
    return Object_Getter__uint(this.handle, "maxBitrate");
  }
  void degradationPreference()(RTCDegradationPreference degradationPreference) {
    RTCRtpEncodingParameters_degradationPreference_Set(this.handle, degradationPreference);
  }
  RTCDegradationPreference degradationPreference()() {
    return RTCRtpEncodingParameters_degradationPreference_Get(this.handle);
  }
  void rid()(string rid) {
    Object_Call_string__void(this.handle, "rid", rid);
  }
  string rid()() {
    return Object_Getter__string(this.handle, "rid");
  }
  void scaleResolutionDownBy()(float scaleResolutionDownBy) {
    Object_Call_float__void(this.handle, "scaleResolutionDownBy", scaleResolutionDownBy);
  }
  float scaleResolutionDownBy()() {
    return Object_Getter__float(this.handle, "scaleResolutionDownBy");
  }
}
struct RTCRtpHeaderExtensionParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpHeaderExtensionParameters(spasm_add__object());
  }
  void uri()(string uri) {
    Object_Call_string__void(this.handle, "uri", uri);
  }
  string uri()() {
    return Object_Getter__string(this.handle, "uri");
  }
  void id()(ushort id) {
    RTCRtpHeaderExtensionParameters_id_Set(this.handle, id);
  }
  ushort id()() {
    return Object_Getter__ushort(this.handle, "id");
  }
  void encrypted()(bool encrypted) {
    Object_Call_bool__void(this.handle, "encrypted", encrypted);
  }
  bool encrypted()() {
    return Object_Getter__bool(this.handle, "encrypted");
  }
}
struct RTCRtpParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpParameters(spasm_add__object());
  }
  void encodings()(scope ref Sequence!(RTCRtpEncodingParameters) encodings) {
    Object_Call_Handle__void(this.handle, "encodings", encodings.handle);
  }
  auto encodings()() {
    return Sequence!(RTCRtpEncodingParameters)(Object_Getter__Handle(this.handle, "encodings"));
  }
  void headerExtensions()(scope ref Sequence!(RTCRtpHeaderExtensionParameters) headerExtensions) {
    Object_Call_Handle__void(this.handle, "headerExtensions", headerExtensions.handle);
  }
  auto headerExtensions()() {
    return Sequence!(RTCRtpHeaderExtensionParameters)(Object_Getter__Handle(this.handle, "headerExtensions"));
  }
  void rtcp()(scope ref RTCRtcpParameters rtcp) {
    Object_Call_Handle__void(this.handle, "rtcp", rtcp.handle);
  }
  auto rtcp()() {
    return RTCRtcpParameters(Object_Getter__Handle(this.handle, "rtcp"));
  }
  void codecs()(scope ref Sequence!(RTCRtpCodecParameters) codecs) {
    Object_Call_Handle__void(this.handle, "codecs", codecs.handle);
  }
  auto codecs()() {
    return Sequence!(RTCRtpCodecParameters)(Object_Getter__Handle(this.handle, "codecs"));
  }
}
struct RTCRtpSender {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto track()() {
    return Object_Getter__OptionalHandle(this.handle, "track");
  }
  auto setParameters()(scope ref RTCRtpParameters parameters) {
    return Promise!(void)(Object_Call_Handle__Handle(this.handle, "setParameters", parameters.handle));
  }
  auto setParameters()() {
    return Promise!(void)(Object_Getter__Handle(this.handle, "setParameters"));
  }
  auto getParameters()() {
    return RTCRtpParameters(Object_Getter__Handle(this.handle, "getParameters"));
  }
  auto replaceTrack(T0)(scope auto ref Optional!(T0) withTrack) if (isTOrPointer!(T0, MediaStreamTrack)) {
    return Promise!(void)(RTCRtpSender_replaceTrack(this.handle, !withTrack.empty, withTrack.front._parent));
  }
  auto getStats()() {
    return Promise!(RTCStatsReport)(Object_Getter__Handle(this.handle, "getStats"));
  }
  auto dtmf()() {
    return Object_Getter__OptionalHandle(this.handle, "dtmf");
  }
  auto getStreams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this.handle, "getStreams"));
  }
  void setStreams()(scope ref Sequence!(MediaStream) streams) {
    Object_Call_Handle__void(this.handle, "setStreams", streams.handle);
  }
  void setTrack(T0)(scope auto ref Optional!(T0) track) if (isTOrPointer!(T0, MediaStreamTrack)) {
    RTCRtpSender_setTrack(this.handle, !track.empty, track.front._parent);
  }
  void checkWasCreatedByPc()(scope ref RTCPeerConnection pc) {
    Object_Call_Handle__void(this.handle, "checkWasCreatedByPc", pc._parent);
  }
}
struct RTCRtxParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtxParameters(spasm_add__object());
  }
  void ssrc()(uint ssrc) {
    Object_Call_uint__void(this.handle, "ssrc", ssrc);
  }
  uint ssrc()() {
    return Object_Getter__uint(this.handle, "ssrc");
  }
}


extern (C) void RTCRtpCodecParameters_payloadType_Set(Handle, ushort);
extern (C) void RTCRtpCodecParameters_channels_Set(Handle, ushort);
extern (C) void RTCRtpEncodingParameters_priority_Set(Handle, RTCPriorityType);
extern (C) RTCPriorityType RTCRtpEncodingParameters_priority_Get(Handle);
extern (C) void RTCRtpEncodingParameters_degradationPreference_Set(Handle, RTCDegradationPreference);
extern (C) RTCDegradationPreference RTCRtpEncodingParameters_degradationPreference_Get(Handle);
extern (C) void RTCRtpHeaderExtensionParameters_id_Set(Handle, ushort);
extern (C) Handle RTCRtpSender_replaceTrack(Handle, bool, Handle);
extern (C) void RTCRtpSender_setTrack(Handle, bool, Handle);