module spasm.bindings.HTMLFrameElement;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.FrameLoader;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLIFrameElement;
import spasm.bindings.MozFrameLoaderOwner;

@safe:
nothrow:

struct HTMLFrameElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void scrolling()(string scrolling) {
    Object_Call_string__void(this._parent, "scrolling", scrolling);
  }
  string scrolling()() {
    return Object_Getter__string(this._parent, "scrolling");
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
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
  void noResize()(bool noResize) {
    Object_Call_bool__void(this._parent, "noResize", noResize);
  }
  bool noResize()() {
    return Object_Getter__bool(this._parent, "noResize");
  }
  auto contentDocument()() {
    return Object_Getter__OptionalHandle(this._parent, "contentDocument");
  }
  auto contentWindow()() {
    return Object_Getter__OptionalHandle(this._parent, "contentWindow");
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


