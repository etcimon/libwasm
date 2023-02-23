module libwasm.bindings.IDBRequest;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DOMException;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.IDBCursor;
import libwasm.bindings.IDBIndex;
import libwasm.bindings.IDBObjectStore;
import libwasm.bindings.IDBTransaction;

@safe:
nothrow:

struct IDBRequest {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto result()() {
    return Any(Object_Getter__Handle(this._parent, "result"));
  }
  auto error()() {
    return recastOpt!(DOMException)(Object_Getter__OptionalHandle(this._parent, "error"));
  }
  auto source()() {
    return IDBRequest_source_Get(this._parent);
  }
  auto transaction()() {
    return recastOpt!(IDBTransaction)(Object_Getter__OptionalHandle(this._parent, "transaction"));
  }
  IDBRequestReadyState readyState()() {
    return Object_Getter__int(this._parent, "readyState");
  }
  void onsuccess(T0)(scope auto ref Optional!(T0) onsuccess) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onsuccess", !onsuccess.empty, onsuccess.front);
  }
  EventHandler onsuccess()() {
    return Object_Getter__EventHandler(this._parent, "onsuccess");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
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