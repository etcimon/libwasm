module libwasm.bindings.SVGImageElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLImageElement;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGGraphicsElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGImageElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
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
    return Serialize_Object_VarArgCall!short(this._parent, "imageBlockingStatus", "", tuple());
  }
  void addObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "addObserver", aObserver.handle);
  }
  void removeObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "removeObserver", aObserver.handle);
  }
  auto getRequest()(int aRequestType) {
    return recastOpt!(imgIRequest)(Object_Call_int__OptionalHandle(this._parent, "getRequest", aRequestType));
  }
  int getRequestType()(scope ref imgIRequest aRequest) {
    return Serialize_Object_VarArgCall!int(this._parent, "getRequestType", "Handle", tuple(cast(Handle)aRequest.handle));
  }
  auto currentURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "currentURI"));
  }
  auto currentRequestFinalURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "currentRequestFinalURI"));
  }
  void forceReload()(bool aNotify /* = true */) {
    Object_Call_bool__void(this._parent, "forceReload", aNotify);
  }
  void forceReload()() {
    Object_Call__void(this._parent, "forceReload");
  }
  void forceImageState()(bool aForce, uint aState) {
    Serialize_Object_VarArgCall!void(this._parent, "forceImageState", "bool;uint", tuple(aForce, aState));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


