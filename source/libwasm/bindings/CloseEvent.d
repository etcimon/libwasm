module libwasm.bindings.CloseEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct CloseEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  bool wasClean()() {
    return Object_Getter__bool(this._parent, "wasClean");
  }
  ushort code()() {
    return Object_Getter__ushort(this._parent, "code");
  }
  string reason()() {
    return Object_Getter__string(this._parent, "reason");
  }
}
struct CloseEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return CloseEventInit(libwasm_add__object());
  }
  void wasClean()(bool wasClean) {
    Object_Call_bool__void(this._parent, "wasClean", wasClean);
  }
  bool wasClean()() {
    return Object_Getter__bool(this._parent, "wasClean");
  }
  void code()(ushort code) {
    Serialize_Object_VarArgCall!void(this._parent, "code", "ushort", tuple(code));
  }
  ushort code()() {
    return Object_Getter__ushort(this._parent, "code");
  }
  void reason()(string reason) {
    Object_Call_string__void(this._parent, "reason", reason);
  }
  string reason()() {
    return Object_Getter__string(this._parent, "reason");
  }
}


