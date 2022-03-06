module spasm.bindings.TransceiverImpl;

import spasm.types;
import spasm.bindings.MediaStreamTrack;
import spasm.bindings.RTCRtpTransceiver;

@safe:
nothrow:

struct TransceiverImpl {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getReceiveTrack()() {
    return MediaStreamTrack(Object_Getter__Handle(this.handle, "getReceiveTrack"));
  }
  void syncWithJS()(scope ref RTCRtpTransceiver transceiver) {
    Object_Call_Handle__void(this.handle, "syncWithJS", transceiver.handle);
  }
}


