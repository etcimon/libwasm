module libwasm.bindings.Worker;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AbortSignal;
import libwasm.bindings.AbstractWorker;
import libwasm.bindings.Blob;
import libwasm.bindings.CloseEvent;
import libwasm.bindings.CustomEvent;
import libwasm.bindings.DOMException;
import libwasm.bindings.ErrorEvent;
import libwasm.bindings.Event;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventListener;
import libwasm.bindings.EventTarget;
import libwasm.bindings.File;
import libwasm.bindings.FormData;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.Headers;
import libwasm.bindings.IDBVersionChangeEvent;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.MessageEvent;
import libwasm.bindings.MessagePort;
import libwasm.bindings.Notification;
import libwasm.bindings.Performance;
import libwasm.bindings.PerformanceObserver;
import libwasm.bindings.ProgressEvent;
import libwasm.bindings.PromiseRejectionEvent;
import libwasm.bindings.Request;
import libwasm.bindings.Response;
import libwasm.bindings.TextDecoder;
import libwasm.bindings.TextEncoder;
import libwasm.bindings.URLSearchParams;
import libwasm.bindings.WebGLContextEvent;
import libwasm.bindings.WebSocket;

@safe:
nothrow:

struct ChromeWorker {
  nothrow:
  libwasm.bindings.Worker.Worker _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Worker(h);
  }
}
struct Worker {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)transfer.handle));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions aOptions) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)aOptions.handle));
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
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onmessageerror(T0)(scope auto ref Optional!(T0) onmessageerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessageerror", !onmessageerror.empty, onmessageerror.front);
  }
  EventHandler onmessageerror()() {
    return Object_Getter__EventHandler(this._parent, "onmessageerror");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  auto Headers()(scope ref HeadersInit init) {
    return .Headers(Serialize_Object_VarArgCall!Handle(this._parent, "Headers", "SumType!(Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => 0),((ref init.Types[1] v) => 1),((ref init.Types[2] v) => 2))(init),tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => cast(Handle)v.handle),((ref init.Types[1] v) => Handle.init),((ref init.Types[2] v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => cast(Handle)v.handle),((ref init.Types[2] v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => Handle.init),((ref init.Types[2] v) => cast(Handle)v.handle))(init)))));
  }
  auto BroadcastChannel()(string channel) {
    return .BroadcastChannel(Object_Call_string__Handle(this._parent, "BroadcastChannel", channel));
  }
  auto Event()(string type, scope ref EventInit eventInitDict) {
    return .Event(Serialize_Object_VarArgCall!Handle(this._parent, "Event", "string;Handle", tuple(type, cast(Handle)eventInitDict.handle)));
  }
  auto Blob()(scope ref Sequence!(BlobPart) blobParts, scope ref BlobPropertyBag options) {
    return .Blob(Serialize_Object_VarArgCall!Handle(this._parent, "Blob", "Handle;Handle", tuple(cast(Handle)blobParts.handle, cast(Handle)options.handle)));
  }
  auto WebGLContextEvent()(string type, scope ref WebGLContextEventInit eventInit) {
    return .WebGLContextEvent(Serialize_Object_VarArgCall!Handle(this._parent, "WebGLContextEvent", "string;Handle", tuple(type, cast(Handle)eventInit._parent)));
  }
  auto URL()(string url, string base) {
    return .URL(Object_Call_string_string__Handle(this._parent, "URL", url, base));
  }
  auto MessageEvent()(string type, scope ref MessageEventInit eventInitDict) {
    return .MessageEvent(Serialize_Object_VarArgCall!Handle(this._parent, "MessageEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto CloseEvent()(string type, scope ref CloseEventInit eventInitDict) {
    return .CloseEvent(Serialize_Object_VarArgCall!Handle(this._parent, "CloseEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto Notification()(string title, scope ref NotificationOptions options) {
    return .Notification(Serialize_Object_VarArgCall!Handle(this._parent, "Notification", "string;Handle", tuple(title, cast(Handle)options.handle)));
  }
  auto IDBVersionChangeEvent()(string type, scope ref IDBVersionChangeEventInit eventInitDict) {
    return .IDBVersionChangeEvent(Serialize_Object_VarArgCall!Handle(this._parent, "IDBVersionChangeEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto ErrorEvent()(string type, scope ref ErrorEventInit eventInitDict) {
    return .ErrorEvent(Serialize_Object_VarArgCall!Handle(this._parent, "ErrorEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto DOMError()(string name, string message /* = "" */) {
    return .DOMError(Object_Call_string_string__Handle(this._parent, "DOMError", name, message));
  }
  auto File()(scope ref Sequence!(BlobPart) fileBits, string fileName, scope ref FilePropertyBag options) {
    return .File(Serialize_Object_VarArgCall!Handle(this._parent, "File", "Handle;string;Handle", tuple(cast(Handle)fileBits.handle, fileName, cast(Handle)options._parent)));
  }
  auto ProgressEvent()(string type, scope ref ProgressEventInit eventInitDict) {
    return .ProgressEvent(Serialize_Object_VarArgCall!Handle(this._parent, "ProgressEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto Response(T0)(scope auto ref Optional!(T0) body_, scope ref ResponseInit init) if (isTOrPointer!(T0, SumType!(.Blob, BufferSource, .FormData, .URLSearchParams, ReadableStream, string))) {
    return .Response(Serialize_Object_VarArgCall!Handle(this._parent, "Response", "Optional!SumType!(Handle,Handle,Handle,Handle,Handle,string);Handle", tuple(!body_.empty, libwasm.sumtype.match!(((ref body_.Types[0] v) => 0),((ref body_.Types[1] v) => 1),((ref body_.Types[2] v) => 2),((ref body_.Types[3] v) => 3),((ref body_.Types[4] v) => 4),((string v) => 5))(body_),tuple(libwasm.sumtype.match!(((ref body_.Types[0] v) => cast(Handle)v.handle),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => cast(Handle)v.handle),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => cast(Handle)v.handle),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => cast(Handle)v.handle),((ref body_.Types[4] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((ref body_.Types[4] v) => cast(Handle)v.handle),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => string.init),((ref body_.Types[1] v) => string.init),((ref body_.Types[2] v) => string.init),((ref body_.Types[3] v) => string.init),((ref body_.Types[4] v) => string.init),((string v) => v))(body_)), cast(Handle)init.handle)));
  }
  auto TextDecoder()(string label /* = "utf-8" */, scope ref TextDecoderOptions options) {
    return .TextDecoder(Serialize_Object_VarArgCall!Handle(this._parent, "TextDecoder", "string;Handle", tuple(label, cast(Handle)options.handle)));
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
    return .WebSocket(Serialize_Object_VarArgCall!Handle(this._parent, "WebSocket", "string;Handle", tuple(url, cast(Handle)protocols.handle)));
  }
  auto StructuredCloneTester()(bool serializable, bool deserializable) {
    return .StructuredCloneTester(Serialize_Object_VarArgCall!Handle(this._parent, "StructuredCloneTester", "bool;bool", tuple(serializable, deserializable)));
  }
  auto PerformanceObserver()(PerformanceObserverCallback callback) {
    return .PerformanceObserver(Worker_PerformanceObserver(this._parent, callback));
  }
  auto PromiseRejectionEvent()(string type, scope ref PromiseRejectionEventInit eventInitDict) {
    return .PromiseRejectionEvent(Serialize_Object_VarArgCall!Handle(this._parent, "PromiseRejectionEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto AbortController()() {
    return .AbortController(Object_Getter__Handle(this._parent, "AbortController"));
  }
  auto MessageChannel()() {
    return .MessageChannel(Object_Getter__Handle(this._parent, "MessageChannel"));
  }
  auto CustomEvent()(string type, scope ref CustomEventInit eventInitDict) {
    return .CustomEvent(Serialize_Object_VarArgCall!Handle(this._parent, "CustomEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto URLSearchParams()(scope ref SumType!(Sequence!(Sequence!(string)), Record!(string, string), string) init /* = "" */) {
    return .URLSearchParams(Serialize_Object_VarArgCall!Handle(this._parent, "URLSearchParams", "SumType!(Handle,Handle,string)", tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => 0),((ref init.Types[1] v) => 1),((string v) => 2))(init),tuple(libwasm.sumtype.match!(((ref init.Types[0] v) => cast(Handle)v.handle),((ref init.Types[1] v) => Handle.init),((string v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => Handle.init),((ref init.Types[1] v) => cast(Handle)v.handle),((string v) => Handle.init))(init),libwasm.sumtype.match!(((ref init.Types[0] v) => string.init),((ref init.Types[1] v) => string.init),((string v) => v))(init)))));
  }
  auto ImageData()(uint sw, uint sh) {
    return .ImageData(Serialize_Object_VarArgCall!Handle(this._parent, "ImageData", "uint;uint", tuple(sw, sh)));
  }
  auto ImageData()(scope ref Uint8ClampedArray data, uint sw, uint sh) {
    return .ImageData(Serialize_Object_VarArgCall!Handle(this._parent, "ImageData", "Handle;uint;uint", tuple(cast(Handle)data.handle, sw, sh)));
  }
  auto FormData()(scope ref HTMLFormElement form) {
    return .FormData(Object_Call_Handle__Handle(this._parent, "FormData", form._parent));
  }
  auto DOMException()(string message /* = "" */, string name) {
    return .DOMException(Object_Call_string_string__Handle(this._parent, "DOMException", message, name));
  }
  auto Request()(scope ref RequestInfo input, scope ref RequestInit init) {
    return .Request(Serialize_Object_VarArgCall!Handle(this._parent, "Request", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)), cast(Handle)init.handle)));
  }
  auto OffscreenCanvas()(uint width, uint height) {
    return .OffscreenCanvas(Serialize_Object_VarArgCall!Handle(this._parent, "OffscreenCanvas", "uint;uint", tuple(width, height)));
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
    return WorkerOptions(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}


extern (C) Handle Worker_PerformanceObserver(Handle, PerformanceObserverCallback);