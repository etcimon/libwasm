module libwasm.bindings.ImageCaptureErrorEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

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
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto imageCaptureError()() {
    return recastOpt!(ImageCaptureError)(Object_Getter__OptionalHandle(this._parent, "imageCaptureError"));
  }
}
struct ImageCaptureErrorEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ImageCaptureErrorEventInit(libwasm_add__object());
  }
  void imageCaptureError(T0)(scope auto ref Optional!(T0) imageCaptureError) if (isTOrPointer!(T0, ImageCaptureError)) {
    Serialize_Object_VarArgCall!void(this._parent, "imageCaptureError", "Optional!Handle", tuple(!imageCaptureError.empty, cast(Handle)imageCaptureError.front.handle));
  }
  auto imageCaptureError()() {
    return recastOpt!(ImageCaptureError)(Object_Getter__OptionalHandle(this._parent, "imageCaptureError"));
  }
}


