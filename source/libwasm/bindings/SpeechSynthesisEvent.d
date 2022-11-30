module libwasm.bindings.SpeechSynthesisEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.SpeechSynthesisUtterance;

@safe:
nothrow:

struct SpeechSynthesisEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto utterance()() {
    return SpeechSynthesisUtterance(Object_Getter__Handle(this._parent, "utterance"));
  }
  uint charIndex()() {
    return Object_Getter__uint(this._parent, "charIndex");
  }
  Optional!(uint) charLength()() {
    return Object_Getter__OptionalUint(this._parent, "charLength");
  }
  float elapsedTime()() {
    return Object_Getter__float(this._parent, "elapsedTime");
  }
  Optional!(string) name()() {
    return Object_Getter__OptionalString(this._parent, "name");
  }
}
struct SpeechSynthesisEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SpeechSynthesisEventInit(libwasm_add__object());
  }
  void utterance()(scope ref SpeechSynthesisUtterance utterance) {
    Object_Call_Handle__void(this._parent, "utterance", utterance.handle);
  }
  auto utterance()() {
    return SpeechSynthesisUtterance(Object_Getter__Handle(this._parent, "utterance"));
  }
  void charIndex()(uint charIndex) {
    Object_Call_uint__void(this._parent, "charIndex", charIndex);
  }
  uint charIndex()() {
    return Object_Getter__uint(this._parent, "charIndex");
  }
  void charLength(T0)(scope auto ref Optional!(T0) charLength) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "charLength", "Optional!(uint)", tuple(!charLength.empty, charLength.front));
  }
  Optional!(uint) charLength()() {
    return Object_Getter__OptionalUint(this._parent, "charLength");
  }
  void elapsedTime()(float elapsedTime) {
    Object_Call_float__void(this._parent, "elapsedTime", elapsedTime);
  }
  float elapsedTime()() {
    return Object_Getter__float(this._parent, "elapsedTime");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
}


