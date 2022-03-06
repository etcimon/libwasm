module spasm.bindings.SpeechRecognitionResultList;

import spasm.types;
import spasm.bindings.SpeechRecognitionResult;

@safe:
nothrow:

struct SpeechRecognitionResultList {
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
    return SpeechRecognitionResult(Object_Call_uint__Handle(this.handle, "item", index));
  }
}


