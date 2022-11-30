module libwasm.bindings.Position;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Coordinates;

@safe:
nothrow:

struct Position {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto coords()() {
    return Coordinates(Object_Getter__Handle(this.handle, "coords"));
  }
  auto timestamp()() {
    return DOMTimeStamp(Object_Getter__Handle(this.handle, "timestamp"));
  }
}


