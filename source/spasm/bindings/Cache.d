module spasm.bindings.Cache;

import spasm.types;
import spasm.bindings.Request;
import spasm.bindings.Response;

@safe:
nothrow:

struct Cache {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto match()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return Promise!(Response)(Cache_match(this.handle, request, options.handle));
  }
  auto match()(scope ref RequestInfo request) {
    return Promise!(Response)(Cache_match_0(this.handle, request));
  }
  auto matchAll()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return Promise!(Sequence!(Response))(Cache_matchAll(this.handle, request, options.handle));
  }
  auto matchAll()(scope ref RequestInfo request) {
    return Promise!(Sequence!(Response))(Cache_matchAll_0(this.handle, request));
  }
  auto matchAll()() {
    return Promise!(Sequence!(Response))(Object_Getter__Handle(this.handle, "matchAll"));
  }
  auto add()(scope ref RequestInfo request) {
    return Promise!(void)(Cache_add(this.handle, request));
  }
  auto addAll()(scope ref Sequence!(RequestInfo) requests) {
    return Promise!(void)(Object_Call_Handle__Handle(this.handle, "addAll", requests.handle));
  }
  auto put()(scope ref RequestInfo request, scope ref Response response) {
    return Promise!(void)(Cache_put(this.handle, request, response.handle));
  }
  auto delete_()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return Promise!(bool)(Cache_delete(this.handle, request, options.handle));
  }
  auto delete_()(scope ref RequestInfo request) {
    return Promise!(bool)(Cache_delete_0(this.handle, request));
  }
  auto keys()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return Promise!(Sequence!(Request))(Cache_keys(this.handle, request, options.handle));
  }
  auto keys()(scope ref RequestInfo request) {
    return Promise!(Sequence!(Request))(Cache_keys_0(this.handle, request));
  }
  auto keys()() {
    return Promise!(Sequence!(Request))(Object_Getter__Handle(this.handle, "keys"));
  }
}
struct CacheBatchOperation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CacheBatchOperation(spasm_add__object());
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void request()(scope ref Request request) {
    Object_Call_Handle__void(this.handle, "request", request.handle);
  }
  auto request()() {
    return Request(Object_Getter__Handle(this.handle, "request"));
  }
  void response()(scope ref Response response) {
    Object_Call_Handle__void(this.handle, "response", response.handle);
  }
  auto response()() {
    return Response(Object_Getter__Handle(this.handle, "response"));
  }
  void options()(scope ref CacheQueryOptions options) {
    Object_Call_Handle__void(this.handle, "options", options.handle);
  }
  auto options()() {
    return CacheQueryOptions(Object_Getter__Handle(this.handle, "options"));
  }
}
struct CacheQueryOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CacheQueryOptions(spasm_add__object());
  }
  void ignoreSearch()(bool ignoreSearch) {
    Object_Call_bool__void(this.handle, "ignoreSearch", ignoreSearch);
  }
  bool ignoreSearch()() {
    return Object_Getter__bool(this.handle, "ignoreSearch");
  }
  void ignoreMethod()(bool ignoreMethod) {
    Object_Call_bool__void(this.handle, "ignoreMethod", ignoreMethod);
  }
  bool ignoreMethod()() {
    return Object_Getter__bool(this.handle, "ignoreMethod");
  }
  void ignoreVary()(bool ignoreVary) {
    Object_Call_bool__void(this.handle, "ignoreVary", ignoreVary);
  }
  bool ignoreVary()() {
    return Object_Getter__bool(this.handle, "ignoreVary");
  }
  void cacheName()(string cacheName) {
    Object_Call_string__void(this.handle, "cacheName", cacheName);
  }
  string cacheName()() {
    return Object_Getter__string(this.handle, "cacheName");
  }
}


extern (C) Handle Cache_match(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Cache_match_0(Handle, scope ref RequestInfo);
extern (C) Handle Cache_matchAll(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Cache_matchAll_0(Handle, scope ref RequestInfo);
extern (C) Handle Cache_add(Handle, scope ref RequestInfo);
extern (C) Handle Cache_put(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Cache_delete(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Cache_delete_0(Handle, scope ref RequestInfo);
extern (C) Handle Cache_keys(Handle, scope ref RequestInfo, Handle);
extern (C) Handle Cache_keys_0(Handle, scope ref RequestInfo);