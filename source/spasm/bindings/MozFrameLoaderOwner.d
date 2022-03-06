module spasm.bindings.MozFrameLoaderOwner;

import spasm.types;
import spasm.bindings.FrameLoader;
import spasm.bindings.HTMLIFrameElement;

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
    return Object_Getter__OptionalHandle(this.handle, "frameLoader");
  }
  void presetOpenerWindow(T0)(scope auto ref Optional!(T0) window) if (isTOrPointer!(T0, WindowProxy)) {
    MozFrameLoaderOwner_presetOpenerWindow(this.handle, !window.empty, window.front.handle);
  }
  void swapFrameLoaders()(scope ref XULFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this.handle, "swapFrameLoaders", aOtherLoaderOwner.handle);
  }
  void swapFrameLoaders()(scope ref HTMLIFrameElement aOtherLoaderOwner) {
    Object_Call_Handle__void(this.handle, "swapFrameLoaders", aOtherLoaderOwner._parent);
  }
}


extern (C) void MozFrameLoaderOwner_presetOpenerWindow(Handle, bool, Handle);