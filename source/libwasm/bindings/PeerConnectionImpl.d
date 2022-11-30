module libwasm.bindings.PeerConnectionImpl;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.MediaStreamTrack;
import libwasm.bindings.PeerConnectionImplEnums;
import libwasm.bindings.PeerConnectionObserver;
import libwasm.bindings.Performance;
import libwasm.bindings.RTCCertificate;
import libwasm.bindings.RTCConfiguration;
import libwasm.bindings.RTCDataChannel;
import libwasm.bindings.RTCPeerConnection;
import libwasm.bindings.RTCRtpSender;
import libwasm.bindings.RTCRtpSources;
import libwasm.bindings.TransceiverImpl;
import libwasm.bindings.Window;

@safe:
nothrow:

struct PeerConnectionImpl {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void initialize()(scope ref PeerConnectionObserver observer, scope ref Window window, scope ref RTCConfiguration iceServers, scope ref nsISupports thread) {
    Serialize_Object_VarArgCall!void(this.handle, "initialize", "Handle;Handle;Handle;Handle", tuple(cast(Handle)observer.handle, cast(Handle)window._parent, cast(Handle)iceServers.handle, cast(Handle)thread.handle));
  }
  void createOffer()(scope ref RTCOfferOptions options) {
    Object_Call_Handle__void(this.handle, "createOffer", options._parent);
  }
  void createOffer()() {
    Object_Call__void(this.handle, "createOffer");
  }
  void createAnswer()() {
    Object_Call__void(this.handle, "createAnswer");
  }
  void setLocalDescription()(int action, string sdp) {
    Serialize_Object_VarArgCall!void(this.handle, "setLocalDescription", "int;string", tuple(action, sdp));
  }
  void setRemoteDescription()(int action, string sdp) {
    Serialize_Object_VarArgCall!void(this.handle, "setRemoteDescription", "int;string", tuple(action, sdp));
  }
  void getStats(T0)(scope auto ref Optional!(T0) selector) if (isTOrPointer!(T0, MediaStreamTrack)) {
    Serialize_Object_VarArgCall!void(this.handle, "getStats", "Optional!Handle", tuple(!selector.empty, cast(Handle)selector.front._parent));
  }
  auto createTransceiverImpl(T1)(string kind, scope auto ref Optional!(T1) track) if (isTOrPointer!(T1, MediaStreamTrack)) {
    return TransceiverImpl(Serialize_Object_VarArgCall!Handle(this.handle, "createTransceiverImpl", "string;Optional!Handle", tuple(kind, !track.empty, cast(Handle)track.front._parent)));
  }
  bool checkNegotiationNeeded()() {
    return Object_Getter__bool(this.handle, "checkNegotiationNeeded");
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones, uint duration /* = 100 */, uint interToneGap /* = 70 */) {
    Serialize_Object_VarArgCall!void(this.handle, "insertDTMF", "Handle;string;uint;uint", tuple(cast(Handle)transceiver.handle, tones, duration, interToneGap));
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones, uint duration /* = 100 */) {
    Serialize_Object_VarArgCall!void(this.handle, "insertDTMF", "Handle;string;uint", tuple(cast(Handle)transceiver.handle, tones, duration));
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones) {
    Serialize_Object_VarArgCall!void(this.handle, "insertDTMF", "Handle;string", tuple(cast(Handle)transceiver.handle, tones));
  }
  string getDTMFToneBuffer()(scope ref RTCRtpSender sender) {
    return Serialize_Object_VarArgCall!string(this.handle, "getDTMFToneBuffer", "Handle", tuple(cast(Handle)sender.handle));
  }
  auto getRtpSources()(scope ref MediaStreamTrack track, double rtpSourceNow) {
    return Sequence!(RTCRtpSourceEntry)(Serialize_Object_VarArgCall!Handle(this.handle, "getRtpSources", "Handle;double", tuple(cast(Handle)track._parent, rtpSourceNow)));
  }
  double getNowInRtpSourceReferenceTime()() {
    return Object_Getter__double(this.handle, "getNowInRtpSourceReferenceTime");
  }
  void replaceTrackNoRenegotiation(T1)(scope ref TransceiverImpl transceiverImpl, scope auto ref Optional!(T1) withTrack) if (isTOrPointer!(T1, MediaStreamTrack)) {
    Serialize_Object_VarArgCall!void(this.handle, "replaceTrackNoRenegotiation", "Handle;Optional!Handle", tuple(cast(Handle)transceiverImpl.handle, !withTrack.empty, cast(Handle)withTrack.front._parent));
  }
  void closeStreams()() {
    Object_Call__void(this.handle, "closeStreams");
  }
  void addRIDExtension()(scope ref MediaStreamTrack recvTrack, ushort extensionId) {
    Serialize_Object_VarArgCall!void(this.handle, "addRIDExtension", "Handle;ushort", tuple(cast(Handle)recvTrack._parent, extensionId));
  }
  void addRIDFilter()(scope ref MediaStreamTrack recvTrack, string rid) {
    Serialize_Object_VarArgCall!void(this.handle, "addRIDFilter", "Handle;string", tuple(cast(Handle)recvTrack._parent, rid));
  }
  void insertAudioLevelForContributingSource()(scope ref MediaStreamTrack recvTrack, uint source, double timestamp, bool hasLevel, byte level) {
    Serialize_Object_VarArgCall!void(this.handle, "insertAudioLevelForContributingSource", "Handle;uint;double;bool;byte", tuple(cast(Handle)recvTrack._parent, source, timestamp, hasLevel, level));
  }
  void enablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    Serialize_Object_VarArgCall!void(this.handle, "enablePacketDump", "uint;Enum;bool", tuple(level, type, sending));
  }
  void disablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    Serialize_Object_VarArgCall!void(this.handle, "disablePacketDump", "uint;Enum;bool", tuple(level, type, sending));
  }
  void addIceCandidate(T2)(string candidate, string mid, scope auto ref Optional!(T2) level) if (isTOrPointer!(T2, ushort)) {
    Serialize_Object_VarArgCall!void(this.handle, "addIceCandidate", "string;string;Optional!(ushort)", tuple(candidate, mid, !level.empty, level.front));
  }
  void close()() {
    Object_Call__void(this.handle, "close");
  }
  bool pluginCrash()(uint pluginId, string name) {
    return Serialize_Object_VarArgCall!bool(this.handle, "pluginCrash", "uint;string", tuple(pluginId, name));
  }
  void certificate()(scope ref RTCCertificate certificate) {
    Object_Call_Handle__void(this.handle, "certificate", certificate.handle);
  }
  auto certificate()() {
    return RTCCertificate(Object_Getter__Handle(this.handle, "certificate"));
  }
  string fingerprint()() {
    return Object_Getter__string(this.handle, "fingerprint");
  }
  string localDescription()() {
    return Object_Getter__string(this.handle, "localDescription");
  }
  string currentLocalDescription()() {
    return Object_Getter__string(this.handle, "currentLocalDescription");
  }
  string pendingLocalDescription()() {
    return Object_Getter__string(this.handle, "pendingLocalDescription");
  }
  string remoteDescription()() {
    return Object_Getter__string(this.handle, "remoteDescription");
  }
  string currentRemoteDescription()() {
    return Object_Getter__string(this.handle, "currentRemoteDescription");
  }
  string pendingRemoteDescription()() {
    return Object_Getter__string(this.handle, "pendingRemoteDescription");
  }
  PCImplIceConnectionState iceConnectionState()() {
    return Object_Getter__int(this.handle, "iceConnectionState");
  }
  PCImplIceGatheringState iceGatheringState()() {
    return Object_Getter__int(this.handle, "iceGatheringState");
  }
  PCImplSignalingState signalingState()() {
    return Object_Getter__int(this.handle, "signalingState");
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void peerIdentity()(string peerIdentity) {
    Object_Call_string__void(this.handle, "peerIdentity", peerIdentity);
  }
  string peerIdentity()() {
    return Object_Getter__string(this.handle, "peerIdentity");
  }
  bool privacyRequested()() {
    return Object_Getter__bool(this.handle, "privacyRequested");
  }
  auto createDataChannel()(string label, string protocol, ushort type, bool ordered, ushort maxTime, ushort maxNum, bool externalNegotiated, ushort stream) {
    return RTCDataChannel(Serialize_Object_VarArgCall!Handle(this.handle, "createDataChannel", "string;string;ushort;bool;ushort;ushort;bool;ushort", tuple(label, protocol, type, ordered, maxTime, maxNum, externalNegotiated, stream)));
  }
}


