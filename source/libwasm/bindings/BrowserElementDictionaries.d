module libwasm.bindings.BrowserElementDictionaries;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Node;

@safe:
nothrow:

struct DOMWindowResizeEventDetail {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DOMWindowResizeEventDetail(libwasm_add__object());
  }
  void width()(int width) {
    Object_Call_int__void(this.handle, "width", width);
  }
  int width()() {
    return Object_Getter__int(this.handle, "width");
  }
  void height()(int height) {
    Object_Call_int__void(this.handle, "height", height);
  }
  int height()() {
    return Object_Getter__int(this.handle, "height");
  }
}
struct OpenWindowEventDetail {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return OpenWindowEventDetail(libwasm_add__object());
  }
  void url()(string url) {
    Object_Call_string__void(this.handle, "url", url);
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void features()(string features) {
    Object_Call_string__void(this.handle, "features", features);
  }
  string features()() {
    return Object_Getter__string(this.handle, "features");
  }
  void frameElement(T0)(scope auto ref Optional!(T0) frameElement) if (isTOrPointer!(T0, Node)) {
    Serialize_Object_VarArgCall!void(this.handle, "frameElement", "Optional!Handle", tuple(!frameElement.empty, cast(Handle)frameElement.front._parent));
  }
  auto frameElement()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "frameElement"));
  }
}


