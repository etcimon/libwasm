module spasm.bindings.Touch;

import spasm.types;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct Touch {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int identifier()() {
    return Object_Getter__int(this.handle, "identifier");
  }
  auto target()() {
    return Object_Getter__OptionalHandle(this.handle, "target");
  }
  int screenX()() {
    return Object_Getter__int(this.handle, "screenX");
  }
  int screenY()() {
    return Object_Getter__int(this.handle, "screenY");
  }
  int clientX()() {
    return Object_Getter__int(this.handle, "clientX");
  }
  int clientY()() {
    return Object_Getter__int(this.handle, "clientY");
  }
  int pageX()() {
    return Object_Getter__int(this.handle, "pageX");
  }
  int pageY()() {
    return Object_Getter__int(this.handle, "pageY");
  }
  int radiusX()() {
    return Object_Getter__int(this.handle, "radiusX");
  }
  int radiusY()() {
    return Object_Getter__int(this.handle, "radiusY");
  }
  float rotationAngle()() {
    return Object_Getter__float(this.handle, "rotationAngle");
  }
  float force()() {
    return Object_Getter__float(this.handle, "force");
  }
}
struct TouchInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return TouchInit(spasm_add__object());
  }
  void identifier()(int identifier) {
    Object_Call_int__void(this.handle, "identifier", identifier);
  }
  int identifier()() {
    return Object_Getter__int(this.handle, "identifier");
  }
  void target()(scope ref EventTarget target) {
    Object_Call_Handle__void(this.handle, "target", target.handle);
  }
  auto target()() {
    return EventTarget(Object_Getter__Handle(this.handle, "target"));
  }
  void clientX()(int clientX) {
    Object_Call_int__void(this.handle, "clientX", clientX);
  }
  int clientX()() {
    return Object_Getter__int(this.handle, "clientX");
  }
  void clientY()(int clientY) {
    Object_Call_int__void(this.handle, "clientY", clientY);
  }
  int clientY()() {
    return Object_Getter__int(this.handle, "clientY");
  }
  void screenX()(int screenX) {
    Object_Call_int__void(this.handle, "screenX", screenX);
  }
  int screenX()() {
    return Object_Getter__int(this.handle, "screenX");
  }
  void screenY()(int screenY) {
    Object_Call_int__void(this.handle, "screenY", screenY);
  }
  int screenY()() {
    return Object_Getter__int(this.handle, "screenY");
  }
  void pageX()(int pageX) {
    Object_Call_int__void(this.handle, "pageX", pageX);
  }
  int pageX()() {
    return Object_Getter__int(this.handle, "pageX");
  }
  void pageY()(int pageY) {
    Object_Call_int__void(this.handle, "pageY", pageY);
  }
  int pageY()() {
    return Object_Getter__int(this.handle, "pageY");
  }
  void radiusX()(float radiusX) {
    Object_Call_float__void(this.handle, "radiusX", radiusX);
  }
  float radiusX()() {
    return Object_Getter__float(this.handle, "radiusX");
  }
  void radiusY()(float radiusY) {
    Object_Call_float__void(this.handle, "radiusY", radiusY);
  }
  float radiusY()() {
    return Object_Getter__float(this.handle, "radiusY");
  }
  void rotationAngle()(float rotationAngle) {
    Object_Call_float__void(this.handle, "rotationAngle", rotationAngle);
  }
  float rotationAngle()() {
    return Object_Getter__float(this.handle, "rotationAngle");
  }
  void force()(float force) {
    Object_Call_float__void(this.handle, "force", force);
  }
  float force()() {
    return Object_Getter__float(this.handle, "force");
  }
}


