module spasm.bindings.SpeechGrammarList;

import spasm.types;
import spasm.bindings.SpeechGrammar;

@safe:
nothrow:

struct SpeechGrammarList {
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
    return SpeechGrammar(Object_Call_uint__Handle(this.handle, "item", index));
  }
  void addFromURI()(string src, float weight) {
    SpeechGrammarList_addFromURI(this.handle, src, weight);
  }
  void addFromURI()(string src) {
    Object_Call_string__void(this.handle, "addFromURI", src);
  }
  void addFromString()(string string, float weight) {
    SpeechGrammarList_addFromString(this.handle, string, weight);
  }
  void addFromString()(string string) {
    Object_Call_string__void(this.handle, "addFromString", string);
  }
}


extern (C) void SpeechGrammarList_addFromURI(Handle, string, float);
extern (C) void SpeechGrammarList_addFromString(Handle, string, float);