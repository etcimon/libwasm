module libwasm.bindings.MediaStreamTrackEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.MediaStreamTrack;

@safe:
nothrow:

struct MediaStreamTrackEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto track()() {
    return MediaStreamTrack(Object_Getter__Handle(this._parent, "track"));
  }
}
struct MediaStreamTrackEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaStreamTrackEventInit(libwasm_add__object());
  }
  void track()(scope ref MediaStreamTrack track) {
    Object_Call_Handle__void(this._parent, "track", track.handle);
  }
  auto track()() {
    return MediaStreamTrack(Object_Getter__Handle(this._parent, "track"));
  }
}


