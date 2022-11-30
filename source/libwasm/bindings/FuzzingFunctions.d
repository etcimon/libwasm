module libwasm.bindings.FuzzingFunctions;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.KeyboardEvent;

@safe:
nothrow:

struct FuzzingFunctions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void garbageCollect()() {
    Object_Call__void(this.handle, "garbageCollect");
  }
  void cycleCollect()() {
    Object_Call__void(this.handle, "cycleCollect");
  }
  void enableAccessibility()() {
    Object_Call__void(this.handle, "enableAccessibility");
  }
  void synthesizeKeyboardEvents()(string aKeyValue, scope ref KeyboardEventInit aDictionary) {
    Serialize_Object_VarArgCall!void(this.handle, "synthesizeKeyboardEvents", "string;Handle", tuple(aKeyValue, cast(Handle)aDictionary._parent));
  }
  void synthesizeKeyboardEvents()(string aKeyValue) {
    Object_Call_string__void(this.handle, "synthesizeKeyboardEvents", aKeyValue);
  }
}


