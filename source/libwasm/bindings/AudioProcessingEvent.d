module libwasm.bindings.AudioProcessingEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioBuffer;
import libwasm.bindings.Event;

@safe:
nothrow:

struct AudioProcessingEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  double playbackTime()() {
    return Object_Getter__double(this._parent, "playbackTime");
  }
  auto inputBuffer()() {
    return AudioBuffer(Object_Getter__Handle(this._parent, "inputBuffer"));
  }
  auto outputBuffer()() {
    return AudioBuffer(Object_Getter__Handle(this._parent, "outputBuffer"));
  }
}


