module libwasm.bindings.ImageBitmapRenderingContext;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.ImageBitmap;

@safe:
nothrow:

struct ImageBitmapRenderingContext {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void transferFromImageBitmap()(scope ref ImageBitmap bitmap) {
    Object_Call_Handle__void(this.handle, "transferFromImageBitmap", bitmap.handle);
  }
  void transferImageBitmap()(scope ref ImageBitmap bitmap) {
    Object_Call_Handle__void(this.handle, "transferImageBitmap", bitmap.handle);
  }
}


