module spasm.bindings.SpeechRecognitionEvent;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.Event;
import spasm.bindings.SpeechRecognitionResultList;

@safe:
nothrow:

struct SpeechRecognitionEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint resultIndex()() {
    return Object_Getter__uint(this._parent, "resultIndex");
  }
  auto results()() {
    return Object_Getter__OptionalHandle(this._parent, "results");
  }
  auto interpretation()() {
    return Any(Object_Getter__Handle(this._parent, "interpretation"));
  }
  auto emma()() {
    return Object_Getter__OptionalHandle(this._parent, "emma");
  }
}
struct SpeechRecognitionEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SpeechRecognitionEventInit(spasm_add__object());
  }
  void resultIndex()(uint resultIndex) {
    Object_Call_uint__void(this._parent, "resultIndex", resultIndex);
  }
  uint resultIndex()() {
    return Object_Getter__uint(this._parent, "resultIndex");
  }
  void results(T0)(scope auto ref Optional!(T0) results) if (isTOrPointer!(T0, SpeechRecognitionResultList)) {
    SpeechRecognitionEventInit_results_Set(this._parent, !results.empty, results.front.handle);
  }
  auto results()() {
    return Object_Getter__OptionalHandle(this._parent, "results");
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
    SpeechRecognitionEventInit_emma_Set(this._parent, !emma.empty, emma.front._parent);
  }
  auto emma()() {
    return Object_Getter__OptionalHandle(this._parent, "emma");
  }
}


extern (C) void SpeechRecognitionEventInit_results_Set(Handle, bool, Handle);
extern (C) void SpeechRecognitionEventInit_emma_Set(Handle, bool, Handle);