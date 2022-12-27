module libwasm.bindings.MIDIOptions;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct MIDIOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MIDIOptions(libwasm_add__object());
  }
  void sysex()(bool sysex) {
    Object_Call_bool__void(this.handle, "sysex", sysex);
  }
  bool sysex()() {
    return Object_Getter__bool(this.handle, "sysex");
  }
  void software()(bool software) {
    Object_Call_bool__void(this.handle, "software", software);
  }
  bool software()() {
    return Object_Getter__bool(this.handle, "software");
  }
}


