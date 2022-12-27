module libwasm.bindings.PeerConnectionObserver;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.MediaStreamTrack;
import libwasm.bindings.PeerConnectionObserverEnums;
import libwasm.bindings.RTCDataChannel;
import libwasm.bindings.RTCPeerConnection;
import libwasm.bindings.RTCStatsReport;
import libwasm.bindings.TransceiverImpl;

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
    Serialize_Object_VarArgCall!void(this.handle, "onCreateOfferError", "uint;string", tuple(name, message));
  }
  void onCreateAnswerSuccess()(string answer) {
    Object_Call_string__void(this.handle, "onCreateAnswerSuccess", answer);
  }
  void onCreateAnswerError()(uint name, string message) {
    Serialize_Object_VarArgCall!void(this.handle, "onCreateAnswerError", "uint;string", tuple(name, message));
  }
  void onSetLocalDescriptionSuccess()() {
    Object_Call__void(this.handle, "onSetLocalDescriptionSuccess");
  }
  void onSetRemoteDescriptionSuccess()() {
    Object_Call__void(this.handle, "onSetRemoteDescriptionSuccess");
  }
  void onSetLocalDescriptionError()(uint name, string message) {
    Serialize_Object_VarArgCall!void(this.handle, "onSetLocalDescriptionError", "uint;string", tuple(name, message));
  }
  void onSetRemoteDescriptionError()(uint name, string message) {
    Serialize_Object_VarArgCall!void(this.handle, "onSetRemoteDescriptionError", "uint;string", tuple(name, message));
  }
  void onAddIceCandidateSuccess()() {
    Object_Call__void(this.handle, "onAddIceCandidateSuccess");
  }
  void onAddIceCandidateError()(uint name, string message) {
    Serialize_Object_VarArgCall!void(this.handle, "onAddIceCandidateError", "uint;string", tuple(name, message));
  }
  void onIceCandidate()(ushort level, string mid, string candidate) {
    Serialize_Object_VarArgCall!void(this.handle, "onIceCandidate", "ushort;string;string", tuple(level, mid, candidate));
  }
  void onGetStatsSuccess()(scope ref RTCStatsReportInternal report) {
    Object_Call_Handle__void(this.handle, "onGetStatsSuccess", report.handle);
  }
  void onGetStatsSuccess()() {
    Object_Call__void(this.handle, "onGetStatsSuccess");
  }
  void onGetStatsError()(uint name, string message) {
    Serialize_Object_VarArgCall!void(this.handle, "onGetStatsError", "uint;string", tuple(name, message));
  }
  void notifyDataChannel()(scope ref RTCDataChannel channel) {
    Object_Call_Handle__void(this.handle, "notifyDataChannel", channel._parent);
  }
  void onStateChange()(PCObserverStateType state) {
    Object_Call_int__void(this.handle, "onStateChange", state);
  }
  void onTransceiverNeeded()(string kind, scope ref TransceiverImpl transceiverImpl) {
    Serialize_Object_VarArgCall!void(this.handle, "onTransceiverNeeded", "string;Handle", tuple(kind, cast(Handle)transceiverImpl.handle));
  }
  void onDTMFToneChange()(scope ref MediaStreamTrack track, string tone) {
    Serialize_Object_VarArgCall!void(this.handle, "onDTMFToneChange", "Handle;string", tuple(cast(Handle)track._parent, tone));
  }
  void onPacket()(uint level, mozPacketDumpType type, bool sending, scope ref ArrayBuffer packet) {
    Serialize_Object_VarArgCall!void(this.handle, "onPacket", "uint;Enum;bool;Handle", tuple(level, type, sending, cast(Handle)packet.handle));
  }
  void syncTransceivers()() {
    Object_Call__void(this.handle, "syncTransceivers");
  }
}


