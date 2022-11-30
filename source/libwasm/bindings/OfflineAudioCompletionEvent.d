module libwasm.bindings.OfflineAudioCompletionEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioBuffer;
import libwasm.bindings.Event;

@safe:
nothrow:

struct OfflineAudioCompletionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return OfflineAudioCompletionEventInit(libwasm_add__object());
  }
  void renderedBuffer()(scope ref AudioBuffer renderedBuffer) {
    Object_Call_Handle__void(this._parent, "renderedBuffer", renderedBuffer.handle);
  }
  auto renderedBuffer()() {
    return AudioBuffer(Object_Getter__Handle(this._parent, "renderedBuffer"));
  }
}


