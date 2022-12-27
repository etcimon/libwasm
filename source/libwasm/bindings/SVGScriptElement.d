module libwasm.bindings.SVGScriptElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGScriptElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "crossOrigin", "Optional!(string)", tuple(!crossOrigin.empty, crossOrigin.front));
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


