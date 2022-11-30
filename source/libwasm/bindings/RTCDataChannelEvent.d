module libwasm.bindings.RTCDataChannelEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.RTCDataChannel;

@safe:
nothrow:

struct RTCDataChannelEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto channel()() {
    return RTCDataChannel(Object_Getter__Handle(this._parent, "channel"));
  }
}
struct RTCDataChannelEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCDataChannelEventInit(libwasm_add__object());
  }
  void channel()(scope ref RTCDataChannel channel) {
    Object_Call_Handle__void(this._parent, "channel", channel.handle);
  }
  auto channel()() {
    return RTCDataChannel(Object_Getter__Handle(this._parent, "channel"));
  }
}


