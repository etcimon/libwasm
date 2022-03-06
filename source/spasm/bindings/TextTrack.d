module spasm.bindings.TextTrack;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.TextTrackCueList;
import spasm.bindings.TextTrackList;
import spasm.bindings.VTTCue;

@safe:
nothrow:

struct TextTrack {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  TextTrackKind kind()() {
    return TextTrack_kind_Get(this._parent);
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
    TextTrack_mode_Set(this._parent, mode);
  }
  TextTrackMode mode()() {
    return TextTrack_mode_Get(this._parent);
  }
  auto cues()() {
    return Object_Getter__OptionalHandle(this._parent, "cues");
  }
  auto activeCues()() {
    return Object_Getter__OptionalHandle(this._parent, "activeCues");
  }
  void addCue()(scope ref VTTCue cue) {
    Object_Call_Handle__void(this._parent, "addCue", cue._parent);
  }
  void removeCue()(scope ref VTTCue cue) {
    Object_Call_Handle__void(this._parent, "removeCue", cue._parent);
  }
  void oncuechange(T0)(scope auto ref Optional!(T0) oncuechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncuechange", !oncuechange.empty, oncuechange.front);
  }
  EventHandler oncuechange()() {
    return Object_Getter__EventHandler(this._parent, "oncuechange");
  }
  auto textTrackList()() {
    return Object_Getter__OptionalHandle(this._parent, "textTrackList");
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


extern (C) TextTrackKind TextTrack_kind_Get(Handle);
extern (C) void TextTrack_mode_Set(Handle, TextTrackMode);
extern (C) TextTrackMode TextTrack_mode_Get(Handle);