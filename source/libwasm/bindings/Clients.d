module libwasm.bindings.Clients;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Client;

@safe:
nothrow:

struct ClientQueryOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ClientQueryOptions(libwasm_add__object());
  }
  void includeUncontrolled()(bool includeUncontrolled) {
    Object_Call_bool__void(this.handle, "includeUncontrolled", includeUncontrolled);
  }
  bool includeUncontrolled()() {
    return Object_Getter__bool(this.handle, "includeUncontrolled");
  }
  void type()(ClientType type) {
    Object_Call_int__void(this.handle, "type", type);
  }
  ClientType type()() {
    return Object_Getter__int(this.handle, "type");
  }
}
enum ClientType {
  window,
  worker,
  sharedworker,
  serviceworker,
  all
}
struct Clients {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto get()(string id) {
    return JsPromise!(Any)(Object_Call_string__Handle(this.handle, "get", id));
  }
  auto matchAll()(scope ref ClientQueryOptions options) {
    return JsPromise!(Sequence!(Client))(Object_Call_Handle__Handle(this.handle, "matchAll", options.handle));
  }
  auto matchAll()() {
    return JsPromise!(Sequence!(Client))(Object_Getter__Handle(this.handle, "matchAll"));
  }
  auto openWindow()(string url) {
    return JsPromise!(Optional!(WindowClient))(Object_Call_string__Handle(this.handle, "openWindow", url));
  }
  auto claim()() {
    return JsPromise!(void)(Object_Getter__Handle(this.handle, "claim"));
  }
}


