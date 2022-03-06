module spasm.bindings.RTCDataChannelEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.RTCDataChannel;

@safe:
nothrow:

struct RTCDataChannelEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCDataChannelEventInit(spasm_add__object());
  }
  void channel()(scope ref RTCDataChannel channel) {
    Object_Call_Handle__void(this._parent, "channel", channel.handle);
  }
  auto channel()() {
    return RTCDataChannel(Object_Getter__Handle(this._parent, "channel"));
  }
}


