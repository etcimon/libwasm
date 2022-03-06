module spasm.bindings.FocusEvent;

import spasm.types;
import spasm.bindings.EventTarget;
import spasm.bindings.UIEvent;

@safe:
nothrow:

struct FocusEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  auto relatedTarget()() {
    return Object_Getter__OptionalHandle(this._parent, "relatedTarget");
  }
}
struct FocusEventInit {
  nothrow:
  spasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return FocusEventInit(spasm_add__object());
  }
  void relatedTarget(T0)(scope auto ref Optional!(T0) relatedTarget) if (isTOrPointer!(T0, EventTarget)) {
    FocusEventInit_relatedTarget_Set(this._parent, !relatedTarget.empty, relatedTarget.front.handle);
  }
  auto relatedTarget()() {
    return Object_Getter__OptionalHandle(this._parent, "relatedTarget");
  }
}


extern (C) void FocusEventInit_relatedTarget_Set(Handle, bool, Handle);