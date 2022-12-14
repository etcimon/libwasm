module libwasm.bindings.ProcessingInstruction;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.CharacterData;
import libwasm.bindings.LinkStyle;
import libwasm.bindings.StyleSheet;

@safe:
nothrow:

struct ProcessingInstruction {
  nothrow:
  libwasm.bindings.CharacterData.CharacterData _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CharacterData(h);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
  auto sheet()() {
    return recastOpt!(StyleSheet)(Object_Getter__OptionalHandle(this._parent, "sheet"));
  }
}


