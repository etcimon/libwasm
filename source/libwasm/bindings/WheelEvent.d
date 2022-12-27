module libwasm.bindings.WheelEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.MouseEvent;

@safe:
nothrow:

struct WheelEvent {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  enum uint DOM_DELTA_PIXEL = 0x00;
  enum uint DOM_DELTA_LINE = 0x01;
  enum uint DOM_DELTA_PAGE = 0x02;
  double deltaX()() {
    return Object_Getter__double(this._parent, "deltaX");
  }
  double deltaY()() {
    return Object_Getter__double(this._parent, "deltaY");
  }
  double deltaZ()() {
    return Object_Getter__double(this._parent, "deltaZ");
  }
  uint deltaMode()() {
    return Object_Getter__uint(this._parent, "deltaMode");
  }
}
struct WheelEventInit {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEventInit(h);
  }
  static auto create() {
    return WheelEventInit(libwasm_add__object());
  }
  void deltaX()(double deltaX) {
    Object_Call_double__void(this._parent, "deltaX", deltaX);
  }
  double deltaX()() {
    return Object_Getter__double(this._parent, "deltaX");
  }
  void deltaY()(double deltaY) {
    Object_Call_double__void(this._parent, "deltaY", deltaY);
  }
  double deltaY()() {
    return Object_Getter__double(this._parent, "deltaY");
  }
  void deltaZ()(double deltaZ) {
    Object_Call_double__void(this._parent, "deltaZ", deltaZ);
  }
  double deltaZ()() {
    return Object_Getter__double(this._parent, "deltaZ");
  }
  void deltaMode()(uint deltaMode) {
    Object_Call_uint__void(this._parent, "deltaMode", deltaMode);
  }
  uint deltaMode()() {
    return Object_Getter__uint(this._parent, "deltaMode");
  }
}


