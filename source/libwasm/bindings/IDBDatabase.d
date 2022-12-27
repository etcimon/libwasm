module libwasm.bindings.IDBDatabase;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DOMStringList;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.IDBObjectStore;
import libwasm.bindings.IDBRequest;
import libwasm.bindings.IDBTransaction;
import libwasm.bindings.StorageType;

@safe:
nothrow:

struct IDBDatabase {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
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
    return IDBObjectStore(Serialize_Object_VarArgCall!Handle(this._parent, "createObjectStore", "string;Handle", tuple(name, cast(Handle)optionalParameters.handle)));
  }
  auto createObjectStore()(string name) {
    return IDBObjectStore(Object_Call_string__Handle(this._parent, "createObjectStore", name));
  }
  void deleteObjectStore()(string name) {
    Object_Call_string__void(this._parent, "deleteObjectStore", name);
  }
  auto transaction()(scope ref SumType!(string, Sequence!(string)) storeNames, IDBTransactionMode mode /* = "readonly" */) {
    return IDBTransaction(Serialize_Object_VarArgCall!Handle(this._parent, "transaction", "SumType!(string,Handle);Enum", tuple(libwasm.sumtype.match!(((string v) => 0),((ref storeNames.Types[1] v) => 1))(storeNames),tuple(libwasm.sumtype.match!(((string v) => v),((ref storeNames.Types[1] v) => string.init))(storeNames),libwasm.sumtype.match!(((string v) => Handle.init),((ref storeNames.Types[1] v) => cast(Handle)v.handle))(storeNames)), mode)));
  }
  auto transaction()(scope ref SumType!(string, Sequence!(string)) storeNames) {
    return IDBTransaction(Serialize_Object_VarArgCall!Handle(this._parent, "transaction", "SumType!(string,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref storeNames.Types[1] v) => 1))(storeNames),tuple(libwasm.sumtype.match!(((string v) => v),((ref storeNames.Types[1] v) => string.init))(storeNames),libwasm.sumtype.match!(((string v) => Handle.init),((ref storeNames.Types[1] v) => cast(Handle)v.handle))(storeNames)))));
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onversionchange(T0)(scope auto ref Optional!(T0) onversionchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onversionchange", !onversionchange.empty, onversionchange.front);
  }
  EventHandler onversionchange()() {
    return Object_Getter__EventHandler(this._parent, "onversionchange");
  }
  StorageType storage()() {
    return Object_Getter__int(this._parent, "storage");
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


