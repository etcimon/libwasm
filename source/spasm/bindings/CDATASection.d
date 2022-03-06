module spasm.bindings.CDATASection;

import spasm.types;
import spasm.bindings.Text;

@safe:
nothrow:

struct CDATASection {
  nothrow:
  spasm.bindings.Text.Text _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Text(h);
  }
}


