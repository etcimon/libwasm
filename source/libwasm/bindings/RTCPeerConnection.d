module libwasm.bindings.RTCPeerConnection;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMException;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Function;
import libwasm.bindings.MediaStream;
import libwasm.bindings.MediaStreamTrack;
import libwasm.bindings.Performance;
import libwasm.bindings.RTCCertificate;
import libwasm.bindings.RTCConfiguration;
import libwasm.bindings.RTCDataChannel;
import libwasm.bindings.RTCIceCandidate;
import libwasm.bindings.RTCIdentityAssertion;
import libwasm.bindings.RTCIdentityProvider;
import libwasm.bindings.RTCRtpReceiver;
import libwasm.bindings.RTCRtpSender;
import libwasm.bindings.RTCRtpTransceiver;
import libwasm.bindings.RTCSessionDescription;
import libwasm.bindings.RTCStatsReport;
import libwasm.bindings.SubtleCrypto;

@safe:
nothrow:

struct RTCAnswerOptions {
  nothrow:
  libwasm.bindings.RTCPeerConnection.RTCOfferAnswerOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCOfferAnswerOptions(h);
  }
  static auto create() {
    return RTCAnswerOptions(libwasm_add__object());
  }
}
struct RTCDataChannelInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCDataChannelInit(libwasm_add__object());
  }
  void ordered()(bool ordered) {
    Object_Call_bool__void(this.handle, "ordered", ordered);
  }
  bool ordered()() {
    return Object_Getter__bool(this.handle, "ordered");
  }
  void maxPacketLifeTime()(ushort maxPacketLifeTime) {
    Serialize_Object_VarArgCall!void(this.handle, "maxPacketLifeTime", "ushort", tuple(maxPacketLifeTime));
  }
  ushort maxPacketLifeTime()() {
    return Object_Getter__ushort(this.handle, "maxPacketLifeTime");
  }
  void maxRetransmits()(ushort maxRetransmits) {
    Serialize_Object_VarArgCall!void(this.handle, "maxRetransmits", "ushort", tuple(maxRetransmits));
  }
  ushort maxRetransmits()() {
    return Object_Getter__ushort(this.handle, "maxRetransmits");
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this.handle, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this.handle, "protocol");
  }
  void negotiated()(bool negotiated) {
    Object_Call_bool__void(this.handle, "negotiated", negotiated);
  }
  bool negotiated()() {
    return Object_Getter__bool(this.handle, "negotiated");
  }
  void id()(ushort id) {
    Serialize_Object_VarArgCall!void(this.handle, "id", "ushort", tuple(id));
  }
  ushort id()() {
    return Object_Getter__ushort(this.handle, "id");
  }
  void maxRetransmitTime()(ushort maxRetransmitTime) {
    Serialize_Object_VarArgCall!void(this.handle, "maxRetransmitTime", "ushort", tuple(maxRetransmitTime));
  }
  ushort maxRetransmitTime()() {
    return Object_Getter__ushort(this.handle, "maxRetransmitTime");
  }
}
enum RTCIceConnectionState {
  new_,
  checking,
  connected,
  completed,
  failed,
  disconnected,
  closed
}
enum RTCIceGatheringState {
  new_,
  gathering,
  complete
}
struct RTCOfferAnswerOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCOfferAnswerOptions(libwasm_add__object());
  }
}
struct RTCOfferOptions {
  nothrow:
  libwasm.bindings.RTCPeerConnection.RTCOfferAnswerOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCOfferAnswerOptions(h);
  }
  static auto create() {
    return RTCOfferOptions(libwasm_add__object());
  }
  void offerToReceiveVideo()(bool offerToReceiveVideo) {
    Object_Call_bool__void(this._parent, "offerToReceiveVideo", offerToReceiveVideo);
  }
  bool offerToReceiveVideo()() {
    return Object_Getter__bool(this._parent, "offerToReceiveVideo");
  }
  void offerToReceiveAudio()(bool offerToReceiveAudio) {
    Object_Call_bool__void(this._parent, "offerToReceiveAudio", offerToReceiveAudio);
  }
  bool offerToReceiveAudio()() {
    return Object_Getter__bool(this._parent, "offerToReceiveAudio");
  }
  void iceRestart()(bool iceRestart) {
    Object_Call_bool__void(this._parent, "iceRestart", iceRestart);
  }
  bool iceRestart()() {
    return Object_Getter__bool(this._parent, "iceRestart");
  }
}
struct RTCPeerConnection {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto generateCertificate()(scope ref AlgorithmIdentifier keygenAlgorithm) {
    return JsPromise!(RTCCertificate)(Serialize_Object_VarArgCall!Handle(this._parent, "generateCertificate", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref keygenAlgorithm.Types[0] v) => 0),((string v) => 1))(keygenAlgorithm),tuple(libwasm.sumtype.match!(((ref keygenAlgorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(keygenAlgorithm),libwasm.sumtype.match!(((ref keygenAlgorithm.Types[0] v) => string.init),((string v) => v))(keygenAlgorithm)))));
  }
  void setIdentityProvider()(string provider, scope ref RTCIdentityProviderOptions options) {
    Serialize_Object_VarArgCall!void(this._parent, "setIdentityProvider", "string;Handle", tuple(provider, cast(Handle)options.handle));
  }
  void setIdentityProvider()(string provider) {
    Object_Call_string__void(this._parent, "setIdentityProvider", provider);
  }
  auto getIdentityAssertion()() {
    return JsPromise!(string)(Object_Getter__Handle(this._parent, "getIdentityAssertion"));
  }
  auto createOffer()(scope ref RTCOfferOptions options) {
    return JsPromise!(RTCSessionDescriptionInit)(Object_Call_Handle__Handle(this._parent, "createOffer", options._parent));
  }
  auto createOffer()() {
    return JsPromise!(RTCSessionDescriptionInit)(Object_Getter__Handle(this._parent, "createOffer"));
  }
  auto createAnswer()(scope ref RTCAnswerOptions options) {
    return JsPromise!(RTCSessionDescriptionInit)(Object_Call_Handle__Handle(this._parent, "createAnswer", options._parent));
  }
  auto createAnswer()() {
    return JsPromise!(RTCSessionDescriptionInit)(Object_Getter__Handle(this._parent, "createAnswer"));
  }
  auto setLocalDescription()(scope ref RTCSessionDescriptionInit description) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this._parent, "setLocalDescription", description.handle));
  }
  auto setRemoteDescription()(scope ref RTCSessionDescriptionInit description) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this._parent, "setRemoteDescription", description.handle));
  }
  auto localDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "localDescription"));
  }
  auto currentLocalDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "currentLocalDescription"));
  }
  auto pendingLocalDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "pendingLocalDescription"));
  }
  auto remoteDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "remoteDescription"));
  }
  auto currentRemoteDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "currentRemoteDescription"));
  }
  auto pendingRemoteDescription()() {
    return Optional!(RTCSessionDescription)(Object_Getter__OptionalHandle(this._parent, "pendingRemoteDescription"));
  }
  RTCSignalingState signalingState()() {
    return Object_Getter__int(this._parent, "signalingState");
  }
  auto addIceCandidate(T0)(scope auto ref Optional!(T0) candidate) if (isTOrPointer!(T0, SumType!(RTCIceCandidateInit, RTCIceCandidate))) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this._parent, "addIceCandidate", "Optional!SumType!(Handle,Handle)", tuple(!candidate.empty, libwasm.sumtype.match!(((ref candidate.Types[0] v) => 0),((ref candidate.Types[1] v) => 1))(candidate),tuple(libwasm.sumtype.match!(((ref candidate.Types[0] v) => cast(Handle)v.handle),((ref candidate.Types[1] v) => Handle.init))(candidate),libwasm.sumtype.match!(((ref candidate.Types[0] v) => Handle.init),((ref candidate.Types[1] v) => cast(Handle)v.handle))(candidate)))));
  }
  Optional!(bool) canTrickleIceCandidates()() {
    return Object_Getter__OptionalBool(this._parent, "canTrickleIceCandidates");
  }
  RTCIceGatheringState iceGatheringState()() {
    return Object_Getter__int(this._parent, "iceGatheringState");
  }
  RTCIceConnectionState iceConnectionState()() {
    return Object_Getter__int(this._parent, "iceConnectionState");
  }
  auto peerIdentity()() {
    return JsPromise!(RTCIdentityAssertion)(Object_Getter__Handle(this._parent, "peerIdentity"));
  }
  Optional!(string) idpLoginUrl()() {
    return Object_Getter__OptionalString(this._parent, "idpLoginUrl");
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  auto getConfiguration()() {
    return RTCConfiguration(Object_Getter__Handle(this._parent, "getConfiguration"));
  }
  auto getLocalStreams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this._parent, "getLocalStreams"));
  }
  auto getRemoteStreams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this._parent, "getRemoteStreams"));
  }
  void addStream()(scope ref MediaStream stream) {
    Object_Call_Handle__void(this._parent, "addStream", stream._parent);
  }
  auto addTrack()(scope ref MediaStreamTrack track, scope ref MediaStream streams) {
    return RTCRtpSender(Serialize_Object_VarArgCall!Handle(this._parent, "addTrack", "Handle;Handle", tuple(cast(Handle)track._parent, cast(Handle)streams._parent)));
  }
  void removeTrack()(scope ref RTCRtpSender sender) {
    Object_Call_Handle__void(this._parent, "removeTrack", sender.handle);
  }
  auto addTransceiver()(scope ref SumType!(MediaStreamTrack, string) trackOrKind, scope ref RTCRtpTransceiverInit init) {
    return RTCRtpTransceiver(Serialize_Object_VarArgCall!Handle(this._parent, "addTransceiver", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => 0),((string v) => 1))(trackOrKind),tuple(libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(trackOrKind),libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => string.init),((string v) => v))(trackOrKind)), cast(Handle)init.handle)));
  }
  auto addTransceiver()(scope ref SumType!(MediaStreamTrack, string) trackOrKind) {
    return RTCRtpTransceiver(Serialize_Object_VarArgCall!Handle(this._parent, "addTransceiver", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => 0),((string v) => 1))(trackOrKind),tuple(libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(trackOrKind),libwasm.sumtype.match!(((ref trackOrKind.Types[0] v) => string.init),((string v) => v))(trackOrKind)))));
  }
  auto getSenders()() {
    return Sequence!(RTCRtpSender)(Object_Getter__Handle(this._parent, "getSenders"));
  }
  auto getReceivers()() {
    return Sequence!(RTCRtpReceiver)(Object_Getter__Handle(this._parent, "getReceivers"));
  }
  auto getTransceivers()() {
    return Sequence!(RTCRtpTransceiver)(Object_Getter__Handle(this._parent, "getTransceivers"));
  }
  double mozGetNowInRtpSourceReferenceTime()() {
    return Object_Getter__double(this._parent, "mozGetNowInRtpSourceReferenceTime");
  }
  void mozInsertAudioLevelForContributingSource()(scope ref RTCRtpReceiver receiver, uint source, double timestamp, bool hasLevel, byte level) {
    Serialize_Object_VarArgCall!void(this._parent, "mozInsertAudioLevelForContributingSource", "Handle;uint;double;bool;byte", tuple(cast(Handle)receiver.handle, source, timestamp, hasLevel, level));
  }
  void mozAddRIDExtension()(scope ref RTCRtpReceiver receiver, ushort extensionId) {
    Serialize_Object_VarArgCall!void(this._parent, "mozAddRIDExtension", "Handle;ushort", tuple(cast(Handle)receiver.handle, extensionId));
  }
  void mozAddRIDFilter()(scope ref RTCRtpReceiver receiver, string rid) {
    Serialize_Object_VarArgCall!void(this._parent, "mozAddRIDFilter", "Handle;string", tuple(cast(Handle)receiver.handle, rid));
  }
  void mozSetPacketCallback()(mozPacketCallback callback) {
    RTCPeerConnection_mozSetPacketCallback(this._parent, callback);
  }
  void mozEnablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    Serialize_Object_VarArgCall!void(this._parent, "mozEnablePacketDump", "uint;Enum;bool", tuple(level, type, sending));
  }
  void mozDisablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    Serialize_Object_VarArgCall!void(this._parent, "mozDisablePacketDump", "uint;Enum;bool", tuple(level, type, sending));
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void onnegotiationneeded(T0)(scope auto ref Optional!(T0) onnegotiationneeded) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onnegotiationneeded", !onnegotiationneeded.empty, onnegotiationneeded.front);
  }
  EventHandler onnegotiationneeded()() {
    return Object_Getter__EventHandler(this._parent, "onnegotiationneeded");
  }
  void onicecandidate(T0)(scope auto ref Optional!(T0) onicecandidate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onicecandidate", !onicecandidate.empty, onicecandidate.front);
  }
  EventHandler onicecandidate()() {
    return Object_Getter__EventHandler(this._parent, "onicecandidate");
  }
  void onsignalingstatechange(T0)(scope auto ref Optional!(T0) onsignalingstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsignalingstatechange", !onsignalingstatechange.empty, onsignalingstatechange.front);
  }
  EventHandler onsignalingstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onsignalingstatechange");
  }
  void onaddstream(T0)(scope auto ref Optional!(T0) onaddstream) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onaddstream", !onaddstream.empty, onaddstream.front);
  }
  EventHandler onaddstream()() {
    return Object_Getter__EventHandler(this._parent, "onaddstream");
  }
  void onaddtrack(T0)(scope auto ref Optional!(T0) onaddtrack) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onaddtrack", !onaddtrack.empty, onaddtrack.front);
  }
  EventHandler onaddtrack()() {
    return Object_Getter__EventHandler(this._parent, "onaddtrack");
  }
  void ontrack(T0)(scope auto ref Optional!(T0) ontrack) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontrack", !ontrack.empty, ontrack.front);
  }
  EventHandler ontrack()() {
    return Object_Getter__EventHandler(this._parent, "ontrack");
  }
  void onremovestream(T0)(scope auto ref Optional!(T0) onremovestream) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onremovestream", !onremovestream.empty, onremovestream.front);
  }
  EventHandler onremovestream()() {
    return Object_Getter__EventHandler(this._parent, "onremovestream");
  }
  void oniceconnectionstatechange(T0)(scope auto ref Optional!(T0) oniceconnectionstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oniceconnectionstatechange", !oniceconnectionstatechange.empty, oniceconnectionstatechange.front);
  }
  EventHandler oniceconnectionstatechange()() {
    return Object_Getter__EventHandler(this._parent, "oniceconnectionstatechange");
  }
  void onicegatheringstatechange(T0)(scope auto ref Optional!(T0) onicegatheringstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onicegatheringstatechange", !onicegatheringstatechange.empty, onicegatheringstatechange.front);
  }
  EventHandler onicegatheringstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onicegatheringstatechange");
  }
  auto getStats(T0)(scope auto ref Optional!(T0) selector) if (isTOrPointer!(T0, MediaStreamTrack)) {
    return JsPromise!(RTCStatsReport)(Serialize_Object_VarArgCall!Handle(this._parent, "getStats", "Optional!Handle", tuple(!selector.empty, cast(Handle)selector.front._parent)));
  }
  auto getStats()() {
    return JsPromise!(RTCStatsReport)(Object_Getter__Handle(this._parent, "getStats"));
  }
  auto createDataChannel()(string label, scope ref RTCDataChannelInit dataChannelDict) {
    return RTCDataChannel(Serialize_Object_VarArgCall!Handle(this._parent, "createDataChannel", "string;Handle", tuple(label, cast(Handle)dataChannelDict.handle)));
  }
  auto createDataChannel()(string label) {
    return RTCDataChannel(Object_Call_string__Handle(this._parent, "createDataChannel", label));
  }
  void ondatachannel(T0)(scope auto ref Optional!(T0) ondatachannel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondatachannel", !ondatachannel.empty, ondatachannel.front);
  }
  EventHandler ondatachannel()() {
    return Object_Getter__EventHandler(this._parent, "ondatachannel");
  }
  auto createOffer()(RTCSessionDescriptionCallback successCallback, RTCPeerConnectionErrorCallback failureCallback, scope ref RTCOfferOptions options) {
    return JsPromise!(void)(RTCPeerConnection_createOffer__Handle_Handle_Handle(this._parent, successCallback, failureCallback, options._parent));
  }
  auto createOffer()(RTCSessionDescriptionCallback successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return JsPromise!(void)(RTCPeerConnection_createOffer_0_Handle_Handle(this._parent, successCallback, failureCallback));
  }
  auto createAnswer()(RTCSessionDescriptionCallback successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return JsPromise!(void)(RTCPeerConnection_createAnswer__Handle_Handle(this._parent, successCallback, failureCallback));
  }
  auto setLocalDescription()(scope ref RTCSessionDescriptionInit description, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return JsPromise!(void)(RTCPeerConnection_setLocalDescription__Handle_Handle_Handle(this._parent, description.handle, successCallback, failureCallback));
  }
  auto setRemoteDescription()(scope ref RTCSessionDescriptionInit description, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return JsPromise!(void)(RTCPeerConnection_setRemoteDescription__Handle_Handle_Handle(this._parent, description.handle, successCallback, failureCallback));
  }
  auto addIceCandidate()(scope ref RTCIceCandidate candidate, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return JsPromise!(void)(RTCPeerConnection_addIceCandidate__Handle_Handle_Handle(this._parent, candidate.handle, successCallback, failureCallback));
  }
}
alias RTCPeerConnectionErrorCallback = void delegate(DOMException);
alias RTCSessionDescriptionCallback = void delegate(RTCSessionDescriptionInit);
enum RTCSignalingState {
  stable,
  have_local_offer,
  have_remote_offer,
  have_local_pranswer,
  have_remote_pranswer,
  closed
}
alias RTCStatsCallback = void delegate(RTCStatsReport);
alias mozPacketCallback = void delegate(uint, mozPacketDumpType, bool, ArrayBuffer);
enum mozPacketDumpType {
  rtp,
  srtp,
  rtcp,
  srtcp
}


extern (C) void RTCPeerConnection_mozSetPacketCallback(Handle, mozPacketCallback);
extern (C) Handle RTCPeerConnection_createOffer__Handle_Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback, Handle);
extern (C) Handle RTCPeerConnection_createOffer_0_Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_createAnswer__Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_setLocalDescription__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_setRemoteDescription__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_addIceCandidate__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);