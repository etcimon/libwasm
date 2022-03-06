module spasm.bindings.MediaKeyMessageEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MediaKeyMessageEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  MediaKeyMessageType messageType()() {
    return MediaKeyMessageEvent_messageType_Get(this._parent);
  }
  auto message()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "message"));
  }
}
struct MediaKeyMessageEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaKeyMessageEventInit(spasm_add__object());
  }
  void messageType()(MediaKeyMessageType messageType) {
    MediaKeyMessageEventInit_messageType_Set(this._parent, messageType);
  }
  MediaKeyMessageType messageType()() {
    return MediaKeyMessageEventInit_messageType_Get(this._parent);
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


extern (C) MediaKeyMessageType MediaKeyMessageEvent_messageType_Get(Handle);
extern (C) void MediaKeyMessageEventInit_messageType_Set(Handle, MediaKeyMessageType);
extern (C) MediaKeyMessageType MediaKeyMessageEventInit_messageType_Get(Handle);