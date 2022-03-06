module spasm.bindings.TrackEvent;

import spasm.types;
import spasm.bindings.AudioTrack;
import spasm.bindings.Event;
import spasm.bindings.TextTrack;
import spasm.bindings.VideoTrack;

@safe:
nothrow:

struct TrackEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto track()() {
    return TrackEvent_track_Get(this._parent);
  }
}
struct TrackEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return TrackEventInit(spasm_add__object());
  }
  void track(T0)(scope auto ref Optional!(T0) track) if (isTOrPointer!(T0, SumType!(VideoTrack, AudioTrack, TextTrack))) {
    TrackEventInit_track_Set(this._parent, !track.empty, *track.frontRef);
  }
  auto track()() {
    return TrackEventInit_track_Get(this._parent);
  }
}


extern (C) Optional!(SumType!(VideoTrack, AudioTrack, TextTrack)) TrackEvent_track_Get(Handle);
extern (C) void TrackEventInit_track_Set(Handle, bool, scope ref SumType!(VideoTrack, AudioTrack, TextTrack));
extern (C) Optional!(SumType!(VideoTrack, AudioTrack, TextTrack)) TrackEventInit_track_Get(Handle);