module spasm.bindings.ProcessingInstruction;

import spasm.types;
import spasm.bindings.CharacterData;
import spasm.bindings.LinkStyle;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct ProcessingInstruction {
  nothrow:
  spasm.bindings.CharacterData.CharacterData _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CharacterData(h);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
  auto sheet()() {
    return Object_Getter__OptionalHandle(this._parent, "sheet");
  }
}


