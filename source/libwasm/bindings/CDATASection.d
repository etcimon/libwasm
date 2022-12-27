module libwasm.bindings.CDATASection;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Text;

@safe:
nothrow:

struct CDATASection {
  nothrow:
  libwasm.bindings.Text.Text _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Text(h);
  }
}


