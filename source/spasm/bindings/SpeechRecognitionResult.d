module spasm.bindings.SpeechRecognitionResult;

import spasm.types;
import spasm.bindings.SpeechRecognitionAlternative;

@safe:
nothrow:

struct SpeechRecognitionResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return SpeechRecognitionAlternative(Object_Call_uint__Handle(this.handle, "item", index));
  }
  bool isFinal()() {
    return Object_Getter__bool(this.handle, "isFinal");
  }
}


