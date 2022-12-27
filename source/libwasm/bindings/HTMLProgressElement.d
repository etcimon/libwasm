module libwasm.bindings.HTMLProgressElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.NodeList;

@safe:
nothrow:

struct HTMLProgressElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void value()(double value) {
    Object_Call_double__void(this._parent, "value", value);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
  void max()(double max) {
    Object_Call_double__void(this._parent, "max", max);
  }
  double max()() {
    return Object_Getter__double(this._parent, "max");
  }
  double position()() {
    return Object_Getter__double(this._parent, "position");
  }
  auto labels()() {
    return NodeList(Object_Getter__Handle(this._parent, "labels"));
  }
}


