module libwasm.bindings.SpeechSynthesisErrorEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SpeechSynthesisEvent;

@safe:
nothrow:

enum SpeechSynthesisErrorCode {
  canceled,
  interrupted,
  audio_busy,
  audio_hardware,
  network,
  synthesis_unavailable,
  synthesis_failed,
  language_unavailable,
  voice_unavailable,
  text_too_long,
  invalid_argument
}
struct SpeechSynthesisErrorEvent {
  nothrow:
  libwasm.bindings.SpeechSynthesisEvent.SpeechSynthesisEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SpeechSynthesisEvent(h);
  }
  SpeechSynthesisErrorCode error()() {
    return Object_Getter__int(this._parent, "error");
  }
}
struct SpeechSynthesisErrorEventInit {
  nothrow:
  libwasm.bindings.SpeechSynthesisEvent.SpeechSynthesisEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SpeechSynthesisEventInit(h);
  }
  static auto create() {
    return SpeechSynthesisErrorEventInit(libwasm_add__object());
  }
  void error()(SpeechSynthesisErrorCode error) {
    Object_Call_int__void(this._parent, "error", error);
  }
  SpeechSynthesisErrorCode error()() {
    return Object_Getter__int(this._parent, "error");
  }
}


