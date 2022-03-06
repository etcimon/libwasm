module spasm.bindings.ShadowRoot;

import spasm.types;
import spasm.bindings.DocumentFragment;
import spasm.bindings.DocumentOrShadowRoot;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.Node;
import spasm.bindings.StyleSheetList;

@safe:
nothrow:

struct ShadowRoot {
  nothrow:
  spasm.bindings.DocumentFragment.DocumentFragment _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DocumentFragment(h);
  }
  ShadowRootMode mode()() {
    return ShadowRoot_mode_Get(this._parent);
  }
  auto host()() {
    return Element(Object_Getter__Handle(this._parent, "host"));
  }
  auto getElementById()(string elementId) {
    return Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId);
  }
  auto getElementsByTagName()(string localName) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByTagName", localName));
  }
  auto getElementsByTagNameNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(ShadowRoot_getElementsByTagNameNS(this._parent, !namespace.empty, namespace.front, localName));
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
    return Node(ShadowRoot_importNodeAndAppendChildAt(this._parent, parentNode._parent, node._parent, deep));
  }
  auto importNodeAndAppendChildAt()(scope ref Node parentNode, scope ref Node node) {
    return Node(ShadowRoot_importNodeAndAppendChildAt_0(this._parent, parentNode._parent, node._parent));
  }
  auto createElementAndAppendChildAt()(scope ref Node parentNode, string localName) {
    return Node(ShadowRoot_createElementAndAppendChildAt(this._parent, parentNode._parent, localName));
  }
  void setIsUAWidget()() {
    Object_Call__void(this._parent, "setIsUAWidget");
  }
  bool isUAWidget()() {
    return Object_Getter__bool(this._parent, "isUAWidget");
  }
  auto elementFromPoint()(float x, float y) {
    return DocumentOrShadowRoot_elementFromPoint(this._parent, x, y);
  }
  auto elementsFromPoint()(float x, float y) {
    return Sequence!(Element)(DocumentOrShadowRoot_elementsFromPoint(this._parent, x, y));
  }
  auto nodeFromPoint()(float x, float y) {
    return DocumentOrShadowRoot_nodeFromPoint(this._parent, x, y);
  }
  auto nodesFromPoint()(float x, float y) {
    return Sequence!(Node)(DocumentOrShadowRoot_nodesFromPoint(this._parent, x, y));
  }
  auto activeElement()() {
    return Object_Getter__OptionalHandle(this._parent, "activeElement");
  }
  auto styleSheets()() {
    return StyleSheetList(Object_Getter__Handle(this._parent, "styleSheets"));
  }
  auto pointerLockElement()() {
    return Object_Getter__OptionalHandle(this._parent, "pointerLockElement");
  }
  auto fullscreenElement()() {
    return Object_Getter__OptionalHandle(this._parent, "fullscreenElement");
  }
  auto mozFullScreenElement()() {
    return Object_Getter__OptionalHandle(this._parent, "mozFullScreenElement");
  }
}
enum ShadowRootMode {
  open,
  closed
}


extern (C) ShadowRootMode ShadowRoot_mode_Get(Handle);
extern (C) Handle ShadowRoot_getElementsByTagNameNS(Handle, bool, string, string);
extern (C) Handle ShadowRoot_importNodeAndAppendChildAt(Handle, Handle, Handle, bool);
extern (C) Handle ShadowRoot_importNodeAndAppendChildAt_0(Handle, Handle, Handle);
extern (C) Handle ShadowRoot_createElementAndAppendChildAt(Handle, Handle, string);