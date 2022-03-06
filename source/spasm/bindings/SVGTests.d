module spasm.bindings.SVGTests;

import spasm.types;
import spasm.bindings.SVGStringList;

@safe:
nothrow:

struct SVGTests {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto requiredFeatures()() {
    return SVGStringList(Object_Getter__Handle(this.handle, "requiredFeatures"));
  }
  auto requiredExtensions()() {
    return SVGStringList(Object_Getter__Handle(this.handle, "requiredExtensions"));
  }
  auto systemLanguage()() {
    return SVGStringList(Object_Getter__Handle(this.handle, "systemLanguage"));
  }
  bool hasExtension()(string extension) {
    return Object_Call_string__bool(this.handle, "hasExtension", extension);
  }
}


