module spasm.bindings.BrowserElement;

import spasm.types;
@safe:
nothrow:

struct BrowserElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void sendMouseEvent()(string type, uint x, uint y, uint button, uint clickCount, uint modifiers) {
    BrowserElementPrivileged_sendMouseEvent(this.handle, type, x, y, button, clickCount, modifiers);
  }
  void goBack()() {
    Object_Call__void(this.handle, "goBack");
  }
  void goForward()() {
    Object_Call__void(this.handle, "goForward");
  }
  void reload()(bool hardReload /* = false */) {
    Object_Call_bool__void(this.handle, "reload", hardReload);
  }
  void reload()() {
    Object_Call__void(this.handle, "reload");
  }
  void stop()() {
    Object_Call__void(this.handle, "stop");
  }
  auto getCanGoBack()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "getCanGoBack"));
  }
  auto getCanGoForward()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "getCanGoForward"));
  }
}
struct BrowserElementPrivileged {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void sendMouseEvent()(string type, uint x, uint y, uint button, uint clickCount, uint modifiers) {
    BrowserElementPrivileged_sendMouseEvent(this.handle, type, x, y, button, clickCount, modifiers);
  }
  void goBack()() {
    Object_Call__void(this.handle, "goBack");
  }
  void goForward()() {
    Object_Call__void(this.handle, "goForward");
  }
  void reload()(bool hardReload /* = false */) {
    Object_Call_bool__void(this.handle, "reload", hardReload);
  }
  void reload()() {
    Object_Call__void(this.handle, "reload");
  }
  void stop()() {
    Object_Call__void(this.handle, "stop");
  }
  auto getCanGoBack()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "getCanGoBack"));
  }
  auto getCanGoForward()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "getCanGoForward"));
  }
}


extern (C) void BrowserElementPrivileged_sendMouseEvent(Handle, string, uint, uint, uint, uint, uint);