module spasm.bindings.RTCRtpReceiver;

import spasm.types;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.RTCRtpSources;
import spasm.bindings.RTCRtpTransceiver;
import spasm.bindings.RTCStatsReport;

@safe:
nothrow:

struct RTCRtpReceiver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto track()() {
    return MediaStreamTrack(Object_Getter__Handle(this.handle, "track"));
  }
  auto getStats()() {
    return Promise!(RTCStatsReport)(Object_Getter__Handle(this.handle, "getStats"));
  }
  auto getContributingSources()() {
    return Sequence!(RTCRtpContributingSource)(Object_Getter__Handle(this.handle, "getContributingSources"));
  }
  auto getSynchronizationSources()() {
    return Sequence!(RTCRtpSynchronizationSource)(Object_Getter__Handle(this.handle, "getSynchronizationSources"));
  }
  void setStreamIds()(scope ref Sequence!(string) streamIds) {
    Object_Call_Handle__void(this.handle, "setStreamIds", streamIds.handle);
  }
  void setRemoteSendBit()(bool sendBit) {
    Object_Call_bool__void(this.handle, "setRemoteSendBit", sendBit);
  }
  void processTrackAdditionsAndRemovals()(scope ref RTCRtpTransceiver transceiver, scope ref JsObject postProcessing) {
    RTCRtpReceiver_processTrackAdditionsAndRemovals(this.handle, transceiver.handle, postProcessing.handle);
  }
}


extern (C) void RTCRtpReceiver_processTrackAdditionsAndRemovals(Handle, Handle, Handle);