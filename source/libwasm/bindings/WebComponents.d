module libwasm.bindings.WebComponents;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Document;

@safe:
nothrow:

alias LifecycleAdoptedCallback = void delegate(Optional!(Document), Optional!(Document));
alias LifecycleAttributeChangedCallback = void delegate(string, Optional!(string), Optional!(string), Optional!(string));
struct LifecycleCallbacks {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return LifecycleCallbacks(libwasm_add__object());
  }
  void connectedCallback()(LifecycleConnectedCallback connectedCallback) {
    LifecycleCallbacks_connectedCallback_Set(this.handle, connectedCallback);
  }
  LifecycleConnectedCallback connectedCallback()() {
    return LifecycleCallbacks_connectedCallback_Get(this.handle);
  }
  void disconnectedCallback()(LifecycleDisconnectedCallback disconnectedCallback) {
    LifecycleCallbacks_disconnectedCallback_Set(this.handle, disconnectedCallback);
  }
  LifecycleDisconnectedCallback disconnectedCallback()() {
    return LifecycleCallbacks_disconnectedCallback_Get(this.handle);
  }
  void adoptedCallback()(LifecycleAdoptedCallback adoptedCallback) {
    LifecycleCallbacks_adoptedCallback_Set(this.handle, adoptedCallback);
  }
  LifecycleAdoptedCallback adoptedCallback()() {
    return LifecycleCallbacks_adoptedCallback_Get(this.handle);
  }
  void attributeChangedCallback()(LifecycleAttributeChangedCallback attributeChangedCallback) {
    LifecycleCallbacks_attributeChangedCallback_Set(this.handle, attributeChangedCallback);
  }
  LifecycleAttributeChangedCallback attributeChangedCallback()() {
    return LifecycleCallbacks_attributeChangedCallback_Get(this.handle);
  }
  void getCustomInterfaceCallback()(LifecycleGetCustomInterfaceCallback getCustomInterfaceCallback) {
    LifecycleCallbacks_getCustomInterfaceCallback_Set(this.handle, getCustomInterfaceCallback);
  }
  LifecycleGetCustomInterfaceCallback getCustomInterfaceCallback()() {
    return LifecycleCallbacks_getCustomInterfaceCallback_Get(this.handle);
  }
}
alias LifecycleConnectedCallback = void delegate();
alias LifecycleDisconnectedCallback = void delegate();
alias LifecycleGetCustomInterfaceCallback = Optional!(JsObject) delegate(Any);


extern (C) void LifecycleCallbacks_connectedCallback_Set(Handle, LifecycleConnectedCallback);
extern (C) LifecycleConnectedCallback LifecycleCallbacks_connectedCallback_Get(Handle);
extern (C) void LifecycleCallbacks_disconnectedCallback_Set(Handle, LifecycleDisconnectedCallback);
extern (C) LifecycleDisconnectedCallback LifecycleCallbacks_disconnectedCallback_Get(Handle);
extern (C) void LifecycleCallbacks_adoptedCallback_Set(Handle, LifecycleAdoptedCallback);
extern (C) LifecycleAdoptedCallback LifecycleCallbacks_adoptedCallback_Get(Handle);
extern (C) void LifecycleCallbacks_attributeChangedCallback_Set(Handle, LifecycleAttributeChangedCallback);
extern (C) LifecycleAttributeChangedCallback LifecycleCallbacks_attributeChangedCallback_Get(Handle);
extern (C) void LifecycleCallbacks_getCustomInterfaceCallback_Set(Handle, LifecycleGetCustomInterfaceCallback);
extern (C) LifecycleGetCustomInterfaceCallback LifecycleCallbacks_getCustomInterfaceCallback_Get(Handle);