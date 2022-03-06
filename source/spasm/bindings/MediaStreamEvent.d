module spasm.bindings.MediaStreamEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaStreamEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stream()() {
    return Object_Getter__OptionalHandle(this._parent, "stream");
  }
}
struct MediaStreamEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaStreamEventInit(spasm_add__object());
  }
  void stream(T0)(scope auto ref Optional!(T0) stream) if (isTOrPointer!(T0, MediaStream)) {
    MediaStreamEventInit_stream_Set(this._parent, !stream.empty, stream.front._parent);
  }
  auto stream()() {
    return Object_Getter__OptionalHandle(this._parent, "stream");
  }
}


extern (C) void MediaStreamEventInit_stream_Set(Handle, bool, Handle);