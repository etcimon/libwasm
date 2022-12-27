module libwasm.bindings.SVGAnimatedRect;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGRect;

@safe:
nothrow:

struct SVGAnimatedRect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return recastOpt!(SVGRect)(Object_Getter__OptionalHandle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return recastOpt!(SVGRect)(Object_Getter__OptionalHandle(this.handle, "animVal"));
  }
}


