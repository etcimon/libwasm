module libwasm.bindings.SpeechSynthesisVoice;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct SpeechSynthesisVoice {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string voiceURI()() {
    return Object_Getter__string(this.handle, "voiceURI");
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string lang()() {
    return Object_Getter__string(this.handle, "lang");
  }
  bool localService()() {
    return Object_Getter__bool(this.handle, "localService");
  }
  bool default_()() {
    return Object_Getter__bool(this.handle, "default");
  }
}


