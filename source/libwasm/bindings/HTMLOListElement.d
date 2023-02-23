module libwasm.bindings.HTMLOListElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLOListElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void reversed()(bool reversed) {
    Object_Call_bool__void(this._parent, "reversed", reversed);
  }
  bool reversed()() {
    return Object_Getter__bool(this._parent, "reversed");
  }
  void start()(int start) {
    Object_Call_int__void(this._parent, "start", start);
  }
  int start()() {
    return Object_Getter__int(this._parent, "start");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void compact()(bool compact) {
    Object_Call_bool__void(this._parent, "compact", compact);
  }
  bool compact()() {
    return Object_Getter__bool(this._parent, "compact");
  }
}


