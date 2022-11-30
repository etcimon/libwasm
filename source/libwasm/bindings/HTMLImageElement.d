module libwasm.bindings.HTMLImageElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLImageElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void alt()(string alt) {
    Object_Call_string__void(this._parent, "alt", alt);
  }
  string alt()() {
    return Object_Getter__string(this._parent, "alt");
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  void srcset()(string srcset) {
    Object_Call_string__void(this._parent, "srcset", srcset);
  }
  string srcset()() {
    return Object_Getter__string(this._parent, "srcset");
  }
  void crossOrigin(T0)(scope auto ref Optional!(T0) crossOrigin) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "crossOrigin", "Optional!(string)", tuple(!crossOrigin.empty, crossOrigin.front));
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  void useMap()(string useMap) {
    Object_Call_string__void(this._parent, "useMap", useMap);
  }
  string useMap()() {
    return Object_Getter__string(this._parent, "useMap");
  }
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  void isMap()(bool isMap) {
    Object_Call_bool__void(this._parent, "isMap", isMap);
  }
  bool isMap()() {
    return Object_Getter__bool(this._parent, "isMap");
  }
  void width()(uint width) {
    Object_Call_uint__void(this._parent, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this._parent, "width");
  }
  void height()(uint height) {
    Object_Call_uint__void(this._parent, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this._parent, "height");
  }
  void decoding()(string decoding) {
    Object_Call_string__void(this._parent, "decoding", decoding);
  }
  string decoding()() {
    return Object_Getter__string(this._parent, "decoding");
  }
  uint naturalWidth()() {
    return Object_Getter__uint(this._parent, "naturalWidth");
  }
  uint naturalHeight()() {
    return Object_Getter__uint(this._parent, "naturalHeight");
  }
  bool complete()() {
    return Object_Getter__bool(this._parent, "complete");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void hspace()(uint hspace) {
    Object_Call_uint__void(this._parent, "hspace", hspace);
  }
  uint hspace()() {
    return Object_Getter__uint(this._parent, "hspace");
  }
  void vspace()(uint vspace) {
    Object_Call_uint__void(this._parent, "vspace", vspace);
  }
  uint vspace()() {
    return Object_Getter__uint(this._parent, "vspace");
  }
  void longDesc()(string longDesc) {
    Object_Call_string__void(this._parent, "longDesc", longDesc);
  }
  string longDesc()() {
    return Object_Getter__string(this._parent, "longDesc");
  }
  void border()(string border) {
    Object_Call_string__void(this._parent, "border", border);
  }
  string border()() {
    return Object_Getter__string(this._parent, "border");
  }
  void sizes()(string sizes) {
    Object_Call_string__void(this._parent, "sizes", sizes);
  }
  string sizes()() {
    return Object_Getter__string(this._parent, "sizes");
  }
  string currentSrc()() {
    return Object_Getter__string(this._parent, "currentSrc");
  }
  void lowsrc()(string lowsrc) {
    Object_Call_string__void(this._parent, "lowsrc", lowsrc);
  }
  string lowsrc()() {
    return Object_Getter__string(this._parent, "lowsrc");
  }
  int x()() {
    return Object_Getter__int(this._parent, "x");
  }
  int y()() {
    return Object_Getter__int(this._parent, "y");
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
    return Optional!(imgIRequest)(Object_Call_int__OptionalHandle(this._parent, "getRequest", aRequestType));
  }
  int getRequestType()(scope ref imgIRequest aRequest) {
    return Serialize_Object_VarArgCall!int(this._parent, "getRequestType", "Handle", tuple(cast(Handle)aRequest.handle));
  }
  auto currentURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this._parent, "currentURI"));
  }
  auto currentRequestFinalURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this._parent, "currentRequestFinalURI"));
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
}
struct MozImageLoadingContent {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum int UNKNOWN_REQUEST = -1;
  enum int CURRENT_REQUEST = 0;
  enum int PENDING_REQUEST = 1;
  void loadingEnabled()(bool loadingEnabled) {
    Object_Call_bool__void(this.handle, "loadingEnabled", loadingEnabled);
  }
  bool loadingEnabled()() {
    return Object_Getter__bool(this.handle, "loadingEnabled");
  }
  short imageBlockingStatus()() {
    return Serialize_Object_VarArgCall!short(this.handle, "imageBlockingStatus", "", tuple());
  }
  void addObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this.handle, "addObserver", aObserver.handle);
  }
  void removeObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this.handle, "removeObserver", aObserver.handle);
  }
  auto getRequest()(int aRequestType) {
    return Optional!(imgIRequest)(Object_Call_int__OptionalHandle(this.handle, "getRequest", aRequestType));
  }
  int getRequestType()(scope ref imgIRequest aRequest) {
    return Serialize_Object_VarArgCall!int(this.handle, "getRequestType", "Handle", tuple(cast(Handle)aRequest.handle));
  }
  auto currentURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this.handle, "currentURI"));
  }
  auto currentRequestFinalURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this.handle, "currentRequestFinalURI"));
  }
  void forceReload()(bool aNotify /* = true */) {
    Object_Call_bool__void(this.handle, "forceReload", aNotify);
  }
  void forceReload()() {
    Object_Call__void(this.handle, "forceReload");
  }
  void forceImageState()(bool aForce, uint aState) {
    Serialize_Object_VarArgCall!void(this.handle, "forceImageState", "bool;uint", tuple(aForce, aState));
  }
}


