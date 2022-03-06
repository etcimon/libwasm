module spasm.bindings.WorkerDebuggerGlobalScope;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.Function;
import spasm.bindings.Promise;

@safe:
nothrow:

struct WorkerDebuggerGlobalScope {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto global()() {
    return JsObject(Object_Getter__Handle(this._parent, "global"));
  }
  auto createSandbox()(string name, scope ref JsObject prototype) {
    return JsObject(WorkerDebuggerGlobalScope_createSandbox(this._parent, name, prototype.handle));
  }
  void loadSubScript()(string url, scope ref JsObject sandbox) {
    WorkerDebuggerGlobalScope_loadSubScript(this._parent, url, sandbox.handle);
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
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
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


extern (C) Handle WorkerDebuggerGlobalScope_createSandbox(Handle, string, Handle);
extern (C) void WorkerDebuggerGlobalScope_loadSubScript(Handle, string, Handle);
extern (C) void WorkerDebuggerGlobalScope_setImmediate(Handle, Function);
extern (C) void WorkerDebuggerGlobalScope_setConsoleEventHandler(Handle, bool, AnyCallback);