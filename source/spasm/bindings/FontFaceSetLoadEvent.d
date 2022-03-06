module spasm.bindings.FontFaceSetLoadEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.FontFace;

@safe:
nothrow:

struct FontFaceSetLoadEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto fontfaces()() {
    return Sequence!(FontFace)(Object_Getter__Handle(this._parent, "fontfaces"));
  }
}
struct FontFaceSetLoadEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return FontFaceSetLoadEventInit(spasm_add__object());
  }
  void fontfaces()(scope ref Sequence!(FontFace) fontfaces) {
    Object_Call_Handle__void(this._parent, "fontfaces", fontfaces.handle);
  }
  auto fontfaces()() {
    return Sequence!(FontFace)(Object_Getter__Handle(this._parent, "fontfaces"));
  }
}


