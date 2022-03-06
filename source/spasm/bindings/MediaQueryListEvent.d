module spasm.bindings.MediaQueryListEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MediaQueryListEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
  bool matches()() {
    return Object_Getter__bool(this._parent, "matches");
  }
}
struct MediaQueryListEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaQueryListEventInit(spasm_add__object());
  }
  void media()(string media) {
    Object_Call_string__void(this._parent, "media", media);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
  void matches()(bool matches) {
    Object_Call_bool__void(this._parent, "matches", matches);
  }
  bool matches()() {
    return Object_Getter__bool(this._parent, "matches");
  }
}


