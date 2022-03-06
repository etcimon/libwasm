module spasm.bindings.FontFaceSource;

import spasm.types;
import spasm.bindings.FontFaceSet;

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


