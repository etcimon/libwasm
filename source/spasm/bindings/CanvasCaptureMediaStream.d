module spasm.bindings.CanvasCaptureMediaStream;

import spasm.types;
import spasm.bindings.HTMLCanvasElement;
import spasm.bindings.MediaStream;

@safe:
nothrow:

struct CanvasCaptureMediaStream {
  nothrow:
  spasm.bindings.MediaStream.MediaStream _parent;
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


