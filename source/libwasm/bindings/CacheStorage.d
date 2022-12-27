module libwasm.bindings.CacheStorage;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Cache;
import libwasm.bindings.Request;
import libwasm.bindings.Response;

@safe:
nothrow:

struct CacheStorage {
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
  auto has()(string cacheName) {
    return JsPromise!(bool)(Object_Call_string__Handle(this.handle, "has", cacheName));
  }
  auto open()(string cacheName) {
    return JsPromise!(Cache)(Object_Call_string__Handle(this.handle, "open", cacheName));
  }
  auto delete_()(string cacheName) {
    return JsPromise!(bool)(Object_Call_string__Handle(this.handle, "delete", cacheName));
  }
  auto keys()() {
    return JsPromise!(Sequence!(string))(Object_Getter__Handle(this.handle, "keys"));
  }
}
enum CacheStorageNamespace {
  content,
  chrome
}


