module spasm.bindings.Request;

import spasm.types;
import spasm.bindings.AbortSignal;
import spasm.bindings.Blob;
import spasm.bindings.Fetch;
import spasm.bindings.FetchObserver;
import spasm.bindings.FormData;
import spasm.bindings.Headers;

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
    return Request_destination_Get(this.handle);
  }
  string referrer()() {
    return Object_Getter__string(this.handle, "referrer");
  }
  ReferrerPolicy referrerPolicy()() {
    return Request_referrerPolicy_Get(this.handle);
  }
  RequestMode mode()() {
    return Request_mode_Get(this.handle);
  }
  RequestCredentials credentials()() {
    return Request_credentials_Get(this.handle);
  }
  RequestCache cache()() {
    return Request_cache_Get(this.handle);
  }
  RequestRedirect redirect()() {
    return Request_redirect_Get(this.handle);
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
    return RequestInit(spasm_add__object());
  }
  void method()(string method) {
    Object_Call_string__void(this.handle, "method", method);
  }
  string method()() {
    return Object_Getter__string(this.handle, "method");
  }
  void headers()(scope ref HeadersInit headers) {
    RequestInit_headers_Set(this.handle, headers);
  }
  auto headers()() {
    return Object_Getter__Handle(this.handle, "headers");
  }
  void body_(T0)(scope auto ref Optional!(T0) body_) if (isTOrPointer!(T0, BodyInit)) {
    RequestInit_body_Set(this.handle, !body_.empty, *body_.frontRef);
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
    RequestInit_referrerPolicy_Set(this.handle, referrerPolicy);
  }
  ReferrerPolicy referrerPolicy()() {
    return RequestInit_referrerPolicy_Get(this.handle);
  }
  void mode()(RequestMode mode) {
    RequestInit_mode_Set(this.handle, mode);
  }
  RequestMode mode()() {
    return RequestInit_mode_Get(this.handle);
  }
  void credentials()(RequestCredentials credentials) {
    RequestInit_credentials_Set(this.handle, credentials);
  }
  RequestCredentials credentials()() {
    return RequestInit_credentials_Get(this.handle);
  }
  void cache()(RequestCache cache) {
    RequestInit_cache_Set(this.handle, cache);
  }
  RequestCache cache()() {
    return RequestInit_cache_Get(this.handle);
  }
  void redirect()(RequestRedirect redirect) {
    RequestInit_redirect_Set(this.handle, redirect);
  }
  RequestRedirect redirect()() {
    return RequestInit_redirect_Get(this.handle);
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
    RequestInit_signal_Set(this.handle, !signal.empty, signal.front._parent);
  }
  auto signal()() {
    return Object_Getter__OptionalHandle(this.handle, "signal");
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


extern (C) RequestDestination Request_destination_Get(Handle);
extern (C) ReferrerPolicy Request_referrerPolicy_Get(Handle);
extern (C) RequestMode Request_mode_Get(Handle);
extern (C) RequestCredentials Request_credentials_Get(Handle);
extern (C) RequestCache Request_cache_Get(Handle);
extern (C) RequestRedirect Request_redirect_Get(Handle);
extern (C) void RequestInit_headers_Set(Handle, scope ref HeadersInit);
extern (C) void RequestInit_body_Set(Handle, bool, scope ref BodyInit);
extern (C) Optional!(BodyInit) RequestInit_body_Get(Handle);
extern (C) void RequestInit_referrerPolicy_Set(Handle, ReferrerPolicy);
extern (C) ReferrerPolicy RequestInit_referrerPolicy_Get(Handle);
extern (C) void RequestInit_mode_Set(Handle, RequestMode);
extern (C) RequestMode RequestInit_mode_Get(Handle);
extern (C) void RequestInit_credentials_Set(Handle, RequestCredentials);
extern (C) RequestCredentials RequestInit_credentials_Get(Handle);
extern (C) void RequestInit_cache_Set(Handle, RequestCache);
extern (C) RequestCache RequestInit_cache_Get(Handle);
extern (C) void RequestInit_redirect_Set(Handle, RequestRedirect);
extern (C) RequestRedirect RequestInit_redirect_Get(Handle);
extern (C) void RequestInit_signal_Set(Handle, bool, Handle);