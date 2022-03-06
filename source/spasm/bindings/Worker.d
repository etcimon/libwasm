module spasm.bindings.Worker;

import spasm.types;
import spasm.bindings.AbortSignal;
import spasm.bindings.AbstractWorker;
import spasm.bindings.Blob;
import spasm.bindings.CloseEvent;
import spasm.bindings.CustomEvent;
import spasm.bindings.DOMException;
import spasm.bindings.ErrorEvent;
import spasm.bindings.Event;
import spasm.bindings.EventHandler;
import spasm.bindings.EventListener;
import spasm.bindings.EventTarget;
import spasm.bindings.File;
import spasm.bindings.FormData;
import spasm.bindings.HTMLFormElement;
import spasm.bindings.Headers;
import spasm.bindings.IDBVersionChangeEvent;
import spasm.bindings.ImageBitmap;
import spasm.bindings.MessageEvent;
import spasm.bindings.MessagePort;
import spasm.bindings.Notification;
import spasm.bindings.Performance;
import spasm.bindings.PerformanceObserver;
import spasm.bindings.ProgressEvent;
import spasm.bindings.PromiseRejectionEvent;
import spasm.bindings.Request;
import spasm.bindings.Response;
import spasm.bindings.TextDecoder;
import spasm.bindings.TextEncoder;
import spasm.bindings.URLSearchParams;
import spasm.bindings.WebGLContextEvent;
import spasm.bindings.WebSocket;

@safe:
nothrow:

struct ChromeWorker {
  nothrow:
  spasm.bindings.Worker.Worker _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Worker(h);
  }
}
struct Worker {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void terminate()() {
    Object_Call__void(this._parent, "terminate");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transfer) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Worker_postMessage__Handle_sequence(this._parent, _handle_message, transfer.handle);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions aOptions) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Worker_postMessage__Handle_Handle(this._parent, _handle_message, aOptions.handle);
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
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  auto Headers()(scope ref HeadersInit init) {
    return .Headers(Worker_Headers(this._parent, init));
  }
  auto BroadcastChannel()(string channel) {
    return .BroadcastChannel(Object_Call_string__Handle(this._parent, "BroadcastChannel", channel));
  }
  auto Event()(string type, scope ref EventInit eventInitDict) {
    return .Event(Worker_Event(this._parent, type, eventInitDict.handle));
  }
  auto Blob()(scope ref Sequence!(BlobPart) blobParts, scope ref BlobPropertyBag options) {
    return .Blob(Worker_Blob(this._parent, blobParts.handle, options.handle));
  }
  auto WebGLContextEvent()(string type, scope ref WebGLContextEventInit eventInit) {
    return .WebGLContextEvent(Worker_WebGLContextEvent(this._parent, type, eventInit._parent));
  }
  auto URL()(string url, string base) {
    return .URL(Object_Call_string_string__Handle(this._parent, "URL", url, base));
  }
  auto MessageEvent()(string type, scope ref MessageEventInit eventInitDict) {
    return .MessageEvent(Worker_MessageEvent(this._parent, type, eventInitDict._parent));
  }
  auto CloseEvent()(string type, scope ref CloseEventInit eventInitDict) {
    return .CloseEvent(Worker_CloseEvent(this._parent, type, eventInitDict._parent));
  }
  auto Notification()(string title, scope ref NotificationOptions options) {
    return .Notification(Worker_Notification(this._parent, title, options.handle));
  }
  auto IDBVersionChangeEvent()(string type, scope ref IDBVersionChangeEventInit eventInitDict) {
    return .IDBVersionChangeEvent(Worker_IDBVersionChangeEvent(this._parent, type, eventInitDict._parent));
  }
  auto ErrorEvent()(string type, scope ref ErrorEventInit eventInitDict) {
    return .ErrorEvent(Worker_ErrorEvent(this._parent, type, eventInitDict._parent));
  }
  auto DOMError()(string name, string message /* = "" */) {
    return .DOMError(Object_Call_string_string__Handle(this._parent, "DOMError", name, message));
  }
  auto File()(scope ref Sequence!(BlobPart) fileBits, string fileName, scope ref FilePropertyBag options) {
    return .File(Worker_File(this._parent, fileBits.handle, fileName, options._parent));
  }
  auto ProgressEvent()(string type, scope ref ProgressEventInit eventInitDict) {
    return .ProgressEvent(Worker_ProgressEvent(this._parent, type, eventInitDict._parent));
  }
  auto Response(T0)(scope auto ref Optional!(T0) body_, scope ref ResponseInit init) if (isTOrPointer!(T0, SumType!(.Blob, BufferSource, .FormData, .URLSearchParams, ReadableStream, string))) {
    return .Response(Worker_Response(this._parent, !body_.empty, *body_.frontRef, init.handle));
  }
  auto TextDecoder()(string label /* = "utf-8" */, scope ref TextDecoderOptions options) {
    return .TextDecoder(Worker_TextDecoder(this._parent, label, options.handle));
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
    return .WebSocket(Worker_WebSocket__string_sequence(this._parent, url, protocols.handle));
  }
  auto StructuredCloneTester()(bool serializable, bool deserializable) {
    return .StructuredCloneTester(Worker_StructuredCloneTester(this._parent, serializable, deserializable));
  }
  auto PerformanceObserver()(PerformanceObserverCallback callback) {
    return .PerformanceObserver(Worker_PerformanceObserver(this._parent, callback));
  }
  auto PromiseRejectionEvent()(string type, scope ref PromiseRejectionEventInit eventInitDict) {
    return .PromiseRejectionEvent(Worker_PromiseRejectionEvent(this._parent, type, eventInitDict._parent));
  }
  auto AbortController()() {
    return .AbortController(Object_Getter__Handle(this._parent, "AbortController"));
  }
  auto MessageChannel()() {
    return .MessageChannel(Object_Getter__Handle(this._parent, "MessageChannel"));
  }
  auto CustomEvent()(string type, scope ref CustomEventInit eventInitDict) {
    return .CustomEvent(Worker_CustomEvent(this._parent, type, eventInitDict._parent));
  }
  auto URLSearchParams()(scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string) init /* = "" */) {
    return .URLSearchParams(Worker_URLSearchParams(this._parent, init));
  }
  auto ImageData()(uint sw, uint sh) {
    return .ImageData(Worker_ImageData__uint_uint(this._parent, sw, sh));
  }
  auto ImageData()(scope ref Uint8ClampedArray data, uint sw, uint sh) {
    return .ImageData(Worker_ImageData__Handle_uint_uint(this._parent, data.handle, sw, sh));
  }
  auto FormData()(scope ref HTMLFormElement form) {
    return .FormData(Object_Call_Handle__Handle(this._parent, "FormData", form._parent));
  }
  auto DOMException()(string message /* = "" */, string name) {
    return .DOMException(Object_Call_string_string__Handle(this._parent, "DOMException", message, name));
  }
  auto Request()(scope ref RequestInfo input, scope ref RequestInit init) {
    return .Request(Worker_Request(this._parent, input, init.handle));
  }
  auto OffscreenCanvas()(uint width, uint height) {
    return .OffscreenCanvas(Worker_OffscreenCanvas(this._parent, width, height));
  }
}
struct WorkerOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WorkerOptions(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}


extern (C) void Worker_postMessage__Handle_sequence(Handle, Handle, Handle);
extern (C) void Worker_postMessage__Handle_Handle(Handle, Handle, Handle);
extern (C) Handle Worker_Headers(Handle, scope ref HeadersInit);
extern (C) Handle Worker_Event(Handle, string, Handle);
extern (C) Handle Worker_Blob(Handle, Handle, Handle);
extern (C) Handle Worker_WebGLContextEvent(Handle, string, Handle);
extern (C) Handle Worker_MessageEvent(Handle, string, Handle);
extern (C) Handle Worker_CloseEvent(Handle, string, Handle);
extern (C) Handle Worker_Notification(Handle, string, Handle);
extern (C) Handle Worker_IDBVersionChangeEvent(Handle, string, Handle);
extern (C) Handle Worker_ErrorEvent(Handle, string, Handle);
extern (C) Handle Worker_File(Handle, Handle, string, Handle);
extern (C) Handle Worker_ProgressEvent(Handle, string, Handle);
extern (C) Handle Worker_Response(Handle, bool, scope ref SumType!(Blob, BufferSource, FormData, URLSearchParams, ReadableStream, string), Handle);
extern (C) Handle Worker_TextDecoder(Handle, string, Handle);
extern (C) Handle Worker_WebSocket__string_sequence(Handle, string, Handle);
extern (C) Handle Worker_StructuredCloneTester(Handle, bool, bool);
extern (C) Handle Worker_PerformanceObserver(Handle, PerformanceObserverCallback);
extern (C) Handle Worker_PromiseRejectionEvent(Handle, string, Handle);
extern (C) Handle Worker_CustomEvent(Handle, string, Handle);
extern (C) Handle Worker_URLSearchParams(Handle, scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string));
extern (C) Handle Worker_ImageData__uint_uint(Handle, uint, uint);
extern (C) Handle Worker_ImageData__Handle_uint_uint(Handle, Handle, uint, uint);
extern (C) Handle Worker_Request(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Worker_OffscreenCanvas(Handle, uint, uint);