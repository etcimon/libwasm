module libwasm.bindings.NotificationEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.ExtendableEvent;
import libwasm.bindings.Notification;

@safe:
nothrow:

struct NotificationEvent {
  nothrow:
  libwasm.bindings.ExtendableEvent.ExtendableEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEvent(h);
  }
  auto notification()() {
    return Notification(Object_Getter__Handle(this._parent, "notification"));
  }
}
struct NotificationEventInit {
  nothrow:
  libwasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return NotificationEventInit(libwasm_add__object());
  }
  void notification()(scope ref Notification notification) {
    Object_Call_Handle__void(this._parent, "notification", notification.handle);
  }
  auto notification()() {
    return Notification(Object_Getter__Handle(this._parent, "notification"));
  }
}


