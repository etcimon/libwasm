module spasm.bindings.SVGAnimatedPathData;

import spasm.types;
import spasm.bindings.SVGPathSegList;

@safe:
nothrow:

struct SVGAnimatedPathData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto pathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this.handle, "pathSegList"));
  }
  auto animatedPathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this.handle, "animatedPathSegList"));
  }
}


