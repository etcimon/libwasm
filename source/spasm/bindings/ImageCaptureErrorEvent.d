module spasm.bindings.ImageCaptureErrorEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct ImageCaptureError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort FRAME_GRAB_ERROR = 1;
  enum ushort SETTINGS_ERROR = 2;
  enum ushort PHOTO_ERROR = 3;
  enum ushort ERROR_UNKNOWN = 4;
  ushort code()() {
    return Object_Getter__ushort(this.handle, "code");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
}
struct ImageCaptureErrorEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto imageCaptureError()() {
    return Object_Getter__OptionalHandle(this._parent, "imageCaptureError");
  }
}
struct ImageCaptureErrorEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ImageCaptureErrorEventInit(spasm_add__object());
  }
  void imageCaptureError(T0)(scope auto ref Optional!(T0) imageCaptureError) if (isTOrPointer!(T0, ImageCaptureError)) {
    ImageCaptureErrorEventInit_imageCaptureError_Set(this._parent, !imageCaptureError.empty, imageCaptureError.front.handle);
  }
  auto imageCaptureError()() {
    return Object_Getter__OptionalHandle(this._parent, "imageCaptureError");
  }
}


extern (C) void ImageCaptureErrorEventInit_imageCaptureError_Set(Handle, bool, Handle);