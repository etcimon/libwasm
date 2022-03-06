module spasm.bindings.ScriptProcessorNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.EventHandler;

@safe:
nothrow:

struct ScriptProcessorNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void onaudioprocess(T0)(scope auto ref Optional!(T0) onaudioprocess) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onaudioprocess", !onaudioprocess.empty, onaudioprocess.front);
  }
  EventHandler onaudioprocess()() {
    return Object_Getter__EventHandler(this._parent, "onaudioprocess");
  }
  int bufferSize()() {
    return Object_Getter__int(this._parent, "bufferSize");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}


