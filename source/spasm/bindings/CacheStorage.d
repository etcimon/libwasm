module spasm.bindings.CacheStorage;

import spasm.types;
import spasm.bindings.Cache;
import spasm.bindings.Request;
import spasm.bindings.Response;

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
    return Promise!(Response)(CacheStorage_match(this.handle, request, options.handle));
  }
  auto match()(scope ref RequestInfo request) {
    return Promise!(Response)(CacheStorage_match_0(this.handle, request));
  }
  auto has()(string cacheName) {
    return Promise!(bool)(Object_Call_string__Handle(this.handle, "has", cacheName));
  }
  auto open()(string cacheName) {
    return Promise!(Cache)(Object_Call_string__Handle(this.handle, "open", cacheName));
  }
  auto delete_()(string cacheName) {
    return Promise!(bool)(Object_Call_string__Handle(this.handle, "delete", cacheName));
  }
  auto keys()() {
    return Promise!(Sequence!(string))(Object_Getter__Handle(this.handle, "keys"));
  }
}
enum CacheStorageNamespace {
  content,
  chrome
}


extern (C) Handle CacheStorage_match(Handle, scope ref RequestInfo, Handle);
extern (C) Handle CacheStorage_match_0(Handle, scope ref RequestInfo);