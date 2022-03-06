module spasm.bindings.Clipboard;

import spasm.types;
import spasm.bindings.DataTransfer;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct Clipboard {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto read()() {
    return Promise!(DataTransfer)(Object_Getter__Handle(this._parent, "read"));
  }
  auto readText()() {
    return Promise!(string)(Object_Getter__Handle(this._parent, "readText"));
  }
  auto write()(scope ref DataTransfer data) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "write", data.handle));
  }
  auto writeText()(string data) {
    return Promise!(void)(Object_Call_string__Handle(this._parent, "writeText", data));
  }
}


