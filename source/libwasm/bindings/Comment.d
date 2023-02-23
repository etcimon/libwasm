module libwasm.bindings.Comment;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CharacterData;

@safe:
nothrow:

struct Comment {
  nothrow:
  libwasm.bindings.CharacterData.CharacterData _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CharacterData(h);
  }
}


