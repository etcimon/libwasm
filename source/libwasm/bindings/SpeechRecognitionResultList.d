module libwasm.bindings.SpeechRecognitionResultList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SpeechRecognitionResult;

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


