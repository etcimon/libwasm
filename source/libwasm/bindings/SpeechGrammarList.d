module libwasm.bindings.SpeechGrammarList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SpeechGrammar;

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
    Serialize_Object_VarArgCall!void(this.handle, "addFromURI", "string;float", tuple(src, weight));
  }
  void addFromURI()(string src) {
    Object_Call_string__void(this.handle, "addFromURI", src);
  }
  void addFromString()(string string, float weight) {
    Serialize_Object_VarArgCall!void(this.handle, "addFromString", "string;float", tuple(string, weight));
  }
  void addFromString()(string string) {
    Object_Call_string__void(this.handle, "addFromString", string);
  }
}


