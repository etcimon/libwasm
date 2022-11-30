module libwasm.bindings.ImageDocument;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLDocument;

@safe:
nothrow:

struct ImageDocument {
  nothrow:
  libwasm.bindings.HTMLDocument.HTMLDocument _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLDocument(h);
  }
  bool imageIsOverflowing()() {
    return Object_Getter__bool(this._parent, "imageIsOverflowing");
  }
  bool imageIsResized()() {
    return Object_Getter__bool(this._parent, "imageIsResized");
  }
  auto imageRequest()() {
    return Optional!(imgIRequest)(Object_Getter__OptionalHandle(this._parent, "imageRequest"));
  }
  void shrinkToFit()() {
    Object_Call__void(this._parent, "shrinkToFit");
  }
  void restoreImage()() {
    Object_Call__void(this._parent, "restoreImage");
  }
  void restoreImageTo()(int x, int y) {
    Serialize_Object_VarArgCall!void(this._parent, "restoreImageTo", "int;int", tuple(x, y));
  }
  void toggleImageSize()() {
    Object_Call__void(this._parent, "toggleImageSize");
  }
}


