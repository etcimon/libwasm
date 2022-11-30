module libwasm.bindings.PushEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.ExtendableEvent;
import libwasm.bindings.PushMessageData;

@safe:
nothrow:

struct PushEvent {
  nothrow:
  libwasm.bindings.ExtendableEvent.ExtendableEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEvent(h);
  }
  auto data()() {
    return Optional!(PushMessageData)(Object_Getter__OptionalHandle(this._parent, "data"));
  }
}
struct PushEventInit {
  nothrow:
  libwasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return PushEventInit(libwasm_add__object());
  }
  void data()(scope ref PushMessageDataInit data) {
    Serialize_Object_VarArgCall!void(this._parent, "data", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((string v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => string.init),((string v) => v))(data))));
  }
  auto data()() {
    return Object_Getter__Handle(this._parent, "data");
  }
}
alias PushMessageDataInit = SumType!(BufferSource, string);


