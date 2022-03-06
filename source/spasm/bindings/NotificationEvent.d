module spasm.bindings.NotificationEvent;

import spasm.types;
import spasm.bindings.ExtendableEvent;
import spasm.bindings.Notification;

@safe:
nothrow:

struct NotificationEvent {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEvent _parent;
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
  spasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return NotificationEventInit(spasm_add__object());
  }
  void notification()(scope ref Notification notification) {
    Object_Call_Handle__void(this._parent, "notification", notification.handle);
  }
  auto notification()() {
    return Notification(Object_Getter__Handle(this._parent, "notification"));
  }
}


