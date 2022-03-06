module spasm.bindings.IDBObjectStore;

import spasm.types;
import spasm.bindings.DOMStringList;
import spasm.bindings.IDBCursor;
import spasm.bindings.IDBIndex;
import spasm.bindings.IDBRequest;
import spasm.bindings.IDBTransaction;

@safe:
nothrow:

struct IDBObjectStore {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  auto keyPath()() {
    return Any(Object_Getter__Handle(this.handle, "keyPath"));
  }
  auto indexNames()() {
    return DOMStringList(Object_Getter__Handle(this.handle, "indexNames"));
  }
  auto transaction()() {
    return IDBTransaction(Object_Getter__Handle(this.handle, "transaction"));
  }
  bool autoIncrement()() {
    return Object_Getter__bool(this.handle, "autoIncrement");
  }
  auto put(T0, T1)(scope auto ref T0 value, scope auto ref T1 key) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(IDBObjectStore_put(this.handle, _handle_value, _handle_key));
    dropHandle!(T0)(_handle_value);
    dropHandle!(T1)(_handle_key);
    return result;
  }
  auto put(T0)(scope auto ref T0 value) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "put", _handle_value));
    dropHandle!(T0)(_handle_value);
    return result;
  }
  auto add(T0, T1)(scope auto ref T0 value, scope auto ref T1 key) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(IDBObjectStore_add(this.handle, _handle_value, _handle_key));
    dropHandle!(T0)(_handle_value);
    dropHandle!(T1)(_handle_key);
    return result;
  }
  auto add(T0)(scope auto ref T0 value) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "add", _handle_value));
    dropHandle!(T0)(_handle_value);
    return result;
  }
  auto delete_(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "delete", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto get(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "get", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto getKey(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "getKey", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto clear()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "clear"));
  }
  auto openCursor(T0)(scope auto ref T0 range, IDBCursorDirection direction /* = "next" */) {
    // Any
    Handle _handle_range = getOrCreateHandle(range);
    auto result = IDBRequest(IDBObjectStore_openCursor(this.handle, _handle_range, direction));
    dropHandle!(T0)(_handle_range);
    return result;
  }
  auto openCursor(T0)(scope auto ref T0 range) {
    // Any
    Handle _handle_range = getOrCreateHandle(range);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "openCursor", _handle_range));
    dropHandle!(T0)(_handle_range);
    return result;
  }
  auto openCursor()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "openCursor"));
  }
  auto createIndex()(string name, scope ref SumType!(string, Sequence!(string)) keyPath, scope ref IDBIndexParameters optionalParameters) {
    return IDBIndex(IDBObjectStore_createIndex(this.handle, name, keyPath, optionalParameters.handle));
  }
  auto createIndex()(string name, scope ref SumType!(string, Sequence!(string)) keyPath) {
    return IDBIndex(IDBObjectStore_createIndex_0(this.handle, name, keyPath));
  }
  auto index()(string name) {
    return IDBIndex(Object_Call_string__Handle(this.handle, "index", name));
  }
  void deleteIndex()(string indexName) {
    Object_Call_string__void(this.handle, "deleteIndex", indexName);
  }
  auto count(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "count", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto count()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "count"));
  }
  auto mozGetAll(T0)(scope auto ref T0 key, uint limit) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(IDBObjectStore_mozGetAll(this.handle, _handle_key, limit));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto mozGetAll(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "mozGetAll", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto mozGetAll()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "mozGetAll"));
  }
  auto getAll(T0)(scope auto ref T0 key, uint limit) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(IDBObjectStore_getAll(this.handle, _handle_key, limit));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto getAll(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "getAll", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto getAll()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "getAll"));
  }
  auto getAllKeys(T0)(scope auto ref T0 key, uint limit) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(IDBObjectStore_getAllKeys(this.handle, _handle_key, limit));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto getAllKeys(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "getAllKeys", _handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto getAllKeys()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "getAllKeys"));
  }
  auto openKeyCursor(T0)(scope auto ref T0 range, IDBCursorDirection direction /* = "next" */) {
    // Any
    Handle _handle_range = getOrCreateHandle(range);
    auto result = IDBRequest(IDBObjectStore_openKeyCursor(this.handle, _handle_range, direction));
    dropHandle!(T0)(_handle_range);
    return result;
  }
  auto openKeyCursor(T0)(scope auto ref T0 range) {
    // Any
    Handle _handle_range = getOrCreateHandle(range);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "openKeyCursor", _handle_range));
    dropHandle!(T0)(_handle_range);
    return result;
  }
  auto openKeyCursor()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "openKeyCursor"));
  }
}
struct IDBObjectStoreParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IDBObjectStoreParameters(spasm_add__object());
  }
  void keyPath(T0)(scope auto ref Optional!(T0) keyPath) if (isTOrPointer!(T0, SumType!(string, Sequence!(string)))) {
    IDBObjectStoreParameters_keyPath_Set(this.handle, !keyPath.empty, *keyPath.frontRef);
  }
  auto keyPath()() {
    return IDBObjectStoreParameters_keyPath_Get(this.handle);
  }
  void autoIncrement()(bool autoIncrement) {
    Object_Call_bool__void(this.handle, "autoIncrement", autoIncrement);
  }
  bool autoIncrement()() {
    return Object_Getter__bool(this.handle, "autoIncrement");
  }
}


extern (C) Handle IDBObjectStore_put(Handle, Handle, Handle);
extern (C) Handle IDBObjectStore_add(Handle, Handle, Handle);
extern (C) Handle IDBObjectStore_openCursor(Handle, Handle, IDBCursorDirection);
extern (C) Handle IDBObjectStore_createIndex(Handle, string, scope ref SumType!(string, Sequence!(string)), Handle);
extern (C) Handle IDBObjectStore_createIndex_0(Handle, string, scope ref SumType!(string, Sequence!(string)));
extern (C) Handle IDBObjectStore_mozGetAll(Handle, Handle, uint);
extern (C) Handle IDBObjectStore_getAll(Handle, Handle, uint);
extern (C) Handle IDBObjectStore_getAllKeys(Handle, Handle, uint);
extern (C) Handle IDBObjectStore_openKeyCursor(Handle, Handle, IDBCursorDirection);
extern (C) void IDBObjectStoreParameters_keyPath_Set(Handle, bool, scope ref SumType!(string, Sequence!(string)));
extern (C) Optional!(SumType!(string, Sequence!(string))) IDBObjectStoreParameters_keyPath_Get(Handle);