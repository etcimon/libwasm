module spasm.bindings.SVGFilterPrimitiveStandardAttributes;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedString;

@safe:
nothrow:

struct SVGFilterPrimitiveStandardAttributes {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto x()() {
    return SVGAnimatedLength(Object_Getter__Handle(this.handle, "x"));
  }
  auto y()() {
    return SVGAnimatedLength(Object_Getter__Handle(this.handle, "y"));
  }
  auto width()() {
    return SVGAnimatedLength(Object_Getter__Handle(this.handle, "width"));
  }
  auto height()() {
    return SVGAnimatedLength(Object_Getter__Handle(this.handle, "height"));
  }
  auto result()() {
    return SVGAnimatedString(Object_Getter__Handle(this.handle, "result"));
  }
}


