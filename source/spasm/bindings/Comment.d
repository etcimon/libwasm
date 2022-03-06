module spasm.bindings.Comment;

import spasm.types;
import spasm.bindings.CharacterData;

@safe:
nothrow:

struct Comment {
  nothrow:
  spasm.bindings.CharacterData.CharacterData _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CharacterData(h);
  }
}


