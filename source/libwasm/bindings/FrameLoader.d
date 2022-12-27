module libwasm.bindings.FrameLoader;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.ParentSHistory;

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
    return recastOpt!(nsIDocShell)(Object_Getter__OptionalHandle(this.handle, "docShell"));
  }
  auto tabParent()() {
    return recastOpt!(TabParent)(Object_Getter__OptionalHandle(this.handle, "tabParent"));
  }
  auto loadContext()() {
    return LoadContext(Object_Getter__Handle(this.handle, "loadContext"));
  }
  auto browsingContext()() {
    return recastOpt!(BrowsingContext)(Object_Getter__OptionalHandle(this.handle, "browsingContext"));
  }
  auto parentSHistory()() {
    return recastOpt!(ParentSHistory)(Object_Getter__OptionalHandle(this.handle, "parentSHistory"));
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
    Serialize_Object_VarArgCall!void(this.handle, "sendCrossProcessMouseEvent", "string;float;float;int;int;int;bool", tuple(aType, aX, aY, aButton, aClickCount, aModifiers, aIgnoreRootScrollFrame));
  }
  void sendCrossProcessMouseEvent()(string aType, float aX, float aY, int aButton, int aClickCount, int aModifiers) {
    Serialize_Object_VarArgCall!void(this.handle, "sendCrossProcessMouseEvent", "string;float;float;int;int;int", tuple(aType, aX, aY, aButton, aClickCount, aModifiers));
  }
  void activateFrameEvent()(string aType, bool capture) {
    Serialize_Object_VarArgCall!void(this.handle, "activateFrameEvent", "string;bool", tuple(aType, capture));
  }
  auto messageManager()() {
    return recastOpt!(MessageSender)(Object_Getter__OptionalHandle(this.handle, "messageManager"));
  }
  void requestNotifyAfterRemotePaint()() {
    Object_Call__void(this.handle, "requestNotifyAfterRemotePaint");
  }
  void requestUpdatePosition()() {
    Object_Call__void(this.handle, "requestUpdatePosition");
  }
  void print(T2)(uint aOuterWindowID, scope ref nsIPrintSettings aPrintSettings, scope auto ref Optional!(T2) aProgressListener /* = no!(nsIWebProgressListener) */) if (isTOrPointer!(T2, nsIWebProgressListener)) {
    Serialize_Object_VarArgCall!void(this.handle, "print", "uint;Handle;Optional!Handle", tuple(aOuterWindowID, cast(Handle)aPrintSettings.handle, !aProgressListener.empty, cast(Handle)aProgressListener.front.handle));
  }
  void print()(uint aOuterWindowID, scope ref nsIPrintSettings aPrintSettings) {
    Serialize_Object_VarArgCall!void(this.handle, "print", "uint;Handle", tuple(aOuterWindowID, cast(Handle)aPrintSettings.handle));
  }
  auto drawSnapshot()(double x, double y, double w, double h, double scale, string backgroundColor) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this.handle, "drawSnapshot", "double;double;double;double;double;string", tuple(x, y, w, h, scale, backgroundColor)));
  }
  auto ownerElement()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "ownerElement"));
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
    Serialize_Object_VarArgCall!void(this.handle, "startPersistence", "uint;Handle", tuple(aOuterWindowID, cast(Handle)aRecv.handle));
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
    Serialize_Object_VarArgCall!void(this.handle, "startPersistence", "uint;Handle", tuple(aOuterWindowID, cast(Handle)aRecv.handle));
  }
}


