module spasm.bindings.DeviceLightEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct DeviceLightEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceLightEventInit(spasm_add__object());
  }
  void value()(double value) {
    Object_Call_double__void(this._parent, "value", value);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
}


