module libwasm.bindings.WorkerDebuggerGlobalScope;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Function;
import libwasm.bindings.Promise;

@safe:
nothrow:

struct WorkerDebuggerGlobalScope {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto global()() {
    return JsObject(Object_Getter__Handle(this._parent, "global"));
  }
  auto createSandbox()(string name, scope ref JsObject prototype) {
    return JsObject(Serialize_Object_VarArgCall!Handle(this._parent, "createSandbox", "string;Handle", tuple(name, cast(Handle)prototype.handle)));
  }
  void loadSubScript()(string url, scope ref JsObject sandbox) {
    Serialize_Object_VarArgCall!void(this._parent, "loadSubScript", "string;Handle", tuple(url, cast(Handle)sandbox.handle));
  }
  void loadSubScript()(string url) {
    Object_Call_string__void(this._parent, "loadSubScript", url);
  }
  void enterEventLoop()() {
    Object_Call__void(this._parent, "enterEventLoop");
  }
  void leaveEventLoop()() {
    Object_Call__void(this._parent, "leaveEventLoop");
  }
  void postMessage()(string message) {
    Object_Call_string__void(this._parent, "postMessage", message);
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void setImmediate()(Function handler) {
    WorkerDebuggerGlobalScope_setImmediate(this._parent, handler);
  }
  void reportError()(string message) {
    Object_Call_string__void(this._parent, "reportError", message);
  }
  auto retrieveConsoleEvents()() {
    return Sequence!(Any)(Object_Getter__Handle(this._parent, "retrieveConsoleEvents"));
  }
  void setConsoleEventHandler(T0)(scope auto ref Optional!(T0) handler) if (isTOrPointer!(T0, AnyCallback)) {
    WorkerDebuggerGlobalScope_setConsoleEventHandler(this._parent, !handler.empty, handler.front);
  }
  string btoa()(string btoa) {
    return Object_Call_string__string(this._parent, "btoa", btoa);
  }
  string atob()(string atob) {
    return Object_Call_string__string(this._parent, "atob", atob);
  }
  void dump()(string string) {
    Object_Call_string__void(this._parent, "dump", string);
  }
  void dump()() {
    Object_Call__void(this._parent, "dump");
  }
}


extern (C) void WorkerDebuggerGlobalScope_setImmediate(Handle, Function);
extern (C) void WorkerDebuggerGlobalScope_setConsoleEventHandler(Handle, bool, AnyCallback);