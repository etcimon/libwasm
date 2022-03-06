module spasm.bindings.SVGFEGaussianBlurElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEGaussianBlurElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto stdDeviationX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "stdDeviationX"));
  }
  auto stdDeviationY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "stdDeviationY"));
  }
  void setStdDeviation()(float stdDeviationX, float stdDeviationY) {
    SVGFEGaussianBlurElement_setStdDeviation(this._parent, stdDeviationX, stdDeviationY);
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
}


extern (C) void SVGFEGaussianBlurElement_setStdDeviation(Handle, float, float);