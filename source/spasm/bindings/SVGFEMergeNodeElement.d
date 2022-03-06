module spasm.bindings.SVGFEMergeNodeElement;

import spasm.types;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFEMergeNodeElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
}


