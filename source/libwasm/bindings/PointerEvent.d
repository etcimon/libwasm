module libwasm.bindings.PointerEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.MouseEvent;

@safe:
nothrow:

struct PointerEvent {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  int pointerId()() {
    return Object_Getter__int(this._parent, "pointerId");
  }
  int width()() {
    return Object_Getter__int(this._parent, "width");
  }
  int height()() {
    return Object_Getter__int(this._parent, "height");
  }
  float pressure()() {
    return Object_Getter__float(this._parent, "pressure");
  }
  float tangentialPressure()() {
    return Object_Getter__float(this._parent, "tangentialPressure");
  }
  int tiltX()() {
    return Object_Getter__int(this._parent, "tiltX");
  }
  int tiltY()() {
    return Object_Getter__int(this._parent, "tiltY");
  }
  int twist()() {
    return Object_Getter__int(this._parent, "twist");
  }
  string pointerType()() {
    return Object_Getter__string(this._parent, "pointerType");
  }
  bool isPrimary()() {
    return Object_Getter__bool(this._parent, "isPrimary");
  }
  auto getCoalescedEvents()() {
    return Sequence!(PointerEvent)(Object_Getter__Handle(this._parent, "getCoalescedEvents"));
  }
}
struct PointerEventInit {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEventInit(h);
  }
  static auto create() {
    return PointerEventInit(libwasm_add__object());
  }
  void pointerId()(int pointerId) {
    Object_Call_int__void(this._parent, "pointerId", pointerId);
  }
  int pointerId()() {
    return Object_Getter__int(this._parent, "pointerId");
  }
  void width()(int width) {
    Object_Call_int__void(this._parent, "width", width);
  }
  int width()() {
    return Object_Getter__int(this._parent, "width");
  }
  void height()(int height) {
    Object_Call_int__void(this._parent, "height", height);
  }
  int height()() {
    return Object_Getter__int(this._parent, "height");
  }
  void pressure()(float pressure) {
    Object_Call_float__void(this._parent, "pressure", pressure);
  }
  float pressure()() {
    return Object_Getter__float(this._parent, "pressure");
  }
  void tangentialPressure()(float tangentialPressure) {
    Object_Call_float__void(this._parent, "tangentialPressure", tangentialPressure);
  }
  float tangentialPressure()() {
    return Object_Getter__float(this._parent, "tangentialPressure");
  }
  void tiltX()(int tiltX) {
    Object_Call_int__void(this._parent, "tiltX", tiltX);
  }
  int tiltX()() {
    return Object_Getter__int(this._parent, "tiltX");
  }
  void tiltY()(int tiltY) {
    Object_Call_int__void(this._parent, "tiltY", tiltY);
  }
  int tiltY()() {
    return Object_Getter__int(this._parent, "tiltY");
  }
  void twist()(int twist) {
    Object_Call_int__void(this._parent, "twist", twist);
  }
  int twist()() {
    return Object_Getter__int(this._parent, "twist");
  }
  void pointerType()(string pointerType) {
    Object_Call_string__void(this._parent, "pointerType", pointerType);
  }
  string pointerType()() {
    return Object_Getter__string(this._parent, "pointerType");
  }
  void isPrimary()(bool isPrimary) {
    Object_Call_bool__void(this._parent, "isPrimary", isPrimary);
  }
  bool isPrimary()() {
    return Object_Getter__bool(this._parent, "isPrimary");
  }
  void coalescedEvents()(scope ref Sequence!(PointerEvent) coalescedEvents) {
    Object_Call_Handle__void(this._parent, "coalescedEvents", coalescedEvents.handle);
  }
  auto coalescedEvents()() {
    return Sequence!(PointerEvent)(Object_Getter__Handle(this._parent, "coalescedEvents"));
  }
}


