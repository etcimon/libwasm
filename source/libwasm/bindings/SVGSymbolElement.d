module libwasm.bindings.SVGSymbolElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedRect;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFitToViewBox;
import libwasm.bindings.SVGStringList;
import libwasm.bindings.SVGTests;

@safe:
nothrow:

struct SVGSymbolElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto viewBox()() {
    return SVGAnimatedRect(Object_Getter__Handle(this._parent, "viewBox"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
  auto requiredFeatures()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "requiredFeatures"));
  }
  auto requiredExtensions()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "requiredExtensions"));
  }
  auto systemLanguage()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "systemLanguage"));
  }
  bool hasExtension()(string extension) {
    return Object_Call_string__bool(this._parent, "hasExtension", extension);
  }
}


