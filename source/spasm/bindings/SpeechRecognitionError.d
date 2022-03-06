module spasm.bindings.SpeechRecognitionError;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct SpeechRecognitionError {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  SpeechRecognitionErrorCode error()() {
    return SpeechRecognitionError_error_Get(this._parent);
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SpeechRecognitionErrorInit(spasm_add__object());
  }
  void error()(SpeechRecognitionErrorCode error) {
    SpeechRecognitionErrorInit_error_Set(this._parent, error);
  }
  SpeechRecognitionErrorCode error()() {
    return SpeechRecognitionErrorInit_error_Get(this._parent);
  }
  void message()(string message) {
    Object_Call_string__void(this._parent, "message", message);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
}


extern (C) SpeechRecognitionErrorCode SpeechRecognitionError_error_Get(Handle);
extern (C) void SpeechRecognitionErrorInit_error_Set(Handle, SpeechRecognitionErrorCode);
extern (C) SpeechRecognitionErrorCode SpeechRecognitionErrorInit_error_Get(Handle);