module libwasm.bindings.MozApplicationEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MozApplicationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto application()() {
    return recastOpt!(DOMApplication)(Object_Getter__OptionalHandle(this._parent, "application"));
  }
}
struct MozApplicationEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MozApplicationEventInit(libwasm_add__object());
  }
  void application(T0)(scope auto ref Optional!(T0) application) if (isTOrPointer!(T0, DOMApplication)) {
    Serialize_Object_VarArgCall!void(this._parent, "application", "Optional!Handle", tuple(!application.empty, cast(Handle)application.front.handle));
  }
  auto application()() {
    return recastOpt!(DOMApplication)(Object_Getter__OptionalHandle(this._parent, "application"));
  }
}


