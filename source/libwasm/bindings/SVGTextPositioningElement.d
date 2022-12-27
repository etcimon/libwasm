module libwasm.bindings.SVGTextPositioningElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedLengthList;
import libwasm.bindings.SVGAnimatedNumberList;
import libwasm.bindings.SVGTextContentElement;

@safe:
nothrow:

struct SVGTextPositioningElement {
  nothrow:
  libwasm.bindings.SVGTextContentElement.SVGTextContentElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextContentElement(h);
  }
  auto x()() {
    return SVGAnimatedLengthList(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedLengthList(Object_Getter__Handle(this._parent, "y"));
  }
  auto dx()() {
    return SVGAnimatedLengthList(Object_Getter__Handle(this._parent, "dx"));
  }
  auto dy()() {
    return SVGAnimatedLengthList(Object_Getter__Handle(this._parent, "dy"));
  }
  auto rotate()() {
    return SVGAnimatedNumberList(Object_Getter__Handle(this._parent, "rotate"));
  }
}


