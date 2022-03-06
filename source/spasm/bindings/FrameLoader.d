module spasm.bindings.FrameLoader;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.ImageBitmap;
import spasm.bindings.ParentSHistory;

@safe:
nothrow:

struct FrameLoader {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto docShell()() {
    return Object_Getter__OptionalHandle(this.handle, "docShell");
  }
  auto tabParent()() {
    return Object_Getter__OptionalHandle(this.handle, "tabParent");
  }
  auto loadContext()() {
    return LoadContext(Object_Getter__Handle(this.handle, "loadContext"));
  }
  auto browsingContext()() {
    return Object_Getter__OptionalHandle(this.handle, "browsingContext");
  }
  auto parentSHistory()() {
    return Object_Getter__OptionalHandle(this.handle, "parentSHistory");
  }
  bool depthTooGreat()() {
    return Object_Getter__bool(this.handle, "depthTooGreat");
  }
  void activateRemoteFrame()() {
    Object_Call__void(this.handle, "activateRemoteFrame");
  }
  void deactivateRemoteFrame()() {
    Object_Call__void(this.handle, "deactivateRemoteFrame");
  }
  void sendCrossProcessMouseEvent()(string aType, float aX, float aY, int aButton, int aClickCount, int aModifiers, bool aIgnoreRootScrollFrame /* = false */) {
    FrameLoader_sendCrossProcessMouseEvent(this.handle, aType, aX, aY, aButton, aClickCount, aModifiers, aIgnoreRootScrollFrame);
  }
  void sendCrossProcessMouseEvent()(string aType, float aX, float aY, int aButton, int aClickCount, int aModifiers) {
    FrameLoader_sendCrossProcessMouseEvent_0(this.handle, aType, aX, aY, aButton, aClickCount, aModifiers);
  }
  void activateFrameEvent()(string aType, bool capture) {
    FrameLoader_activateFrameEvent(this.handle, aType, capture);
  }
  auto messageManager()() {
    return Object_Getter__OptionalHandle(this.handle, "messageManager");
  }
  void requestNotifyAfterRemotePaint()() {
    Object_Call__void(this.handle, "requestNotifyAfterRemotePaint");
  }
  void requestUpdatePosition()() {
    Object_Call__void(this.handle, "requestUpdatePosition");
  }
  void print(T2)(uint aOuterWindowID, scope ref nsIPrintSettings aPrintSettings, scope auto ref Optional!(T2) aProgressListener /* = no!(nsIWebProgressListener) */) if (isTOrPointer!(T2, nsIWebProgressListener)) {
    FrameLoader_print(this.handle, aOuterWindowID, aPrintSettings.handle, !aProgressListener.empty, aProgressListener.front.handle);
  }
  void print()(uint aOuterWindowID, scope ref nsIPrintSettings aPrintSettings) {
    FrameLoader_print_0(this.handle, aOuterWindowID, aPrintSettings.handle);
  }
  auto drawSnapshot()(double x, double y, double w, double h, double scale, string backgroundColor) {
    return Promise!(ImageBitmap)(FrameLoader_drawSnapshot(this.handle, x, y, w, h, scale, backgroundColor));
  }
  auto ownerElement()() {
    return Object_Getter__OptionalHandle(this.handle, "ownerElement");
  }
  uint childID()() {
    return Object_Getter__uint(this.handle, "childID");
  }
  bool ownerIsMozBrowserFrame()() {
    return Object_Getter__bool(this.handle, "ownerIsMozBrowserFrame");
  }
  uint lazyWidth()() {
    return Object_Getter__uint(this.handle, "lazyWidth");
  }
  uint lazyHeight()() {
    return Object_Getter__uint(this.handle, "lazyHeight");
  }
  bool isDead()() {
    return Object_Getter__bool(this.handle, "isDead");
  }
  void startPersistence()(uint aOuterWindowID, scope ref nsIWebBrowserPersistDocumentReceiver aRecv) {
    WebBrowserPersistable_startPersistence(this.handle, aOuterWindowID, aRecv.handle);
  }
}
struct WebBrowserPersistable {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void startPersistence()(uint aOuterWindowID, scope ref nsIWebBrowserPersistDocumentReceiver aRecv) {
    WebBrowserPersistable_startPersistence(this.handle, aOuterWindowID, aRecv.handle);
  }
}


extern (C) void FrameLoader_sendCrossProcessMouseEvent(Handle, string, float, float, int, int, int, bool);
extern (C) void FrameLoader_sendCrossProcessMouseEvent_0(Handle, string, float, float, int, int, int);
extern (C) void FrameLoader_activateFrameEvent(Handle, string, bool);
extern (C) void FrameLoader_print(Handle, uint, Handle, bool, Handle);
extern (C) void FrameLoader_print_0(Handle, uint, Handle);
extern (C) Handle FrameLoader_drawSnapshot(Handle, double, double, double, double, double, string);
extern (C) void WebBrowserPersistable_startPersistence(Handle, uint, Handle);