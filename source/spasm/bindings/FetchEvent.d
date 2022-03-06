module spasm.bindings.FetchEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.ExtendableEvent;
import spasm.bindings.Request;
import spasm.bindings.Response;

@safe:
nothrow:

struct FetchEvent {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEvent(h);
  }
  auto request()() {
    return Request(Object_Getter__Handle(this._parent, "request"));
  }
  string clientId()() {
    return Object_Getter__string(this._parent, "clientId");
  }
  string resultingClientId()() {
    return Object_Getter__string(this._parent, "resultingClientId");
  }
  bool isReload()() {
    return Object_Getter__bool(this._parent, "isReload");
  }
  void respondWith()(scope ref Promise!(Response) r) {
    Object_Call_Handle__void(this._parent, "respondWith", r.handle);
  }
}
struct FetchEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return FetchEventInit(spasm_add__object());
  }
  void request()(scope ref Request request) {
    Object_Call_Handle__void(this._parent, "request", request.handle);
  }
  auto request()() {
    return Request(Object_Getter__Handle(this._parent, "request"));
  }
  void clientId()(string clientId) {
    Object_Call_string__void(this._parent, "clientId", clientId);
  }
  string clientId()() {
    return Object_Getter__string(this._parent, "clientId");
  }
  void resultingClientId()(string resultingClientId) {
    Object_Call_string__void(this._parent, "resultingClientId", resultingClientId);
  }
  string resultingClientId()() {
    return Object_Getter__string(this._parent, "resultingClientId");
  }
  void isReload()(bool isReload) {
    Object_Call_bool__void(this._parent, "isReload", isReload);
  }
  bool isReload()() {
    return Object_Getter__bool(this._parent, "isReload");
  }
}


