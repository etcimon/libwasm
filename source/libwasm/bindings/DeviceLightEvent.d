module libwasm.bindings.DeviceLightEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct DeviceLightEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
}
struct DeviceLightEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceLightEventInit(libwasm_add__object());
  }
  void value()(double value) {
    Object_Call_double__void(this._parent, "value", value);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
}


