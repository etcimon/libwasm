module spasm.bindings.Node;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.Element;
import spasm.bindings.EventTarget;
import spasm.bindings.L10nUtils;
import spasm.bindings.NodeList;

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
    return GetRootNodeOptions(spasm_add__object());
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
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return Object_Getter__OptionalHandle(this._parent, "ownerDocument");
  }
  auto getRootNode()(scope ref GetRootNodeOptions options) {
    return Node(Object_Call_Handle__Handle(this._parent, "getRootNode", options.handle));
  }
  auto getRootNode()() {
    return Node(Object_Getter__Handle(this._parent, "getRootNode"));
  }
  auto parentNode()() {
    return Object_Getter__OptionalHandle(this._parent, "parentNode");
  }
  auto parentElement()() {
    return Object_Getter__OptionalHandle(this._parent, "parentElement");
  }
  bool hasChildNodes()() {
    return Object_Getter__bool(this._parent, "hasChildNodes");
  }
  auto childNodes()() {
    return NodeList(Object_Getter__Handle(this._parent, "childNodes"));
  }
  auto firstChild()() {
    return Object_Getter__OptionalHandle(this._parent, "firstChild");
  }
  auto lastChild()() {
    return Object_Getter__OptionalHandle(this._parent, "lastChild");
  }
  auto previousSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "previousSibling");
  }
  auto nextSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "nextSibling");
  }
  void nodeValue(T0)(scope auto ref Optional!(T0) nodeValue) if (isTOrPointer!(T0, string)) {
    Node_nodeValue_Set(this._parent, !nodeValue.empty, nodeValue.front);
  }
  Optional!(string) nodeValue()() {
    return Object_Getter__OptionalString(this._parent, "nodeValue");
  }
  void textContent(T0)(scope auto ref Optional!(T0) textContent) if (isTOrPointer!(T0, string)) {
    Node_textContent_Set(this._parent, !textContent.empty, textContent.front);
  }
  Optional!(string) textContent()() {
    return Object_Getter__OptionalString(this._parent, "textContent");
  }
  auto insertBefore(T1)(scope ref Node node, scope auto ref Optional!(T1) child) if (isTOrPointer!(T1, Node)) {
    return Node(Node_insertBefore(this._parent, node._parent, !child.empty, child.front._parent));
  }
  auto appendChild()(scope ref Node node) {
    return Node(Object_Call_Handle__Handle(this._parent, "appendChild", node._parent));
  }
  auto replaceChild()(scope ref Node node, scope ref Node child) {
    return Node(Node_replaceChild(this._parent, node._parent, child._parent));
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
    return Node_isSameNode(this._parent, !node.empty, node.front._parent);
  }
  bool isEqualNode(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    return Node_isEqualNode(this._parent, !node.empty, node.front._parent);
  }
  enum ushort DOCUMENT_POSITION_DISCONNECTED = 0x01;
  enum ushort DOCUMENT_POSITION_PRECEDING = 0x02;
  enum ushort DOCUMENT_POSITION_FOLLOWING = 0x04;
  enum ushort DOCUMENT_POSITION_CONTAINS = 0x08;
  enum ushort DOCUMENT_POSITION_CONTAINED_BY = 0x10;
  enum ushort DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 0x20;
  ushort compareDocumentPosition()(scope ref Node other) {
    return Node_compareDocumentPosition(this._parent, other._parent);
  }
  bool contains(T0)(scope auto ref Optional!(T0) other) if (isTOrPointer!(T0, Node)) {
    return Node_contains(this._parent, !other.empty, other.front._parent);
  }
  Optional!(string) lookupPrefix(T0)(scope auto ref Optional!(T0) namespace) if (isTOrPointer!(T0, string)) {
    return Node_lookupPrefix(this._parent, !namespace.empty, namespace.front);
  }
  Optional!(string) lookupNamespaceURI(T0)(scope auto ref Optional!(T0) prefix) if (isTOrPointer!(T0, string)) {
    return Node_lookupNamespaceURI(this._parent, !prefix.empty, prefix.front);
  }
  bool isDefaultNamespace(T0)(scope auto ref Optional!(T0) namespace) if (isTOrPointer!(T0, string)) {
    return Node_isDefaultNamespace(this._parent, !namespace.empty, namespace.front);
  }
  auto nodePrincipal()() {
    return Principal(Object_Getter__Handle(this._parent, "nodePrincipal"));
  }
  auto baseURIObject()() {
    return Object_Getter__OptionalHandle(this._parent, "baseURIObject");
  }
  string generateXPath()() {
    return Object_Getter__string(this._parent, "generateXPath");
  }
  auto flattenedTreeParentNode()() {
    return Object_Getter__OptionalHandle(this._parent, "flattenedTreeParentNode");
  }
  auto parentFlexElement()() {
    return Object_Getter__OptionalHandle(this._parent, "parentFlexElement");
  }
  auto localize()(L10nCallback l10nCallback) {
    return Promise!(void)(Node_localize(this._parent, l10nCallback));
  }
}


extern (C) void Node_nodeValue_Set(Handle, bool, string);
extern (C) void Node_textContent_Set(Handle, bool, string);
extern (C) Handle Node_insertBefore(Handle, Handle, bool, Handle);
extern (C) Handle Node_replaceChild(Handle, Handle, Handle);
extern (C) bool Node_isSameNode(Handle, bool, Handle);
extern (C) bool Node_isEqualNode(Handle, bool, Handle);
extern (C) ushort Node_compareDocumentPosition(Handle, Handle);
extern (C) bool Node_contains(Handle, bool, Handle);
extern (C) Optional!(string) Node_lookupPrefix(Handle, bool, string);
extern (C) Optional!(string) Node_lookupNamespaceURI(Handle, bool, string);
extern (C) bool Node_isDefaultNamespace(Handle, bool, string);
extern (C) Handle Node_localize(Handle, L10nCallback);