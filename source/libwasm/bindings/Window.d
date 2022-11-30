module libwasm.bindings.Window;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AbortSignal;
import libwasm.bindings.BarProp;
import libwasm.bindings.Blob;
import libwasm.bindings.CSSStyleDeclaration;
import libwasm.bindings.CacheStorage;
import libwasm.bindings.CloseEvent;
import libwasm.bindings.Crypto;
import libwasm.bindings.CustomElementRegistry;
import libwasm.bindings.CustomEvent;
import libwasm.bindings.DOMException;
import libwasm.bindings.Document;
import libwasm.bindings.Element;
import libwasm.bindings.ErrorEvent;
import libwasm.bindings.Event;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventListener;
import libwasm.bindings.EventSource;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Fetch;
import libwasm.bindings.File;
import libwasm.bindings.FormData;
import libwasm.bindings.Function;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.Headers;
import libwasm.bindings.History;
import libwasm.bindings.IDBFactory;
import libwasm.bindings.IDBVersionChangeEvent;
import libwasm.bindings.IdleDeadline;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.InstallTrigger;
import libwasm.bindings.IntlUtils;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.Location;
import libwasm.bindings.MediaQueryList;
import libwasm.bindings.MessageEvent;
import libwasm.bindings.MessagePort;
import libwasm.bindings.Navigator;
import libwasm.bindings.Notification;
import libwasm.bindings.OfflineResourceList;
import libwasm.bindings.Performance;
import libwasm.bindings.PerformanceObserver;
import libwasm.bindings.ProgressEvent;
import libwasm.bindings.PromiseRejectionEvent;
import libwasm.bindings.Request;
import libwasm.bindings.Response;
import libwasm.bindings.Screen;
import libwasm.bindings.Selection;
import libwasm.bindings.Storage;
import libwasm.bindings.TextDecoder;
import libwasm.bindings.TextEncoder;
import libwasm.bindings.U2F;
import libwasm.bindings.URLSearchParams;
import libwasm.bindings.VisualViewport;
import libwasm.bindings.WebGLContextEvent;
import libwasm.bindings.WebGPU;
import libwasm.bindings.WebSocket;
import libwasm.bindings.WindowOrWorkerGlobalScope;
import libwasm.bindings.WindowRoot;
import libwasm.bindings.Worker;
import libwasm.bindings.Worklet;
import libwasm.bindings.XMLHttpRequest;
import libwasm.bindings.XMLHttpRequestEventTarget;
import libwasm.bindings.XMLHttpRequestUpload;

@safe:
nothrow:

alias ApplicationCache = OfflineResourceList;
alias FrameRequestCallback = void delegate(double);
alias IdleRequestCallback = void delegate(IdleDeadline);
struct IdleRequestOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IdleRequestOptions(libwasm_add__object());
  }
  void timeout()(uint timeout) {
    Object_Call_uint__void(this.handle, "timeout", timeout);
  }
  uint timeout()() {
    return Object_Getter__uint(this.handle, "timeout");
  }
}
alias PromiseDocumentFlushedCallback = Any delegate();
enum ScrollBehavior {
  auto_,
  instant,
  smooth
}
struct ScrollOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ScrollOptions(libwasm_add__object());
  }
  void behavior()(ScrollBehavior behavior) {
    Object_Call_int__void(this.handle, "behavior", behavior);
  }
  ScrollBehavior behavior()() {
    return Object_Getter__int(this.handle, "behavior");
  }
}
struct ScrollToOptions {
  nothrow:
  libwasm.bindings.Window.ScrollOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ScrollOptions(h);
  }
  static auto create() {
    return ScrollToOptions(libwasm_add__object());
  }
  void left()(double left) {
    Object_Call_double__void(this._parent, "left", left);
  }
  double left()() {
    return Object_Getter__double(this._parent, "left");
  }
  void top()(double top) {
    Object_Call_double__void(this._parent, "top", top);
  }
  double top()() {
    return Object_Getter__double(this._parent, "top");
  }
}
struct Window {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto window()() {
    return WindowProxy(Object_Getter__Handle(this._parent, "window"));
  }
  auto self()() {
    return WindowProxy(Object_Getter__Handle(this._parent, "self"));
  }
  auto document()() {
    return Optional!(Document)(Object_Getter__OptionalHandle(this._parent, "document"));
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  auto location()() {
    return Location(Object_Getter__Handle(this._parent, "location"));
  }
  auto history()() {
    return History(Object_Getter__Handle(this._parent, "history"));
  }
  auto customElements()() {
    return CustomElementRegistry(Object_Getter__Handle(this._parent, "customElements"));
  }
  auto locationbar()() {
    return BarProp(Object_Getter__Handle(this._parent, "locationbar"));
  }
  auto menubar()() {
    return BarProp(Object_Getter__Handle(this._parent, "menubar"));
  }
  auto personalbar()() {
    return BarProp(Object_Getter__Handle(this._parent, "personalbar"));
  }
  auto scrollbars()() {
    return BarProp(Object_Getter__Handle(this._parent, "scrollbars"));
  }
  auto statusbar()() {
    return BarProp(Object_Getter__Handle(this._parent, "statusbar"));
  }
  auto toolbar()() {
    return BarProp(Object_Getter__Handle(this._parent, "toolbar"));
  }
  void status()(string status) {
    Object_Call_string__void(this._parent, "status", status);
  }
  string status()() {
    return Object_Getter__string(this._parent, "status");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  bool closed()() {
    return Object_Getter__bool(this._parent, "closed");
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
  void focus()() {
    Object_Call__void(this._parent, "focus");
  }
  void blur()() {
    Object_Call__void(this._parent, "blur");
  }
  auto event()() {
    return Any(Object_Getter__Handle(this._parent, "event"));
  }
  auto frames()() {
    return WindowProxy(Object_Getter__Handle(this._parent, "frames"));
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  auto top()() {
    return Optional!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "top"));
  }
  void opener()(scope ref Any opener) {
    Object_Call_Handle__void(this._parent, "opener", opener.handle);
  }
  auto opener()() {
    return Any(Object_Getter__Handle(this._parent, "opener"));
  }
  auto parent()() {
    return Optional!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "parent"));
  }
  auto frameElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "frameElement"));
  }
  auto open()(string url /* = "" */, string target /* = "" */, string features /* = "" */) {
    return Optional!(WindowProxy)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "open", "string;string;string", tuple(url, target, features)));
  }
  auto open()(string url /* = "" */, string target /* = "" */) {
    return Optional!(WindowProxy)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "open", "string;string", tuple(url, target)));
  }
  auto open()(string url /* = "" */) {
    return Optional!(WindowProxy)(Object_Call_string__OptionalHandle(this._parent, "open", url));
  }
  auto open()() {
    return Optional!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "open"));
  }
  auto opIndex()(string name) {
    return JsObject(Object_Call_string__Handle(this._parent, "getter", name));
  }
  auto opDispatch(string name)() {
    return JsObject(Object_Call_string__Handle(this._parent, "getter", name));
  }
  auto navigator()() {
    return Navigator(Object_Getter__Handle(this._parent, "navigator"));
  }
  auto applicationCache()() {
    return ApplicationCache(Object_Getter__Handle(this._parent, "applicationCache"));
  }
  void alert()() {
    Object_Call__void(this._parent, "alert");
  }
  void alert()(string message) {
    Object_Call_string__void(this._parent, "alert", message);
  }
  bool confirm()(string message /* = "" */) {
    return Object_Call_string__bool(this._parent, "confirm", message);
  }
  bool confirm()() {
    return Object_Getter__bool(this._parent, "confirm");
  }
  Optional!(string) prompt()(string message /* = "" */, string default_ /* = "" */) {
    return Serialize_Object_VarArgCall!(Optional!string)(this._parent, "prompt", "string;string", tuple(message, default_));
  }
  Optional!(string) prompt()(string message /* = "" */) {
    return Object_Call_string__OptionalString(this._parent, "prompt", message);
  }
  Optional!(string) prompt()() {
    return Object_Getter__OptionalString(this._parent, "prompt");
  }
  void print()() {
    Object_Call__void(this._parent, "print");
  }
  void postMessage(T0)(scope auto ref T0 message, string targetOrigin, scope ref Sequence!(JsObject) transfer /* = [] */) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;string;Handle", tuple(_handle_message, targetOrigin, cast(Handle)transfer.handle));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, string targetOrigin) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;string", tuple(_handle_message, targetOrigin));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref WindowPostMessageOptions options) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)options._parent));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "postMessage", cast(string) message);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "postMessage", cast(long) message);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "postMessage", cast(double) message);
      return;
    }
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Object_Call_Handle__void(this._parent, "postMessage", _handle_message);
    dropHandle!(T0)(_handle_message);
  }
  void onappinstalled(T0)(scope auto ref Optional!(T0) onappinstalled) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onappinstalled", !onappinstalled.empty, onappinstalled.front);
  }
  EventHandler onappinstalled()() {
    return Object_Getter__EventHandler(this._parent, "onappinstalled");
  }
  void captureEvents()() {
    Object_Call__void(this._parent, "captureEvents");
  }
  void releaseEvents()() {
    Object_Call__void(this._parent, "releaseEvents");
  }
  auto getSelection()() {
    return Optional!(Selection)(Object_Getter__OptionalHandle(this._parent, "getSelection"));
  }
  auto getComputedStyle()(scope ref Element elt, string pseudoElt /* = "" */) {
    return Optional!(CSSStyleDeclaration)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getComputedStyle", "Handle;string", tuple(cast(Handle)elt._parent, pseudoElt)));
  }
  auto getComputedStyle()(scope ref Element elt) {
    return Optional!(CSSStyleDeclaration)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getComputedStyle", "Handle", tuple(cast(Handle)elt._parent)));
  }
  auto matchMedia()(string query) {
    return Optional!(MediaQueryList)(Object_Call_string__OptionalHandle(this._parent, "matchMedia", query));
  }
  auto screen()() {
    return Screen(Object_Getter__Handle(this._parent, "screen"));
  }
  void moveTo()(int x, int y) {
    Serialize_Object_VarArgCall!void(this._parent, "moveTo", "int;int", tuple(x, y));
  }
  void moveBy()(int x, int y) {
    Serialize_Object_VarArgCall!void(this._parent, "moveBy", "int;int", tuple(x, y));
  }
  void resizeTo()(int x, int y) {
    Serialize_Object_VarArgCall!void(this._parent, "resizeTo", "int;int", tuple(x, y));
  }
  void resizeBy()(int x, int y) {
    Serialize_Object_VarArgCall!void(this._parent, "resizeBy", "int;int", tuple(x, y));
  }
  void innerWidth()(scope ref Any innerWidth) {
    Object_Call_Handle__void(this._parent, "innerWidth", innerWidth.handle);
  }
  auto innerWidth()() {
    return Any(Object_Getter__Handle(this._parent, "innerWidth"));
  }
  void innerHeight()(scope ref Any innerHeight) {
    Object_Call_Handle__void(this._parent, "innerHeight", innerHeight.handle);
  }
  auto innerHeight()() {
    return Any(Object_Getter__Handle(this._parent, "innerHeight"));
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
  double scrollX()() {
    return Object_Getter__double(this._parent, "scrollX");
  }
  double pageXOffset()() {
    return Object_Getter__double(this._parent, "pageXOffset");
  }
  double scrollY()() {
    return Object_Getter__double(this._parent, "scrollY");
  }
  double pageYOffset()() {
    return Object_Getter__double(this._parent, "pageYOffset");
  }
  double screenLeft()() {
    return Object_Getter__double(this._parent, "screenLeft");
  }
  double screenTop()() {
    return Object_Getter__double(this._parent, "screenTop");
  }
  void screenX()(scope ref Any screenX) {
    Object_Call_Handle__void(this._parent, "screenX", screenX.handle);
  }
  auto screenX()() {
    return Any(Object_Getter__Handle(this._parent, "screenX"));
  }
  void screenY()(scope ref Any screenY) {
    Object_Call_Handle__void(this._parent, "screenY", screenY.handle);
  }
  auto screenY()() {
    return Any(Object_Getter__Handle(this._parent, "screenY"));
  }
  void outerWidth()(scope ref Any outerWidth) {
    Object_Call_Handle__void(this._parent, "outerWidth", outerWidth.handle);
  }
  auto outerWidth()() {
    return Any(Object_Getter__Handle(this._parent, "outerWidth"));
  }
  void outerHeight()(scope ref Any outerHeight) {
    Object_Call_Handle__void(this._parent, "outerHeight", outerHeight.handle);
  }
  auto outerHeight()() {
    return Any(Object_Getter__Handle(this._parent, "outerHeight"));
  }
  int requestAnimationFrame()(FrameRequestCallback callback) {
    return Window_requestAnimationFrame(this._parent, callback);
  }
  void cancelAnimationFrame()(int handle) {
    Object_Call_int__void(this._parent, "cancelAnimationFrame", handle);
  }
  auto performance()() {
    return Optional!(Performance)(Object_Getter__OptionalHandle(this._parent, "performance"));
  }
  auto getDefaultComputedStyle()(scope ref Element elt, string pseudoElt /* = "" */) {
    return Optional!(CSSStyleDeclaration)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getDefaultComputedStyle", "Handle;string", tuple(cast(Handle)elt._parent, pseudoElt)));
  }
  auto getDefaultComputedStyle()(scope ref Element elt) {
    return Optional!(CSSStyleDeclaration)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getDefaultComputedStyle", "Handle", tuple(cast(Handle)elt._parent)));
  }
  void scrollByLines()(int numLines, scope ref ScrollOptions options) {
    Serialize_Object_VarArgCall!void(this._parent, "scrollByLines", "int;Handle", tuple(numLines, cast(Handle)options.handle));
  }
  void scrollByLines()(int numLines) {
    Object_Call_int__void(this._parent, "scrollByLines", numLines);
  }
  void scrollByPages()(int numPages, scope ref ScrollOptions options) {
    Serialize_Object_VarArgCall!void(this._parent, "scrollByPages", "int;Handle", tuple(numPages, cast(Handle)options.handle));
  }
  void scrollByPages()(int numPages) {
    Object_Call_int__void(this._parent, "scrollByPages", numPages);
  }
  void sizeToContent()() {
    Object_Call__void(this._parent, "sizeToContent");
  }
  auto controllers()() {
    return XULControllers(Object_Getter__Handle(this._parent, "controllers"));
  }
  auto realFrameElement()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this._parent, "realFrameElement"));
  }
  auto docShell()() {
    return Optional!(nsIDocShell)(Object_Getter__OptionalHandle(this._parent, "docShell"));
  }
  float mozInnerScreenX()() {
    return Object_Getter__float(this._parent, "mozInnerScreenX");
  }
  float mozInnerScreenY()() {
    return Object_Getter__float(this._parent, "mozInnerScreenY");
  }
  double devicePixelRatio()() {
    return Object_Getter__double(this._parent, "devicePixelRatio");
  }
  int scrollMinX()() {
    return Object_Getter__int(this._parent, "scrollMinX");
  }
  int scrollMinY()() {
    return Object_Getter__int(this._parent, "scrollMinY");
  }
  int scrollMaxX()() {
    return Object_Getter__int(this._parent, "scrollMaxX");
  }
  int scrollMaxY()() {
    return Object_Getter__int(this._parent, "scrollMaxY");
  }
  void fullScreen()(bool fullScreen) {
    Object_Call_bool__void(this._parent, "fullScreen", fullScreen);
  }
  bool fullScreen()() {
    return Object_Getter__bool(this._parent, "fullScreen");
  }
  void updateCommands(T1)(string action, scope auto ref Optional!(T1) sel /* = no!(Selection) */, short reason /* = 0 */) if (isTOrPointer!(T1, Selection)) {
    Serialize_Object_VarArgCall!void(this._parent, "updateCommands", "string;Optional!Handle;short", tuple(action, !sel.empty, cast(Handle)sel.front.handle, reason));
  }
  void updateCommands(T1)(string action, scope auto ref Optional!(T1) sel /* = no!(Selection) */) if (isTOrPointer!(T1, Selection)) {
    Serialize_Object_VarArgCall!void(this._parent, "updateCommands", "string;Optional!Handle", tuple(action, !sel.empty, cast(Handle)sel.front.handle));
  }
  void updateCommands()(string action) {
    Object_Call_string__void(this._parent, "updateCommands", action);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */, bool searchInFrames /* = false */, bool showDialog /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool;bool;bool;bool;bool;bool", tuple(str, caseSensitive, backwards, wrapAround, wholeWord, searchInFrames, showDialog));
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */, bool searchInFrames /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool;bool;bool;bool;bool", tuple(str, caseSensitive, backwards, wrapAround, wholeWord, searchInFrames));
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool;bool;bool;bool", tuple(str, caseSensitive, backwards, wrapAround, wholeWord));
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool;bool;bool", tuple(str, caseSensitive, backwards, wrapAround));
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool;bool", tuple(str, caseSensitive, backwards));
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "find", "string;bool", tuple(str, caseSensitive));
  }
  bool find()(string str /* = "" */) {
    return Object_Call_string__bool(this._parent, "find", str);
  }
  bool find()() {
    return Object_Getter__bool(this._parent, "find");
  }
  uint mozPaintCount()() {
    return Object_Getter__uint(this._parent, "mozPaintCount");
  }
  void ondevicemotion(T0)(scope auto ref Optional!(T0) ondevicemotion) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondevicemotion", !ondevicemotion.empty, ondevicemotion.front);
  }
  EventHandler ondevicemotion()() {
    return Object_Getter__EventHandler(this._parent, "ondevicemotion");
  }
  void ondeviceorientation(T0)(scope auto ref Optional!(T0) ondeviceorientation) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondeviceorientation", !ondeviceorientation.empty, ondeviceorientation.front);
  }
  EventHandler ondeviceorientation()() {
    return Object_Getter__EventHandler(this._parent, "ondeviceorientation");
  }
  void onabsolutedeviceorientation(T0)(scope auto ref Optional!(T0) onabsolutedeviceorientation) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabsolutedeviceorientation", !onabsolutedeviceorientation.empty, onabsolutedeviceorientation.front);
  }
  EventHandler onabsolutedeviceorientation()() {
    return Object_Getter__EventHandler(this._parent, "onabsolutedeviceorientation");
  }
  void ondeviceproximity(T0)(scope auto ref Optional!(T0) ondeviceproximity) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondeviceproximity", !ondeviceproximity.empty, ondeviceproximity.front);
  }
  EventHandler ondeviceproximity()() {
    return Object_Getter__EventHandler(this._parent, "ondeviceproximity");
  }
  void onuserproximity(T0)(scope auto ref Optional!(T0) onuserproximity) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onuserproximity", !onuserproximity.empty, onuserproximity.front);
  }
  EventHandler onuserproximity()() {
    return Object_Getter__EventHandler(this._parent, "onuserproximity");
  }
  void ondevicelight(T0)(scope auto ref Optional!(T0) ondevicelight) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondevicelight", !ondevicelight.empty, ondevicelight.front);
  }
  EventHandler ondevicelight()() {
    return Object_Getter__EventHandler(this._parent, "ondevicelight");
  }
  void dump()(string str) {
    Object_Call_string__void(this._parent, "dump", str);
  }
  void setResizable()(bool resizable) {
    Object_Call_bool__void(this._parent, "setResizable", resizable);
  }
  auto openDialog(T3)(string url /* = "" */, string name /* = "" */, string options /* = "" */, scope auto ref T3 extraArguments) {
    // Any
    Handle _handle_extraArguments = getOrCreateHandle(extraArguments);
    auto result = Optional!(WindowProxy)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "openDialog", "string;string;string;Handle", tuple(url, name, options, _handle_extraArguments)));
    dropHandle!(T3)(_handle_extraArguments);
    return result;
  }
  auto content()() {
    return Optional!(JsObject)(Object_Getter__OptionalHandle(this._parent, "content"));
  }
  auto getInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = Any(Object_Call_Handle__Handle(this._parent, "getInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
  auto windowRoot()() {
    return Optional!(WindowRoot)(Object_Getter__OptionalHandle(this._parent, "windowRoot"));
  }
  bool shouldReportForServiceWorkerScope()(string aScope) {
    return Object_Call_string__bool(this._parent, "shouldReportForServiceWorkerScope", aScope);
  }
  auto InstallTrigger()() {
    return Optional!(InstallTriggerImpl)(Object_Getter__OptionalHandle(this._parent, "InstallTrigger"));
  }
  auto windowUtils()() {
    return nsIDOMWindowUtils(Object_Getter__Handle(this._parent, "windowUtils"));
  }
  bool hasOpenerForInitialContentBrowser()() {
    return Object_Getter__bool(this._parent, "hasOpenerForInitialContentBrowser");
  }
  auto getWindowGlobalChild()() {
    return WindowGlobalChild(Object_Getter__Handle(this._parent, "getWindowGlobalChild"));
  }
  ushort windowState()() {
    return Object_Getter__ushort(this._parent, "windowState");
  }
  bool isFullyOccluded()() {
    return Object_Getter__bool(this._parent, "isFullyOccluded");
  }
  void browserDOMWindow(T0)(scope auto ref Optional!(T0) browserDOMWindow) if (isTOrPointer!(T0, nsIBrowserDOMWindow)) {
    Serialize_Object_VarArgCall!void(this._parent, "browserDOMWindow", "Optional!Handle", tuple(!browserDOMWindow.empty, cast(Handle)browserDOMWindow.front.handle));
  }
  auto browserDOMWindow()() {
    return Optional!(nsIBrowserDOMWindow)(Object_Getter__OptionalHandle(this._parent, "browserDOMWindow"));
  }
  void getAttention()() {
    Object_Call__void(this._parent, "getAttention");
  }
  void getAttentionWithCycleCount()(int aCycleCount) {
    Object_Call_int__void(this._parent, "getAttentionWithCycleCount", aCycleCount);
  }
  void setCursor()(string cursor) {
    Object_Call_string__void(this._parent, "setCursor", cursor);
  }
  void maximize()() {
    Object_Call__void(this._parent, "maximize");
  }
  void minimize()() {
    Object_Call__void(this._parent, "minimize");
  }
  void restore()() {
    Object_Call__void(this._parent, "restore");
  }
  void notifyDefaultButtonLoaded()(scope ref Element defaultButton) {
    Object_Call_Handle__void(this._parent, "notifyDefaultButtonLoaded", defaultButton._parent);
  }
  auto messageManager()() {
    return ChromeMessageBroadcaster(Object_Getter__Handle(this._parent, "messageManager"));
  }
  auto getGroupMessageManager()(string aGroup) {
    return ChromeMessageBroadcaster(Object_Call_string__Handle(this._parent, "getGroupMessageManager", aGroup));
  }
  auto promiseDocumentFlushed()(PromiseDocumentFlushedCallback callback) {
    return JsPromise!(Any)(Window_promiseDocumentFlushed(this._parent, callback));
  }
  bool isChromeWindow()() {
    return Object_Getter__bool(this._parent, "isChromeWindow");
  }
  void onvrdisplayconnect(T0)(scope auto ref Optional!(T0) onvrdisplayconnect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvrdisplayconnect", !onvrdisplayconnect.empty, onvrdisplayconnect.front);
  }
  EventHandler onvrdisplayconnect()() {
    return Object_Getter__EventHandler(this._parent, "onvrdisplayconnect");
  }
  void onvrdisplaydisconnect(T0)(scope auto ref Optional!(T0) onvrdisplaydisconnect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvrdisplaydisconnect", !onvrdisplaydisconnect.empty, onvrdisplaydisconnect.front);
  }
  EventHandler onvrdisplaydisconnect()() {
    return Object_Getter__EventHandler(this._parent, "onvrdisplaydisconnect");
  }
  void onvrdisplayactivate(T0)(scope auto ref Optional!(T0) onvrdisplayactivate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvrdisplayactivate", !onvrdisplayactivate.empty, onvrdisplayactivate.front);
  }
  EventHandler onvrdisplayactivate()() {
    return Object_Getter__EventHandler(this._parent, "onvrdisplayactivate");
  }
  void onvrdisplaydeactivate(T0)(scope auto ref Optional!(T0) onvrdisplaydeactivate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvrdisplaydeactivate", !onvrdisplaydeactivate.empty, onvrdisplaydeactivate.front);
  }
  EventHandler onvrdisplaydeactivate()() {
    return Object_Getter__EventHandler(this._parent, "onvrdisplaydeactivate");
  }
  void onvrdisplaypresentchange(T0)(scope auto ref Optional!(T0) onvrdisplaypresentchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvrdisplaypresentchange", !onvrdisplaypresentchange.empty, onvrdisplaypresentchange.front);
  }
  EventHandler onvrdisplaypresentchange()() {
    return Object_Getter__EventHandler(this._parent, "onvrdisplaypresentchange");
  }
  auto paintWorklet()() {
    return Worklet(Object_Getter__Handle(this._parent, "paintWorklet"));
  }
  uint requestIdleCallback()(IdleRequestCallback callback, scope ref IdleRequestOptions options) {
    return Window_requestIdleCallback(this._parent, callback, options.handle);
  }
  uint requestIdleCallback()(IdleRequestCallback callback) {
    return Window_requestIdleCallback_0(this._parent, callback);
  }
  void cancelIdleCallback()(uint handle) {
    Object_Call_uint__void(this._parent, "cancelIdleCallback", handle);
  }
  auto getRegionalPrefsLocales()() {
    return Sequence!(string)(Object_Getter__Handle(this._parent, "getRegionalPrefsLocales"));
  }
  auto intlUtils()() {
    return IntlUtils(Object_Getter__Handle(this._parent, "intlUtils"));
  }
  auto visualViewport()() {
    return VisualViewport(Object_Getter__Handle(this._parent, "visualViewport"));
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
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
  void onafterprint(T0)(scope auto ref Optional!(T0) onafterprint) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onafterprint", !onafterprint.empty, onafterprint.front);
  }
  EventHandler onafterprint()() {
    return Object_Getter__EventHandler(this._parent, "onafterprint");
  }
  void onbeforeprint(T0)(scope auto ref Optional!(T0) onbeforeprint) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onbeforeprint", !onbeforeprint.empty, onbeforeprint.front);
  }
  EventHandler onbeforeprint()() {
    return Object_Getter__EventHandler(this._parent, "onbeforeprint");
  }
  void onbeforeunload(T0)(scope auto ref Optional!(T0) onbeforeunload) if (isTOrPointer!(T0, OnBeforeUnloadEventHandler)) {
    WindowEventHandlers_onbeforeunload_Set(this._parent, !onbeforeunload.empty, onbeforeunload.front);
  }
  OnBeforeUnloadEventHandler onbeforeunload()() {
    return WindowEventHandlers_onbeforeunload_Get(this._parent);
  }
  void onhashchange(T0)(scope auto ref Optional!(T0) onhashchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onhashchange", !onhashchange.empty, onhashchange.front);
  }
  EventHandler onhashchange()() {
    return Object_Getter__EventHandler(this._parent, "onhashchange");
  }
  void onlanguagechange(T0)(scope auto ref Optional!(T0) onlanguagechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onlanguagechange", !onlanguagechange.empty, onlanguagechange.front);
  }
  EventHandler onlanguagechange()() {
    return Object_Getter__EventHandler(this._parent, "onlanguagechange");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onmessageerror(T0)(scope auto ref Optional!(T0) onmessageerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessageerror", !onmessageerror.empty, onmessageerror.front);
  }
  EventHandler onmessageerror()() {
    return Object_Getter__EventHandler(this._parent, "onmessageerror");
  }
  void onoffline(T0)(scope auto ref Optional!(T0) onoffline) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onoffline", !onoffline.empty, onoffline.front);
  }
  EventHandler onoffline()() {
    return Object_Getter__EventHandler(this._parent, "onoffline");
  }
  void ononline(T0)(scope auto ref Optional!(T0) ononline) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ononline", !ononline.empty, ononline.front);
  }
  EventHandler ononline()() {
    return Object_Getter__EventHandler(this._parent, "ononline");
  }
  void onpagehide(T0)(scope auto ref Optional!(T0) onpagehide) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpagehide", !onpagehide.empty, onpagehide.front);
  }
  EventHandler onpagehide()() {
    return Object_Getter__EventHandler(this._parent, "onpagehide");
  }
  void onpageshow(T0)(scope auto ref Optional!(T0) onpageshow) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpageshow", !onpageshow.empty, onpageshow.front);
  }
  EventHandler onpageshow()() {
    return Object_Getter__EventHandler(this._parent, "onpageshow");
  }
  void onpopstate(T0)(scope auto ref Optional!(T0) onpopstate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpopstate", !onpopstate.empty, onpopstate.front);
  }
  EventHandler onpopstate()() {
    return Object_Getter__EventHandler(this._parent, "onpopstate");
  }
  void onstorage(T0)(scope auto ref Optional!(T0) onstorage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstorage", !onstorage.empty, onstorage.front);
  }
  EventHandler onstorage()() {
    return Object_Getter__EventHandler(this._parent, "onstorage");
  }
  void onunload(T0)(scope auto ref Optional!(T0) onunload) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onunload", !onunload.empty, onunload.front);
  }
  EventHandler onunload()() {
    return Object_Getter__EventHandler(this._parent, "onunload");
  }
  auto sessionStorage()() {
    return Optional!(Storage)(Object_Getter__OptionalHandle(this._parent, "sessionStorage"));
  }
  auto localStorage()() {
    return Optional!(Storage)(Object_Getter__OptionalHandle(this._parent, "localStorage"));
  }
  auto crypto()() {
    return Crypto(Object_Getter__Handle(this._parent, "crypto"));
  }
  auto u2f()() {
    return U2F(Object_Getter__Handle(this._parent, "u2f"));
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
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, OnErrorEventHandler)) {
    OnErrorEventHandlerForWindow_onerror_Set(this._parent, !onerror.empty, onerror.front);
  }
  OnErrorEventHandler onerror()() {
    return OnErrorEventHandlerForWindow_onerror_Get(this._parent);
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
  string btoa()(string btoa) {
    return Object_Call_string__string(this._parent, "btoa", btoa);
  }
  string atob()(string atob) {
    return Object_Call_string__string(this._parent, "atob", atob);
  }
  int setTimeout(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle(this._parent, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setTimeout(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setTimeout__string_int_Handle(this._parent, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearTimeout()(int handle /* = 0 */) {
    Object_Call_int__void(this._parent, "clearTimeout", handle);
  }
  void clearTimeout()() {
    Object_Call__void(this._parent, "clearTimeout");
  }
  int setInterval(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle(this._parent, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setInterval(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setInterval__string_int_Handle(this._parent, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearInterval()(int handle /* = 0 */) {
    Object_Call_int__void(this._parent, "clearInterval", handle);
  }
  void clearInterval()() {
    Object_Call__void(this._parent, "clearInterval");
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this._parent, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)))));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this._parent, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle);int;int;int;int", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)), aSx, aSy, aSw, aSh)));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return JsPromise!(.Response)(Serialize_Object_VarArgCall!Handle(this._parent, "fetch", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)), cast(Handle)init.handle)));
  }
  auto fetch()(scope ref RequestInfo input) {
    return JsPromise!(.Response)(Serialize_Object_VarArgCall!Handle(this._parent, "fetch", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)))));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this._parent, "isSecureContext");
  }
  auto indexedDB()() {
    return Optional!(IDBFactory)(Object_Getter__OptionalHandle(this._parent, "indexedDB"));
  }
  auto caches()() {
    return CacheStorage(Object_Getter__Handle(this._parent, "caches"));
  }
  auto webgpu()() {
    return WebGPU(Object_Getter__Handle(this._parent, "webgpu"));
  }
  auto ChromeWorker()(string scriptURL) {
    return .ChromeWorker(Object_Call_string__Handle(this._parent, "ChromeWorker", scriptURL));
  }
  auto Worker()(string scriptURL, scope ref WorkerOptions options) {
    return .Worker(Serialize_Object_VarArgCall!Handle(this._parent, "Worker", "string;Handle", tuple(scriptURL, cast(Handle)options.handle)));
  }
  auto EventSource()(string url, scope ref EventSourceInit eventSourceInitDict) {
    return .EventSource(Serialize_Object_VarArgCall!Handle(this._parent, "EventSource", "string;Handle", tuple(url, cast(Handle)eventSourceInitDict.handle)));
  }
  auto Headers()(scope ref HeadersInit init) {
    return .Headers(Serialize_Object_VarArgCall!Handle(this._parent, "Headers", "SumType!(Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => 0),((ref init.Types[1] v) => 1),((ref init.Types[2] v) => 2))(init),tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => cast(Handle)v.handle),((ref init.Types[1] v) => Handle.init),((ref init.Types[2] v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => cast(Handle)v.handle),((ref init.Types[2] v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => Handle.init),((ref init.Types[2] v) => cast(Handle)v.handle))(init)))));
  }
  auto BroadcastChannel()(string channel) {
    return .BroadcastChannel(Object_Call_string__Handle(this._parent, "BroadcastChannel", channel));
  }
  auto Event()(string type, scope ref EventInit eventInitDict) {
    return .Event(Serialize_Object_VarArgCall!Handle(this._parent, "Event", "string;Handle", tuple(type, cast(Handle)eventInitDict.handle)));
  }
  auto Blob()(scope ref Sequence!(BlobPart) blobParts, scope ref BlobPropertyBag options) {
    return .Blob(Serialize_Object_VarArgCall!Handle(this._parent, "Blob", "Handle;Handle", tuple(cast(Handle)blobParts.handle, cast(Handle)options.handle)));
  }
  auto WebGLContextEvent()(string type, scope ref WebGLContextEventInit eventInit) {
    return .WebGLContextEvent(Serialize_Object_VarArgCall!Handle(this._parent, "WebGLContextEvent", "string;Handle", tuple(type, cast(Handle)eventInit._parent)));
  }
  auto URL()(string url, string base) {
    return .URL(Object_Call_string_string__Handle(this._parent, "URL", url, base));
  }
  auto MessageEvent()(string type, scope ref MessageEventInit eventInitDict) {
    return .MessageEvent(Serialize_Object_VarArgCall!Handle(this._parent, "MessageEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto CloseEvent()(string type, scope ref CloseEventInit eventInitDict) {
    return .CloseEvent(Serialize_Object_VarArgCall!Handle(this._parent, "CloseEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto Notification()(string title, scope ref NotificationOptions options) {
    return .Notification(Serialize_Object_VarArgCall!Handle(this._parent, "Notification", "string;Handle", tuple(title, cast(Handle)options.handle)));
  }
  auto IDBVersionChangeEvent()(string type, scope ref IDBVersionChangeEventInit eventInitDict) {
    return .IDBVersionChangeEvent(Serialize_Object_VarArgCall!Handle(this._parent, "IDBVersionChangeEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto ErrorEvent()(string type, scope ref ErrorEventInit eventInitDict) {
    return .ErrorEvent(Serialize_Object_VarArgCall!Handle(this._parent, "ErrorEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto DOMError()(string name, string message /* = "" */) {
    return .DOMError(Object_Call_string_string__Handle(this._parent, "DOMError", name, message));
  }
  auto File()(scope ref Sequence!(BlobPart) fileBits, string fileName, scope ref FilePropertyBag options) {
    return .File(Serialize_Object_VarArgCall!Handle(this._parent, "File", "Handle;string;Handle", tuple(cast(Handle)fileBits.handle, fileName, cast(Handle)options._parent)));
  }
  auto ProgressEvent()(string type, scope ref ProgressEventInit eventInitDict) {
    return .ProgressEvent(Serialize_Object_VarArgCall!Handle(this._parent, "ProgressEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto Response(T0)(scope auto ref Optional!(T0) body_, scope ref ResponseInit init) if (isTOrPointer!(T0, SumType!(.Blob, BufferSource, .FormData, .URLSearchParams, ReadableStream, string))) {
    return .Response(Serialize_Object_VarArgCall!Handle(this._parent, "Response", "Optional!SumType!(Handle,Handle,Handle,Handle,Handle,string);Handle", tuple(!body_.empty, libwasm.sumtype.match!(((ref body_.Types[0] v) => 0),((ref body_.Types[1] v) => 1),((ref body_.Types[2] v) => 2),((ref body_.Types[3] v) => 3),((ref body_.Types[4] v) => 4),((string v) => 5))(body_),tuple(libwasm.sumtype.match!(((ref body_.Types[0] v) => cast(Handle)v.handle),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => cast(Handle)v.handle),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => cast(Handle)v.handle),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => cast(Handle)v.handle),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => cast(Handle)v.handle),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => string.init),((ref body_.Types[1] v) => string.init),((ref body_.Types[2] v) => string.init),((ref body_.Types[3] v) => string.init),((ref body_.Types[4] v) => string.init),((string v) => v))(body_)), cast(Handle)init.handle)));
  }
  auto TextDecoder()(string label /* = "utf-8" */, scope ref TextDecoderOptions options) {
    return .TextDecoder(Serialize_Object_VarArgCall!Handle(this._parent, "TextDecoder", "string;Handle", tuple(label, cast(Handle)options.handle)));
  }
  auto EventTarget()() {
    return .EventTarget(Object_Getter__Handle(this._parent, "EventTarget"));
  }
  auto TextEncoder()() {
    return .TextEncoder(Object_Getter__Handle(this._parent, "TextEncoder"));
  }
  auto FileReader()() {
    return .FileReader(Object_Getter__Handle(this._parent, "FileReader"));
  }
  auto WebSocket()(string url) {
    return .WebSocket(Object_Call_string__Handle(this._parent, "WebSocket", url));
  }
  auto WebSocket()(string url, string protocols) {
    return .WebSocket(Object_Call_string_string__Handle(this._parent, "WebSocket", url, protocols));
  }
  auto WebSocket()(string url, scope ref Sequence!(string) protocols) {
    return .WebSocket(Serialize_Object_VarArgCall!Handle(this._parent, "WebSocket", "string;Handle", tuple(url, cast(Handle)protocols.handle)));
  }
  auto StructuredCloneTester()(bool serializable, bool deserializable) {
    return .StructuredCloneTester(Serialize_Object_VarArgCall!Handle(this._parent, "StructuredCloneTester", "bool;bool", tuple(serializable, deserializable)));
  }
  auto PerformanceObserver()(PerformanceObserverCallback callback) {
    return .PerformanceObserver(Window_PerformanceObserver(this._parent, callback));
  }
  auto PromiseRejectionEvent()(string type, scope ref PromiseRejectionEventInit eventInitDict) {
    return .PromiseRejectionEvent(Serialize_Object_VarArgCall!Handle(this._parent, "PromiseRejectionEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto AbortController()() {
    return .AbortController(Object_Getter__Handle(this._parent, "AbortController"));
  }
  auto MessageChannel()() {
    return .MessageChannel(Object_Getter__Handle(this._parent, "MessageChannel"));
  }
  auto CustomEvent()(string type, scope ref CustomEventInit eventInitDict) {
    return .CustomEvent(Serialize_Object_VarArgCall!Handle(this._parent, "CustomEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto TestingDeprecatedInterface()() {
    return .TestingDeprecatedInterface(Object_Getter__Handle(this._parent, "TestingDeprecatedInterface"));
  }
  auto URLSearchParams()(scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string) init /* = "" */) {
    return .URLSearchParams(Serialize_Object_VarArgCall!Handle(this._parent, "URLSearchParams", "SumType!(Handle,Handle,string)", tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => 0),((ref init.Types[1] v) => 1),((string v) => 2))(init),tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => cast(Handle)v.handle),((ref init.Types[1] v) => Handle.init),((string v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => cast(Handle)v.handle),((string v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => string.init),((ref init.Types[1] v) => string.init),((string v) => v))(init)))));
  }
  auto XMLHttpRequest()(scope ref MozXMLHttpRequestParameters params) {
    return .XMLHttpRequest(Object_Call_Handle__Handle(this._parent, "XMLHttpRequest", params.handle));
  }
  auto XMLHttpRequest()(string ignored) {
    return .XMLHttpRequest(Object_Call_string__Handle(this._parent, "XMLHttpRequest", ignored));
  }
  auto ImageData()(uint sw, uint sh) {
    return .ImageData(Serialize_Object_VarArgCall!Handle(this._parent, "ImageData", "uint;uint", tuple(sw, sh)));
  }
  auto ImageData()(scope ref Uint8ClampedArray data, uint sw, uint sh) {
    return .ImageData(Serialize_Object_VarArgCall!Handle(this._parent, "ImageData", "Handle;uint;uint", tuple(cast(Handle)data.handle, sw, sh)));
  }
  auto FormData()(scope ref HTMLFormElement form) {
    return .FormData(Object_Call_Handle__Handle(this._parent, "FormData", form._parent));
  }
  auto DOMException()(string message /* = "" */, string name) {
    return .DOMException(Object_Call_string_string__Handle(this._parent, "DOMException", message, name));
  }
  auto Request()(scope ref RequestInfo input, scope ref RequestInit init) {
    return .Request(Serialize_Object_VarArgCall!Handle(this._parent, "Request", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)), cast(Handle)init.handle)));
  }
  auto OffscreenCanvas()(uint width, uint height) {
    return .OffscreenCanvas(Serialize_Object_VarArgCall!Handle(this._parent, "OffscreenCanvas", "uint;uint", tuple(width, height)));
  }
}
struct WindowLocalStorage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto localStorage()() {
    return Optional!(Storage)(Object_Getter__OptionalHandle(this.handle, "localStorage"));
  }
}
struct WindowPostMessageOptions {
  nothrow:
  libwasm.bindings.MessagePort.PostMessageOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PostMessageOptions(h);
  }
  static auto create() {
    return WindowPostMessageOptions(libwasm_add__object());
  }
  void targetOrigin()(string targetOrigin) {
    Object_Call_string__void(this._parent, "targetOrigin", targetOrigin);
  }
  string targetOrigin()() {
    return Object_Getter__string(this._parent, "targetOrigin");
  }
}
struct WindowSessionStorage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto sessionStorage()() {
    return Optional!(Storage)(Object_Getter__OptionalHandle(this.handle, "sessionStorage"));
  }
}


extern (C) int Window_requestAnimationFrame(Handle, FrameRequestCallback);
extern (C) Handle Window_promiseDocumentFlushed(Handle, PromiseDocumentFlushedCallback);
extern (C) uint Window_requestIdleCallback(Handle, IdleRequestCallback, Handle);
extern (C) uint Window_requestIdleCallback_0(Handle, IdleRequestCallback);
extern (C) Handle Window_PerformanceObserver(Handle, PerformanceObserverCallback);