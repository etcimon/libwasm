module libwasm.bindings.Request;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AbortSignal;
import libwasm.bindings.Blob;
import libwasm.bindings.Fetch;
import libwasm.bindings.FetchObserver;
import libwasm.bindings.FormData;
import libwasm.bindings.Headers;

@safe:
nothrow:

enum ReferrerPolicy {
  none,
  no_referrer,
  no_referrer_when_downgrade,
  origin,
  origin_when_cross_origin,
  unsafe_url,
  same_origin,
  strict_origin,
  strict_origin_when_cross_origin
}
struct Request {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string method()() {
    return Object_Getter__string(this.handle, "method");
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  auto headers()() {
    return Headers(Object_Getter__Handle(this.handle, "headers"));
  }
  RequestDestination destination()() {
    return Object_Getter__int(this.handle, "destination");
  }
  string referrer()() {
    return Object_Getter__string(this.handle, "referrer");
  }
  ReferrerPolicy referrerPolicy()() {
    return Object_Getter__int(this.handle, "referrerPolicy");
  }
  RequestMode mode()() {
    return Object_Getter__int(this.handle, "mode");
  }
  RequestCredentials credentials()() {
    return Object_Getter__int(this.handle, "credentials");
  }
  RequestCache cache()() {
    return Object_Getter__int(this.handle, "cache");
  }
  RequestRedirect redirect()() {
    return Object_Getter__int(this.handle, "redirect");
  }
  string integrity()() {
    return Object_Getter__string(this.handle, "integrity");
  }
  bool mozErrors()() {
    return Object_Getter__bool(this.handle, "mozErrors");
  }
  auto signal()() {
    return AbortSignal(Object_Getter__Handle(this.handle, "signal"));
  }
  auto clone()() {
    return Request(Object_Getter__Handle(this.handle, "clone"));
  }
  void overrideContentPolicyType()(uint context) {
    Object_Call_uint__void(this.handle, "overrideContentPolicyType", context);
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
enum RequestCache {
  default_,
  no_store,
  reload,
  no_cache,
  force_cache,
  only_if_cached
}
enum RequestCredentials {
  omit,
  same_origin,
  include
}
enum RequestDestination {
  none,
  audio,
  audioworklet,
  document,
  embed,
  font,
  image,
  manifest,
  object,
  paintworklet,
  report,
  script,
  sharedworker,
  style,
  track,
  video,
  worker,
  xslt
}
alias RequestInfo = SumType!(Request, string);
struct RequestInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RequestInit(libwasm_add__object());
  }
  void method()(string method) {
    Object_Call_string__void(this.handle, "method", method);
  }
  string method()() {
    return Object_Getter__string(this.handle, "method");
  }
  void headers()(scope ref HeadersInit headers) {
    Serialize_Object_VarArgCall!void(this.handle, "headers", "SumType!(Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref headers.Types[0] v) => 0),((ref headers.Types[1] v) => 1),((ref headers.Types[2] v) => 2))(headers),tuple(libwasm.sumtype.match!(((ref headers.Types[0] v) => cast(Handle)v.handle),((ref headers.Types[1] v) => Handle.init),((ref headers.Types[2] v) => Handle.init))(headers),libwasm.sumtype.match!(((ref headers.Types[0] v) => Handle.init),((ref headers.Types[1] v) => cast(Handle)v.handle),((ref headers.Types[2] v) => Handle.init))(headers),libwasm.sumtype.match!(((ref headers.Types[0] v) => Handle.init),((ref headers.Types[1] v) => Handle.init),((ref headers.Types[2] v) => cast(Handle)v.handle))(headers))));
  }
  auto headers()() {
    return Object_Getter__Handle(this.handle, "headers");
  }
  void body_(T0)(scope auto ref Optional!(T0) body_) if (isTOrPointer!(T0, BodyInit)) {
    Serialize_Object_VarArgCall!void(this.handle, "body", "Optional!SumType!(Handle,Handle,Handle,Handle,string)", tuple(!body_.empty, libwasm.sumtype.match!(((ref body_.Types[0] v) => 0),((ref body_.Types[1] v) => 1),((ref body_.Types[2] v) => 2),((ref body_.Types[3] v) => 3),((string v) => 4))(body_),tuple(libwasm.sumtype.match!(((ref body_.Types[0] v) => cast(Handle)v.handle),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => cast(Handle)v.handle),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => cast(Handle)v.handle),((ref body_.Types[3] v) => Handle.init),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => Handle.init),((ref body_.Types[1] v) => Handle.init),((ref body_.Types[2] v) => Handle.init),((ref body_.Types[3] v) => cast(Handle)v.handle),((string v) => Handle.init))(body_),libwasm.sumtype.match!(((ref body_.Types[0] v) => string.init),((ref body_.Types[1] v) => string.init),((ref body_.Types[2] v) => string.init),((ref body_.Types[3] v) => string.init),((string v) => v))(body_))));
  }
  auto body_()() {
    return RequestInit_body_Get(this.handle);
  }
  void referrer()(string referrer) {
    Object_Call_string__void(this.handle, "referrer", referrer);
  }
  string referrer()() {
    return Object_Getter__string(this.handle, "referrer");
  }
  void referrerPolicy()(ReferrerPolicy referrerPolicy) {
    Object_Call_int__void(this.handle, "referrerPolicy", referrerPolicy);
  }
  ReferrerPolicy referrerPolicy()() {
    return Object_Getter__int(this.handle, "referrerPolicy");
  }
  void mode()(RequestMode mode) {
    Object_Call_int__void(this.handle, "mode", mode);
  }
  RequestMode mode()() {
    return Object_Getter__int(this.handle, "mode");
  }
  void credentials()(RequestCredentials credentials) {
    Object_Call_int__void(this.handle, "credentials", credentials);
  }
  RequestCredentials credentials()() {
    return Object_Getter__int(this.handle, "credentials");
  }
  void cache()(RequestCache cache) {
    Object_Call_int__void(this.handle, "cache", cache);
  }
  RequestCache cache()() {
    return Object_Getter__int(this.handle, "cache");
  }
  void redirect()(RequestRedirect redirect) {
    Object_Call_int__void(this.handle, "redirect", redirect);
  }
  RequestRedirect redirect()() {
    return Object_Getter__int(this.handle, "redirect");
  }
  void integrity()(string integrity) {
    Object_Call_string__void(this.handle, "integrity", integrity);
  }
  string integrity()() {
    return Object_Getter__string(this.handle, "integrity");
  }
  void mozErrors()(bool mozErrors) {
    Object_Call_bool__void(this.handle, "mozErrors", mozErrors);
  }
  bool mozErrors()() {
    return Object_Getter__bool(this.handle, "mozErrors");
  }
  void signal(T0)(scope auto ref Optional!(T0) signal) if (isTOrPointer!(T0, AbortSignal)) {
    Serialize_Object_VarArgCall!void(this.handle, "signal", "Optional!Handle", tuple(!signal.empty, cast(Handle)signal.front._parent));
  }
  auto signal()() {
    return Optional!(AbortSignal)(Object_Getter__OptionalHandle(this.handle, "signal"));
  }
  void observe()(scope ref ObserverCallback observe) {
    Object_Call_Handle__void(this.handle, "observe", observe.handle);
  }
  auto observe()() {
    return ObserverCallback(Object_Getter__Handle(this.handle, "observe"));
  }
}
enum RequestMode {
  same_origin,
  no_cors,
  cors,
  navigate
}
enum RequestRedirect {
  follow,
  error,
  manual
}
alias nsContentPolicyType = uint;


extern (C) Optional!(BodyInit) RequestInit_body_Get(Handle);