module spasm.bindings.AddonEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct AddonEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
}
struct AddonEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return AddonEventInit(spasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
}


