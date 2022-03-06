module spasm.bindings.Response;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.Fetch;
import spasm.bindings.FormData;
import spasm.bindings.Headers;

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
    return Response(Response_redirect(this.handle, url, status));
  }
  auto redirect()(string url) {
    return Response(Object_Call_string__Handle(this.handle, "redirect", url));
  }
  ResponseType type()() {
    return Response_type_Get(this.handle);
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
    return Object_Getter__OptionalHandle(this.handle, "body");
  }
  bool bodyUsed()() {
    return Object_Getter__bool(this.handle, "bodyUsed");
  }
  auto arrayBuffer()() {
    return Promise!(ArrayBuffer)(Object_Getter__Handle(this.handle, "arrayBuffer"));
  }
  auto blob()() {
    return Promise!(Blob)(Object_Getter__Handle(this.handle, "blob"));
  }
  auto formData()() {
    return Promise!(FormData)(Object_Getter__Handle(this.handle, "formData"));
  }
  auto json()() {
    return Promise!(JSON)(Object_Getter__Handle(this.handle, "json"));
  }
  auto text()() {
    return Promise!(string)(Object_Getter__Handle(this.handle, "text"));
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
    return ResponseInit(spasm_add__object());
  }
  void status()(ushort status) {
    ResponseInit_status_Set(this.handle, status);
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
    ResponseInit_headers_Set(this.handle, headers);
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


extern (C) Handle Response_redirect(Handle, string, ushort);
extern (C) ResponseType Response_type_Get(Handle);
extern (C) void ResponseInit_status_Set(Handle, ushort);
extern (C) void ResponseInit_headers_Set(Handle, scope ref HeadersInit);