module spasm.bindings.Clients;

import spasm.types;
import spasm.bindings.Client;

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
    return ClientQueryOptions(spasm_add__object());
  }
  void includeUncontrolled()(bool includeUncontrolled) {
    Object_Call_bool__void(this.handle, "includeUncontrolled", includeUncontrolled);
  }
  bool includeUncontrolled()() {
    return Object_Getter__bool(this.handle, "includeUncontrolled");
  }
  void type()(ClientType type) {
    ClientQueryOptions_type_Set(this.handle, type);
  }
  ClientType type()() {
    return ClientQueryOptions_type_Get(this.handle);
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
    return Promise!(Any)(Object_Call_string__Handle(this.handle, "get", id));
  }
  auto matchAll()(scope ref ClientQueryOptions options) {
    return Promise!(Sequence!(Client))(Object_Call_Handle__Handle(this.handle, "matchAll", options.handle));
  }
  auto matchAll()() {
    return Promise!(Sequence!(Client))(Object_Getter__Handle(this.handle, "matchAll"));
  }
  auto openWindow()(string url) {
    return Promise!(Optional!(WindowClient))(Object_Call_string__Handle(this.handle, "openWindow", url));
  }
  auto claim()() {
    return Promise!(void)(Object_Getter__Handle(this.handle, "claim"));
  }
}


extern (C) void ClientQueryOptions_type_Set(Handle, ClientType);
extern (C) ClientType ClientQueryOptions_type_Get(Handle);