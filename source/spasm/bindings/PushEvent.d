module spasm.bindings.PushEvent;

import spasm.types;
import spasm.bindings.ExtendableEvent;
import spasm.bindings.PushMessageData;

@safe:
nothrow:

struct PushEvent {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEvent(h);
  }
  auto data()() {
    return Object_Getter__OptionalHandle(this._parent, "data");
  }
}
struct PushEventInit {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return PushEventInit(spasm_add__object());
  }
  void data()(scope ref PushMessageDataInit data) {
    PushEventInit_data_Set(this._parent, data);
  }
  auto data()() {
    return Object_Getter__Handle(this._parent, "data");
  }
}
alias PushMessageDataInit = SumType!(BufferSource, string);


extern (C) void PushEventInit_data_Set(Handle, scope ref PushMessageDataInit);