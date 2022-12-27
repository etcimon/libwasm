module libwasm.bindings.CanvasCaptureMediaStream;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLCanvasElement;
import libwasm.bindings.MediaStream;

@safe:
nothrow:

struct CanvasCaptureMediaStream {
  nothrow:
  libwasm.bindings.MediaStream.MediaStream _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MediaStream(h);
  }
  auto canvas()() {
    return HTMLCanvasElement(Object_Getter__Handle(this._parent, "canvas"));
  }
  void requestFrame()() {
    Object_Call__void(this._parent, "requestFrame");
  }
}


