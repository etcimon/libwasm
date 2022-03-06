module spasm.bindings.IDBDatabase;

import spasm.types;
import spasm.bindings.DOMStringList;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.IDBObjectStore;
import spasm.bindings.IDBRequest;
import spasm.bindings.IDBTransaction;
import spasm.bindings.StorageType;

@safe:
nothrow:

struct IDBDatabase {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  uint version_()() {
    return Object_Getter__uint(this._parent, "version");
  }
  auto objectStoreNames()() {
    return DOMStringList(Object_Getter__Handle(this._parent, "objectStoreNames"));
  }
  auto createObjectStore()(string name, scope ref IDBObjectStoreParameters optionalParameters) {
    return IDBObjectStore(IDBDatabase_createObjectStore(this._parent, name, optionalParameters.handle));
  }
  auto createObjectStore()(string name) {
    return IDBObjectStore(Object_Call_string__Handle(this._parent, "createObjectStore", name));
  }
  void deleteObjectStore()(string name) {
    Object_Call_string__void(this._parent, "deleteObjectStore", name);
  }
  auto transaction()(scope ref SumType!(string, Sequence!(string)) storeNames, IDBTransactionMode mode /* = "readonly" */) {
    return IDBTransaction(IDBDatabase_transaction(this._parent, storeNames, mode));
  }
  auto transaction()(scope ref SumType!(string, Sequence!(string)) storeNames) {
    return IDBTransaction(IDBDatabase_transaction_0(this._parent, storeNames));
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onversionchange(T0)(scope auto ref Optional!(T0) onversionchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onversionchange", !onversionchange.empty, onversionchange.front);
  }
  EventHandler onversionchange()() {
    return Object_Getter__EventHandler(this._parent, "onversionchange");
  }
  StorageType storage()() {
    return IDBDatabase_storage_Get(this._parent);
  }
  auto createMutableFile()(string name, string type) {
    return IDBRequest(Object_Call_string_string__Handle(this._parent, "createMutableFile", name, type));
  }
  auto createMutableFile()(string name) {
    return IDBRequest(Object_Call_string__Handle(this._parent, "createMutableFile", name));
  }
  auto mozCreateFileHandle()(string name, string type) {
    return IDBRequest(Object_Call_string_string__Handle(this._parent, "mozCreateFileHandle", name, type));
  }
  auto mozCreateFileHandle()(string name) {
    return IDBRequest(Object_Call_string__Handle(this._parent, "mozCreateFileHandle", name));
  }
}


extern (C) Handle IDBDatabase_createObjectStore(Handle, string, Handle);
extern (C) Handle IDBDatabase_transaction(Handle, scope ref SumType!(string, Sequence!(string)), IDBTransactionMode);
extern (C) Handle IDBDatabase_transaction_0(Handle, scope ref SumType!(string, Sequence!(string)));
extern (C) StorageType IDBDatabase_storage_Get(Handle);