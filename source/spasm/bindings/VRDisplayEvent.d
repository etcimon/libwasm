module spasm.bindings.VRDisplayEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.VRDisplay;

@safe:
nothrow:

struct VRDisplayEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return VRDisplayEventInit(spasm_add__object());
  }
  void display()(scope ref VRDisplay display) {
    Object_Call_Handle__void(this._parent, "display", display.handle);
  }
  auto display()() {
    return VRDisplay(Object_Getter__Handle(this._parent, "display"));
  }
  void reason()(VRDisplayEventReason reason) {
    VRDisplayEventInit_reason_Set(this._parent, reason);
  }
  VRDisplayEventReason reason()() {
    return VRDisplayEventInit_reason_Get(this._parent);
  }
}
enum VRDisplayEventReason {
  mounted,
  navigation,
  requested,
  unmounted
}


extern (C) Optional!(VRDisplayEventReason) VRDisplayEvent_reason_Get(Handle);
extern (C) void VRDisplayEventInit_reason_Set(Handle, VRDisplayEventReason);
extern (C) VRDisplayEventReason VRDisplayEventInit_reason_Get(Handle);