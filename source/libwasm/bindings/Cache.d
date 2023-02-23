module libwasm.bindings.Cache;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Request;
import libwasm.bindings.Response;

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
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this.handle, "match", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)), cast(Handle)options.handle)));
  }
  auto match()(scope ref RequestInfo request) {
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this.handle, "match", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)))));
  }
  auto matchAll()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return JsPromise!(Sequence!(Response))(Serialize_Object_VarArgCall!Handle(this.handle, "matchAll", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)), cast(Handle)options.handle)));
  }
  auto matchAll()(scope ref RequestInfo request) {
    return JsPromise!(Sequence!(Response))(Serialize_Object_VarArgCall!Handle(this.handle, "matchAll", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)))));
  }
  auto matchAll()() {
    return JsPromise!(Sequence!(Response))(Object_Getter__Handle(this.handle, "matchAll"));
  }
  auto add()(scope ref RequestInfo request) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this.handle, "add", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)))));
  }
  auto addAll()(scope ref Sequence!(RequestInfo) requests) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this.handle, "addAll", requests.handle));
  }
  auto put()(scope ref RequestInfo request, scope ref Response response) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this.handle, "put", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)), cast(Handle)response.handle)));
  }
  auto delete_()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return JsPromise!(bool)(Serialize_Object_VarArgCall!Handle(this.handle, "delete", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)), cast(Handle)options.handle)));
  }
  auto delete_()(scope ref RequestInfo request) {
    return JsPromise!(bool)(Serialize_Object_VarArgCall!Handle(this.handle, "delete", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)))));
  }
  auto keys()(scope ref RequestInfo request, scope ref CacheQueryOptions options) {
    return JsPromise!(Sequence!(Request))(Serialize_Object_VarArgCall!Handle(this.handle, "keys", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)), cast(Handle)options.handle)));
  }
  auto keys()(scope ref RequestInfo request) {
    return JsPromise!(Sequence!(Request))(Serialize_Object_VarArgCall!Handle(this.handle, "keys", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => 0),((string v) => 1))(request),tuple(libwasm.sumtype.match!(((ref request.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(request),libwasm.sumtype.match!(((ref request.Types[0] v) => string.init),((string v) => v))(request)))));
  }
  auto keys()() {
    return JsPromise!(Sequence!(Request))(Object_Getter__Handle(this.handle, "keys"));
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
    return CacheBatchOperation(libwasm_add__object());
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
    return CacheQueryOptions(libwasm_add__object());
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


