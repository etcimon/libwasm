module spasm.bindings.TextClause;

import spasm.types;
@safe:
nothrow:

struct TextClause {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int startOffset()() {
    return Object_Getter__int(this.handle, "startOffset");
  }
  int endOffset()() {
    return Object_Getter__int(this.handle, "endOffset");
  }
  bool isCaret()() {
    return Object_Getter__bool(this.handle, "isCaret");
  }
  bool isTargetClause()() {
    return Object_Getter__bool(this.handle, "isTargetClause");
  }
}


