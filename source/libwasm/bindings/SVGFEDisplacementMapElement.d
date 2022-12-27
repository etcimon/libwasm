module libwasm.bindings.SVGFEDisplacementMapElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEDisplacementMapElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_CHANNEL_UNKNOWN = 0;
  enum ushort SVG_CHANNEL_R = 1;
  enum ushort SVG_CHANNEL_G = 2;
  enum ushort SVG_CHANNEL_B = 3;
  enum ushort SVG_CHANNEL_A = 4;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto in2()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in2"));
  }
  auto scale()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "scale"));
  }
  auto xChannelSelector()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "xChannelSelector"));
  }
  auto yChannelSelector()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "yChannelSelector"));
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


