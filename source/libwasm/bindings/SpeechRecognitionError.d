module libwasm.bindings.SpeechRecognitionError;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct SpeechRecognitionError {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  SpeechRecognitionErrorCode error()() {
    return Object_Getter__int(this._parent, "error");
  }
  Optional!(string) message()() {
    return Object_Getter__OptionalString(this._parent, "message");
  }
}
enum SpeechRecognitionErrorCode {
  no_speech,
  aborted,
  audio_capture,
  network,
  not_allowed,
  service_not_allowed,
  bad_grammar,
  language_not_supported
}
struct SpeechRecognitionErrorInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SpeechRecognitionErrorInit(libwasm_add__object());
  }
  void error()(SpeechRecognitionErrorCode error) {
    Object_Call_int__void(this._parent, "error", error);
  }
  SpeechRecognitionErrorCode error()() {
    return Object_Getter__int(this._parent, "error");
  }
  void message()(string message) {
    Object_Call_string__void(this._parent, "message", message);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
}


