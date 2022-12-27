module libwasm.bindings.DeviceProximityEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct DeviceProximityEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
  double min()() {
    return Object_Getter__double(this._parent, "min");
  }
  double max()() {
    return Object_Getter__double(this._parent, "max");
  }
}
struct DeviceProximityEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceProximityEventInit(libwasm_add__object());
  }
  void value()(double value) {
    Object_Call_double__void(this._parent, "value", value);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
  void min()(double min) {
    Object_Call_double__void(this._parent, "min", min);
  }
  double min()() {
    return Object_Getter__double(this._parent, "min");
  }
  void max()(double max) {
    Object_Call_double__void(this._parent, "max", max);
  }
  double max()() {
    return Object_Getter__double(this._parent, "max");
  }
}


