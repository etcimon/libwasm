module spasm.bindings.SVGFEImageElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFilterPrimitiveStandardAttributes;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGFEImageElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
  auto x()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y"));
  }
  auto width()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "width"));
  }
  auto height()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "height"));
  }
  auto result()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "result"));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


