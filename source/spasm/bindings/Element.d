module spasm.bindings.Element;

import spasm.types;
import spasm.bindings.Animatable;
import spasm.bindings.Animation;
import spasm.bindings.Attr;
import spasm.bindings.ChildNode;
import spasm.bindings.DOMMatrix;
import spasm.bindings.DOMPoint;
import spasm.bindings.DOMQuad;
import spasm.bindings.DOMRect;
import spasm.bindings.DOMRectList;
import spasm.bindings.DOMTokenList;
import spasm.bindings.EventHandler;
import spasm.bindings.GeometryUtils;
import spasm.bindings.Grid;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLSlotElement;
import spasm.bindings.KeyframeAnimationOptions;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.NamedNodeMap;
import spasm.bindings.Node;
import spasm.bindings.NodeList;
import spasm.bindings.ParentNode;
import spasm.bindings.ShadowRoot;
import spasm.bindings.Window;

@safe:
nothrow:

struct Element {
  nothrow:
  spasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  Optional!(string) namespaceURI()() {
    return Object_Getter__OptionalString(this._parent, "namespaceURI");
  }
  Optional!(string) prefix()() {
    return Object_Getter__OptionalString(this._parent, "prefix");
  }
  string localName()() {
    return Object_Getter__string(this._parent, "localName");
  }
  string tagName()() {
    return Object_Getter__string(this._parent, "tagName");
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  void className()(string className) {
    Object_Call_string__void(this._parent, "className", className);
  }
  string className()() {
    return Object_Getter__string(this._parent, "className");
  }
  auto classList()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "classList"));
  }
  auto attributes()() {
    return NamedNodeMap(Object_Getter__Handle(this._parent, "attributes"));
  }
  auto getAttributeNames()() {
    return Sequence!(string)(Object_Getter__Handle(this._parent, "getAttributeNames"));
  }
  Optional!(string) getAttribute()(string name) {
    return Object_Call_string__OptionalString(this._parent, "getAttribute", name);
  }
  Optional!(string) getAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return Element_getAttributeNS(this._parent, !namespace.empty, namespace.front, localName);
  }
  bool toggleAttribute()(string name, bool force) {
    return Element_toggleAttribute(this._parent, name, force);
  }
  bool toggleAttribute()(string name) {
    return Object_Call_string__bool(this._parent, "toggleAttribute", name);
  }
  void setAttribute()(string name, string value) {
    Object_Call_string_string__void(this._parent, "setAttribute", name, value);
  }
  void setAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string name, string value) if (isTOrPointer!(T0, string)) {
    Element_setAttributeNS(this._parent, !namespace.empty, namespace.front, name, value);
  }
  void removeAttribute()(string name) {
    Object_Call_string__void(this._parent, "removeAttribute", name);
  }
  void removeAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    Element_removeAttributeNS(this._parent, !namespace.empty, namespace.front, localName);
  }
  bool hasAttribute()(string name) {
    return Object_Call_string__bool(this._parent, "hasAttribute", name);
  }
  bool hasAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return Element_hasAttributeNS(this._parent, !namespace.empty, namespace.front, localName);
  }
  bool hasAttributes()() {
    return Object_Getter__bool(this._parent, "hasAttributes");
  }
  auto closest()(string selector) {
    return Object_Call_string__OptionalHandle(this._parent, "closest", selector);
  }
  bool matches()(string selector) {
    return Object_Call_string__bool(this._parent, "matches", selector);
  }
  bool webkitMatchesSelector()(string selector) {
    return Object_Call_string__bool(this._parent, "webkitMatchesSelector", selector);
  }
  auto getElementsByTagName()(string localName) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByTagName", localName));
  }
  auto getElementsByTagNameNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Element_getElementsByTagNameNS(this._parent, !namespace.empty, namespace.front, localName));
  }
  auto getElementsByClassName()(string classNames) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByClassName", classNames));
  }
  auto insertAdjacentElement()(string where, scope ref Element element) {
    return Element_insertAdjacentElement(this._parent, where, element._parent);
  }
  void insertAdjacentText()(string where, string data) {
    Object_Call_string_string__void(this._parent, "insertAdjacentText", where, data);
  }
  float fontSizeInflation()() {
    return Object_Getter__float(this._parent, "fontSizeInflation");
  }
  bool mozMatchesSelector()(string selector) {
    return Object_Call_string__bool(this._parent, "mozMatchesSelector", selector);
  }
  void setPointerCapture()(int pointerId) {
    Object_Call_int__void(this._parent, "setPointerCapture", pointerId);
  }
  void releasePointerCapture()(int pointerId) {
    Object_Call_int__void(this._parent, "releasePointerCapture", pointerId);
  }
  bool hasPointerCapture()(int pointerId) {
    return Element_hasPointerCapture(this._parent, pointerId);
  }
  void setCapture()(bool retargetToElement /* = false */) {
    Object_Call_bool__void(this._parent, "setCapture", retargetToElement);
  }
  void setCapture()() {
    Object_Call__void(this._parent, "setCapture");
  }
  void releaseCapture()() {
    Object_Call__void(this._parent, "releaseCapture");
  }
  void setCaptureAlways()(bool retargetToElement /* = false */) {
    Object_Call_bool__void(this._parent, "setCaptureAlways", retargetToElement);
  }
  void setCaptureAlways()() {
    Object_Call__void(this._parent, "setCaptureAlways");
  }
  auto getAttributeNode()(string name) {
    return Object_Call_string__OptionalHandle(this._parent, "getAttributeNode", name);
  }
  auto setAttributeNode()(scope ref Attr newAttr) {
    return Element_setAttributeNode(this._parent, newAttr._parent);
  }
  auto removeAttributeNode()(scope ref Attr oldAttr) {
    return Element_removeAttributeNode(this._parent, oldAttr._parent);
  }
  auto getAttributeNodeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return Element_getAttributeNodeNS(this._parent, !namespaceURI.empty, namespaceURI.front, localName);
  }
  auto setAttributeNodeNS()(scope ref Attr newAttr) {
    return Element_setAttributeNodeNS(this._parent, newAttr._parent);
  }
  auto getTransformToAncestor()(scope ref Element ancestor) {
    return DOMMatrixReadOnly(Object_Call_Handle__Handle(this._parent, "getTransformToAncestor", ancestor._parent));
  }
  auto getTransformToParent()() {
    return DOMMatrixReadOnly(Object_Getter__Handle(this._parent, "getTransformToParent"));
  }
  auto getTransformToViewport()() {
    return DOMMatrixReadOnly(Object_Getter__Handle(this._parent, "getTransformToViewport"));
  }
  auto getClientRects()() {
    return DOMRectList(Object_Getter__Handle(this._parent, "getClientRects"));
  }
  auto getBoundingClientRect()() {
    return DOMRect(Object_Getter__Handle(this._parent, "getBoundingClientRect"));
  }
  void scrollIntoView()(scope ref SumType!(bool, ScrollIntoViewOptions) arg) {
    Element_scrollIntoView(this._parent, arg);
  }
  void scrollIntoView()() {
    Object_Call__void(this._parent, "scrollIntoView");
  }
  void scrollTop()(int scrollTop) {
    Object_Call_int__void(this._parent, "scrollTop", scrollTop);
  }
  int scrollTop()() {
    return Object_Getter__int(this._parent, "scrollTop");
  }
  void scrollLeft()(int scrollLeft) {
    Object_Call_int__void(this._parent, "scrollLeft", scrollLeft);
  }
  int scrollLeft()() {
    return Object_Getter__int(this._parent, "scrollLeft");
  }
  int scrollWidth()() {
    return Object_Getter__int(this._parent, "scrollWidth");
  }
  int scrollHeight()() {
    return Object_Getter__int(this._parent, "scrollHeight");
  }
  void scroll()(double x, double y) {
    Object_Call_double_double__void(this._parent, "scroll", x, y);
  }
  void scroll()(scope ref ScrollToOptions options) {
    Object_Call_Handle__void(this._parent, "scroll", options._parent);
  }
  void scroll()() {
    Object_Call__void(this._parent, "scroll");
  }
  void scrollTo()(double x, double y) {
    Object_Call_double_double__void(this._parent, "scrollTo", x, y);
  }
  void scrollTo()(scope ref ScrollToOptions options) {
    Object_Call_Handle__void(this._parent, "scrollTo", options._parent);
  }
  void scrollTo()() {
    Object_Call__void(this._parent, "scrollTo");
  }
  void scrollBy()(double x, double y) {
    Object_Call_double_double__void(this._parent, "scrollBy", x, y);
  }
  void scrollBy()(scope ref ScrollToOptions options) {
    Object_Call_Handle__void(this._parent, "scrollBy", options._parent);
  }
  void scrollBy()() {
    Object_Call__void(this._parent, "scrollBy");
  }
  void mozScrollSnap()() {
    Object_Call__void(this._parent, "mozScrollSnap");
  }
  int clientTop()() {
    return Object_Getter__int(this._parent, "clientTop");
  }
  int clientLeft()() {
    return Object_Getter__int(this._parent, "clientLeft");
  }
  int clientWidth()() {
    return Object_Getter__int(this._parent, "clientWidth");
  }
  int clientHeight()() {
    return Object_Getter__int(this._parent, "clientHeight");
  }
  int scrollTopMin()() {
    return Object_Getter__int(this._parent, "scrollTopMin");
  }
  int scrollTopMax()() {
    return Object_Getter__int(this._parent, "scrollTopMax");
  }
  int scrollLeftMin()() {
    return Object_Getter__int(this._parent, "scrollLeftMin");
  }
  int scrollLeftMax()() {
    return Object_Getter__int(this._parent, "scrollLeftMax");
  }
  void innerHTML()(string innerHTML) {
    Object_Call_string__void(this._parent, "innerHTML", innerHTML);
  }
  string innerHTML()() {
    return Object_Getter__string(this._parent, "innerHTML");
  }
  void outerHTML()(string outerHTML) {
    Object_Call_string__void(this._parent, "outerHTML", outerHTML);
  }
  string outerHTML()() {
    return Object_Getter__string(this._parent, "outerHTML");
  }
  void insertAdjacentHTML()(string position, string text) {
    Object_Call_string_string__void(this._parent, "insertAdjacentHTML", position, text);
  }
  auto querySelector()(string selectors) {
    return Object_Call_string__OptionalHandle(this._parent, "querySelector", selectors);
  }
  auto querySelectorAll()(string selectors) {
    return NodeList(Object_Call_string__Handle(this._parent, "querySelectorAll", selectors));
  }
  auto attachShadow()(scope ref ShadowRootInit shadowRootInitDict) {
    return ShadowRoot(Object_Call_Handle__Handle(this._parent, "attachShadow", shadowRootInitDict.handle));
  }
  auto shadowRoot()() {
    return Object_Getter__OptionalHandle(this._parent, "shadowRoot");
  }
  auto openOrClosedShadowRoot()() {
    return Object_Getter__OptionalHandle(this._parent, "openOrClosedShadowRoot");
  }
  auto assignedSlot()() {
    return Object_Getter__OptionalHandle(this._parent, "assignedSlot");
  }
  auto openOrClosedAssignedSlot()() {
    return Object_Getter__OptionalHandle(this._parent, "openOrClosedAssignedSlot");
  }
  void slot()(string slot) {
    Object_Call_string__void(this._parent, "slot", slot);
  }
  string slot()() {
    return Object_Getter__string(this._parent, "slot");
  }
  auto requestFullscreen()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "requestFullscreen"));
  }
  auto mozRequestFullScreen()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "mozRequestFullScreen"));
  }
  void onfullscreenchange(T0)(scope auto ref Optional!(T0) onfullscreenchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onfullscreenchange", !onfullscreenchange.empty, onfullscreenchange.front);
  }
  EventHandler onfullscreenchange()() {
    return Object_Getter__EventHandler(this._parent, "onfullscreenchange");
  }
  void onfullscreenerror(T0)(scope auto ref Optional!(T0) onfullscreenerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onfullscreenerror", !onfullscreenerror.empty, onfullscreenerror.front);
  }
  EventHandler onfullscreenerror()() {
    return Object_Getter__EventHandler(this._parent, "onfullscreenerror");
  }
  void requestPointerLock()() {
    Object_Call__void(this._parent, "requestPointerLock");
  }
  auto getAsFlexContainer()() {
    return Object_Getter__OptionalHandle(this._parent, "getAsFlexContainer");
  }
  auto getGridFragments()() {
    return Sequence!(Grid)(Object_Getter__Handle(this._parent, "getGridFragments"));
  }
  auto getElementsWithGrid()() {
    return Sequence!(Element)(Object_Getter__Handle(this._parent, "getElementsWithGrid"));
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    ChildNode_before(this._parent, nodes);
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    ChildNode_after(this._parent, nodes);
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    ChildNode_replaceWith(this._parent, nodes);
  }
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
  auto previousElementSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "previousElementSibling");
  }
  auto nextElementSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "nextElementSibling");
  }
  auto children()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "children"));
  }
  auto firstElementChild()() {
    return Object_Getter__OptionalHandle(this._parent, "firstElementChild");
  }
  auto lastElementChild()() {
    return Object_Getter__OptionalHandle(this._parent, "lastElementChild");
  }
  uint childElementCount()() {
    return Object_Getter__uint(this._parent, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this._parent, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(ParentNode_getElementsByAttributeNS(this._parent, !namespaceURI.empty, namespaceURI.front, name, value));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    ParentNode_prepend(this._parent, nodes);
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    ParentNode_append(this._parent, nodes);
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes, scope ref SumType!(double, KeyframeAnimationOptions) options) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Animatable_animate(this._parent, !keyframes.empty, keyframes.front.handle, options));
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Animatable_animate_0(this._parent, !keyframes.empty, keyframes.front.handle));
  }
  auto getAnimations()(scope ref AnimationFilter filter) {
    return Sequence!(Animation)(Object_Call_Handle__Handle(this._parent, "getAnimations", filter.handle));
  }
  auto getAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this._parent, "getAnimations"));
  }
  auto getBoxQuads()(scope ref BoxQuadOptions options) {
    return Sequence!(DOMQuad)(Object_Call_Handle__Handle(this._parent, "getBoxQuads", options.handle));
  }
  auto getBoxQuads()() {
    return Sequence!(DOMQuad)(Object_Getter__Handle(this._parent, "getBoxQuads"));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertQuadFromNode(this._parent, quad.handle, from, options.handle));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertQuadFromNode_0(this._parent, quad.handle, from));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertRectFromNode(this._parent, rect.handle, from, options.handle));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertRectFromNode_0(this._parent, rect.handle, from));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(GeometryUtils_convertPointFromNode(this._parent, point.handle, from, options.handle));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(GeometryUtils_convertPointFromNode_0(this._parent, point.handle, from));
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}
struct ScrollIntoViewOptions {
  nothrow:
  spasm.bindings.Window.ScrollOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ScrollOptions(h);
  }
  static auto create() {
    return ScrollIntoViewOptions(spasm_add__object());
  }
  void block()(ScrollLogicalPosition block) {
    ScrollIntoViewOptions_block_Set(this._parent, block);
  }
  ScrollLogicalPosition block()() {
    return ScrollIntoViewOptions_block_Get(this._parent);
  }
  void inline()(ScrollLogicalPosition inline) {
    ScrollIntoViewOptions_inline_Set(this._parent, inline);
  }
  ScrollLogicalPosition inline()() {
    return ScrollIntoViewOptions_inline_Get(this._parent);
  }
}
enum ScrollLogicalPosition {
  start,
  center,
  end,
  nearest
}
struct ShadowRootInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ShadowRootInit(spasm_add__object());
  }
  void mode()(ShadowRootMode mode) {
    ShadowRootInit_mode_Set(this.handle, mode);
  }
  ShadowRootMode mode()() {
    return ShadowRootInit_mode_Get(this.handle);
  }
}


extern (C) Optional!(string) Element_getAttributeNS(Handle, bool, string, string);
extern (C) bool Element_toggleAttribute(Handle, string, bool);
extern (C) void Element_setAttributeNS(Handle, bool, string, string, string);
extern (C) void Element_removeAttributeNS(Handle, bool, string, string);
extern (C) bool Element_hasAttributeNS(Handle, bool, string, string);
extern (C) Handle Element_getElementsByTagNameNS(Handle, bool, string, string);
extern (C) Optional!(Element) Element_insertAdjacentElement(Handle, string, Handle);
extern (C) bool Element_hasPointerCapture(Handle, int);
extern (C) Optional!(Attr) Element_setAttributeNode(Handle, Handle);
extern (C) Optional!(Attr) Element_removeAttributeNode(Handle, Handle);
extern (C) Optional!(Attr) Element_getAttributeNodeNS(Handle, bool, string, string);
extern (C) Optional!(Attr) Element_setAttributeNodeNS(Handle, Handle);
extern (C) void Element_scrollIntoView(Handle, scope ref SumType!(bool, ScrollIntoViewOptions));
extern (C) void ScrollIntoViewOptions_block_Set(Handle, ScrollLogicalPosition);
extern (C) ScrollLogicalPosition ScrollIntoViewOptions_block_Get(Handle);
extern (C) void ScrollIntoViewOptions_inline_Set(Handle, ScrollLogicalPosition);
extern (C) ScrollLogicalPosition ScrollIntoViewOptions_inline_Get(Handle);
extern (C) void ShadowRootInit_mode_Set(Handle, ShadowRootMode);
extern (C) ShadowRootMode ShadowRootInit_mode_Get(Handle);