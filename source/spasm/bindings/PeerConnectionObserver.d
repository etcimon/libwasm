module spasm.bindings.PeerConnectionObserver;

import spasm.types;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.PeerConnectionObserverEnums;
import spasm.bindings.RTCDataChannel;
import spasm.bindings.RTCPeerConnection;
import spasm.bindings.RTCStatsReport;
import spasm.bindings.TransceiverImpl;

@safe:
nothrow:

struct PeerConnectionObserver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onCreateOfferSuccess()(string offer) {
    Object_Call_string__void(this.handle, "onCreateOfferSuccess", offer);
  }
  void onCreateOfferError()(uint name, string message) {
    PeerConnectionObserver_onCreateOfferError(this.handle, name, message);
  }
  void onCreateAnswerSuccess()(string answer) {
    Object_Call_string__void(this.handle, "onCreateAnswerSuccess", answer);
  }
  void onCreateAnswerError()(uint name, string message) {
    PeerConnectionObserver_onCreateAnswerError(this.handle, name, message);
  }
  void onSetLocalDescriptionSuccess()() {
    Object_Call__void(this.handle, "onSetLocalDescriptionSuccess");
  }
  void onSetRemoteDescriptionSuccess()() {
    Object_Call__void(this.handle, "onSetRemoteDescriptionSuccess");
  }
  void onSetLocalDescriptionError()(uint name, string message) {
    PeerConnectionObserver_onSetLocalDescriptionError(this.handle, name, message);
  }
  void onSetRemoteDescriptionError()(uint name, string message) {
    PeerConnectionObserver_onSetRemoteDescriptionError(this.handle, name, message);
  }
  void onAddIceCandidateSuccess()() {
    Object_Call__void(this.handle, "onAddIceCandidateSuccess");
  }
  void onAddIceCandidateError()(uint name, string message) {
    PeerConnectionObserver_onAddIceCandidateError(this.handle, name, message);
  }
  void onIceCandidate()(ushort level, string mid, string candidate) {
    PeerConnectionObserver_onIceCandidate(this.handle, level, mid, candidate);
  }
  void onGetStatsSuccess()(scope ref RTCStatsReportInternal report) {
    Object_Call_Handle__void(this.handle, "onGetStatsSuccess", report.handle);
  }
  void onGetStatsSuccess()() {
    Object_Call__void(this.handle, "onGetStatsSuccess");
  }
  void onGetStatsError()(uint name, string message) {
    PeerConnectionObserver_onGetStatsError(this.handle, name, message);
  }
  void notifyDataChannel()(scope ref RTCDataChannel channel) {
    Object_Call_Handle__void(this.handle, "notifyDataChannel", channel._parent);
  }
  void onStateChange()(PCObserverStateType state) {
    PeerConnectionObserver_onStateChange(this.handle, state);
  }
  void onTransceiverNeeded()(string kind, scope ref TransceiverImpl transceiverImpl) {
    PeerConnectionObserver_onTransceiverNeeded(this.handle, kind, transceiverImpl.handle);
  }
  void onDTMFToneChange()(scope ref MediaStreamTrack track, string tone) {
    PeerConnectionObserver_onDTMFToneChange(this.handle, track._parent, tone);
  }
  void onPacket()(uint level, mozPacketDumpType type, bool sending, scope ref ArrayBuffer packet) {
    PeerConnectionObserver_onPacket(this.handle, level, type, sending, packet.handle);
  }
  void syncTransceivers()() {
    Object_Call__void(this.handle, "syncTransceivers");
  }
}


extern (C) void PeerConnectionObserver_onCreateOfferError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onCreateAnswerError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onSetLocalDescriptionError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onSetRemoteDescriptionError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onAddIceCandidateError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onIceCandidate(Handle, ushort, string, string);
extern (C) void PeerConnectionObserver_onGetStatsError(Handle, uint, string);
extern (C) void PeerConnectionObserver_onStateChange(Handle, PCObserverStateType);
extern (C) void PeerConnectionObserver_onTransceiverNeeded(Handle, string, Handle);
extern (C) void PeerConnectionObserver_onDTMFToneChange(Handle, Handle, string);
extern (C) void PeerConnectionObserver_onPacket(Handle, uint, mozPacketDumpType, bool, Handle);