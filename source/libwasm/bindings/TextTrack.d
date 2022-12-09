module libwasm.bindings.TextTrack;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.TextTrackCueList;
import libwasm.bindings.TextTrackList;
import libwasm.bindings.VTTCue;

@safe:
nothrow:

struct TextTrack {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  TextTrackKind kind()() {
    return Object_Getter__int(this._parent, "kind");
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  string language()() {
    return Object_Getter__string(this._parent, "language");
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  string inBandMetadataTrackDispatchType()() {
    return Object_Getter__string(this._parent, "inBandMetadataTrackDispatchType");
  }
  void mode()(TextTrackMode mode) {
    Object_Call_int__void(this._parent, "mode", mode);
  }
  TextTrackMode mode()() {
    return Object_Getter__int(this._parent, "mode");
  }
  auto cues()() {
    return recastOpt!(TextTrackCueList)(Object_Getter__OptionalHandle(this._parent, "cues"));
  }
  auto activeCues()() {
    return recastOpt!(TextTrackCueList)(Object_Getter__OptionalHandle(this._parent, "activeCues"));
  }
  void addCue()(scope ref VTTCue cue) {
    Object_Call_Handle__void(this._parent, "addCue", cue._parent);
  }
  void removeCue()(scope ref VTTCue cue) {
    Object_Call_Handle__void(this._parent, "removeCue", cue._parent);
  }
  void oncuechange(T0)(scope auto ref Optional!(T0) oncuechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oncuechange", !oncuechange.empty, oncuechange.front);
  }
  EventHandler oncuechange()() {
    return Object_Getter__EventHandler(this._parent, "oncuechange");
  }
  auto textTrackList()() {
    return recastOpt!(TextTrackList)(Object_Getter__OptionalHandle(this._parent, "textTrackList"));
  }
}
enum TextTrackKind {
  subtitles,
  captions,
  descriptions,
  chapters,
  metadata
}
enum TextTrackMode {
  disabled,
  hidden,
  showing
}


