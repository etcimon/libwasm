module libwasm.bindings.ClipboardEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DataTransfer;
import libwasm.bindings.Event;

@safe:
nothrow:

struct ClipboardEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto clipboardData()() {
    return Optional!(DataTransfer)(Object_Getter__OptionalHandle(this._parent, "clipboardData"));
  }
}
struct ClipboardEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ClipboardEventInit(libwasm_add__object());
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


