module spasm.bindings.ErrorEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct ErrorEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
  string filename()() {
    return Object_Getter__string(this._parent, "filename");
  }
  uint lineno()() {
    return Object_Getter__uint(this._parent, "lineno");
  }
  uint colno()() {
    return Object_Getter__uint(this._parent, "colno");
  }
  auto error()() {
    return Any(Object_Getter__Handle(this._parent, "error"));
  }
}
struct ErrorEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ErrorEventInit(spasm_add__object());
  }
  void message()(string message) {
    Object_Call_string__void(this._parent, "message", message);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
  void filename()(string filename) {
    Object_Call_string__void(this._parent, "filename", filename);
  }
  string filename()() {
    return Object_Getter__string(this._parent, "filename");
  }
  void lineno()(uint lineno) {
    Object_Call_uint__void(this._parent, "lineno", lineno);
  }
  uint lineno()() {
    return Object_Getter__uint(this._parent, "lineno");
  }
  void colno()(uint colno) {
    Object_Call_uint__void(this._parent, "colno", colno);
  }
  uint colno()() {
    return Object_Getter__uint(this._parent, "colno");
  }
  void error(T0)(scope auto ref T0 error) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "error", cast(string) error);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "error", cast(long) error);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "error", cast(double) error);
      return;
    }
    // Any
    Handle _handle_error = getOrCreateHandle(error);
    Object_Call_Handle__void(this._parent, "error", _handle_error);
    dropHandle!(T0)(_handle_error);
  }
  auto error()() {
    return Any(Object_Getter__Handle(this._parent, "error"));
  }
}


