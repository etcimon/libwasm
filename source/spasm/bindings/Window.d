module spasm.bindings.Window;

import spasm.types;
import spasm.bindings.AbortSignal;
import spasm.bindings.BarProp;
import spasm.bindings.Blob;
import spasm.bindings.CSSStyleDeclaration;
import spasm.bindings.CacheStorage;
import spasm.bindings.CloseEvent;
import spasm.bindings.Crypto;
import spasm.bindings.CustomElementRegistry;
import spasm.bindings.CustomEvent;
import spasm.bindings.DOMException;
import spasm.bindings.Document;
import spasm.bindings.Element;
import spasm.bindings.ErrorEvent;
import spasm.bindings.Event;
import spasm.bindings.EventHandler;
import spasm.bindings.EventListener;
import spasm.bindings.EventSource;
import spasm.bindings.EventTarget;
import spasm.bindings.Fetch;
import spasm.bindings.File;
import spasm.bindings.FormData;
import spasm.bindings.Function;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLFormElement;
import spasm.bindings.Headers;
import spasm.bindings.History;
import spasm.bindings.IDBFactory;
import spasm.bindings.IDBVersionChangeEvent;
import spasm.bindings.IdleDeadline;
import spasm.bindings.ImageBitmap;
import spasm.bindings.InstallTrigger;
import spasm.bindings.IntlUtils;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.Location;
import spasm.bindings.MediaQueryList;
import spasm.bindings.MessageEvent;
import spasm.bindings.MessagePort;
import spasm.bindings.Navigator;
import spasm.bindings.Notification;
import spasm.bindings.OfflineResourceList;
import spasm.bindings.Performance;
import spasm.bindings.PerformanceObserver;
import spasm.bindings.ProgressEvent;
import spasm.bindings.PromiseRejectionEvent;
import spasm.bindings.Request;
import spasm.bindings.Response;
import spasm.bindings.Screen;
import spasm.bindings.Selection;
import spasm.bindings.Storage;
import spasm.bindings.TextDecoder;
import spasm.bindings.TextEncoder;
import spasm.bindings.U2F;
import spasm.bindings.URLSearchParams;
import spasm.bindings.VisualViewport;
import spasm.bindings.WebGLContextEvent;
import spasm.bindings.WebGPU;
import spasm.bindings.WebSocket;
import spasm.bindings.WindowOrWorkerGlobalScope;
import spasm.bindings.WindowRoot;
import spasm.bindings.Worker;
import spasm.bindings.Worklet;
import spasm.bindings.XMLHttpRequest;
import spasm.bindings.XMLHttpRequestEventTarget;
import spasm.bindings.XMLHttpRequestUpload;

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
    return IdleRequestOptions(spasm_add__object());
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
    return ScrollOptions(spasm_add__object());
  }
  void behavior()(ScrollBehavior behavior) {
    ScrollOptions_behavior_Set(this.handle, behavior);
  }
  ScrollBehavior behavior()() {
    return ScrollOptions_behavior_Get(this.handle);
  }
}
struct ScrollToOptions {
  nothrow:
  spasm.bindings.Window.ScrollOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ScrollOptions(h);
  }
  static auto create() {
    return ScrollToOptions(spasm_add__object());
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
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return Object_Getter__OptionalHandle(this._parent, "document");
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
    return Object_Getter__OptionalHandle(this._parent, "top");
  }
  void opener()(scope ref Any opener) {
    Object_Call_Handle__void(this._parent, "opener", opener.handle);
  }
  auto opener()() {
    return Any(Object_Getter__Handle(this._parent, "opener"));
  }
  auto parent()() {
    return Object_Getter__OptionalHandle(this._parent, "parent");
  }
  auto frameElement()() {
    return Object_Getter__OptionalHandle(this._parent, "frameElement");
  }
  auto open()(string url /* = "" */, string target /* = "" */, string features /* = "" */) {
    return Window_open(this._parent, url, target, features);
  }
  auto open()(string url /* = "" */, string target /* = "" */) {
    return Window_open_0(this._parent, url, target);
  }
  auto open()(string url /* = "" */) {
    return Object_Call_string__OptionalHandle(this._parent, "open", url);
  }
  auto open()() {
    return Object_Getter__OptionalHandle(this._parent, "open");
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
    return Window_prompt(this._parent, message, default_);
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
    Window_postMessage__Handle_string_sequence(this._parent, _handle_message, targetOrigin, transfer.handle);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, string targetOrigin) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Window_postMessage_0_Handle_string(this._parent, _handle_message, targetOrigin);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref WindowPostMessageOptions options) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Window_postMessage__Handle_Handle(this._parent, _handle_message, options._parent);
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
    return Object_Getter__OptionalHandle(this._parent, "getSelection");
  }
  auto getComputedStyle()(scope ref Element elt, string pseudoElt /* = "" */) {
    return Window_getComputedStyle(this._parent, elt._parent, pseudoElt);
  }
  auto getComputedStyle()(scope ref Element elt) {
    return Window_getComputedStyle_0(this._parent, elt._parent);
  }
  auto matchMedia()(string query) {
    return Object_Call_string__OptionalHandle(this._parent, "matchMedia", query);
  }
  auto screen()() {
    return Screen(Object_Getter__Handle(this._parent, "screen"));
  }
  void moveTo()(int x, int y) {
    Window_moveTo(this._parent, x, y);
  }
  void moveBy()(int x, int y) {
    Window_moveBy(this._parent, x, y);
  }
  void resizeTo()(int x, int y) {
    Window_resizeTo(this._parent, x, y);
  }
  void resizeBy()(int x, int y) {
    Window_resizeBy(this._parent, x, y);
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
    return Object_Getter__OptionalHandle(this._parent, "performance");
  }
  auto getDefaultComputedStyle()(scope ref Element elt, string pseudoElt /* = "" */) {
    return Window_getDefaultComputedStyle(this._parent, elt._parent, pseudoElt);
  }
  auto getDefaultComputedStyle()(scope ref Element elt) {
    return Window_getDefaultComputedStyle_0(this._parent, elt._parent);
  }
  void scrollByLines()(int numLines, scope ref ScrollOptions options) {
    Window_scrollByLines(this._parent, numLines, options.handle);
  }
  void scrollByLines()(int numLines) {
    Object_Call_int__void(this._parent, "scrollByLines", numLines);
  }
  void scrollByPages()(int numPages, scope ref ScrollOptions options) {
    Window_scrollByPages(this._parent, numPages, options.handle);
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
    return Object_Getter__OptionalHandle(this._parent, "realFrameElement");
  }
  auto docShell()() {
    return Object_Getter__OptionalHandle(this._parent, "docShell");
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
    Window_updateCommands(this._parent, action, !sel.empty, sel.front.handle, reason);
  }
  void updateCommands(T1)(string action, scope auto ref Optional!(T1) sel /* = no!(Selection) */) if (isTOrPointer!(T1, Selection)) {
    Window_updateCommands_0(this._parent, action, !sel.empty, sel.front.handle);
  }
  void updateCommands()(string action) {
    Object_Call_string__void(this._parent, "updateCommands", action);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */, bool searchInFrames /* = false */, bool showDialog /* = false */) {
    return Window_find(this._parent, str, caseSensitive, backwards, wrapAround, wholeWord, searchInFrames, showDialog);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */, bool searchInFrames /* = false */) {
    return Window_find_0(this._parent, str, caseSensitive, backwards, wrapAround, wholeWord, searchInFrames);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */, bool wholeWord /* = false */) {
    return Window_find_1(this._parent, str, caseSensitive, backwards, wrapAround, wholeWord);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */, bool wrapAround /* = false */) {
    return Window_find_2(this._parent, str, caseSensitive, backwards, wrapAround);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */, bool backwards /* = false */) {
    return Window_find_3(this._parent, str, caseSensitive, backwards);
  }
  bool find()(string str /* = "" */, bool caseSensitive /* = false */) {
    return Window_find_4(this._parent, str, caseSensitive);
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
    auto result = Window_openDialog(this._parent, url, name, options, _handle_extraArguments);
    dropHandle!(T3)(_handle_extraArguments);
    return result;
  }
  auto content()() {
    return Object_Getter__OptionalHandle(this._parent, "content");
  }
  auto getInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = Any(Object_Call_Handle__Handle(this._parent, "getInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
  auto windowRoot()() {
    return Object_Getter__OptionalHandle(this._parent, "windowRoot");
  }
  bool shouldReportForServiceWorkerScope()(string aScope) {
    return Object_Call_string__bool(this._parent, "shouldReportForServiceWorkerScope", aScope);
  }
  auto InstallTrigger()() {
    return Object_Getter__OptionalHandle(this._parent, "InstallTrigger");
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
    Window_browserDOMWindow_Set(this._parent, !browserDOMWindow.empty, browserDOMWindow.front.handle);
  }
  auto browserDOMWindow()() {
    return Object_Getter__OptionalHandle(this._parent, "browserDOMWindow");
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
    return Promise!(Any)(Window_promiseDocumentFlushed(this._parent, callback));
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
    return Object_Getter__OptionalHandle(this._parent, "sessionStorage");
  }
  auto localStorage()() {
    return Object_Getter__OptionalHandle(this._parent, "localStorage");
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
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource(this._parent, aImage));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource_int_int_int_int(this._parent, aImage, aSx, aSy, aSw, aSh));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return Promise!(.Response)(WindowOrWorkerGlobalScope_fetch(this._parent, input, init.handle));
  }
  auto fetch()(scope ref RequestInfo input) {
    return Promise!(.Response)(WindowOrWorkerGlobalScope_fetch_0(this._parent, input));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this._parent, "isSecureContext");
  }
  auto indexedDB()() {
    return Object_Getter__OptionalHandle(this._parent, "indexedDB");
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
    return .Worker(Window_Worker(this._parent, scriptURL, options.handle));
  }
  auto EventSource()(string url, scope ref EventSourceInit eventSourceInitDict) {
    return .EventSource(Window_EventSource(this._parent, url, eventSourceInitDict.handle));
  }
  auto Headers()(scope ref HeadersInit init) {
    return .Headers(Window_Headers(this._parent, init));
  }
  auto BroadcastChannel()(string channel) {
    return .BroadcastChannel(Object_Call_string__Handle(this._parent, "BroadcastChannel", channel));
  }
  auto Event()(string type, scope ref EventInit eventInitDict) {
    return .Event(Window_Event(this._parent, type, eventInitDict.handle));
  }
  auto Blob()(scope ref Sequence!(BlobPart) blobParts, scope ref BlobPropertyBag options) {
    return .Blob(Window_Blob(this._parent, blobParts.handle, options.handle));
  }
  auto WebGLContextEvent()(string type, scope ref WebGLContextEventInit eventInit) {
    return .WebGLContextEvent(Window_WebGLContextEvent(this._parent, type, eventInit._parent));
  }
  auto URL()(string url, string base) {
    return .URL(Object_Call_string_string__Handle(this._parent, "URL", url, base));
  }
  auto MessageEvent()(string type, scope ref MessageEventInit eventInitDict) {
    return .MessageEvent(Window_MessageEvent(this._parent, type, eventInitDict._parent));
  }
  auto CloseEvent()(string type, scope ref CloseEventInit eventInitDict) {
    return .CloseEvent(Window_CloseEvent(this._parent, type, eventInitDict._parent));
  }
  auto Notification()(string title, scope ref NotificationOptions options) {
    return .Notification(Window_Notification(this._parent, title, options.handle));
  }
  auto IDBVersionChangeEvent()(string type, scope ref IDBVersionChangeEventInit eventInitDict) {
    return .IDBVersionChangeEvent(Window_IDBVersionChangeEvent(this._parent, type, eventInitDict._parent));
  }
  auto ErrorEvent()(string type, scope ref ErrorEventInit eventInitDict) {
    return .ErrorEvent(Window_ErrorEvent(this._parent, type, eventInitDict._parent));
  }
  auto DOMError()(string name, string message /* = "" */) {
    return .DOMError(Object_Call_string_string__Handle(this._parent, "DOMError", name, message));
  }
  auto File()(scope ref Sequence!(BlobPart) fileBits, string fileName, scope ref FilePropertyBag options) {
    return .File(Window_File(this._parent, fileBits.handle, fileName, options._parent));
  }
  auto ProgressEvent()(string type, scope ref ProgressEventInit eventInitDict) {
    return .ProgressEvent(Window_ProgressEvent(this._parent, type, eventInitDict._parent));
  }
  auto Response(T0)(scope auto ref Optional!(T0) body_, scope ref ResponseInit init) if (isTOrPointer!(T0, SumType!(.Blob, BufferSource, .FormData, .URLSearchParams, ReadableStream, string))) {
    return .Response(Window_Response(this._parent, !body_.empty, *body_.frontRef, init.handle));
  }
  auto TextDecoder()(string label /* = "utf-8" */, scope ref TextDecoderOptions options) {
    return .TextDecoder(Window_TextDecoder(this._parent, label, options.handle));
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
    return .WebSocket(Window_WebSocket__string_sequence(this._parent, url, protocols.handle));
  }
  auto StructuredCloneTester()(bool serializable, bool deserializable) {
    return .StructuredCloneTester(Window_StructuredCloneTester(this._parent, serializable, deserializable));
  }
  auto PerformanceObserver()(PerformanceObserverCallback callback) {
    return .PerformanceObserver(Window_PerformanceObserver(this._parent, callback));
  }
  auto PromiseRejectionEvent()(string type, scope ref PromiseRejectionEventInit eventInitDict) {
    return .PromiseRejectionEvent(Window_PromiseRejectionEvent(this._parent, type, eventInitDict._parent));
  }
  auto AbortController()() {
    return .AbortController(Object_Getter__Handle(this._parent, "AbortController"));
  }
  auto MessageChannel()() {
    return .MessageChannel(Object_Getter__Handle(this._parent, "MessageChannel"));
  }
  auto CustomEvent()(string type, scope ref CustomEventInit eventInitDict) {
    return .CustomEvent(Window_CustomEvent(this._parent, type, eventInitDict._parent));
  }
  auto TestingDeprecatedInterface()() {
    return .TestingDeprecatedInterface(Object_Getter__Handle(this._parent, "TestingDeprecatedInterface"));
  }
  auto URLSearchParams()(scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string) init /* = "" */) {
    return .URLSearchParams(Window_URLSearchParams(this._parent, init));
  }
  auto XMLHttpRequest()(scope ref MozXMLHttpRequestParameters params) {
    return .XMLHttpRequest(Object_Call_Handle__Handle(this._parent, "XMLHttpRequest", params.handle));
  }
  auto XMLHttpRequest()(string ignored) {
    return .XMLHttpRequest(Object_Call_string__Handle(this._parent, "XMLHttpRequest", ignored));
  }
  auto ImageData()(uint sw, uint sh) {
    return .ImageData(Window_ImageData__uint_uint(this._parent, sw, sh));
  }
  auto ImageData()(scope ref Uint8ClampedArray data, uint sw, uint sh) {
    return .ImageData(Window_ImageData__Handle_uint_uint(this._parent, data.handle, sw, sh));
  }
  auto FormData()(scope ref HTMLFormElement form) {
    return .FormData(Object_Call_Handle__Handle(this._parent, "FormData", form._parent));
  }
  auto DOMException()(string message /* = "" */, string name) {
    return .DOMException(Object_Call_string_string__Handle(this._parent, "DOMException", message, name));
  }
  auto Request()(scope ref RequestInfo input, scope ref RequestInit init) {
    return .Request(Window_Request(this._parent, input, init.handle));
  }
  auto OffscreenCanvas()(uint width, uint height) {
    return .OffscreenCanvas(Window_OffscreenCanvas(this._parent, width, height));
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
    return Object_Getter__OptionalHandle(this.handle, "localStorage");
  }
}
struct WindowPostMessageOptions {
  nothrow:
  spasm.bindings.MessagePort.PostMessageOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PostMessageOptions(h);
  }
  static auto create() {
    return WindowPostMessageOptions(spasm_add__object());
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
    return Object_Getter__OptionalHandle(this.handle, "sessionStorage");
  }
}


extern (C) void ScrollOptions_behavior_Set(Handle, ScrollBehavior);
extern (C) ScrollBehavior ScrollOptions_behavior_Get(Handle);
extern (C) Optional!(WindowProxy) Window_open(Handle, string, string, string);
extern (C) Optional!(WindowProxy) Window_open_0(Handle, string, string);
extern (C) Optional!(string) Window_prompt(Handle, string, string);
extern (C) void Window_postMessage__Handle_string_sequence(Handle, Handle, string, Handle);
extern (C) void Window_postMessage_0_Handle_string(Handle, Handle, string);
extern (C) void Window_postMessage__Handle_Handle(Handle, Handle, Handle);
extern (C) Optional!(CSSStyleDeclaration) Window_getComputedStyle(Handle, Handle, string);
extern (C) Optional!(CSSStyleDeclaration) Window_getComputedStyle_0(Handle, Handle);
extern (C) void Window_moveTo(Handle, int, int);
extern (C) void Window_moveBy(Handle, int, int);
extern (C) void Window_resizeTo(Handle, int, int);
extern (C) void Window_resizeBy(Handle, int, int);
extern (C) int Window_requestAnimationFrame(Handle, FrameRequestCallback);
extern (C) Optional!(CSSStyleDeclaration) Window_getDefaultComputedStyle(Handle, Handle, string);
extern (C) Optional!(CSSStyleDeclaration) Window_getDefaultComputedStyle_0(Handle, Handle);
extern (C) void Window_scrollByLines(Handle, int, Handle);
extern (C) void Window_scrollByPages(Handle, int, Handle);
extern (C) void Window_updateCommands(Handle, string, bool, Handle, short);
extern (C) void Window_updateCommands_0(Handle, string, bool, Handle);
extern (C) bool Window_find(Handle, string, bool, bool, bool, bool, bool, bool);
extern (C) bool Window_find_0(Handle, string, bool, bool, bool, bool, bool);
extern (C) bool Window_find_1(Handle, string, bool, bool, bool, bool);
extern (C) bool Window_find_2(Handle, string, bool, bool, bool);
extern (C) bool Window_find_3(Handle, string, bool, bool);
extern (C) bool Window_find_4(Handle, string, bool);
extern (C) Optional!(WindowProxy) Window_openDialog(Handle, string, string, string, Handle);
extern (C) void Window_browserDOMWindow_Set(Handle, bool, Handle);
extern (C) Handle Window_promiseDocumentFlushed(Handle, PromiseDocumentFlushedCallback);
extern (C) uint Window_requestIdleCallback(Handle, IdleRequestCallback, Handle);
extern (C) uint Window_requestIdleCallback_0(Handle, IdleRequestCallback);
extern (C) Handle Window_Worker(Handle, string, Handle);
extern (C) Handle Window_EventSource(Handle, string, Handle);
extern (C) Handle Window_Headers(Handle, scope ref HeadersInit);
extern (C) Handle Window_Event(Handle, string, Handle);
extern (C) Handle Window_Blob(Handle, Handle, Handle);
extern (C) Handle Window_WebGLContextEvent(Handle, string, Handle);
extern (C) Handle Window_MessageEvent(Handle, string, Handle);
extern (C) Handle Window_CloseEvent(Handle, string, Handle);
extern (C) Handle Window_Notification(Handle, string, Handle);
extern (C) Handle Window_IDBVersionChangeEvent(Handle, string, Handle);
extern (C) Handle Window_ErrorEvent(Handle, string, Handle);
extern (C) Handle Window_File(Handle, Handle, string, Handle);
extern (C) Handle Window_ProgressEvent(Handle, string, Handle);
extern (C) Handle Window_Response(Handle, bool, scope ref SumType!(Blob, BufferSource, FormData, URLSearchParams, ReadableStream, string), Handle);
extern (C) Handle Window_TextDecoder(Handle, string, Handle);
extern (C) Handle Window_WebSocket__string_sequence(Handle, string, Handle);
extern (C) Handle Window_StructuredCloneTester(Handle, bool, bool);
extern (C) Handle Window_PerformanceObserver(Handle, PerformanceObserverCallback);
extern (C) Handle Window_PromiseRejectionEvent(Handle, string, Handle);
extern (C) Handle Window_CustomEvent(Handle, string, Handle);
extern (C) Handle Window_URLSearchParams(Handle, scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string));
extern (C) Handle Window_ImageData__uint_uint(Handle, uint, uint);
extern (C) Handle Window_ImageData__Handle_uint_uint(Handle, Handle, uint, uint);
extern (C) Handle Window_Request(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Window_OffscreenCanvas(Handle, uint, uint);