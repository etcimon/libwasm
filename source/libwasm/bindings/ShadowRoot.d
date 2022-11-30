module libwasm.bindings.ShadowRoot;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DocumentFragment;
import libwasm.bindings.DocumentOrShadowRoot;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.Node;
import libwasm.bindings.StyleSheetList;

@safe:
nothrow:

struct ShadowRoot {
  nothrow:
  libwasm.bindings.DocumentFragment.DocumentFragment _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DocumentFragment(h);
  }
  ShadowRootMode mode()() {
    return Object_Getter__int(this._parent, "mode");
  }
  auto host()() {
    return Element(Object_Getter__Handle(this._parent, "host"));
  }
  auto getElementById()(string elementId) {
    return Optional!(Element)(Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId));
  }
  auto getElementsByTagName()(string localName) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByTagName", localName));
  }
  auto getElementsByTagNameNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Serialize_Object_VarArgCall!Handle(this._parent, "getElementsByTagNameNS", "Optional!(string);string", tuple(!namespace.empty, namespace.front, localName)));
  }
  auto getElementsByClassName()(string classNames) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByClassName", classNames));
  }
  void innerHTML()(string innerHTML) {
    Object_Call_string__void(this._parent, "innerHTML", innerHTML);
  }
  string innerHTML()() {
    return Object_Getter__string(this._parent, "innerHTML");
  }
  auto importNodeAndAppendChildAt()(scope ref Node parentNode, scope ref Node node, bool deep /* = false */) {
    return Node(Serialize_Object_VarArgCall!Handle(this._parent, "importNodeAndAppendChildAt", "Handle;Handle;bool", tuple(cast(Handle)parentNode._parent, cast(Handle)node._parent, deep)));
  }
  auto importNodeAndAppendChildAt()(scope ref Node parentNode, scope ref Node node) {
    return Node(Serialize_Object_VarArgCall!Handle(this._parent, "importNodeAndAppendChildAt", "Handle;Handle", tuple(cast(Handle)parentNode._parent, cast(Handle)node._parent)));
  }
  auto createElementAndAppendChildAt()(scope ref Node parentNode, string localName) {
    return Node(Serialize_Object_VarArgCall!Handle(this._parent, "createElementAndAppendChildAt", "Handle;string", tuple(cast(Handle)parentNode._parent, localName)));
  }
  void setIsUAWidget()() {
    Object_Call__void(this._parent, "setIsUAWidget");
  }
  bool isUAWidget()() {
    return Object_Getter__bool(this._parent, "isUAWidget");
  }
  auto elementFromPoint()(float x, float y) {
    return Optional!(Element)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "elementFromPoint", "float;float", tuple(x, y)));
  }
  auto elementsFromPoint()(float x, float y) {
    return Sequence!(Element)(Serialize_Object_VarArgCall!Handle(this._parent, "elementsFromPoint", "float;float", tuple(x, y)));
  }
  auto nodeFromPoint()(float x, float y) {
    return Optional!(Node)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "nodeFromPoint", "float;float", tuple(x, y)));
  }
  auto nodesFromPoint()(float x, float y) {
    return Sequence!(Node)(Serialize_Object_VarArgCall!Handle(this._parent, "nodesFromPoint", "float;float", tuple(x, y)));
  }
  auto activeElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "activeElement"));
  }
  auto styleSheets()() {
    return StyleSheetList(Object_Getter__Handle(this._parent, "styleSheets"));
  }
  auto pointerLockElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "pointerLockElement"));
  }
  auto fullscreenElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "fullscreenElement"));
  }
  auto mozFullScreenElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "mozFullScreenElement"));
  }
}
enum ShadowRootMode {
  open,
  closed
}


