module libwasm.bindings.FocusEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventTarget;
import libwasm.bindings.UIEvent;

@safe:
nothrow:

struct FocusEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  auto relatedTarget()() {
    return recastOpt!(EventTarget)(Object_Getter__OptionalHandle(this._parent, "relatedTarget"));
  }
}
struct FocusEventInit {
  nothrow:
  libwasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return FocusEventInit(libwasm_add__object());
  }
  void relatedTarget(T0)(scope auto ref Optional!(T0) relatedTarget) if (isTOrPointer!(T0, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "relatedTarget", "Optional!Handle", tuple(!relatedTarget.empty, cast(Handle)relatedTarget.front.handle));
  }
  auto relatedTarget()() {
    return recastOpt!(EventTarget)(Object_Getter__OptionalHandle(this._parent, "relatedTarget"));
  }
}


