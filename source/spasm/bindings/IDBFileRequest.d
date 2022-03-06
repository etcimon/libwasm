module spasm.bindings.IDBFileRequest;

import spasm.types;
import spasm.bindings.DOMRequest;
import spasm.bindings.EventHandler;
import spasm.bindings.IDBFileHandle;

@safe:
nothrow:

struct IDBFileRequest {
  nothrow:
  spasm.bindings.DOMRequest.DOMRequest _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMRequest(h);
  }
  auto fileHandle()() {
    return Object_Getter__OptionalHandle(this._parent, "fileHandle");
  }
  auto lockedFile()() {
    return Object_Getter__OptionalHandle(this._parent, "lockedFile");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
}


