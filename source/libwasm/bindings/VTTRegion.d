module libwasm.bindings.VTTRegion;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

enum ScrollSetting {
  none,
  up
}
struct VTTRegion {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void width()(double width) {
    Object_Call_double__void(this.handle, "width", width);
  }
  double width()() {
    return Object_Getter__double(this.handle, "width");
  }
  void lines()(int lines) {
    Object_Call_int__void(this.handle, "lines", lines);
  }
  int lines()() {
    return Object_Getter__int(this.handle, "lines");
  }
  void regionAnchorX()(double regionAnchorX) {
    Object_Call_double__void(this.handle, "regionAnchorX", regionAnchorX);
  }
  double regionAnchorX()() {
    return Object_Getter__double(this.handle, "regionAnchorX");
  }
  void regionAnchorY()(double regionAnchorY) {
    Object_Call_double__void(this.handle, "regionAnchorY", regionAnchorY);
  }
  double regionAnchorY()() {
    return Object_Getter__double(this.handle, "regionAnchorY");
  }
  void viewportAnchorX()(double viewportAnchorX) {
    Object_Call_double__void(this.handle, "viewportAnchorX", viewportAnchorX);
  }
  double viewportAnchorX()() {
    return Object_Getter__double(this.handle, "viewportAnchorX");
  }
  void viewportAnchorY()(double viewportAnchorY) {
    Object_Call_double__void(this.handle, "viewportAnchorY", viewportAnchorY);
  }
  double viewportAnchorY()() {
    return Object_Getter__double(this.handle, "viewportAnchorY");
  }
  void scroll()(ScrollSetting scroll) {
    Object_Call_int__void(this.handle, "scroll", scroll);
  }
  ScrollSetting scroll()() {
    return Object_Getter__int(this.handle, "scroll");
  }
}


