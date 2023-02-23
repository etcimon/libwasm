module libwasm.bindings.Clipboard;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DataTransfer;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct Clipboard {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto read()() {
    return JsPromise!(DataTransfer)(Object_Getter__Handle(this._parent, "read"));
  }
  auto readText()() {
    return JsPromise!(string)(Object_Getter__Handle(this._parent, "readText"));
  }
  auto write()(scope ref DataTransfer data) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this._parent, "write", data.handle));
  }
  auto writeText()(string data) {
    return JsPromise!(void)(Object_Call_string__Handle(this._parent, "writeText", data));
  }
}


