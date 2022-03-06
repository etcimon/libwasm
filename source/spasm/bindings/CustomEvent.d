module spasm.bindings.CustomEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct CustomEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
    CustomEvent_initCustomEvent(this._parent, type, canBubble, cancelable, _handle_detail);
    dropHandle!(T3)(_handle_detail);
  }
  void initCustomEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    CustomEvent_initCustomEvent_0(this._parent, type, canBubble, cancelable);
  }
  void initCustomEvent()(string type, bool canBubble /* = false */) {
    CustomEvent_initCustomEvent_1(this._parent, type, canBubble);
  }
  void initCustomEvent()(string type) {
    Object_Call_string__void(this._parent, "initCustomEvent", type);
  }
}
struct CustomEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return CustomEventInit(spasm_add__object());
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


extern (C) void CustomEvent_initCustomEvent(Handle, string, bool, bool, Handle);
extern (C) void CustomEvent_initCustomEvent_0(Handle, string, bool, bool);
extern (C) void CustomEvent_initCustomEvent_1(Handle, string, bool);