module spasm.bindings.SharedWorker;

import spasm.types;
import spasm.bindings.AbstractWorker;
import spasm.bindings.Blob;
import spasm.bindings.Document;
import spasm.bindings.EventHandler;
import spasm.bindings.EventSource;
import spasm.bindings.EventTarget;
import spasm.bindings.Fetch;
import spasm.bindings.MessagePort;
import spasm.bindings.Worker;
import spasm.bindings.XMLHttpRequest;
import spasm.bindings.XMLHttpRequestEventTarget;
import spasm.bindings.XMLHttpRequestUpload;

@safe:
nothrow:

struct SharedWorker {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return .Worker(SharedWorker_Worker(this._parent, scriptURL, options.handle));
  }
  auto EventSource()(string url, scope ref EventSourceInit eventSourceInitDict) {
    return .EventSource(SharedWorker_EventSource(this._parent, url, eventSourceInitDict.handle));
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


extern (C) Handle SharedWorker_Worker(Handle, string, Handle);
extern (C) Handle SharedWorker_EventSource(Handle, string, Handle);