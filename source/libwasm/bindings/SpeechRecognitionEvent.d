module libwasm.bindings.SpeechRecognitionEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Document;
import libwasm.bindings.Event;
import libwasm.bindings.SpeechRecognitionResultList;

@safe:
nothrow:

struct SpeechRecognitionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint resultIndex()() {
    return Object_Getter__uint(this._parent, "resultIndex");
  }
  auto results()() {
    return recastOpt!(SpeechRecognitionResultList)(Object_Getter__OptionalHandle(this._parent, "results"));
  }
  auto interpretation()() {
    return Any(Object_Getter__Handle(this._parent, "interpretation"));
  }
  auto emma()() {
    return recastOpt!(Document)(Object_Getter__OptionalHandle(this._parent, "emma"));
  }
}
struct SpeechRecognitionEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SpeechRecognitionEventInit(libwasm_add__object());
  }
  void resultIndex()(uint resultIndex) {
    Object_Call_uint__void(this._parent, "resultIndex", resultIndex);
  }
  uint resultIndex()() {
    return Object_Getter__uint(this._parent, "resultIndex");
  }
  void results(T0)(scope auto ref Optional!(T0) results) if (isTOrPointer!(T0, SpeechRecognitionResultList)) {
    Serialize_Object_VarArgCall!void(this._parent, "results", "Optional!Handle", tuple(!results.empty, cast(Handle)results.front.handle));
  }
  auto results()() {
    return recastOpt!(SpeechRecognitionResultList)(Object_Getter__OptionalHandle(this._parent, "results"));
  }
  void interpretation(T0)(scope auto ref T0 interpretation) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "interpretation", cast(string) interpretation);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "interpretation", cast(long) interpretation);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "interpretation", cast(double) interpretation);
      return;
    }
    // Any
    Handle _handle_interpretation = getOrCreateHandle(interpretation);
    Object_Call_Handle__void(this._parent, "interpretation", _handle_interpretation);
    dropHandle!(T0)(_handle_interpretation);
  }
  auto interpretation()() {
    return Any(Object_Getter__Handle(this._parent, "interpretation"));
  }
  void emma(T0)(scope auto ref Optional!(T0) emma) if (isTOrPointer!(T0, Document)) {
    Serialize_Object_VarArgCall!void(this._parent, "emma", "Optional!Handle", tuple(!emma.empty, cast(Handle)emma.front._parent));
  }
  auto emma()() {
    return recastOpt!(Document)(Object_Getter__OptionalHandle(this._parent, "emma"));
  }
}


