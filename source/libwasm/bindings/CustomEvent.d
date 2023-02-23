module libwasm.bindings.CustomEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct CustomEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto detail()() {
    return Any(Object_Getter__Handle(this._parent, "detail"));
  }
  void initCustomEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref T3 detail /* = null */) {
    // Any
    Handle _handle_detail = getOrCreateHandle(detail);
    Serialize_Object_VarArgCall!void(this._parent, "initCustomEvent", "string;bool;bool;Handle", tuple(type, canBubble, cancelable, _handle_detail));
    dropHandle!(T3)(_handle_detail);
  }
  void initCustomEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCustomEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initCustomEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCustomEvent", "string;bool", tuple(type, canBubble));
  }
  void initCustomEvent()(string type) {
    Object_Call_string__void(this._parent, "initCustomEvent", type);
  }
}
struct CustomEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return CustomEventInit(libwasm_add__object());
  }
  void detail(T0)(scope auto ref T0 detail) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "detail", cast(string) detail);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "detail", cast(long) detail);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "detail", cast(double) detail);
      return;
    }
    // Any
    Handle _handle_detail = getOrCreateHandle(detail);
    Object_Call_Handle__void(this._parent, "detail", _handle_detail);
    dropHandle!(T0)(_handle_detail);
  }
  auto detail()() {
    return Any(Object_Getter__Handle(this._parent, "detail"));
  }
}


