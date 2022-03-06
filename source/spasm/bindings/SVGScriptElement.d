module spasm.bindings.SVGScriptElement;

import spasm.types;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGScriptElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void crossOrigin(T0)(scope auto ref Optional!(T0) crossOrigin) if (isTOrPointer!(T0, string)) {
    SVGScriptElement_crossOrigin_Set(this._parent, !crossOrigin.empty, crossOrigin.front);
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


extern (C) void SVGScriptElement_crossOrigin_Set(Handle, bool, string);