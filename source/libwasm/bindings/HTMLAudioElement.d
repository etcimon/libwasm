module libwasm.bindings.HTMLAudioElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLMediaElement;

@safe:
nothrow:

struct HTMLAudioElement {
  nothrow:
  libwasm.bindings.HTMLMediaElement.HTMLMediaElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLMediaElement(h);
  }
}


