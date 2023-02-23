module libwasm.bindings.FontFaceSource;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.FontFaceSet;

@safe:
nothrow:

struct FontFaceSource {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto fonts()() {
    return FontFaceSet(Object_Getter__Handle(this.handle, "fonts"));
  }
}


