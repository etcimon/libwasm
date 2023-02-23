module libwasm.bindings.MediaKeyMessageEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MediaKeyMessageEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  MediaKeyMessageType messageType()() {
    return Object_Getter__int(this._parent, "messageType");
  }
  auto message()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "message"));
  }
}
struct MediaKeyMessageEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaKeyMessageEventInit(libwasm_add__object());
  }
  void messageType()(MediaKeyMessageType messageType) {
    Object_Call_int__void(this._parent, "messageType", messageType);
  }
  MediaKeyMessageType messageType()() {
    return Object_Getter__int(this._parent, "messageType");
  }
  void message()(scope ref ArrayBuffer message) {
    Object_Call_Handle__void(this._parent, "message", message.handle);
  }
  auto message()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "message"));
  }
}
enum MediaKeyMessageType {
  license_request,
  license_renewal,
  license_release,
  individualization_request
}


