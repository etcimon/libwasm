module spasm.bindings.CommandEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct CommandEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  Optional!(string) command()() {
    return Object_Getter__OptionalString(this._parent, "command");
  }
}


