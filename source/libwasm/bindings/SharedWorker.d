module libwasm.bindings.SharedWorker;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AbstractWorker;
import libwasm.bindings.Blob;
import libwasm.bindings.Document;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventSource;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Fetch;
import libwasm.bindings.MessagePort;
import libwasm.bindings.Worker;
import libwasm.bindings.XMLHttpRequest;
import libwasm.bindings.XMLHttpRequestEventTarget;
import libwasm.bindings.XMLHttpRequestUpload;

@safe:
nothrow:

struct SharedWorker {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto port()() {
    return MessagePort(Object_Getter__Handle(this._parent, "port"));
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
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
  auto FileReaderSync()() {
    return .FileReaderSync(Object_Getter__Handle(this._parent, "FileReaderSync"));
  }
  auto XMLHttpRequest()(scope ref MozXMLHttpRequestParameters params) {
    return .XMLHttpRequest(Object_Call_Handle__Handle(this._parent, "XMLHttpRequest", params.handle));
  }
  auto XMLHttpRequest()(string ignored) {
    return .XMLHttpRequest(Object_Call_string__Handle(this._parent, "XMLHttpRequest", ignored));
  }
}


