module libwasm.bindings.FontFaceSetLoadEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.FontFace;

@safe:
nothrow:

struct FontFaceSetLoadEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return FontFaceSetLoadEventInit(libwasm_add__object());
  }
  void fontfaces()(scope ref Sequence!(FontFace) fontfaces) {
    Object_Call_Handle__void(this._parent, "fontfaces", fontfaces.handle);
  }
  auto fontfaces()() {
    return Sequence!(FontFace)(Object_Getter__Handle(this._parent, "fontfaces"));
  }
}


