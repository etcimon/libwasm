module spasm.bindings.SVGComponentTransferFunctionElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGAnimatedNumberList;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGComponentTransferFunctionElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_UNKNOWN = 0;
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_IDENTITY = 1;
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_TABLE = 2;
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_DISCRETE = 3;
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_LINEAR = 4;
  enum ushort SVG_FECOMPONENTTRANSFER_TYPE_GAMMA = 5;
  auto type()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "type"));
  }
  auto tableValues()() {
    return SVGAnimatedNumberList(Object_Getter__Handle(this._parent, "tableValues"));
  }
  auto slope()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "slope"));
  }
  auto intercept()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "intercept"));
  }
  auto amplitude()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "amplitude"));
  }
  auto exponent()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "exponent"));
  }
  auto offset()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "offset"));
  }
}


