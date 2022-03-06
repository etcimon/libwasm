module spasm.bindings.TextTrackCue;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.TextTrack;

@safe:
nothrow:

struct TextTrackCue {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto track()() {
    return Object_Getter__OptionalHandle(this._parent, "track");
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  void startTime()(double startTime) {
    Object_Call_double__void(this._parent, "startTime", startTime);
  }
  double startTime()() {
    return Object_Getter__double(this._parent, "startTime");
  }
  void endTime()(double endTime) {
    Object_Call_double__void(this._parent, "endTime", endTime);
  }
  double endTime()() {
    return Object_Getter__double(this._parent, "endTime");
  }
  void pauseOnExit()(bool pauseOnExit) {
    Object_Call_bool__void(this._parent, "pauseOnExit", pauseOnExit);
  }
  bool pauseOnExit()() {
    return Object_Getter__bool(this._parent, "pauseOnExit");
  }
  void onenter(T0)(scope auto ref Optional!(T0) onenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onenter", !onenter.empty, onenter.front);
  }
  EventHandler onenter()() {
    return Object_Getter__EventHandler(this._parent, "onenter");
  }
  void onexit(T0)(scope auto ref Optional!(T0) onexit) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onexit", !onexit.empty, onexit.front);
  }
  EventHandler onexit()() {
    return Object_Getter__EventHandler(this._parent, "onexit");
  }
}


