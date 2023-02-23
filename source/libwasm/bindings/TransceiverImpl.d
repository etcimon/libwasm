module libwasm.bindings.TransceiverImpl;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.MediaStreamTrack;
import libwasm.bindings.RTCRtpTransceiver;

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


