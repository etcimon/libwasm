module libwasm.bindings.SpeechGrammar;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct SpeechGrammar {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void src()(string src) {
    Object_Call_string__void(this.handle, "src", src);
  }
  string src()() {
    return Object_Getter__string(this.handle, "src");
  }
  void weight()(float weight) {
    Object_Call_float__void(this.handle, "weight", weight);
  }
  float weight()() {
    return Object_Getter__float(this.handle, "weight");
  }
}


