module libwasm.bindings.SVGFEDropShadowElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEDropShadowElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto dx()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "dx"));
  }
  auto dy()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "dy"));
  }
  auto stdDeviationX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "stdDeviationX"));
  }
  auto stdDeviationY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "stdDeviationY"));
  }
  void setStdDeviation()(float stdDeviationX, float stdDeviationY) {
    Serialize_Object_VarArgCall!void(this._parent, "setStdDeviation", "float;float", tuple(stdDeviationX, stdDeviationY));
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


