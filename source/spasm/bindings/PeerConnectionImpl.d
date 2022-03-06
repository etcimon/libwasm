module spasm.bindings.PeerConnectionImpl;

import spasm.types;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.PeerConnectionImplEnums;
import spasm.bindings.PeerConnectionObserver;
import spasm.bindings.Performance;
import spasm.bindings.RTCCertificate;
import spasm.bindings.RTCConfiguration;
import spasm.bindings.RTCDataChannel;
import spasm.bindings.RTCPeerConnection;
import spasm.bindings.RTCRtpSender;
import spasm.bindings.RTCRtpSources;
import spasm.bindings.TransceiverImpl;
import spasm.bindings.Window;

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
    PeerConnectionImpl_initialize(this.handle, observer.handle, window._parent, iceServers.handle, thread.handle);
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
    PeerConnectionImpl_setLocalDescription(this.handle, action, sdp);
  }
  void setRemoteDescription()(int action, string sdp) {
    PeerConnectionImpl_setRemoteDescription(this.handle, action, sdp);
  }
  void getStats(T0)(scope auto ref Optional!(T0) selector) if (isTOrPointer!(T0, MediaStreamTrack)) {
    PeerConnectionImpl_getStats(this.handle, !selector.empty, selector.front._parent);
  }
  auto createTransceiverImpl(T1)(string kind, scope auto ref Optional!(T1) track) if (isTOrPointer!(T1, MediaStreamTrack)) {
    return TransceiverImpl(PeerConnectionImpl_createTransceiverImpl(this.handle, kind, !track.empty, track.front._parent));
  }
  bool checkNegotiationNeeded()() {
    return Object_Getter__bool(this.handle, "checkNegotiationNeeded");
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones, uint duration /* = 100 */, uint interToneGap /* = 70 */) {
    PeerConnectionImpl_insertDTMF(this.handle, transceiver.handle, tones, duration, interToneGap);
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones, uint duration /* = 100 */) {
    PeerConnectionImpl_insertDTMF_0(this.handle, transceiver.handle, tones, duration);
  }
  void insertDTMF()(scope ref TransceiverImpl transceiver, string tones) {
    PeerConnectionImpl_insertDTMF_1(this.handle, transceiver.handle, tones);
  }
  string getDTMFToneBuffer()(scope ref RTCRtpSender sender) {
    return PeerConnectionImpl_getDTMFToneBuffer(this.handle, sender.handle);
  }
  auto getRtpSources()(scope ref MediaStreamTrack track, double rtpSourceNow) {
    return Sequence!(RTCRtpSourceEntry)(PeerConnectionImpl_getRtpSources(this.handle, track._parent, rtpSourceNow));
  }
  double getNowInRtpSourceReferenceTime()() {
    return Object_Getter__double(this.handle, "getNowInRtpSourceReferenceTime");
  }
  void replaceTrackNoRenegotiation(T1)(scope ref TransceiverImpl transceiverImpl, scope auto ref Optional!(T1) withTrack) if (isTOrPointer!(T1, MediaStreamTrack)) {
    PeerConnectionImpl_replaceTrackNoRenegotiation(this.handle, transceiverImpl.handle, !withTrack.empty, withTrack.front._parent);
  }
  void closeStreams()() {
    Object_Call__void(this.handle, "closeStreams");
  }
  void addRIDExtension()(scope ref MediaStreamTrack recvTrack, ushort extensionId) {
    PeerConnectionImpl_addRIDExtension(this.handle, recvTrack._parent, extensionId);
  }
  void addRIDFilter()(scope ref MediaStreamTrack recvTrack, string rid) {
    PeerConnectionImpl_addRIDFilter(this.handle, recvTrack._parent, rid);
  }
  void insertAudioLevelForContributingSource()(scope ref MediaStreamTrack recvTrack, uint source, double timestamp, bool hasLevel, byte level) {
    PeerConnectionImpl_insertAudioLevelForContributingSource(this.handle, recvTrack._parent, source, timestamp, hasLevel, level);
  }
  void enablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    PeerConnectionImpl_enablePacketDump(this.handle, level, type, sending);
  }
  void disablePacketDump()(uint level, mozPacketDumpType type, bool sending) {
    PeerConnectionImpl_disablePacketDump(this.handle, level, type, sending);
  }
  void addIceCandidate(T2)(string candidate, string mid, scope auto ref Optional!(T2) level) if (isTOrPointer!(T2, ushort)) {
    PeerConnectionImpl_addIceCandidate(this.handle, candidate, mid, !level.empty, level.front);
  }
  void close()() {
    Object_Call__void(this.handle, "close");
  }
  bool pluginCrash()(uint pluginId, string name) {
    return PeerConnectionImpl_pluginCrash(this.handle, pluginId, name);
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
    return PeerConnectionImpl_iceConnectionState_Get(this.handle);
  }
  PCImplIceGatheringState iceGatheringState()() {
    return PeerConnectionImpl_iceGatheringState_Get(this.handle);
  }
  PCImplSignalingState signalingState()() {
    return PeerConnectionImpl_signalingState_Get(this.handle);
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
    return RTCDataChannel(PeerConnectionImpl_createDataChannel(this.handle, label, protocol, type, ordered, maxTime, maxNum, externalNegotiated, stream));
  }
}


extern (C) void PeerConnectionImpl_initialize(Handle, Handle, Handle, Handle, Handle);
extern (C) void PeerConnectionImpl_setLocalDescription(Handle, int, string);
extern (C) void PeerConnectionImpl_setRemoteDescription(Handle, int, string);
extern (C) void PeerConnectionImpl_getStats(Handle, bool, Handle);
extern (C) Handle PeerConnectionImpl_createTransceiverImpl(Handle, string, bool, Handle);
extern (C) void PeerConnectionImpl_insertDTMF(Handle, Handle, string, uint, uint);
extern (C) void PeerConnectionImpl_insertDTMF_0(Handle, Handle, string, uint);
extern (C) void PeerConnectionImpl_insertDTMF_1(Handle, Handle, string);
extern (C) string PeerConnectionImpl_getDTMFToneBuffer(Handle, Handle);
extern (C) Handle PeerConnectionImpl_getRtpSources(Handle, Handle, double);
extern (C) void PeerConnectionImpl_replaceTrackNoRenegotiation(Handle, Handle, bool, Handle);
extern (C) void PeerConnectionImpl_addRIDExtension(Handle, Handle, ushort);
extern (C) void PeerConnectionImpl_addRIDFilter(Handle, Handle, string);
extern (C) void PeerConnectionImpl_insertAudioLevelForContributingSource(Handle, Handle, uint, double, bool, byte);
extern (C) void PeerConnectionImpl_enablePacketDump(Handle, uint, mozPacketDumpType, bool);
extern (C) void PeerConnectionImpl_disablePacketDump(Handle, uint, mozPacketDumpType, bool);
extern (C) void PeerConnectionImpl_addIceCandidate(Handle, string, string, bool, ushort);
extern (C) bool PeerConnectionImpl_pluginCrash(Handle, uint, string);
extern (C) PCImplIceConnectionState PeerConnectionImpl_iceConnectionState_Get(Handle);
extern (C) PCImplIceGatheringState PeerConnectionImpl_iceGatheringState_Get(Handle);
extern (C) PCImplSignalingState PeerConnectionImpl_signalingState_Get(Handle);
extern (C) Handle PeerConnectionImpl_createDataChannel(Handle, string, string, ushort, bool, ushort, ushort, bool, ushort);