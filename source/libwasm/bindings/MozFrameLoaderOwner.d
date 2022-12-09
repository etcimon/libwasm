module libwasm.bindings.MozFrameLoaderOwner;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.FrameLoader;
import libwasm.bindings.HTMLIFrameElement;

@safe:
nothrow:

struct MozFrameLoaderOwner {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto frameLoader()() {
    return recastOpt!(FrameLoader)(Object_Getter__OptionalHandle(this.handle, "frameLoader"));
  }
  void presetOpenerWindow(T0)(scope auto ref Optional!(T0) window) if (isTOrPointer!(T0, WindowProxy)) {
    Serialize_Object_VarArgCall!void(this.handle, "presetOpenerWindow", "Optional!Handle", tuple(!window.empty, cast(Handle)window.front.handle));
  }
  void swapFrameLoaders()(scope ref XULFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this.handle, "swapFrameLoaders", aOtherLoaderOwner.handle);
  }
  void swapFrameLoaders()(scope ref HTMLIFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this.handle, "swapFrameLoaders", aOtherLoaderOwner._parent);
  }
}


