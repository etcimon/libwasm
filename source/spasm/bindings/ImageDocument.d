module spasm.bindings.ImageDocument;

import spasm.types;
import spasm.bindings.HTMLDocument;

@safe:
nothrow:

struct ImageDocument {
  nothrow:
  spasm.bindings.HTMLDocument.HTMLDocument _parent;
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
    return Object_Getter__OptionalHandle(this._parent, "imageRequest");
  }
  void shrinkToFit()() {
    Object_Call__void(this._parent, "shrinkToFit");
  }
  void restoreImage()() {
    Object_Call__void(this._parent, "restoreImage");
  }
  void restoreImageTo()(int x, int y) {
    ImageDocument_restoreImageTo(this._parent, x, y);
  }
  void toggleImageSize()() {
    Object_Call__void(this._parent, "toggleImageSize");
  }
}


extern (C) void ImageDocument_restoreImageTo(Handle, int, int);