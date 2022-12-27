module libwasm.bindings.AudioScheduledSourceNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.EventHandler;

@safe:
nothrow:

struct AudioScheduledSourceNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onended", !onended.empty, onended.front);
  }
  EventHandler onended()() {
    return Object_Getter__EventHandler(this._parent, "onended");
  }
  void start()(double when /* = 0 */) {
    Object_Call_double__void(this._parent, "start", when);
  }
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void stop()(double when /* = 0 */) {
    Object_Call_double__void(this._parent, "stop", when);
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
}


