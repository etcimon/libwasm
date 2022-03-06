module spasm.bindings.SVGUseElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGGraphicsElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGUseElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
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
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


