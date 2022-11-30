module libwasm.bindings.VRDisplayEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.VRDisplay;

@safe:
nothrow:

struct VRDisplayEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto display()() {
    return VRDisplay(Object_Getter__Handle(this._parent, "display"));
  }
  Optional!(VRDisplayEventReason) reason()() {
    return VRDisplayEvent_reason_Get(this._parent);
  }
}
struct VRDisplayEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return VRDisplayEventInit(libwasm_add__object());
  }
  void display()(scope ref VRDisplay display) {
    Object_Call_Handle__void(this._parent, "display", display.handle);
  }
  auto display()() {
    return VRDisplay(Object_Getter__Handle(this._parent, "display"));
  }
  void reason()(VRDisplayEventReason reason) {
    Object_Call_int__void(this._parent, "reason", reason);
  }
  VRDisplayEventReason reason()() {
    return Object_Getter__int(this._parent, "reason");
  }
}
enum VRDisplayEventReason {
  mounted,
  navigation,
  requested,
  unmounted
}


extern (C) Optional!(VRDisplayEventReason) VRDisplayEvent_reason_Get(Handle);