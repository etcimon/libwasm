module libwasm.bindings.IDBTransaction;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMException;
import libwasm.bindings.DOMStringList;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.IDBDatabase;
import libwasm.bindings.IDBObjectStore;

@safe:
nothrow:

struct IDBTransaction {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  IDBTransactionMode mode()() {
    return Object_Getter__int(this._parent, "mode");
  }
  auto db()() {
    return IDBDatabase(Object_Getter__Handle(this._parent, "db"));
  }
  auto error()() {
    return recastOpt!(DOMException)(Object_Getter__OptionalHandle(this._parent, "error"));
  }
  auto objectStore()(string name) {
    return IDBObjectStore(Object_Call_string__Handle(this._parent, "objectStore", name));
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void oncomplete(T0)(scope auto ref Optional!(T0) oncomplete) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oncomplete", !oncomplete.empty, oncomplete.front);
  }
  EventHandler oncomplete()() {
    return Object_Getter__EventHandler(this._parent, "oncomplete");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  auto objectStoreNames()() {
    return DOMStringList(Object_Getter__Handle(this._parent, "objectStoreNames"));
  }
}
enum IDBTransactionMode {
  readonly,
  readwrite,
  readwriteflush,
  cleanup,
  versionchange
}


