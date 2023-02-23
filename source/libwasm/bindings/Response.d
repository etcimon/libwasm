module libwasm.bindings.Response;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.Fetch;
import libwasm.bindings.FormData;
import libwasm.bindings.Headers;

@safe:
nothrow:

struct Response {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto error()() {
    return Response(Object_Getter__Handle(this.handle, "error"));
  }
  auto redirect()(string url, ushort status /* = 302 */) {
    return Response(Serialize_Object_VarArgCall!Handle(this.handle, "redirect", "string;ushort", tuple(url, status)));
  }
  auto redirect()(string url) {
    return Response(Object_Call_string__Handle(this.handle, "redirect", url));
  }
  ResponseType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  bool redirected()() {
    return Object_Getter__bool(this.handle, "redirected");
  }
  ushort status()() {
    return Object_Getter__ushort(this.handle, "status");
  }
  bool ok()() {
    return Object_Getter__bool(this.handle, "ok");
  }
  string statusText()() {
    return Object_Getter__string(this.handle, "statusText");
  }
  auto headers()() {
    return Headers(Object_Getter__Handle(this.handle, "headers"));
  }
  auto clone()() {
    return Response(Object_Getter__Handle(this.handle, "clone"));
  }
  auto cloneUnfiltered()() {
    return Response(Object_Getter__Handle(this.handle, "cloneUnfiltered"));
  }
  bool hasCacheInfoChannel()() {
    return Object_Getter__bool(this.handle, "hasCacheInfoChannel");
  }
  auto body_()() {
    return recastOpt!(ReadableStream)(Object_Getter__OptionalHandle(this.handle, "body"));
  }
  bool bodyUsed()() {
    return Object_Getter__bool(this.handle, "bodyUsed");
  }
  auto arrayBuffer()() {
    return JsPromise!(ArrayBuffer)(Object_Getter__Handle(this.handle, "arrayBuffer"));
  }
  auto blob()() {
    return JsPromise!(Blob)(Object_Getter__Handle(this.handle, "blob"));
  }
  auto formData()() {
    return JsPromise!(FormData)(Object_Getter__Handle(this.handle, "formData"));
  }
  auto json()() {
    return JsPromise!(JSON)(Object_Getter__Handle(this.handle, "json"));
  }
  auto text()() {
    return JsPromise!(string)(Object_Getter__Handle(this.handle, "text"));
  }
}
struct ResponseInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ResponseInit(libwasm_add__object());
  }
  void status()(ushort status) {
    Serialize_Object_VarArgCall!void(this.handle, "status", "ushort", tuple(status));
  }
  ushort status()() {
    return Object_Getter__ushort(this.handle, "status");
  }
  void statusText()(string statusText) {
    Object_Call_string__void(this.handle, "statusText", statusText);
  }
  string statusText()() {
    return Object_Getter__string(this.handle, "statusText");
  }
  void headers()(scope ref HeadersInit headers) {
    Serialize_Object_VarArgCall!void(this.handle, "headers", "SumType!(Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref headers.Types[0] v) => 0),((ref headers.Types[1] v) => 1),((ref headers.Types[2] v) => 2))(headers),tuple(libwasm.sumtype.match!(((ref headers.Types[0] v) => cast(Handle)v.handle),((ref headers.Types[1] v) => Handle.init),((ref headers.Types[2] v) => Handle.init))(headers),libwasm.sumtype.match!(((ref headers.Types[0] v) => Handle.init),((ref headers.Types[1] v) => cast(Handle)v.handle),((ref headers.Types[2] v) => Handle.init))(headers),libwasm.sumtype.match!(((ref headers.Types[0] v) => Handle.init),((ref headers.Types[1] v) => Handle.init),((ref headers.Types[2] v) => cast(Handle)v.handle))(headers))));
  }
  auto headers()() {
    return Object_Getter__Handle(this.handle, "headers");
  }
}
enum ResponseType {
  basic,
  cors,
  default_,
  error,
  opaque,
  opaqueredirect
}


