module libwasm.bindings.TrackEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioTrack;
import libwasm.bindings.Event;
import libwasm.bindings.TextTrack;
import libwasm.bindings.VideoTrack;

@safe:
nothrow:

struct TrackEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return TrackEventInit(libwasm_add__object());
  }
  void track(T0)(scope auto ref Optional!(T0) track) if (isTOrPointer!(T0, SumType!(VideoTrack, AudioTrack, TextTrack))) {
    Serialize_Object_VarArgCall!void(this._parent, "track", "Optional!SumType!(Handle,Handle,Handle)", tuple(!track.empty, libwasm.sumtype.match!(((ref track.Types[0] v) => 0),((ref track.Types[1] v) => 1),((ref track.Types[2] v) => 2))(track),tuple(libwasm.sumtype.match!(((ref track.Types[0] v) => cast(Handle)v.handle),((ref track.Types[1] v) => Handle.init),((ref track.Types[2] v) => Handle.init))(track),libwasm.sumtype.match!(((ref track.Types[0] v) => Handle.init),((ref track.Types[1] v) => cast(Handle)v.handle),((ref track.Types[2] v) => Handle.init))(track),libwasm.sumtype.match!(((ref track.Types[0] v) => Handle.init),((ref track.Types[1] v) => Handle.init),((ref track.Types[2] v) => cast(Handle)v.handle))(track))));
  }
  auto track()() {
    return TrackEventInit_track_Get(this._parent);
  }
}


extern (C) Optional!(SumType!(VideoTrack, AudioTrack, TextTrack)) TrackEvent_track_Get(Handle);
extern (C) Optional!(SumType!(VideoTrack, AudioTrack, TextTrack)) TrackEventInit_track_Get(Handle);