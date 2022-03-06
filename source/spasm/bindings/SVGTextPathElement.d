module spasm.bindings.SVGTextPathElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGTextContentElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGTextPathElement {
  nothrow:
  spasm.bindings.SVGTextContentElement.SVGTextContentElement _parent;
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


