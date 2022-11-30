module libwasm.bindings.RTCTrackEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.MediaStream;
import libwasm.bindings.MediaStreamTrack;
import libwasm.bindings.RTCRtpReceiver;
import libwasm.bindings.RTCRtpTransceiver;

@safe:
nothrow:

struct RTCTrackEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto receiver()() {
    return RTCRtpReceiver(Object_Getter__Handle(this._parent, "receiver"));
  }
  auto track()() {
    return MediaStreamTrack(Object_Getter__Handle(this._parent, "track"));
  }
  auto streams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this._parent, "streams"));
  }
  auto transceiver()() {
    return RTCRtpTransceiver(Object_Getter__Handle(this._parent, "transceiver"));
  }
}
struct RTCTrackEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCTrackEventInit(libwasm_add__object());
  }
  void receiver()(scope ref RTCRtpReceiver receiver) {
    Object_Call_Handle__void(this._parent, "receiver", receiver.handle);
  }
  auto receiver()() {
    return RTCRtpReceiver(Object_Getter__Handle(this._parent, "receiver"));
  }
  void track()(scope ref MediaStreamTrack track) {
    Object_Call_Handle__void(this._parent, "track", track.handle);
  }
  auto track()() {
    return MediaStreamTrack(Object_Getter__Handle(this._parent, "track"));
  }
  void streams()(scope ref Sequence!(MediaStream) streams) {
    Object_Call_Handle__void(this._parent, "streams", streams.handle);
  }
  auto streams()() {
    return Sequence!(MediaStream)(Object_Getter__Handle(this._parent, "streams"));
  }
  void transceiver()(scope ref RTCRtpTransceiver transceiver) {
    Object_Call_Handle__void(this._parent, "transceiver", transceiver.handle);
  }
  auto transceiver()() {
    return RTCRtpTransceiver(Object_Getter__Handle(this._parent, "transceiver"));
  }
}


