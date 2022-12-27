module libwasm.bindings.SVGTextPathElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGTextContentElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGTextPathElement {
  nothrow:
  libwasm.bindings.SVGTextContentElement.SVGTextContentElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextContentElement(h);
  }
  enum ushort TEXTPATH_METHODTYPE_UNKNOWN = 0;
  enum ushort TEXTPATH_METHODTYPE_ALIGN = 1;
  enum ushort TEXTPATH_METHODTYPE_STRETCH = 2;
  enum ushort TEXTPATH_SPACINGTYPE_UNKNOWN = 0;
  enum ushort TEXTPATH_SPACINGTYPE_AUTO = 1;
  enum ushort TEXTPATH_SPACINGTYPE_EXACT = 2;
  auto startOffset()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "startOffset"));
  }
  auto method()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "method"));
  }
  auto spacing()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "spacing"));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


