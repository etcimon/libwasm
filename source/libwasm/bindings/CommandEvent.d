module libwasm.bindings.CommandEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct CommandEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  Optional!(string) command()() {
    return Object_Getter__OptionalString(this._parent, "command");
  }
}


