module libwasm.bindings.IDBFileRequest;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMRequest;
import libwasm.bindings.EventHandler;
import libwasm.bindings.IDBFileHandle;

@safe:
nothrow:

struct IDBFileRequest {
  nothrow:
  libwasm.bindings.DOMRequest.DOMRequest _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMRequest(h);
  }
  auto fileHandle()() {
    return recastOpt!(IDBFileHandle)(Object_Getter__OptionalHandle(this._parent, "fileHandle"));
  }
  auto lockedFile()() {
    return recastOpt!(IDBFileHandle)(Object_Getter__OptionalHandle(this._parent, "lockedFile"));
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
}


