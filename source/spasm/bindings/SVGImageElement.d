module spasm.bindings.SVGImageElement;

import spasm.types;
import spasm.bindings.HTMLImageElement;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGGraphicsElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGImageElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
  auto x()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y"));
  }
  auto width()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "width"));
  }
  auto height()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "height"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
  void decoding()(string decoding) {
    Object_Call_string__void(this._parent, "decoding", decoding);
  }
  string decoding()() {
    return Object_Getter__string(this._parent, "decoding");
  }
  enum int UNKNOWN_REQUEST = -1;
  enum int CURRENT_REQUEST = 0;
  enum int PENDING_REQUEST = 1;
  void loadingEnabled()(bool loadingEnabled) {
    Object_Call_bool__void(this._parent, "loadingEnabled", loadingEnabled);
  }
  bool loadingEnabled()() {
    return Object_Getter__bool(this._parent, "loadingEnabled");
  }
  short imageBlockingStatus()() {
    return MozImageLoadingContent_imageBlockingStatus_Get(this._parent);
  }
  void addObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "addObserver", aObserver.handle);
  }
  void removeObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "removeObserver", aObserver.handle);
  }
  auto getRequest()(int aRequestType) {
    return Object_Call_int__OptionalHandle(this._parent, "getRequest", aRequestType);
  }
  int getRequestType()(scope ref imgIRequest aRequest) {
    return MozImageLoadingContent_getRequestType(this._parent, aRequest.handle);
  }
  auto currentURI()() {
    return Object_Getter__OptionalHandle(this._parent, "currentURI");
  }
  auto currentRequestFinalURI()() {
    return Object_Getter__OptionalHandle(this._parent, "currentRequestFinalURI");
  }
  void forceReload()(bool aNotify /* = true */) {
    Object_Call_bool__void(this._parent, "forceReload", aNotify);
  }
  void forceReload()() {
    Object_Call__void(this._parent, "forceReload");
  }
  void forceImageState()(bool aForce, uint aState) {
    MozImageLoadingContent_forceImageState(this._parent, aForce, aState);
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


