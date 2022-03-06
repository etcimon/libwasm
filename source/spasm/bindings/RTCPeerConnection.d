module spasm.bindings.RTCPeerConnection;

import spasm.types;
import spasm.bindings.DOMException;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.Function;
import spasm.bindings.MediaStream;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.Performance;
import spasm.bindings.RTCCertificate;
import spasm.bindings.RTCConfiguration;
import spasm.bindings.RTCDataChannel;
import spasm.bindings.RTCIceCandidate;
import spasm.bindings.RTCIdentityAssertion;
import spasm.bindings.RTCIdentityProvider;
import spasm.bindings.RTCRtpReceiver;
import spasm.bindings.RTCRtpSender;
import spasm.bindings.RTCRtpTransceiver;
import spasm.bindings.RTCSessionDescription;
import spasm.bindings.RTCStatsReport;
import spasm.bindings.SubtleCrypto;

@safe:
nothrow:

struct RTCAnswerOptions {
  nothrow:
  spasm.bindings.RTCPeerConnection.RTCOfferAnswerOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCOfferAnswerOptions(h);
  }
  static auto create() {
    return RTCAnswerOptions(spasm_add__object());
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
    return RTCDataChannelInit(spasm_add__object());
  }
  void ordered()(bool ordered) {
    Object_Call_bool__void(this.handle, "ordered", ordered);
  }
  bool ordered()() {
    return Object_Getter__bool(this.handle, "ordered");
  }
  void maxPacketLifeTime()(ushort maxPacketLifeTime) {
    RTCDataChannelInit_maxPacketLifeTime_Set(this.handle, maxPacketLifeTime);
  }
  ushort maxPacketLifeTime()() {
    return Object_Getter__ushort(this.handle, "maxPacketLifeTime");
  }
  void maxRetransmits()(ushort maxRetransmits) {
    RTCDataChannelInit_maxRetransmits_Set(this.handle, maxRetransmits);
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
    RTCDataChannelInit_id_Set(this.handle, id);
  }
  ushort id()() {
    return Object_Getter__ushort(this.handle, "id");
  }
  void maxRetransmitTime()(ushort maxRetransmitTime) {
    RTCDataChannelInit_maxRetransmitTime_Set(this.handle, maxRetransmitTime);
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
    return RTCOfferAnswerOptions(spasm_add__object());
  }
}
struct RTCOfferOptions {
  nothrow:
  spasm.bindings.RTCPeerConnection.RTCOfferAnswerOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCOfferAnswerOptions(h);
  }
  static auto create() {
    return RTCOfferOptions(spasm_add__object());
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
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto generateCertificate()(scope ref AlgorithmIdentifier keygenAlgorithm) {
    return Promise!(RTCCertificate)(RTCPeerConnection_generateCertificate(this._parent, keygenAlgorithm));
  }
  void setIdentityProvider()(string provider, scope ref RTCIdentityProviderOptions options) {
    RTCPeerConnection_setIdentityProvider(this._parent, provider, options.handle);
  }
  void setIdentityProvider()(string provider) {
    Object_Call_string__void(this._parent, "setIdentityProvider", provider);
  }
  auto getIdentityAssertion()() {
    return Promise!(string)(Object_Getter__Handle(this._parent, "getIdentityAssertion"));
  }
  auto createOffer()(scope ref RTCOfferOptions options) {
    return Promise!(RTCSessionDescriptionInit)(Object_Call_Handle__Handle(this._parent, "createOffer", options._parent));
  }
  auto createOffer()() {
    return Promise!(RTCSessionDescriptionInit)(Object_Getter__Handle(this._parent, "createOffer"));
  }
  auto createAnswer()(scope ref RTCAnswerOptions options) {
    return Promise!(RTCSessionDescriptionInit)(Object_Call_Handle__Handle(this._parent, "createAnswer", options._parent));
  }
  auto createAnswer()() {
    return Promise!(RTCSessionDescriptionInit)(Object_Getter__Handle(this._parent, "createAnswer"));
  }
  auto setLocalDescription()(scope ref RTCSessionDescriptionInit description) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "setLocalDescription", description.handle));
  }
  auto setRemoteDescription()(scope ref RTCSessionDescriptionInit description) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "setRemoteDescription", description.handle));
  }
  auto localDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "localDescription");
  }
  auto currentLocalDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "currentLocalDescription");
  }
  auto pendingLocalDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "pendingLocalDescription");
  }
  auto remoteDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "remoteDescription");
  }
  auto currentRemoteDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "currentRemoteDescription");
  }
  auto pendingRemoteDescription()() {
    return Object_Getter__OptionalHandle(this._parent, "pendingRemoteDescription");
  }
  RTCSignalingState signalingState()() {
    return RTCPeerConnection_signalingState_Get(this._parent);
  }
  auto addIceCandidate(T0)(scope auto ref Optional!(T0) candidate) if (isTOrPointer!(T0, SumType!(RTCIceCandidateInit, RTCIceCandidate))) {
    return Promise!(void)(RTCPeerConnection_addIceCandidate__optional_union2_RTCIceCandidateInit_RTCIceCandidate(this._parent, !candidate.empty, *candidate.frontRef));
  }
  Optional!(bool) canTrickleIceCandidates()() {
    return Object_Getter__OptionalBool(this._parent, "canTrickleIceCandidates");
  }
  RTCIceGatheringState iceGatheringState()() {
    return RTCPeerConnection_iceGatheringState_Get(this._parent);
  }
  RTCIceConnectionState iceConnectionState()() {
    return RTCPeerConnection_iceConnectionState_Get(this._parent);
  }
  auto peerIdentity()() {
    return Promise!(RTCIdentityAssertion)(Object_Getter__Handle(this._parent, "peerIdentity"));
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
    return RTCRtpSender(RTCPeerConnection_addTrack(this._parent, track._parent, streams._parent));
  }
  void removeTrack()(scope ref RTCRtpSender sender) {
    Object_Call_Handle__void(this._parent, "removeTrack", sender.handle);
  }
  auto addTransceiver()(scope ref SumType!(MediaStreamTrack, string) trackOrKind, scope ref RTCRtpTransceiverInit init) {
    return RTCRtpTransceiver(RTCPeerConnection_addTransceiver(this._parent, trackOrKind, init.handle));
  }
  auto addTransceiver()(scope ref SumType!(MediaStreamTrack, string) trackOrKind) {
    return RTCRtpTransceiver(RTCPeerConnection_addTransceiver_0(this._parent, trackOrKind));
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
    RTCPeerConnection_mozInsertAudioLevelForContributingSource(this._parent, receiver.handle, source, timestamp, hasLevel, level);
  }
  void mozAddRIDExtension()(scope ref RTCRtpReceiver receiver, ushort extensionId) {
    RTCPeerConnection_mozAddRIDExtension(this._parent, receiver.handle, extensionId);
  }
  void mozAddRIDFilter()(scope ref RTCRtpReceiver receiver, string rid) {
    RTCPeerConnection_mozAddRIDFilter(this._parent, receiver.handle, rid);
  }
  void mozSetPacketCallback()(mozPacketCallback callback) {
    RTCPeerConnection_mozSetPacketCallback(this._parent, callback);
  }
  void mozEnablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    RTCPeerConnection_mozEnablePacketDump(this._parent, level, type, sending);
  }
  void mozDisablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    RTCPeerConnection_mozDisablePacketDump(this._parent, level, type, sending);
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
    return Promise!(RTCStatsReport)(RTCPeerConnection_getStats(this._parent, !selector.empty, selector.front._parent));
  }
  auto getStats()() {
    return Promise!(RTCStatsReport)(Object_Getter__Handle(this._parent, "getStats"));
  }
  auto createDataChannel()(string label, scope ref RTCDataChannelInit dataChannelDict) {
    return RTCDataChannel(RTCPeerConnection_createDataChannel(this._parent, label, dataChannelDict.handle));
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
    return Promise!(void)(RTCPeerConnection_createOffer__Handle_Handle_Handle(this._parent, successCallback, failureCallback, options._parent));
  }
  auto createOffer()(RTCSessionDescriptionCallback successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return Promise!(void)(RTCPeerConnection_createOffer_0_Handle_Handle(this._parent, successCallback, failureCallback));
  }
  auto createAnswer()(RTCSessionDescriptionCallback successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return Promise!(void)(RTCPeerConnection_createAnswer__Handle_Handle(this._parent, successCallback, failureCallback));
  }
  auto setLocalDescription()(scope ref RTCSessionDescriptionInit description, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return Promise!(void)(RTCPeerConnection_setLocalDescription__Handle_Handle_Handle(this._parent, description.handle, successCallback, failureCallback));
  }
  auto setRemoteDescription()(scope ref RTCSessionDescriptionInit description, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return Promise!(void)(RTCPeerConnection_setRemoteDescription__Handle_Handle_Handle(this._parent, description.handle, successCallback, failureCallback));
  }
  auto addIceCandidate()(scope ref RTCIceCandidate candidate, VoidFunction successCallback, RTCPeerConnectionErrorCallback failureCallback) {
    return Promise!(void)(RTCPeerConnection_addIceCandidate__Handle_Handle_Handle(this._parent, candidate.handle, successCallback, failureCallback));
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


extern (C) void RTCDataChannelInit_maxPacketLifeTime_Set(Handle, ushort);
extern (C) void RTCDataChannelInit_maxRetransmits_Set(Handle, ushort);
extern (C) void RTCDataChannelInit_id_Set(Handle, ushort);
extern (C) void RTCDataChannelInit_maxRetransmitTime_Set(Handle, ushort);
extern (C) Handle RTCPeerConnection_generateCertificate(Handle, scope ref AlgorithmIdentifier);
extern (C) void RTCPeerConnection_setIdentityProvider(Handle, string, Handle);
extern (C) RTCSignalingState RTCPeerConnection_signalingState_Get(Handle);
extern (C) Handle RTCPeerConnection_addIceCandidate__optional_union2_RTCIceCandidateInit_RTCIceCandidate(Handle, bool, scope ref SumType!(RTCIceCandidateInit, RTCIceCandidate));
extern (C) RTCIceGatheringState RTCPeerConnection_iceGatheringState_Get(Handle);
extern (C) RTCIceConnectionState RTCPeerConnection_iceConnectionState_Get(Handle);
extern (C) Handle RTCPeerConnection_addTrack(Handle, Handle, Handle);
extern (C) Handle RTCPeerConnection_addTransceiver(Handle, scope ref SumType!(MediaStreamTrack, string), Handle);
extern (C) Handle RTCPeerConnection_addTransceiver_0(Handle, scope ref SumType!(MediaStreamTrack, string));
extern (C) void RTCPeerConnection_mozInsertAudioLevelForContributingSource(Handle, Handle, uint, double, bool, byte);
extern (C) void RTCPeerConnection_mozAddRIDExtension(Handle, Handle, ushort);
extern (C) void RTCPeerConnection_mozAddRIDFilter(Handle, Handle, string);
extern (C) void RTCPeerConnection_mozSetPacketCallback(Handle, mozPacketCallback);
extern (C) void RTCPeerConnection_mozEnablePacketDump(Handle, uint, mozPacketDumpType, bool);
extern (C) void RTCPeerConnection_mozDisablePacketDump(Handle, uint, mozPacketDumpType, bool);
extern (C) Handle RTCPeerConnection_getStats(Handle, bool, Handle);
extern (C) Handle RTCPeerConnection_createDataChannel(Handle, string, Handle);
extern (C) Handle RTCPeerConnection_createOffer__Handle_Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback, Handle);
extern (C) Handle RTCPeerConnection_createOffer_0_Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_createAnswer__Handle_Handle(Handle, RTCSessionDescriptionCallback, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_setLocalDescription__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_setRemoteDescription__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);
extern (C) Handle RTCPeerConnection_addIceCandidate__Handle_Handle_Handle(Handle, Handle, VoidFunction, RTCPeerConnectionErrorCallback);