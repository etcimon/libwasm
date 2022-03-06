module spasm.bindings.SourceBufferList;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.SourceBuffer;

@safe:
nothrow:

struct SourceBufferList {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  void onaddsourcebuffer(T0)(scope auto ref Optional!(T0) onaddsourcebuffer) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onaddsourcebuffer", !onaddsourcebuffer.empty, onaddsourcebuffer.front);
  }
  EventHandler onaddsourcebuffer()() {
    return Object_Getter__EventHandler(this._parent, "onaddsourcebuffer");
  }
  void onremovesourcebuffer(T0)(scope auto ref Optional!(T0) onremovesourcebuffer) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onremovesourcebuffer", !onremovesourcebuffer.empty, onremovesourcebuffer.front);
  }
  EventHandler onremovesourcebuffer()() {
    return Object_Getter__EventHandler(this._parent, "onremovesourcebuffer");
  }
  auto opIndex()(uint index) {
    return SourceBuffer(Object_Call_uint__Handle(this._parent, "getter", index));
  }
  auto opDispatch(uint index)() {
    return SourceBuffer(Object_Call_uint__Handle(this._parent, "getter", index));
  }
}


