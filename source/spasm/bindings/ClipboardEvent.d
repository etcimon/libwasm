module spasm.bindings.ClipboardEvent;

import spasm.types;
import spasm.bindings.DataTransfer;
import spasm.bindings.Event;

@safe:
nothrow:

struct ClipboardEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto clipboardData()() {
    return Object_Getter__OptionalHandle(this._parent, "clipboardData");
  }
}
struct ClipboardEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ClipboardEventInit(spasm_add__object());
  }
  void data()(string data) {
    Object_Call_string__void(this._parent, "data", data);
  }
  string data()() {
    return Object_Getter__string(this._parent, "data");
  }
  void dataType()(string dataType) {
    Object_Call_string__void(this._parent, "dataType", dataType);
  }
  string dataType()() {
    return Object_Getter__string(this._parent, "dataType");
  }
}


