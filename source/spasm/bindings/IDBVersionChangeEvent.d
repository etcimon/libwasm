module spasm.bindings.IDBVersionChangeEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct IDBVersionChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return IDBVersionChangeEventInit(spasm_add__object());
  }
  void oldVersion()(uint oldVersion) {
    Object_Call_uint__void(this._parent, "oldVersion", oldVersion);
  }
  uint oldVersion()() {
    return Object_Getter__uint(this._parent, "oldVersion");
  }
  void newVersion(T0)(scope auto ref Optional!(T0) newVersion) if (isTOrPointer!(T0, uint)) {
    IDBVersionChangeEventInit_newVersion_Set(this._parent, !newVersion.empty, newVersion.front);
  }
  Optional!(uint) newVersion()() {
    return Object_Getter__OptionalUint(this._parent, "newVersion");
  }
}


extern (C) void IDBVersionChangeEventInit_newVersion_Set(Handle, bool, uint);