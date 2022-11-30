module libwasm.bindings.IDBVersionChangeEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct IDBVersionChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint oldVersion()() {
    return Object_Getter__uint(this._parent, "oldVersion");
  }
  Optional!(uint) newVersion()() {
    return Object_Getter__OptionalUint(this._parent, "newVersion");
  }
}
struct IDBVersionChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return IDBVersionChangeEventInit(libwasm_add__object());
  }
  void oldVersion()(uint oldVersion) {
    Object_Call_uint__void(this._parent, "oldVersion", oldVersion);
  }
  uint oldVersion()() {
    return Object_Getter__uint(this._parent, "oldVersion");
  }
  void newVersion(T0)(scope auto ref Optional!(T0) newVersion) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "newVersion", "Optional!(uint)", tuple(!newVersion.empty, newVersion.front));
  }
  Optional!(uint) newVersion()() {
    return Object_Getter__OptionalUint(this._parent, "newVersion");
  }
}


