module spasm.bindings.SVGFEDisplacementMapElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEDisplacementMapElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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


