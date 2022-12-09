module libwasm.bindings.MediaStreamEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaStreamEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stream()() {
    return recastOpt!(MediaStream)(Object_Getter__OptionalHandle(this._parent, "stream"));
  }
}
struct MediaStreamEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaStreamEventInit(libwasm_add__object());
  }
  void stream(T0)(scope auto ref Optional!(T0) stream) if (isTOrPointer!(T0, MediaStream)) {
    Serialize_Object_VarArgCall!void(this._parent, "stream", "Optional!Handle", tuple(!stream.empty, cast(Handle)stream.front._parent));
  }
  auto stream()() {
    return recastOpt!(MediaStream)(Object_Getter__OptionalHandle(this._parent, "stream"));
  }
}


