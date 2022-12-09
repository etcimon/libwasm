module libwasm.bindings.Element;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Animatable;
import libwasm.bindings.Animation;
import libwasm.bindings.Attr;
import libwasm.bindings.ChildNode;
import libwasm.bindings.DOMMatrix;
import libwasm.bindings.DOMPoint;
import libwasm.bindings.DOMQuad;
import libwasm.bindings.DOMRect;
import libwasm.bindings.DOMRectList;
import libwasm.bindings.DOMTokenList;
import libwasm.bindings.EventHandler;
import libwasm.bindings.GeometryUtils;
import libwasm.bindings.Grid;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.HTMLSlotElement;
import libwasm.bindings.KeyframeAnimationOptions;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.NamedNodeMap;
import libwasm.bindings.Node;
import libwasm.bindings.NodeList;
import libwasm.bindings.ParentNode;
import libwasm.bindings.ShadowRoot;
import libwasm.bindings.Window;

@safe:
nothrow:

struct Element {
  nothrow:
  libwasm.bindings.Node.Node _parent;
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
    return Serialize_Object_VarArgCall!(Optional!string)(this._parent, "getAttributeNS", "Optional!(string);string", tuple(!namespace.empty, namespace.front, localName));
  }
  bool toggleAttribute()(string name, bool force) {
    return Serialize_Object_VarArgCall!bool(this._parent, "toggleAttribute", "string;bool", tuple(name, force));
  }
  bool toggleAttribute()(string name) {
    return Object_Call_string__bool(this._parent, "toggleAttribute", name);
  }
  void setAttribute()(string name, string value) {
    Object_Call_string_string__void(this._parent, "setAttribute", name, value);
  }
  void setAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string name, string value) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "setAttributeNS", "Optional!(string);string;string", tuple(!namespace.empty, namespace.front, name, value));
  }
  void removeAttribute()(string name) {
    Object_Call_string__void(this._parent, "removeAttribute", name);
  }
  void removeAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "removeAttributeNS", "Optional!(string);string", tuple(!namespace.empty, namespace.front, localName));
  }
  bool hasAttribute()(string name) {
    return Object_Call_string__bool(this._parent, "hasAttribute", name);
  }
  bool hasAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "hasAttributeNS", "Optional!(string);string", tuple(!namespace.empty, namespace.front, localName));
  }
  bool hasAttributes()() {
    return Object_Getter__bool(this._parent, "hasAttributes");
  }
  auto closest()(string selector) {
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this._parent, "closest", selector));
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
    return HTMLCollection(Serialize_Object_VarArgCall!Handle(this._parent, "getElementsByTagNameNS", "Optional!(string);string", tuple(!namespace.empty, namespace.front, localName)));
  }
  auto getElementsByClassName()(string classNames) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByClassName", classNames));
  }
  auto insertAdjacentElement()(string where, scope ref Element element) {
    return recastOpt!(Element)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "insertAdjacentElement", "string;Handle", tuple(where, cast(Handle)element._parent)));
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
    return Serialize_Object_VarArgCall!bool(this._parent, "hasPointerCapture", "int", tuple(pointerId));
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
    return recastOpt!(Attr)(Object_Call_string__OptionalHandle(this._parent, "getAttributeNode", name));
  }
  auto setAttributeNode()(scope ref Attr newAttr) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "setAttributeNode", "Handle", tuple(cast(Handle)newAttr._parent)));
  }
  auto removeAttributeNode()(scope ref Attr oldAttr) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "removeAttributeNode", "Handle", tuple(cast(Handle)oldAttr._parent)));
  }
  auto getAttributeNodeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getAttributeNodeNS", "Optional!(string);string", tuple(!namespaceURI.empty, namespaceURI.front, localName)));
  }
  auto setAttributeNodeNS()(scope ref Attr newAttr) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "setAttributeNodeNS", "Handle", tuple(cast(Handle)newAttr._parent)));
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
    Serialize_Object_VarArgCall!void(this._parent, "scrollIntoView", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref arg.Types[1] v) => 1))(arg),tuple(libwasm.sumtype.match!(((bool v) => v),((ref arg.Types[1] v) => bool.init))(arg),libwasm.sumtype.match!(((bool v) => Handle.init),((ref arg.Types[1] v) => cast(Handle)v.handle))(arg))));
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
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this._parent, "querySelector", selectors));
  }
  auto querySelectorAll()(string selectors) {
    return NodeList(Object_Call_string__Handle(this._parent, "querySelectorAll", selectors));
  }
  auto attachShadow()(scope ref ShadowRootInit shadowRootInitDict) {
    return ShadowRoot(Object_Call_Handle__Handle(this._parent, "attachShadow", shadowRootInitDict.handle));
  }
  auto shadowRoot()() {
    return recastOpt!(ShadowRoot)(Object_Getter__OptionalHandle(this._parent, "shadowRoot"));
  }
  auto openOrClosedShadowRoot()() {
    return recastOpt!(ShadowRoot)(Object_Getter__OptionalHandle(this._parent, "openOrClosedShadowRoot"));
  }
  auto assignedSlot()() {
    return recastOpt!(HTMLSlotElement)(Object_Getter__OptionalHandle(this._parent, "assignedSlot"));
  }
  auto openOrClosedAssignedSlot()() {
    return recastOpt!(HTMLSlotElement)(Object_Getter__OptionalHandle(this._parent, "openOrClosedAssignedSlot"));
  }
  void slot()(string slot) {
    Object_Call_string__void(this._parent, "slot", slot);
  }
  string slot()() {
    return Object_Getter__string(this._parent, "slot");
  }
  auto requestFullscreen()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "requestFullscreen"));
  }
  auto mozRequestFullScreen()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "mozRequestFullScreen"));
  }
  void onfullscreenchange(T0)(scope auto ref Optional!(T0) onfullscreenchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onfullscreenchange", !onfullscreenchange.empty, onfullscreenchange.front);
  }
  EventHandler onfullscreenchange()() {
    return Object_Getter__EventHandler(this._parent, "onfullscreenchange");
  }
  void onfullscreenerror(T0)(scope auto ref Optional!(T0) onfullscreenerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onfullscreenerror", !onfullscreenerror.empty, onfullscreenerror.front);
  }
  EventHandler onfullscreenerror()() {
    return Object_Getter__EventHandler(this._parent, "onfullscreenerror");
  }
  void requestPointerLock()() {
    Object_Call__void(this._parent, "requestPointerLock");
  }
  auto getAsFlexContainer()() {
    return recastOpt!(Flex)(Object_Getter__OptionalHandle(this._parent, "getAsFlexContainer"));
  }
  auto getGridFragments()() {
    return Sequence!(Grid)(Object_Getter__Handle(this._parent, "getGridFragments"));
  }
  auto getElementsWithGrid()() {
    return Sequence!(Element)(Object_Getter__Handle(this._parent, "getElementsWithGrid"));
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "before", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "after", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "replaceWith", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
  auto previousElementSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "previousElementSibling"));
  }
  auto nextElementSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "nextElementSibling"));
  }
  auto children()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "children"));
  }
  auto firstElementChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "firstElementChild"));
  }
  auto lastElementChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "lastElementChild"));
  }
  uint childElementCount()() {
    return Object_Getter__uint(this._parent, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this._parent, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Serialize_Object_VarArgCall!Handle(this._parent, "getElementsByAttributeNS", "Optional!(string);string;string", tuple(!namespaceURI.empty, namespaceURI.front, name, value)));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "prepend", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "append", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes, scope ref SumType!(double, KeyframeAnimationOptions) options) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this._parent, "animate", "Optional!Handle;SumType!(double,Handle)", tuple(!keyframes.empty, cast(Handle)keyframes.front.handle, libwasm.sumtype.match!(((double v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((double v) => v),((ref options.Types[1] v) => double.init))(options),libwasm.sumtype.match!(((double v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)))));
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this._parent, "animate", "Optional!Handle", tuple(!keyframes.empty, cast(Handle)keyframes.front.handle)));
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
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this._parent, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this._parent, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
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
  libwasm.bindings.Window.ScrollOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ScrollOptions(h);
  }
  static auto create() {
    return ScrollIntoViewOptions(libwasm_add__object());
  }
  void block()(ScrollLogicalPosition block) {
    Object_Call_int__void(this._parent, "block", block);
  }
  ScrollLogicalPosition block()() {
    return Object_Getter__int(this._parent, "block");
  }
  void inline()(ScrollLogicalPosition inline) {
    Object_Call_int__void(this._parent, "inline", inline);
  }
  ScrollLogicalPosition inline()() {
    return Object_Getter__int(this._parent, "inline");
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
    return ShadowRootInit(libwasm_add__object());
  }
  void mode()(ShadowRootMode mode) {
    Object_Call_int__void(this.handle, "mode", mode);
  }
  ShadowRootMode mode()() {
    return Object_Getter__int(this.handle, "mode");
  }
}


