module libwasm.bindings.HTMLObjectElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Document;
import libwasm.bindings.FrameLoader;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.HTMLIFrameElement;
import libwasm.bindings.HTMLImageElement;
import libwasm.bindings.MozFrameLoaderOwner;
import libwasm.bindings.ValidityState;

@safe:
nothrow:

struct HTMLObjectElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void data()(string data) {
    Object_Call_string__void(this._parent, "data", data);
  }
  string data()() {
    return Object_Getter__string(this._parent, "data");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void typeMustMatch()(bool typeMustMatch) {
    Object_Call_bool__void(this._parent, "typeMustMatch", typeMustMatch);
  }
  bool typeMustMatch()() {
    return Object_Getter__bool(this._parent, "typeMustMatch");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void useMap()(string useMap) {
    Object_Call_string__void(this._parent, "useMap", useMap);
  }
  string useMap()() {
    return Object_Getter__string(this._parent, "useMap");
  }
  auto form()() {
    return recastOpt!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
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
  auto contentDocument()() {
    return recastOpt!(Document)(Object_Getter__OptionalHandle(this._parent, "contentDocument"));
  }
  auto contentWindow()() {
    return recastOpt!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "contentWindow"));
  }
  bool willValidate()() {
    return Object_Getter__bool(this._parent, "willValidate");
  }
  auto validity()() {
    return ValidityState(Object_Getter__Handle(this._parent, "validity"));
  }
  string validationMessage()() {
    return Object_Getter__string(this._parent, "validationMessage");
  }
  bool checkValidity()() {
    return Object_Getter__bool(this._parent, "checkValidity");
  }
  bool reportValidity()() {
    return Object_Getter__bool(this._parent, "reportValidity");
  }
  void setCustomValidity()(string error) {
    Object_Call_string__void(this._parent, "setCustomValidity", error);
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void archive()(string archive) {
    Object_Call_string__void(this._parent, "archive", archive);
  }
  string archive()() {
    return Object_Getter__string(this._parent, "archive");
  }
  void code()(string code) {
    Object_Call_string__void(this._parent, "code", code);
  }
  string code()() {
    return Object_Getter__string(this._parent, "code");
  }
  void declare()(bool declare) {
    Object_Call_bool__void(this._parent, "declare", declare);
  }
  bool declare()() {
    return Object_Getter__bool(this._parent, "declare");
  }
  void hspace()(uint hspace) {
    Object_Call_uint__void(this._parent, "hspace", hspace);
  }
  uint hspace()() {
    return Object_Getter__uint(this._parent, "hspace");
  }
  void standby()(string standby) {
    Object_Call_string__void(this._parent, "standby", standby);
  }
  string standby()() {
    return Object_Getter__string(this._parent, "standby");
  }
  void vspace()(uint vspace) {
    Object_Call_uint__void(this._parent, "vspace", vspace);
  }
  uint vspace()() {
    return Object_Getter__uint(this._parent, "vspace");
  }
  void codeBase()(string codeBase) {
    Object_Call_string__void(this._parent, "codeBase", codeBase);
  }
  string codeBase()() {
    return Object_Getter__string(this._parent, "codeBase");
  }
  void codeType()(string codeType) {
    Object_Call_string__void(this._parent, "codeType", codeType);
  }
  string codeType()() {
    return Object_Getter__string(this._parent, "codeType");
  }
  void border()(string border) {
    Object_Call_string__void(this._parent, "border", border);
  }
  string border()() {
    return Object_Getter__string(this._parent, "border");
  }
  auto getSVGDocument()() {
    return recastOpt!(Document)(Object_Getter__OptionalHandle(this._parent, "getSVGDocument"));
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
  auto frameLoader()() {
    return recastOpt!(FrameLoader)(Object_Getter__OptionalHandle(this._parent, "frameLoader"));
  }
  void presetOpenerWindow(T0)(scope auto ref Optional!(T0) window) if (isTOrPointer!(T0, WindowProxy)) {
    Serialize_Object_VarArgCall!void(this._parent, "presetOpenerWindow", "Optional!Handle", tuple(!window.empty, cast(Handle)window.front.handle));
  }
  void swapFrameLoaders()(scope ref XULFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this._parent, "swapFrameLoaders", aOtherLoaderOwner.handle);
  }
  void swapFrameLoaders()(scope ref HTMLIFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this._parent, "swapFrameLoaders", aOtherLoaderOwner._parent);
  }
  enum uint TYPE_LOADING = 0;
  enum uint TYPE_IMAGE = 1;
  enum uint TYPE_PLUGIN = 2;
  enum uint TYPE_FAKE_PLUGIN = 3;
  enum uint TYPE_DOCUMENT = 4;
  enum uint TYPE_NULL = 5;
  enum uint PLUGIN_UNSUPPORTED = 0;
  enum uint PLUGIN_ALTERNATE = 1;
  enum uint PLUGIN_DISABLED = 2;
  enum uint PLUGIN_BLOCKLISTED = 3;
  enum uint PLUGIN_OUTDATED = 4;
  enum uint PLUGIN_CRASHED = 5;
  enum uint PLUGIN_SUPPRESSED = 6;
  enum uint PLUGIN_USER_DISABLED = 7;
  enum uint PLUGIN_CLICK_TO_PLAY = 8;
  enum uint PLUGIN_VULNERABLE_UPDATABLE = 9;
  enum uint PLUGIN_VULNERABLE_NO_UPDATE = 10;
  string actualType()() {
    return Object_Getter__string(this._parent, "actualType");
  }
  uint displayedType()() {
    return Object_Getter__uint(this._parent, "displayedType");
  }
  uint getContentTypeForMIMEType()(string aMimeType) {
    return Serialize_Object_VarArgCall!uint(this._parent, "getContentTypeForMIMEType", "string", tuple(aMimeType));
  }
  auto getPluginAttributes()() {
    return Sequence!(MozPluginParameter)(Object_Getter__Handle(this._parent, "getPluginAttributes"));
  }
  auto getPluginParameters()() {
    return Sequence!(MozPluginParameter)(Object_Getter__Handle(this._parent, "getPluginParameters"));
  }
  void playPlugin()() {
    Object_Call__void(this._parent, "playPlugin");
  }
  void reload()(bool aClearActivation) {
    Object_Call_bool__void(this._parent, "reload", aClearActivation);
  }
  bool activated()() {
    return Object_Getter__bool(this._parent, "activated");
  }
  auto srcURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "srcURI"));
  }
  uint defaultFallbackType()() {
    return Object_Getter__uint(this._parent, "defaultFallbackType");
  }
  uint pluginFallbackType()() {
    return Object_Getter__uint(this._parent, "pluginFallbackType");
  }
  bool hasRunningPlugin()() {
    return Object_Getter__bool(this._parent, "hasRunningPlugin");
  }
  void skipFakePlugins()() {
    Object_Call__void(this._parent, "skipFakePlugins");
  }
  uint runID()() {
    return Object_Getter__uint(this._parent, "runID");
  }
}
struct MozObjectLoadingContent {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint TYPE_LOADING = 0;
  enum uint TYPE_IMAGE = 1;
  enum uint TYPE_PLUGIN = 2;
  enum uint TYPE_FAKE_PLUGIN = 3;
  enum uint TYPE_DOCUMENT = 4;
  enum uint TYPE_NULL = 5;
  enum uint PLUGIN_UNSUPPORTED = 0;
  enum uint PLUGIN_ALTERNATE = 1;
  enum uint PLUGIN_DISABLED = 2;
  enum uint PLUGIN_BLOCKLISTED = 3;
  enum uint PLUGIN_OUTDATED = 4;
  enum uint PLUGIN_CRASHED = 5;
  enum uint PLUGIN_SUPPRESSED = 6;
  enum uint PLUGIN_USER_DISABLED = 7;
  enum uint PLUGIN_CLICK_TO_PLAY = 8;
  enum uint PLUGIN_VULNERABLE_UPDATABLE = 9;
  enum uint PLUGIN_VULNERABLE_NO_UPDATE = 10;
  string actualType()() {
    return Object_Getter__string(this.handle, "actualType");
  }
  uint displayedType()() {
    return Object_Getter__uint(this.handle, "displayedType");
  }
  uint getContentTypeForMIMEType()(string aMimeType) {
    return Serialize_Object_VarArgCall!uint(this.handle, "getContentTypeForMIMEType", "string", tuple(aMimeType));
  }
  auto getPluginAttributes()() {
    return Sequence!(MozPluginParameter)(Object_Getter__Handle(this.handle, "getPluginAttributes"));
  }
  auto getPluginParameters()() {
    return Sequence!(MozPluginParameter)(Object_Getter__Handle(this.handle, "getPluginParameters"));
  }
  void playPlugin()() {
    Object_Call__void(this.handle, "playPlugin");
  }
  void reload()(bool aClearActivation) {
    Object_Call_bool__void(this.handle, "reload", aClearActivation);
  }
  bool activated()() {
    return Object_Getter__bool(this.handle, "activated");
  }
  auto srcURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this.handle, "srcURI"));
  }
  uint defaultFallbackType()() {
    return Object_Getter__uint(this.handle, "defaultFallbackType");
  }
  uint pluginFallbackType()() {
    return Object_Getter__uint(this.handle, "pluginFallbackType");
  }
  bool hasRunningPlugin()() {
    return Object_Getter__bool(this.handle, "hasRunningPlugin");
  }
  void skipFakePlugins()() {
    Object_Call__void(this.handle, "skipFakePlugins");
  }
  uint runID()() {
    return Object_Getter__uint(this.handle, "runID");
  }
}
struct MozPluginParameter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MozPluginParameter(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
}


