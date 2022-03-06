module spasm.bindings.MozApplicationEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MozApplicationEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto application()() {
    return Object_Getter__OptionalHandle(this._parent, "application");
  }
}
struct MozApplicationEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MozApplicationEventInit(spasm_add__object());
  }
  void application(T0)(scope auto ref Optional!(T0) application) if (isTOrPointer!(T0, DOMApplication)) {
    MozApplicationEventInit_application_Set(this._parent, !application.empty, application.front.handle);
  }
  auto application()() {
    return Object_Getter__OptionalHandle(this._parent, "application");
  }
}


extern (C) void MozApplicationEventInit_application_Set(Handle, bool, Handle);