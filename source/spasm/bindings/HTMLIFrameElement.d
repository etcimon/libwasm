module spasm.bindings.HTMLIFrameElement;

import spasm.types;
import spasm.bindings.BrowserElement;
import spasm.bindings.DOMTokenList;
import spasm.bindings.Document;
import spasm.bindings.FeaturePolicy;
import spasm.bindings.FrameLoader;
import spasm.bindings.HTMLElement;
import spasm.bindings.MozFrameLoaderOwner;

@safe:
nothrow:

struct HTMLIFrameElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  void srcdoc()(string srcdoc) {
    Object_Call_string__void(this._parent, "srcdoc", srcdoc);
  }
  string srcdoc()() {
    return Object_Getter__string(this._parent, "srcdoc");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  auto sandbox()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "sandbox"));
  }
  void allowFullscreen()(bool allowFullscreen) {
    Object_Call_bool__void(this._parent, "allowFullscreen", allowFullscreen);
  }
  bool allowFullscreen()() {
    return Object_Getter__bool(this._parent, "allowFullscreen");
  }
  void allowPaymentRequest()(bool allowPaymentRequest) {
    Object_Call_bool__void(this._parent, "allowPaymentRequest", allowPaymentRequest);
  }
  bool allowPaymentRequest()() {
    return Object_Getter__bool(this._parent, "allowPaymentRequest");
  }
  void width()(string width) {
    Object_Call_string__void(this._parent, "width", width);
  }
  string width()() {
    return Object_Getter__string(this._parent, "width");
  }
  void height()(string height) {
    Object_Call_string__void(this._parent, "height", height);
  }
  string height()() {
    return Object_Getter__string(this._parent, "height");
  }
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  auto contentDocument()() {
    return Object_Getter__OptionalHandle(this._parent, "contentDocument");
  }
  auto contentWindow()() {
    return Object_Getter__OptionalHandle(this._parent, "contentWindow");
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void scrolling()(string scrolling) {
    Object_Call_string__void(this._parent, "scrolling", scrolling);
  }
  string scrolling()() {
    return Object_Getter__string(this._parent, "scrolling");
  }
  void frameBorder()(string frameBorder) {
    Object_Call_string__void(this._parent, "frameBorder", frameBorder);
  }
  string frameBorder()() {
    return Object_Getter__string(this._parent, "frameBorder");
  }
  void longDesc()(string longDesc) {
    Object_Call_string__void(this._parent, "longDesc", longDesc);
  }
  string longDesc()() {
    return Object_Getter__string(this._parent, "longDesc");
  }
  void marginHeight()(string marginHeight) {
    Object_Call_string__void(this._parent, "marginHeight", marginHeight);
  }
  string marginHeight()() {
    return Object_Getter__string(this._parent, "marginHeight");
  }
  void marginWidth()(string marginWidth) {
    Object_Call_string__void(this._parent, "marginWidth", marginWidth);
  }
  string marginWidth()() {
    return Object_Getter__string(this._parent, "marginWidth");
  }
  auto getSVGDocument()() {
    return Object_Getter__OptionalHandle(this._parent, "getSVGDocument");
  }
  void mozbrowser()(bool mozbrowser) {
    Object_Call_bool__void(this._parent, "mozbrowser", mozbrowser);
  }
  bool mozbrowser()() {
    return Object_Getter__bool(this._parent, "mozbrowser");
  }
  auto policy()() {
    return Policy(Object_Getter__Handle(this._parent, "policy"));
  }
  void allow()(string allow) {
    Object_Call_string__void(this._parent, "allow", allow);
  }
  string allow()() {
    return Object_Getter__string(this._parent, "allow");
  }
  auto frameLoader()() {
    return Object_Getter__OptionalHandle(this._parent, "frameLoader");
  }
  void presetOpenerWindow(T0)(scope auto ref Optional!(T0) window) if (isTOrPointer!(T0, WindowProxy)) {
    MozFrameLoaderOwner_presetOpenerWindow(this._parent, !window.empty, window.front.handle);
  }
  void swapFrameLoaders()(scope ref XULFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this._parent, "swapFrameLoaders", aOtherLoaderOwner.handle);
  }
  void swapFrameLoaders()(scope ref HTMLIFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this._parent, "swapFrameLoaders", aOtherLoaderOwner._parent);
  }
}


