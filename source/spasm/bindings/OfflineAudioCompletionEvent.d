module spasm.bindings.OfflineAudioCompletionEvent;

import spasm.types;
import spasm.bindings.AudioBuffer;
import spasm.bindings.Event;

@safe:
nothrow:

struct OfflineAudioCompletionEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto renderedBuffer()() {
    return AudioBuffer(Object_Getter__Handle(this._parent, "renderedBuffer"));
  }
}
struct OfflineAudioCompletionEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return OfflineAudioCompletionEventInit(spasm_add__object());
  }
  void renderedBuffer()(scope ref AudioBuffer renderedBuffer) {
    Object_Call_Handle__void(this._parent, "renderedBuffer", renderedBuffer.handle);
  }
  auto renderedBuffer()() {
    return AudioBuffer(Object_Getter__Handle(this._parent, "renderedBuffer"));
  }
}


