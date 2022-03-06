module spasm.bindings.SpeechSynthesisErrorEvent;

import spasm.types;
import spasm.bindings.SpeechSynthesisEvent;

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
  spasm.bindings.SpeechSynthesisEvent.SpeechSynthesisEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SpeechSynthesisEvent(h);
  }
  SpeechSynthesisErrorCode error()() {
    return SpeechSynthesisErrorEvent_error_Get(this._parent);
  }
}
struct SpeechSynthesisErrorEventInit {
  nothrow:
  spasm.bindings.SpeechSynthesisEvent.SpeechSynthesisEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SpeechSynthesisEventInit(h);
  }
  static auto create() {
    return SpeechSynthesisErrorEventInit(spasm_add__object());
  }
  void error()(SpeechSynthesisErrorCode error) {
    SpeechSynthesisErrorEventInit_error_Set(this._parent, error);
  }
  SpeechSynthesisErrorCode error()() {
    return SpeechSynthesisErrorEventInit_error_Get(this._parent);
  }
}


extern (C) SpeechSynthesisErrorCode SpeechSynthesisErrorEvent_error_Get(Handle);
extern (C) void SpeechSynthesisErrorEventInit_error_Set(Handle, SpeechSynthesisErrorCode);
extern (C) SpeechSynthesisErrorCode SpeechSynthesisErrorEventInit_error_Get(Handle);