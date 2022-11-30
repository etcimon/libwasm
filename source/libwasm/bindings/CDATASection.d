module libwasm.bindings.CDATASection;

import libwasm.types;

import std.typecons: tuple;
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


