module libwasm.bindings.Node;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Document;
import libwasm.bindings.Element;
import libwasm.bindings.EventTarget;
import libwasm.bindings.L10nUtils;
import libwasm.bindings.NodeList;

@safe:
nothrow:

struct GetRootNodeOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return GetRootNodeOptions(libwasm_add__object());
  }
  void composed()(bool composed) {
    Object_Call_bool__void(this.handle, "composed", composed);
  }
  bool composed()() {
    return Object_Getter__bool(this.handle, "composed");
  }
}
struct Node {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  enum ushort ELEMENT_NODE = 1;
  enum ushort ATTRIBUTE_NODE = 2;
  enum ushort TEXT_NODE = 3;
  enum ushort CDATA_SECTION_NODE = 4;
  enum ushort ENTITY_REFERENCE_NODE = 5;
  enum ushort ENTITY_NODE = 6;
  enum ushort PROCESSING_INSTRUCTION_NODE = 7;
  enum ushort COMMENT_NODE = 8;
  enum ushort DOCUMENT_NODE = 9;
  enum ushort DOCUMENT_TYPE_NODE = 10;
  enum ushort DOCUMENT_FRAGMENT_NODE = 11;
  enum ushort NOTATION_NODE = 12;
  ushort nodeType()() {
    return Object_Getter__ushort(this._parent, "nodeType");
  }
  string nodeName()() {
    return Object_Getter__string(this._parent, "nodeName");
  }
  Optional!(string) baseURI()() {
    return Object_Getter__OptionalString(this._parent, "baseURI");
  }
  bool isConnected()() {
    return Object_Getter__bool(this._parent, "isConnected");
  }
  auto ownerDocument()() {
    return recastOpt!(Document)(Object_Getter__OptionalHandle(this._parent, "ownerDocument"));
  }
  auto getRootNode()(scope ref GetRootNodeOptions options) {
    return Node(Object_Call_Handle__Handle(this._parent, "getRootNode", options.handle));
  }
  auto getRootNode()() {
    return Node(Object_Getter__Handle(this._parent, "getRootNode"));
  }
  auto parentNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "parentNode"));
  }
  auto parentElement()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "parentElement"));
  }
  bool hasChildNodes()() {
    return Object_Getter__bool(this._parent, "hasChildNodes");
  }
  auto childNodes()() {
    return NodeList(Object_Getter__Handle(this._parent, "childNodes"));
  }
  auto firstChild()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "firstChild"));
  }
  auto lastChild()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "lastChild"));
  }
  auto previousSibling()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "previousSibling"));
  }
  auto nextSibling()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "nextSibling"));
  }
  void nodeValue(T0)(scope auto ref Optional!(T0) nodeValue) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "nodeValue", "Optional!(string)", tuple(!nodeValue.empty, nodeValue.front));
  }
  Optional!(string) nodeValue()() {
    return Object_Getter__OptionalString(this._parent, "nodeValue");
  }
  void textContent(T0)(scope auto ref Optional!(T0) textContent) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "textContent", "Optional!(string)", tuple(!textContent.empty, textContent.front));
  }
  Optional!(string) textContent()() {
    return Object_Getter__OptionalString(this._parent, "textContent");
  }
  auto insertBefore(T1)(scope ref Node node, scope auto ref Optional!(T1) child) if (isTOrPointer!(T1, Node)) {
    return Node(Serialize_Object_VarArgCall!Handle(this._parent, "insertBefore", "Handle;Optional!Handle", tuple(cast(Handle)node._parent, !child.empty, cast(Handle)child.front._parent)));
  }
  auto appendChild()(scope ref Node node) {
    return Node(Object_Call_Handle__Handle(this._parent, "appendChild", node._parent));
  }
  auto replaceChild()(scope ref Node node, scope ref Node child) {
    return Node(Serialize_Object_VarArgCall!Handle(this._parent, "replaceChild", "Handle;Handle", tuple(cast(Handle)node._parent, cast(Handle)child._parent)));
  }
  auto removeChild()(scope ref Node child) {
    return Node(Object_Call_Handle__Handle(this._parent, "removeChild", child._parent));
  }
  void normalize()() {
    Object_Call__void(this._parent, "normalize");
  }
  auto cloneNode()(bool deep /* = false */) {
    return Node(Object_Call_bool__Handle(this._parent, "cloneNode", deep));
  }
  auto cloneNode()() {
    return Node(Object_Getter__Handle(this._parent, "cloneNode"));
  }
  bool isSameNode(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "isSameNode", "Optional!Handle", tuple(!node.empty, cast(Handle)node.front._parent));
  }
  bool isEqualNode(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "isEqualNode", "Optional!Handle", tuple(!node.empty, cast(Handle)node.front._parent));
  }
  enum ushort DOCUMENT_POSITION_DISCONNECTED = 0x01;
  enum ushort DOCUMENT_POSITION_PRECEDING = 0x02;
  enum ushort DOCUMENT_POSITION_FOLLOWING = 0x04;
  enum ushort DOCUMENT_POSITION_CONTAINS = 0x08;
  enum ushort DOCUMENT_POSITION_CONTAINED_BY = 0x10;
  enum ushort DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 0x20;
  ushort compareDocumentPosition()(scope ref Node other) {
    return Serialize_Object_VarArgCall!ushort(this._parent, "compareDocumentPosition", "Handle", tuple(cast(Handle)other._parent));
  }
  bool contains(T0)(scope auto ref Optional!(T0) other) if (isTOrPointer!(T0, Node)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "contains", "Optional!Handle", tuple(!other.empty, cast(Handle)other.front._parent));
  }
  Optional!(string) lookupPrefix(T0)(scope auto ref Optional!(T0) namespace) if (isTOrPointer!(T0, string)) {
    return Serialize_Object_VarArgCall!(Optional!string)(this._parent, "lookupPrefix", "Optional!(string)", tuple(!namespace.empty, namespace.front));
  }
  Optional!(string) lookupNamespaceURI(T0)(scope auto ref Optional!(T0) prefix) if (isTOrPointer!(T0, string)) {
    return Serialize_Object_VarArgCall!(Optional!string)(this._parent, "lookupNamespaceURI", "Optional!(string)", tuple(!prefix.empty, prefix.front));
  }
  bool isDefaultNamespace(T0)(scope auto ref Optional!(T0) namespace) if (isTOrPointer!(T0, string)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "isDefaultNamespace", "Optional!(string)", tuple(!namespace.empty, namespace.front));
  }
  auto nodePrincipal()() {
    return Principal(Object_Getter__Handle(this._parent, "nodePrincipal"));
  }
  auto baseURIObject()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "baseURIObject"));
  }
  string generateXPath()() {
    return Object_Getter__string(this._parent, "generateXPath");
  }
  auto flattenedTreeParentNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "flattenedTreeParentNode"));
  }
  auto parentFlexElement()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "parentFlexElement"));
  }
  auto localize()(L10nCallback l10nCallback) {
    return JsPromise!(void)(Node_localize(this._parent, l10nCallback));
  }
}


extern (C) Handle Node_localize(Handle, L10nCallback);