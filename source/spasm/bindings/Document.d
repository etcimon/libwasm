module spasm.bindings.Document;

import spasm.types;
import spasm.bindings.Animation;
import spasm.bindings.AnonymousContent;
import spasm.bindings.Attr;
import spasm.bindings.BoxObject;
import spasm.bindings.CDATASection;
import spasm.bindings.CaretPosition;
import spasm.bindings.Comment;
import spasm.bindings.DOMImplementation;
import spasm.bindings.DOMPoint;
import spasm.bindings.DOMQuad;
import spasm.bindings.DOMRect;
import spasm.bindings.DOMStringList;
import spasm.bindings.DocumentFragment;
import spasm.bindings.DocumentL10n;
import spasm.bindings.DocumentOrShadowRoot;
import spasm.bindings.DocumentTimeline;
import spasm.bindings.DocumentType;
import spasm.bindings.Element;
import spasm.bindings.Event;
import spasm.bindings.EventHandler;
import spasm.bindings.EventListener;
import spasm.bindings.EventTarget;
import spasm.bindings.FeaturePolicy;
import spasm.bindings.FontFaceSet;
import spasm.bindings.FontFaceSource;
import spasm.bindings.GeometryUtils;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLHeadElement;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.Location;
import spasm.bindings.Node;
import spasm.bindings.NodeFilter;
import spasm.bindings.NodeIterator;
import spasm.bindings.NodeList;
import spasm.bindings.ParentNode;
import spasm.bindings.ProcessingInstruction;
import spasm.bindings.Range;
import spasm.bindings.SVGSVGElement;
import spasm.bindings.Selection;
import spasm.bindings.StyleSheetList;
import spasm.bindings.Text;
import spasm.bindings.Touch;
import spasm.bindings.TouchList;
import spasm.bindings.TreeWalker;
import spasm.bindings.Window;
import spasm.bindings.XPathEvaluator;
import spasm.bindings.XPathExpression;
import spasm.bindings.XPathNSResolver;
import spasm.bindings.XPathResult;

@safe:
nothrow:

struct BlockParsingOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BlockParsingOptions(spasm_add__object());
  }
  void blockScriptCreated()(bool blockScriptCreated) {
    Object_Call_bool__void(this.handle, "blockScriptCreated", blockScriptCreated);
  }
  bool blockScriptCreated()() {
    return Object_Getter__bool(this.handle, "blockScriptCreated");
  }
}
struct Document {
  nothrow:
  spasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  auto implementation()() {
    return DOMImplementation(Object_Getter__Handle(this._parent, "implementation"));
  }
  string URL()() {
    return Object_Getter__string(this._parent, "URL");
  }
  string documentURI()() {
    return Object_Getter__string(this._parent, "documentURI");
  }
  string compatMode()() {
    return Object_Getter__string(this._parent, "compatMode");
  }
  string characterSet()() {
    return Object_Getter__string(this._parent, "characterSet");
  }
  string charset()() {
    return Object_Getter__string(this._parent, "charset");
  }
  string inputEncoding()() {
    return Object_Getter__string(this._parent, "inputEncoding");
  }
  string contentType()() {
    return Object_Getter__string(this._parent, "contentType");
  }
  auto doctype()() {
    return Object_Getter__OptionalHandle(this._parent, "doctype");
  }
  auto documentElement()() {
    return Object_Getter__OptionalHandle(this._parent, "documentElement");
  }
  auto getElementsByTagName()(string localName) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByTagName", localName));
  }
  auto getElementsByTagNameNS(T0)(scope auto ref Optional!(T0) namespace, string localName) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Document_getElementsByTagNameNS(this._parent, !namespace.empty, namespace.front, localName));
  }
  auto getElementsByClassName()(string classNames) {
    return HTMLCollection(Object_Call_string__Handle(this._parent, "getElementsByClassName", classNames));
  }
  auto getElementById()(string elementId) {
    return Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId);
  }
  auto createElement()(string localName, scope ref SumType!(ElementCreationOptions, string) options) {
    return Element(Document_createElement(this._parent, localName, options));
  }
  auto createElement()(string localName) {
    return Element(Object_Call_string__Handle(this._parent, "createElement", localName));
  }
  auto createElementNS(T0)(scope auto ref Optional!(T0) namespace, string qualifiedName, scope ref SumType!(ElementCreationOptions, string) options) if (isTOrPointer!(T0, string)) {
    return Element(Document_createElementNS(this._parent, !namespace.empty, namespace.front, qualifiedName, options));
  }
  auto createElementNS(T0)(scope auto ref Optional!(T0) namespace, string qualifiedName) if (isTOrPointer!(T0, string)) {
    return Element(Document_createElementNS_0(this._parent, !namespace.empty, namespace.front, qualifiedName));
  }
  auto createDocumentFragment()() {
    return DocumentFragment(Object_Getter__Handle(this._parent, "createDocumentFragment"));
  }
  auto createTextNode()(string data) {
    return Text(Object_Call_string__Handle(this._parent, "createTextNode", data));
  }
  auto createComment()(string data) {
    return Comment(Object_Call_string__Handle(this._parent, "createComment", data));
  }
  auto createProcessingInstruction()(string target, string data) {
    return ProcessingInstruction(Object_Call_string_string__Handle(this._parent, "createProcessingInstruction", target, data));
  }
  auto importNode()(scope ref Node node, bool deep /* = false */) {
    return Node(Document_importNode(this._parent, node._parent, deep));
  }
  auto importNode()(scope ref Node node) {
    return Node(Object_Call_Handle__Handle(this._parent, "importNode", node._parent));
  }
  auto adoptNode()(scope ref Node node) {
    return Node(Object_Call_Handle__Handle(this._parent, "adoptNode", node._parent));
  }
  auto createEvent()(string interface_) {
    return Event(Object_Call_string__Handle(this._parent, "createEvent", interface_));
  }
  auto createRange()() {
    return Range(Object_Getter__Handle(this._parent, "createRange"));
  }
  auto createNodeIterator(T2)(scope ref Node root, uint whatToShow /* = 0xFFFFFFFF */, scope auto ref Optional!(T2) filter /* = no!(NodeFilter) */) if (isTOrPointer!(T2, NodeFilter)) {
    return NodeIterator(Document_createNodeIterator(this._parent, root._parent, whatToShow, !filter.empty, filter.front.handle));
  }
  auto createNodeIterator()(scope ref Node root, uint whatToShow /* = 0xFFFFFFFF */) {
    return NodeIterator(Document_createNodeIterator_0(this._parent, root._parent, whatToShow));
  }
  auto createNodeIterator()(scope ref Node root) {
    return NodeIterator(Object_Call_Handle__Handle(this._parent, "createNodeIterator", root._parent));
  }
  auto createTreeWalker(T2)(scope ref Node root, uint whatToShow /* = 0xFFFFFFFF */, scope auto ref Optional!(T2) filter /* = no!(NodeFilter) */) if (isTOrPointer!(T2, NodeFilter)) {
    return TreeWalker(Document_createTreeWalker(this._parent, root._parent, whatToShow, !filter.empty, filter.front.handle));
  }
  auto createTreeWalker()(scope ref Node root, uint whatToShow /* = 0xFFFFFFFF */) {
    return TreeWalker(Document_createTreeWalker_0(this._parent, root._parent, whatToShow));
  }
  auto createTreeWalker()(scope ref Node root) {
    return TreeWalker(Object_Call_Handle__Handle(this._parent, "createTreeWalker", root._parent));
  }
  auto createCDATASection()(string data) {
    return CDATASection(Object_Call_string__Handle(this._parent, "createCDATASection", data));
  }
  auto createAttribute()(string name) {
    return Attr(Object_Call_string__Handle(this._parent, "createAttribute", name));
  }
  auto createAttributeNS(T0)(scope auto ref Optional!(T0) namespace, string name) if (isTOrPointer!(T0, string)) {
    return Attr(Document_createAttributeNS(this._parent, !namespace.empty, namespace.front, name));
  }
  auto location()() {
    return Object_Getter__OptionalHandle(this._parent, "location");
  }
  string referrer()() {
    return Object_Getter__string(this._parent, "referrer");
  }
  string lastModified()() {
    return Object_Getter__string(this._parent, "lastModified");
  }
  string readyState()() {
    return Object_Getter__string(this._parent, "readyState");
  }
  void title()(string title) {
    Object_Call_string__void(this._parent, "title", title);
  }
  string title()() {
    return Object_Getter__string(this._parent, "title");
  }
  void dir()(string dir) {
    Object_Call_string__void(this._parent, "dir", dir);
  }
  string dir()() {
    return Object_Getter__string(this._parent, "dir");
  }
  void body_(T0)(scope auto ref Optional!(T0) body_) if (isTOrPointer!(T0, HTMLElement)) {
    Document_body_Set(this._parent, !body_.empty, body_.front.handle);
  }
  auto body_()() {
    return Object_Getter__OptionalHandle(this._parent, "body");
  }
  auto head()() {
    return Object_Getter__OptionalHandle(this._parent, "head");
  }
  auto images()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "images"));
  }
  auto embeds()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "embeds"));
  }
  auto plugins()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "plugins"));
  }
  auto links()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "links"));
  }
  auto forms()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "forms"));
  }
  auto scripts()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "scripts"));
  }
  auto getElementsByName()(string elementName) {
    return NodeList(Object_Call_string__Handle(this._parent, "getElementsByName", elementName));
  }
  auto defaultView()() {
    return Object_Getter__OptionalHandle(this._parent, "defaultView");
  }
  bool hasFocus()() {
    return Object_Getter__bool(this._parent, "hasFocus");
  }
  void onreadystatechange(T0)(scope auto ref Optional!(T0) onreadystatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onreadystatechange", !onreadystatechange.empty, onreadystatechange.front);
  }
  EventHandler onreadystatechange()() {
    return Object_Getter__EventHandler(this._parent, "onreadystatechange");
  }
  void onbeforescriptexecute(T0)(scope auto ref Optional!(T0) onbeforescriptexecute) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onbeforescriptexecute", !onbeforescriptexecute.empty, onbeforescriptexecute.front);
  }
  EventHandler onbeforescriptexecute()() {
    return Object_Getter__EventHandler(this._parent, "onbeforescriptexecute");
  }
  void onafterscriptexecute(T0)(scope auto ref Optional!(T0) onafterscriptexecute) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onafterscriptexecute", !onafterscriptexecute.empty, onafterscriptexecute.front);
  }
  EventHandler onafterscriptexecute()() {
    return Object_Getter__EventHandler(this._parent, "onafterscriptexecute");
  }
  void onselectionchange(T0)(scope auto ref Optional!(T0) onselectionchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onselectionchange", !onselectionchange.empty, onselectionchange.front);
  }
  EventHandler onselectionchange()() {
    return Object_Getter__EventHandler(this._parent, "onselectionchange");
  }
  bool mozSyntheticDocument()() {
    return Object_Getter__bool(this._parent, "mozSyntheticDocument");
  }
  auto getBoxObjectFor(T0)(scope auto ref Optional!(T0) element) if (isTOrPointer!(T0, Element)) {
    return Document_getBoxObjectFor(this._parent, !element.empty, element.front._parent);
  }
  auto currentScript()() {
    return Object_Getter__OptionalHandle(this._parent, "currentScript");
  }
  void releaseCapture()() {
    Object_Call__void(this._parent, "releaseCapture");
  }
  void mozSetImageElement(T1)(string aImageElementId, scope auto ref Optional!(T1) aImageElement) if (isTOrPointer!(T1, Element)) {
    Document_mozSetImageElement(this._parent, aImageElementId, !aImageElement.empty, aImageElement.front._parent);
  }
  auto documentURIObject()() {
    return Object_Getter__OptionalHandle(this._parent, "documentURIObject");
  }
  uint referrerPolicy()() {
    return Object_Getter__uint(this._parent, "referrerPolicy");
  }
  auto anchors()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "anchors"));
  }
  auto applets()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "applets"));
  }
  bool fullscreen()() {
    return Object_Getter__bool(this._parent, "fullscreen");
  }
  bool mozFullScreen()() {
    return Object_Getter__bool(this._parent, "mozFullScreen");
  }
  bool fullscreenEnabled()() {
    return Object_Getter__bool(this._parent, "fullscreenEnabled");
  }
  bool mozFullScreenEnabled()() {
    return Object_Getter__bool(this._parent, "mozFullScreenEnabled");
  }
  auto exitFullscreen()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "exitFullscreen"));
  }
  auto mozCancelFullScreen()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "mozCancelFullScreen"));
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
  void exitPointerLock()() {
    Object_Call__void(this._parent, "exitPointerLock");
  }
  void onpointerlockchange(T0)(scope auto ref Optional!(T0) onpointerlockchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerlockchange", !onpointerlockchange.empty, onpointerlockchange.front);
  }
  EventHandler onpointerlockchange()() {
    return Object_Getter__EventHandler(this._parent, "onpointerlockchange");
  }
  void onpointerlockerror(T0)(scope auto ref Optional!(T0) onpointerlockerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerlockerror", !onpointerlockerror.empty, onpointerlockerror.front);
  }
  EventHandler onpointerlockerror()() {
    return Object_Getter__EventHandler(this._parent, "onpointerlockerror");
  }
  bool hidden()() {
    return Object_Getter__bool(this._parent, "hidden");
  }
  VisibilityState visibilityState()() {
    return Document_visibilityState_Get(this._parent);
  }
  void onvisibilitychange(T0)(scope auto ref Optional!(T0) onvisibilitychange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvisibilitychange", !onvisibilitychange.empty, onvisibilitychange.front);
  }
  EventHandler onvisibilitychange()() {
    return Object_Getter__EventHandler(this._parent, "onvisibilitychange");
  }
  void selectedStyleSheetSet(T0)(scope auto ref Optional!(T0) selectedStyleSheetSet) if (isTOrPointer!(T0, string)) {
    Document_selectedStyleSheetSet_Set(this._parent, !selectedStyleSheetSet.empty, selectedStyleSheetSet.front);
  }
  Optional!(string) selectedStyleSheetSet()() {
    return Object_Getter__OptionalString(this._parent, "selectedStyleSheetSet");
  }
  Optional!(string) lastStyleSheetSet()() {
    return Object_Getter__OptionalString(this._parent, "lastStyleSheetSet");
  }
  Optional!(string) preferredStyleSheetSet()() {
    return Object_Getter__OptionalString(this._parent, "preferredStyleSheetSet");
  }
  auto styleSheetSets()() {
    return DOMStringList(Object_Getter__Handle(this._parent, "styleSheetSets"));
  }
  void enableStyleSheetsForSet(T0)(scope auto ref Optional!(T0) name) if (isTOrPointer!(T0, string)) {
    Document_enableStyleSheetsForSet(this._parent, !name.empty, name.front);
  }
  auto caretPositionFromPoint()(float x, float y) {
    return Document_caretPositionFromPoint(this._parent, x, y);
  }
  auto scrollingElement()() {
    return Object_Getter__OptionalHandle(this._parent, "scrollingElement");
  }
  auto querySelector()(string selectors) {
    return Object_Call_string__OptionalHandle(this._parent, "querySelector", selectors);
  }
  auto querySelectorAll()(string selectors) {
    return NodeList(Object_Call_string__Handle(this._parent, "querySelectorAll", selectors));
  }
  auto timeline()() {
    return DocumentTimeline(Object_Getter__Handle(this._parent, "timeline"));
  }
  auto getAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this._parent, "getAnimations"));
  }
  auto rootElement()() {
    return Object_Getter__OptionalHandle(this._parent, "rootElement");
  }
  auto getAnonymousNodes()(scope ref Element elt) {
    return Document_getAnonymousNodes(this._parent, elt._parent);
  }
  auto getAnonymousElementByAttribute()(scope ref Element elt, string attrName, string attrValue) {
    return Document_getAnonymousElementByAttribute(this._parent, elt._parent, attrName, attrValue);
  }
  auto getBindingParent()(scope ref Node node) {
    return Document_getBindingParent(this._parent, node._parent);
  }
  void loadBindingDocument()(string documentURL) {
    Object_Call_string__void(this._parent, "loadBindingDocument", documentURL);
  }
  auto createXULElement()(string localName, scope ref SumType!(ElementCreationOptions, string) options) {
    return Element(Document_createXULElement(this._parent, localName, options));
  }
  auto createXULElement()(string localName) {
    return Element(Object_Call_string__Handle(this._parent, "createXULElement", localName));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, int radiusX /* = 0 */, int radiusY /* = 0 */, float rotationAngle /* = 0 */, float force /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX, clientY, radiusX, radiusY, rotationAngle, force));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, int radiusX /* = 0 */, int radiusY /* = 0 */, float rotationAngle /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_0(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX, clientY, radiusX, radiusY, rotationAngle));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, int radiusX /* = 0 */, int radiusY /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_1(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX, clientY, radiusX, radiusY));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, int radiusX /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_2(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX, clientY, radiusX));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_3(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX, clientY));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_4(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY, clientX));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_5(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX, screenY));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */, int screenX /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_6(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY, screenX));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */, int pageY /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_7(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX, pageY));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */, int pageX /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_8(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier, pageX));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */, int identifier /* = 0 */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_9(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle, identifier));
  }
  auto createTouch(T0, T1)(scope auto ref Optional!(T0) view /* = no!(Window) */, scope auto ref Optional!(T1) target /* = no!(EventTarget) */) if (isTOrPointer!(T0, Window) && isTOrPointer!(T1, EventTarget)) {
    return Touch(Document_createTouch_10(this._parent, !view.empty, view.front._parent, !target.empty, target.front.handle));
  }
  auto createTouch(T0)(scope auto ref Optional!(T0) view /* = no!(Window) */) if (isTOrPointer!(T0, Window)) {
    return Touch(Document_createTouch_11(this._parent, !view.empty, view.front._parent));
  }
  auto createTouch()() {
    return Touch(Object_Getter__Handle(this._parent, "createTouch"));
  }
  auto createTouchList()(scope ref Touch touch, scope ref Touch touches) {
    return TouchList(Document_createTouchList__Handle_Handle(this._parent, touch.handle, touches.handle));
  }
  auto createTouchList()() {
    return TouchList(Object_Getter__Handle(this._parent, "createTouchList"));
  }
  auto createTouchList()(scope ref Sequence!(Touch) touches) {
    return TouchList(Object_Call_Handle__Handle(this._parent, "createTouchList", touches.handle));
  }
  void styleSheetChangeEventsEnabled()(bool styleSheetChangeEventsEnabled) {
    Object_Call_bool__void(this._parent, "styleSheetChangeEventsEnabled", styleSheetChangeEventsEnabled);
  }
  bool styleSheetChangeEventsEnabled()() {
    return Object_Getter__bool(this._parent, "styleSheetChangeEventsEnabled");
  }
  string contentLanguage()() {
    return Object_Getter__string(this._parent, "contentLanguage");
  }
  auto documentLoadGroup()() {
    return Object_Getter__OptionalHandle(this._parent, "documentLoadGroup");
  }
  auto blockParsing()(scope ref Promise!(Any) promise, scope ref BlockParsingOptions options) {
    return Promise!(Any)(Document_blockParsing(this._parent, promise.handle, options.handle));
  }
  auto blockParsing()(scope ref Promise!(Any) promise) {
    return Promise!(Any)(Object_Call_Handle__Handle(this._parent, "blockParsing", promise.handle));
  }
  auto mozDocumentURIIfNotForErrorPages()() {
    return Object_Getter__OptionalHandle(this._parent, "mozDocumentURIIfNotForErrorPages");
  }
  auto documentReadyForIdle()() {
    return Promise!(Document)(Object_Getter__Handle(this._parent, "documentReadyForIdle"));
  }
  auto commandDispatcher()() {
    return Object_Getter__OptionalHandle(this._parent, "commandDispatcher");
  }
  void popupNode(T0)(scope auto ref Optional!(T0) popupNode) if (isTOrPointer!(T0, Node)) {
    Document_popupNode_Set(this._parent, !popupNode.empty, popupNode.front.handle);
  }
  auto popupNode()() {
    return Object_Getter__OptionalHandle(this._parent, "popupNode");
  }
  auto popupRangeParent()() {
    return Object_Getter__OptionalHandle(this._parent, "popupRangeParent");
  }
  int popupRangeOffset()() {
    return Object_Getter__int(this._parent, "popupRangeOffset");
  }
  void tooltipNode(T0)(scope auto ref Optional!(T0) tooltipNode) if (isTOrPointer!(T0, Node)) {
    Document_tooltipNode_Set(this._parent, !tooltipNode.empty, tooltipNode.front.handle);
  }
  auto tooltipNode()() {
    return Object_Getter__OptionalHandle(this._parent, "tooltipNode");
  }
  bool isSrcdocDocument()() {
    return Object_Getter__bool(this._parent, "isSrcdocDocument");
  }
  Optional!(string) sandboxFlagsAsString()() {
    return Object_Getter__OptionalString(this._parent, "sandboxFlagsAsString");
  }
  auto insertAnonymousContent()(scope ref Element aElement) {
    return AnonymousContent(Object_Call_Handle__Handle(this._parent, "insertAnonymousContent", aElement._parent));
  }
  void removeAnonymousContent()(scope ref AnonymousContent aContent) {
    Object_Call_Handle__void(this._parent, "removeAnonymousContent", aContent.handle);
  }
  auto getSelection()() {
    return Object_Getter__OptionalHandle(this._parent, "getSelection");
  }
  auto hasStorageAccess()() {
    return Promise!(bool)(Object_Getter__Handle(this._parent, "hasStorageAccess"));
  }
  auto requestStorageAccess()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "requestStorageAccess"));
  }
  DocumentAutoplayPolicy autoplayPolicy()() {
    return Document_autoplayPolicy_Get(this._parent);
  }
  bool userHasInteracted()() {
    return Object_Getter__bool(this._parent, "userHasInteracted");
  }
  void notifyUserGestureActivation()() {
    Object_Call__void(this._parent, "notifyUserGestureActivation");
  }
  void clearUserGestureActivation()() {
    Object_Call__void(this._parent, "clearUserGestureActivation");
  }
  void setSuppressedEventListener(T0)(scope auto ref Optional!(T0) aListener) if (isTOrPointer!(T0, EventListener)) {
    Document_setSuppressedEventListener(this._parent, !aListener.empty, aListener.front.handle);
  }
  bool hasScriptsBlockedBySandbox()() {
    return Object_Getter__bool(this._parent, "hasScriptsBlockedBySandbox");
  }
  bool inlineScriptAllowedByCSP()() {
    return Object_Getter__bool(this._parent, "inlineScriptAllowedByCSP");
  }
  FlashClassification documentFlashClassification()() {
    return Document_documentFlashClassification_Get(this._parent);
  }
  auto l10n()() {
    return Object_Getter__OptionalHandle(this._parent, "l10n");
  }
  auto policy()() {
    return Policy(Object_Getter__Handle(this._parent, "policy"));
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
  auto createExpression(T1)(string expression, scope auto ref Optional!(T1) resolver /* = no!(XPathNSResolver) */) if (isTOrPointer!(T1, XPathNSResolver)) {
    return XPathExpression(XPathEvaluator_createExpression(this._parent, expression, !resolver.empty, resolver.front.handle));
  }
  auto createExpression()(string expression) {
    return XPathExpression(Object_Call_string__Handle(this._parent, "createExpression", expression));
  }
  auto createNSResolver()(scope ref Node nodeResolver) {
    return Node(Object_Call_Handle__Handle(this._parent, "createNSResolver", nodeResolver._parent));
  }
  auto evaluate(T2, T4)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */, ushort type /* = 0 */, scope auto ref Optional!(T4) result /* = no!(JsObject) */) if (isTOrPointer!(T2, XPathNSResolver) && isTOrPointer!(T4, JsObject)) {
    return XPathResult(XPathEvaluator_evaluate(this._parent, expression, contextNode._parent, !resolver.empty, resolver.front.handle, type, !result.empty, result.front.handle));
  }
  auto evaluate(T2)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */, ushort type /* = 0 */) if (isTOrPointer!(T2, XPathNSResolver)) {
    return XPathResult(XPathEvaluator_evaluate_0(this._parent, expression, contextNode._parent, !resolver.empty, resolver.front.handle, type));
  }
  auto evaluate(T2)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */) if (isTOrPointer!(T2, XPathNSResolver)) {
    return XPathResult(XPathEvaluator_evaluate_1(this._parent, expression, contextNode._parent, !resolver.empty, resolver.front.handle));
  }
  auto evaluate()(string expression, scope ref Node contextNode) {
    return XPathResult(XPathEvaluator_evaluate_2(this._parent, expression, contextNode._parent));
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onblur(T0)(scope auto ref Optional!(T0) onblur) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onblur", !onblur.empty, onblur.front);
  }
  EventHandler onblur()() {
    return Object_Getter__EventHandler(this._parent, "onblur");
  }
  void onfocus(T0)(scope auto ref Optional!(T0) onfocus) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onfocus", !onfocus.empty, onfocus.front);
  }
  EventHandler onfocus()() {
    return Object_Getter__EventHandler(this._parent, "onfocus");
  }
  void onauxclick(T0)(scope auto ref Optional!(T0) onauxclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onauxclick", !onauxclick.empty, onauxclick.front);
  }
  EventHandler onauxclick()() {
    return Object_Getter__EventHandler(this._parent, "onauxclick");
  }
  void oncanplay(T0)(scope auto ref Optional!(T0) oncanplay) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncanplay", !oncanplay.empty, oncanplay.front);
  }
  EventHandler oncanplay()() {
    return Object_Getter__EventHandler(this._parent, "oncanplay");
  }
  void oncanplaythrough(T0)(scope auto ref Optional!(T0) oncanplaythrough) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncanplaythrough", !oncanplaythrough.empty, oncanplaythrough.front);
  }
  EventHandler oncanplaythrough()() {
    return Object_Getter__EventHandler(this._parent, "oncanplaythrough");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
  void onclick(T0)(scope auto ref Optional!(T0) onclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclick", !onclick.empty, onclick.front);
  }
  EventHandler onclick()() {
    return Object_Getter__EventHandler(this._parent, "onclick");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void oncontextmenu(T0)(scope auto ref Optional!(T0) oncontextmenu) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncontextmenu", !oncontextmenu.empty, oncontextmenu.front);
  }
  EventHandler oncontextmenu()() {
    return Object_Getter__EventHandler(this._parent, "oncontextmenu");
  }
  void ondblclick(T0)(scope auto ref Optional!(T0) ondblclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondblclick", !ondblclick.empty, ondblclick.front);
  }
  EventHandler ondblclick()() {
    return Object_Getter__EventHandler(this._parent, "ondblclick");
  }
  void ondrag(T0)(scope auto ref Optional!(T0) ondrag) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondrag", !ondrag.empty, ondrag.front);
  }
  EventHandler ondrag()() {
    return Object_Getter__EventHandler(this._parent, "ondrag");
  }
  void ondragend(T0)(scope auto ref Optional!(T0) ondragend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragend", !ondragend.empty, ondragend.front);
  }
  EventHandler ondragend()() {
    return Object_Getter__EventHandler(this._parent, "ondragend");
  }
  void ondragenter(T0)(scope auto ref Optional!(T0) ondragenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragenter", !ondragenter.empty, ondragenter.front);
  }
  EventHandler ondragenter()() {
    return Object_Getter__EventHandler(this._parent, "ondragenter");
  }
  void ondragexit(T0)(scope auto ref Optional!(T0) ondragexit) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragexit", !ondragexit.empty, ondragexit.front);
  }
  EventHandler ondragexit()() {
    return Object_Getter__EventHandler(this._parent, "ondragexit");
  }
  void ondragleave(T0)(scope auto ref Optional!(T0) ondragleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragleave", !ondragleave.empty, ondragleave.front);
  }
  EventHandler ondragleave()() {
    return Object_Getter__EventHandler(this._parent, "ondragleave");
  }
  void ondragover(T0)(scope auto ref Optional!(T0) ondragover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragover", !ondragover.empty, ondragover.front);
  }
  EventHandler ondragover()() {
    return Object_Getter__EventHandler(this._parent, "ondragover");
  }
  void ondragstart(T0)(scope auto ref Optional!(T0) ondragstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragstart", !ondragstart.empty, ondragstart.front);
  }
  EventHandler ondragstart()() {
    return Object_Getter__EventHandler(this._parent, "ondragstart");
  }
  void ondrop(T0)(scope auto ref Optional!(T0) ondrop) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondrop", !ondrop.empty, ondrop.front);
  }
  EventHandler ondrop()() {
    return Object_Getter__EventHandler(this._parent, "ondrop");
  }
  void ondurationchange(T0)(scope auto ref Optional!(T0) ondurationchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondurationchange", !ondurationchange.empty, ondurationchange.front);
  }
  EventHandler ondurationchange()() {
    return Object_Getter__EventHandler(this._parent, "ondurationchange");
  }
  void onemptied(T0)(scope auto ref Optional!(T0) onemptied) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onemptied", !onemptied.empty, onemptied.front);
  }
  EventHandler onemptied()() {
    return Object_Getter__EventHandler(this._parent, "onemptied");
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onended", !onended.empty, onended.front);
  }
  EventHandler onended()() {
    return Object_Getter__EventHandler(this._parent, "onended");
  }
  void oninput(T0)(scope auto ref Optional!(T0) oninput) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oninput", !oninput.empty, oninput.front);
  }
  EventHandler oninput()() {
    return Object_Getter__EventHandler(this._parent, "oninput");
  }
  void oninvalid(T0)(scope auto ref Optional!(T0) oninvalid) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oninvalid", !oninvalid.empty, oninvalid.front);
  }
  EventHandler oninvalid()() {
    return Object_Getter__EventHandler(this._parent, "oninvalid");
  }
  void onkeydown(T0)(scope auto ref Optional!(T0) onkeydown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeydown", !onkeydown.empty, onkeydown.front);
  }
  EventHandler onkeydown()() {
    return Object_Getter__EventHandler(this._parent, "onkeydown");
  }
  void onkeypress(T0)(scope auto ref Optional!(T0) onkeypress) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeypress", !onkeypress.empty, onkeypress.front);
  }
  EventHandler onkeypress()() {
    return Object_Getter__EventHandler(this._parent, "onkeypress");
  }
  void onkeyup(T0)(scope auto ref Optional!(T0) onkeyup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeyup", !onkeyup.empty, onkeyup.front);
  }
  EventHandler onkeyup()() {
    return Object_Getter__EventHandler(this._parent, "onkeyup");
  }
  void onload(T0)(scope auto ref Optional!(T0) onload) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onload", !onload.empty, onload.front);
  }
  EventHandler onload()() {
    return Object_Getter__EventHandler(this._parent, "onload");
  }
  void onloadeddata(T0)(scope auto ref Optional!(T0) onloadeddata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadeddata", !onloadeddata.empty, onloadeddata.front);
  }
  EventHandler onloadeddata()() {
    return Object_Getter__EventHandler(this._parent, "onloadeddata");
  }
  void onloadedmetadata(T0)(scope auto ref Optional!(T0) onloadedmetadata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadedmetadata", !onloadedmetadata.empty, onloadedmetadata.front);
  }
  EventHandler onloadedmetadata()() {
    return Object_Getter__EventHandler(this._parent, "onloadedmetadata");
  }
  void onloadend(T0)(scope auto ref Optional!(T0) onloadend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadend", !onloadend.empty, onloadend.front);
  }
  EventHandler onloadend()() {
    return Object_Getter__EventHandler(this._parent, "onloadend");
  }
  void onloadstart(T0)(scope auto ref Optional!(T0) onloadstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadstart", !onloadstart.empty, onloadstart.front);
  }
  EventHandler onloadstart()() {
    return Object_Getter__EventHandler(this._parent, "onloadstart");
  }
  void onmousedown(T0)(scope auto ref Optional!(T0) onmousedown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmousedown", !onmousedown.empty, onmousedown.front);
  }
  EventHandler onmousedown()() {
    return Object_Getter__EventHandler(this._parent, "onmousedown");
  }
  void onmouseenter(T0)(scope auto ref Optional!(T0) onmouseenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseenter", !onmouseenter.empty, onmouseenter.front);
  }
  EventHandler onmouseenter()() {
    return Object_Getter__EventHandler(this._parent, "onmouseenter");
  }
  void onmouseleave(T0)(scope auto ref Optional!(T0) onmouseleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseleave", !onmouseleave.empty, onmouseleave.front);
  }
  EventHandler onmouseleave()() {
    return Object_Getter__EventHandler(this._parent, "onmouseleave");
  }
  void onmousemove(T0)(scope auto ref Optional!(T0) onmousemove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmousemove", !onmousemove.empty, onmousemove.front);
  }
  EventHandler onmousemove()() {
    return Object_Getter__EventHandler(this._parent, "onmousemove");
  }
  void onmouseout(T0)(scope auto ref Optional!(T0) onmouseout) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseout", !onmouseout.empty, onmouseout.front);
  }
  EventHandler onmouseout()() {
    return Object_Getter__EventHandler(this._parent, "onmouseout");
  }
  void onmouseover(T0)(scope auto ref Optional!(T0) onmouseover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseover", !onmouseover.empty, onmouseover.front);
  }
  EventHandler onmouseover()() {
    return Object_Getter__EventHandler(this._parent, "onmouseover");
  }
  void onmouseup(T0)(scope auto ref Optional!(T0) onmouseup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseup", !onmouseup.empty, onmouseup.front);
  }
  EventHandler onmouseup()() {
    return Object_Getter__EventHandler(this._parent, "onmouseup");
  }
  void onwheel(T0)(scope auto ref Optional!(T0) onwheel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwheel", !onwheel.empty, onwheel.front);
  }
  EventHandler onwheel()() {
    return Object_Getter__EventHandler(this._parent, "onwheel");
  }
  void onpause(T0)(scope auto ref Optional!(T0) onpause) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpause", !onpause.empty, onpause.front);
  }
  EventHandler onpause()() {
    return Object_Getter__EventHandler(this._parent, "onpause");
  }
  void onplay(T0)(scope auto ref Optional!(T0) onplay) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onplay", !onplay.empty, onplay.front);
  }
  EventHandler onplay()() {
    return Object_Getter__EventHandler(this._parent, "onplay");
  }
  void onplaying(T0)(scope auto ref Optional!(T0) onplaying) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onplaying", !onplaying.empty, onplaying.front);
  }
  EventHandler onplaying()() {
    return Object_Getter__EventHandler(this._parent, "onplaying");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
  void onratechange(T0)(scope auto ref Optional!(T0) onratechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onratechange", !onratechange.empty, onratechange.front);
  }
  EventHandler onratechange()() {
    return Object_Getter__EventHandler(this._parent, "onratechange");
  }
  void onreset(T0)(scope auto ref Optional!(T0) onreset) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onreset", !onreset.empty, onreset.front);
  }
  EventHandler onreset()() {
    return Object_Getter__EventHandler(this._parent, "onreset");
  }
  void onresize(T0)(scope auto ref Optional!(T0) onresize) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onresize", !onresize.empty, onresize.front);
  }
  EventHandler onresize()() {
    return Object_Getter__EventHandler(this._parent, "onresize");
  }
  void onscroll(T0)(scope auto ref Optional!(T0) onscroll) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onscroll", !onscroll.empty, onscroll.front);
  }
  EventHandler onscroll()() {
    return Object_Getter__EventHandler(this._parent, "onscroll");
  }
  void onseeked(T0)(scope auto ref Optional!(T0) onseeked) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onseeked", !onseeked.empty, onseeked.front);
  }
  EventHandler onseeked()() {
    return Object_Getter__EventHandler(this._parent, "onseeked");
  }
  void onseeking(T0)(scope auto ref Optional!(T0) onseeking) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onseeking", !onseeking.empty, onseeking.front);
  }
  EventHandler onseeking()() {
    return Object_Getter__EventHandler(this._parent, "onseeking");
  }
  void onselect(T0)(scope auto ref Optional!(T0) onselect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onselect", !onselect.empty, onselect.front);
  }
  EventHandler onselect()() {
    return Object_Getter__EventHandler(this._parent, "onselect");
  }
  void onshow(T0)(scope auto ref Optional!(T0) onshow) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onshow", !onshow.empty, onshow.front);
  }
  EventHandler onshow()() {
    return Object_Getter__EventHandler(this._parent, "onshow");
  }
  void onstalled(T0)(scope auto ref Optional!(T0) onstalled) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstalled", !onstalled.empty, onstalled.front);
  }
  EventHandler onstalled()() {
    return Object_Getter__EventHandler(this._parent, "onstalled");
  }
  void onsubmit(T0)(scope auto ref Optional!(T0) onsubmit) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsubmit", !onsubmit.empty, onsubmit.front);
  }
  EventHandler onsubmit()() {
    return Object_Getter__EventHandler(this._parent, "onsubmit");
  }
  void onsuspend(T0)(scope auto ref Optional!(T0) onsuspend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsuspend", !onsuspend.empty, onsuspend.front);
  }
  EventHandler onsuspend()() {
    return Object_Getter__EventHandler(this._parent, "onsuspend");
  }
  void ontimeupdate(T0)(scope auto ref Optional!(T0) ontimeupdate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontimeupdate", !ontimeupdate.empty, ontimeupdate.front);
  }
  EventHandler ontimeupdate()() {
    return Object_Getter__EventHandler(this._parent, "ontimeupdate");
  }
  void onvolumechange(T0)(scope auto ref Optional!(T0) onvolumechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvolumechange", !onvolumechange.empty, onvolumechange.front);
  }
  EventHandler onvolumechange()() {
    return Object_Getter__EventHandler(this._parent, "onvolumechange");
  }
  void onwaiting(T0)(scope auto ref Optional!(T0) onwaiting) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwaiting", !onwaiting.empty, onwaiting.front);
  }
  EventHandler onwaiting()() {
    return Object_Getter__EventHandler(this._parent, "onwaiting");
  }
  void onselectstart(T0)(scope auto ref Optional!(T0) onselectstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onselectstart", !onselectstart.empty, onselectstart.front);
  }
  EventHandler onselectstart()() {
    return Object_Getter__EventHandler(this._parent, "onselectstart");
  }
  void ontoggle(T0)(scope auto ref Optional!(T0) ontoggle) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontoggle", !ontoggle.empty, ontoggle.front);
  }
  EventHandler ontoggle()() {
    return Object_Getter__EventHandler(this._parent, "ontoggle");
  }
  void onpointercancel(T0)(scope auto ref Optional!(T0) onpointercancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointercancel", !onpointercancel.empty, onpointercancel.front);
  }
  EventHandler onpointercancel()() {
    return Object_Getter__EventHandler(this._parent, "onpointercancel");
  }
  void onpointerdown(T0)(scope auto ref Optional!(T0) onpointerdown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerdown", !onpointerdown.empty, onpointerdown.front);
  }
  EventHandler onpointerdown()() {
    return Object_Getter__EventHandler(this._parent, "onpointerdown");
  }
  void onpointerup(T0)(scope auto ref Optional!(T0) onpointerup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerup", !onpointerup.empty, onpointerup.front);
  }
  EventHandler onpointerup()() {
    return Object_Getter__EventHandler(this._parent, "onpointerup");
  }
  void onpointermove(T0)(scope auto ref Optional!(T0) onpointermove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointermove", !onpointermove.empty, onpointermove.front);
  }
  EventHandler onpointermove()() {
    return Object_Getter__EventHandler(this._parent, "onpointermove");
  }
  void onpointerout(T0)(scope auto ref Optional!(T0) onpointerout) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerout", !onpointerout.empty, onpointerout.front);
  }
  EventHandler onpointerout()() {
    return Object_Getter__EventHandler(this._parent, "onpointerout");
  }
  void onpointerover(T0)(scope auto ref Optional!(T0) onpointerover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerover", !onpointerover.empty, onpointerover.front);
  }
  EventHandler onpointerover()() {
    return Object_Getter__EventHandler(this._parent, "onpointerover");
  }
  void onpointerenter(T0)(scope auto ref Optional!(T0) onpointerenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerenter", !onpointerenter.empty, onpointerenter.front);
  }
  EventHandler onpointerenter()() {
    return Object_Getter__EventHandler(this._parent, "onpointerenter");
  }
  void onpointerleave(T0)(scope auto ref Optional!(T0) onpointerleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerleave", !onpointerleave.empty, onpointerleave.front);
  }
  EventHandler onpointerleave()() {
    return Object_Getter__EventHandler(this._parent, "onpointerleave");
  }
  void ongotpointercapture(T0)(scope auto ref Optional!(T0) ongotpointercapture) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ongotpointercapture", !ongotpointercapture.empty, ongotpointercapture.front);
  }
  EventHandler ongotpointercapture()() {
    return Object_Getter__EventHandler(this._parent, "ongotpointercapture");
  }
  void onlostpointercapture(T0)(scope auto ref Optional!(T0) onlostpointercapture) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onlostpointercapture", !onlostpointercapture.empty, onlostpointercapture.front);
  }
  EventHandler onlostpointercapture()() {
    return Object_Getter__EventHandler(this._parent, "onlostpointercapture");
  }
  void onmozfullscreenchange(T0)(scope auto ref Optional!(T0) onmozfullscreenchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmozfullscreenchange", !onmozfullscreenchange.empty, onmozfullscreenchange.front);
  }
  EventHandler onmozfullscreenchange()() {
    return Object_Getter__EventHandler(this._parent, "onmozfullscreenchange");
  }
  void onmozfullscreenerror(T0)(scope auto ref Optional!(T0) onmozfullscreenerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmozfullscreenerror", !onmozfullscreenerror.empty, onmozfullscreenerror.front);
  }
  EventHandler onmozfullscreenerror()() {
    return Object_Getter__EventHandler(this._parent, "onmozfullscreenerror");
  }
  void onanimationcancel(T0)(scope auto ref Optional!(T0) onanimationcancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationcancel", !onanimationcancel.empty, onanimationcancel.front);
  }
  EventHandler onanimationcancel()() {
    return Object_Getter__EventHandler(this._parent, "onanimationcancel");
  }
  void onanimationend(T0)(scope auto ref Optional!(T0) onanimationend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationend", !onanimationend.empty, onanimationend.front);
  }
  EventHandler onanimationend()() {
    return Object_Getter__EventHandler(this._parent, "onanimationend");
  }
  void onanimationiteration(T0)(scope auto ref Optional!(T0) onanimationiteration) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationiteration", !onanimationiteration.empty, onanimationiteration.front);
  }
  EventHandler onanimationiteration()() {
    return Object_Getter__EventHandler(this._parent, "onanimationiteration");
  }
  void onanimationstart(T0)(scope auto ref Optional!(T0) onanimationstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationstart", !onanimationstart.empty, onanimationstart.front);
  }
  EventHandler onanimationstart()() {
    return Object_Getter__EventHandler(this._parent, "onanimationstart");
  }
  void ontransitioncancel(T0)(scope auto ref Optional!(T0) ontransitioncancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitioncancel", !ontransitioncancel.empty, ontransitioncancel.front);
  }
  EventHandler ontransitioncancel()() {
    return Object_Getter__EventHandler(this._parent, "ontransitioncancel");
  }
  void ontransitionend(T0)(scope auto ref Optional!(T0) ontransitionend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionend", !ontransitionend.empty, ontransitionend.front);
  }
  EventHandler ontransitionend()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionend");
  }
  void ontransitionrun(T0)(scope auto ref Optional!(T0) ontransitionrun) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionrun", !ontransitionrun.empty, ontransitionrun.front);
  }
  EventHandler ontransitionrun()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionrun");
  }
  void ontransitionstart(T0)(scope auto ref Optional!(T0) ontransitionstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionstart", !ontransitionstart.empty, ontransitionstart.front);
  }
  EventHandler ontransitionstart()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionstart");
  }
  void onwebkitanimationend(T0)(scope auto ref Optional!(T0) onwebkitanimationend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationend", !onwebkitanimationend.empty, onwebkitanimationend.front);
  }
  EventHandler onwebkitanimationend()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationend");
  }
  void onwebkitanimationiteration(T0)(scope auto ref Optional!(T0) onwebkitanimationiteration) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationiteration", !onwebkitanimationiteration.empty, onwebkitanimationiteration.front);
  }
  EventHandler onwebkitanimationiteration()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationiteration");
  }
  void onwebkitanimationstart(T0)(scope auto ref Optional!(T0) onwebkitanimationstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationstart", !onwebkitanimationstart.empty, onwebkitanimationstart.front);
  }
  EventHandler onwebkitanimationstart()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationstart");
  }
  void onwebkittransitionend(T0)(scope auto ref Optional!(T0) onwebkittransitionend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkittransitionend", !onwebkittransitionend.empty, onwebkittransitionend.front);
  }
  EventHandler onwebkittransitionend()() {
    return Object_Getter__EventHandler(this._parent, "onwebkittransitionend");
  }
  void oncopy(T0)(scope auto ref Optional!(T0) oncopy) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncopy", !oncopy.empty, oncopy.front);
  }
  EventHandler oncopy()() {
    return Object_Getter__EventHandler(this._parent, "oncopy");
  }
  void oncut(T0)(scope auto ref Optional!(T0) oncut) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncut", !oncut.empty, oncut.front);
  }
  EventHandler oncut()() {
    return Object_Getter__EventHandler(this._parent, "oncut");
  }
  void onpaste(T0)(scope auto ref Optional!(T0) onpaste) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpaste", !onpaste.empty, onpaste.front);
  }
  EventHandler onpaste()() {
    return Object_Getter__EventHandler(this._parent, "onpaste");
  }
  void ontouchstart(T0)(scope auto ref Optional!(T0) ontouchstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchstart", !ontouchstart.empty, ontouchstart.front);
  }
  EventHandler ontouchstart()() {
    return Object_Getter__EventHandler(this._parent, "ontouchstart");
  }
  void ontouchend(T0)(scope auto ref Optional!(T0) ontouchend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchend", !ontouchend.empty, ontouchend.front);
  }
  EventHandler ontouchend()() {
    return Object_Getter__EventHandler(this._parent, "ontouchend");
  }
  void ontouchmove(T0)(scope auto ref Optional!(T0) ontouchmove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchmove", !ontouchmove.empty, ontouchmove.front);
  }
  EventHandler ontouchmove()() {
    return Object_Getter__EventHandler(this._parent, "ontouchmove");
  }
  void ontouchcancel(T0)(scope auto ref Optional!(T0) ontouchcancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchcancel", !ontouchcancel.empty, ontouchcancel.front);
  }
  EventHandler ontouchcancel()() {
    return Object_Getter__EventHandler(this._parent, "ontouchcancel");
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
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
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
  auto fonts()() {
    return FontFaceSet(Object_Getter__Handle(this._parent, "fonts"));
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
enum DocumentAutoplayPolicy {
  allowed,
  allowed_muted,
  disallowed
}
struct ElementCreationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ElementCreationOptions(spasm_add__object());
  }
  void is_()(string is_) {
    Object_Call_string__void(this.handle, "is", is_);
  }
  string is_()() {
    return Object_Getter__string(this.handle, "is");
  }
  void pseudo()(string pseudo) {
    Object_Call_string__void(this.handle, "pseudo", pseudo);
  }
  string pseudo()() {
    return Object_Getter__string(this.handle, "pseudo");
  }
}
enum FlashClassification {
  unknown,
  allowed,
  denied
}
enum VisibilityState {
  hidden,
  visible
}


extern (C) Handle Document_getElementsByTagNameNS(Handle, bool, string, string);
extern (C) Handle Document_createElement(Handle, string, scope ref SumType!(ElementCreationOptions, string));
extern (C) Handle Document_createElementNS(Handle, bool, string, string, scope ref SumType!(ElementCreationOptions, string));
extern (C) Handle Document_createElementNS_0(Handle, bool, string, string);
extern (C) Handle Document_importNode(Handle, Handle, bool);
extern (C) Handle Document_createNodeIterator(Handle, Handle, uint, bool, Handle);
extern (C) Handle Document_createNodeIterator_0(Handle, Handle, uint);
extern (C) Handle Document_createTreeWalker(Handle, Handle, uint, bool, Handle);
extern (C) Handle Document_createTreeWalker_0(Handle, Handle, uint);
extern (C) Handle Document_createAttributeNS(Handle, bool, string, string);
extern (C) void Document_body_Set(Handle, bool, Handle);
extern (C) Optional!(BoxObject) Document_getBoxObjectFor(Handle, bool, Handle);
extern (C) void Document_mozSetImageElement(Handle, string, bool, Handle);
extern (C) VisibilityState Document_visibilityState_Get(Handle);
extern (C) void Document_selectedStyleSheetSet_Set(Handle, bool, string);
extern (C) void Document_enableStyleSheetsForSet(Handle, bool, string);
extern (C) Optional!(CaretPosition) Document_caretPositionFromPoint(Handle, float, float);
extern (C) Optional!(NodeList) Document_getAnonymousNodes(Handle, Handle);
extern (C) Optional!(Element) Document_getAnonymousElementByAttribute(Handle, Handle, string, string);
extern (C) Optional!(Element) Document_getBindingParent(Handle, Handle);
extern (C) Handle Document_createXULElement(Handle, string, scope ref SumType!(ElementCreationOptions, string));
extern (C) Handle Document_createTouch(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int, int, int, int, float, float);
extern (C) Handle Document_createTouch_0(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int, int, int, int, float);
extern (C) Handle Document_createTouch_1(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int, int, int, int);
extern (C) Handle Document_createTouch_2(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int, int, int);
extern (C) Handle Document_createTouch_3(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int, int);
extern (C) Handle Document_createTouch_4(Handle, bool, Handle, bool, Handle, int, int, int, int, int, int);
extern (C) Handle Document_createTouch_5(Handle, bool, Handle, bool, Handle, int, int, int, int, int);
extern (C) Handle Document_createTouch_6(Handle, bool, Handle, bool, Handle, int, int, int, int);
extern (C) Handle Document_createTouch_7(Handle, bool, Handle, bool, Handle, int, int, int);
extern (C) Handle Document_createTouch_8(Handle, bool, Handle, bool, Handle, int, int);
extern (C) Handle Document_createTouch_9(Handle, bool, Handle, bool, Handle, int);
extern (C) Handle Document_createTouch_10(Handle, bool, Handle, bool, Handle);
extern (C) Handle Document_createTouch_11(Handle, bool, Handle);
extern (C) Handle Document_createTouchList__Handle_Handle(Handle, Handle, Handle);
extern (C) Handle Document_blockParsing(Handle, Handle, Handle);
extern (C) void Document_popupNode_Set(Handle, bool, Handle);
extern (C) void Document_tooltipNode_Set(Handle, bool, Handle);
extern (C) DocumentAutoplayPolicy Document_autoplayPolicy_Get(Handle);
extern (C) void Document_setSuppressedEventListener(Handle, bool, Handle);
extern (C) FlashClassification Document_documentFlashClassification_Get(Handle);