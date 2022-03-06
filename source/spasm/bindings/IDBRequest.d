module spasm.bindings.IDBRequest;

import spasm.types;
import spasm.bindings.DOMException;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.IDBCursor;
import spasm.bindings.IDBIndex;
import spasm.bindings.IDBObjectStore;
import spasm.bindings.IDBTransaction;

@safe:
nothrow:

struct IDBRequest {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto result()() {
    return Any(Object_Getter__Handle(this._parent, "result"));
  }
  auto error()() {
    return Object_Getter__OptionalHandle(this._parent, "error");
  }
  auto source()() {
    return IDBRequest_source_Get(this._parent);
  }
  auto transaction()() {
    return Object_Getter__OptionalHandle(this._parent, "transaction");
  }
  IDBRequestReadyState readyState()() {
    return IDBRequest_readyState_Get(this._parent);
  }
  void onsuccess(T0)(scope auto ref Optional!(T0) onsuccess) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsuccess", !onsuccess.empty, onsuccess.front);
  }
  EventHandler onsuccess()() {
    return Object_Getter__EventHandler(this._parent, "onsuccess");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}
enum IDBRequestReadyState {
  pending,
  done
}


extern (C) Optional!(SumType!(IDBObjectStore, IDBIndex, IDBCursor)) IDBRequest_source_Get(Handle);
extern (C) IDBRequestReadyState IDBRequest_readyState_Get(Handle);