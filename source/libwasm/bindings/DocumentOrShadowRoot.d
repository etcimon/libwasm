module libwasm.bindings.DocumentOrShadowRoot;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.Node;
import libwasm.bindings.StyleSheetList;

@safe:
nothrow:

struct DocumentOrShadowRoot {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto elementFromPoint()(float x, float y) {
    return Optional!(Element)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "elementFromPoint", "float;float", tuple(x, y)));
  }
  auto elementsFromPoint()(float x, float y) {
    return Sequence!(Element)(Serialize_Object_VarArgCall!Handle(this.handle, "elementsFromPoint", "float;float", tuple(x, y)));
  }
  auto nodeFromPoint()(float x, float y) {
    return Optional!(Node)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "nodeFromPoint", "float;float", tuple(x, y)));
  }
  auto nodesFromPoint()(float x, float y) {
    return Sequence!(Node)(Serialize_Object_VarArgCall!Handle(this.handle, "nodesFromPoint", "float;float", tuple(x, y)));
  }
  auto activeElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "activeElement"));
  }
  auto styleSheets()() {
    return StyleSheetList(Object_Getter__Handle(this.handle, "styleSheets"));
  }
  auto pointerLockElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "pointerLockElement"));
  }
  auto fullscreenElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "fullscreenElement"));
  }
  auto mozFullScreenElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "mozFullScreenElement"));
  }
}


