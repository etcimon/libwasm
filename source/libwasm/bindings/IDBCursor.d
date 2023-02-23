module libwasm.bindings.IDBCursor;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.IDBIndex;
import libwasm.bindings.IDBObjectStore;
import libwasm.bindings.IDBRequest;

@safe:
nothrow:

struct IDBCursor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto source()() {
    return Object_Getter__Handle(this.handle, "source");
  }
  IDBCursorDirection direction()() {
    return Object_Getter__int(this.handle, "direction");
  }
  auto key()() {
    return Any(Object_Getter__Handle(this.handle, "key"));
  }
  auto primaryKey()() {
    return Any(Object_Getter__Handle(this.handle, "primaryKey"));
  }
  auto update(T0)(scope auto ref T0 value) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    auto result = IDBRequest(Object_Call_Handle__Handle(this.handle, "update", _handle_value));
    dropHandle!(T0)(_handle_value);
    return result;
  }
  void advance()(uint count) {
    Object_Call_uint__void(this.handle, "advance", count);
  }
  void continue_(T0)(scope auto ref T0 key) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "continue", cast(string) key);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "continue", cast(long) key);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "continue", cast(double) key);
      return;
    }
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    Object_Call_Handle__void(this.handle, "continue", _handle_key);
    dropHandle!(T0)(_handle_key);
  }
  void continue_()() {
    Object_Call__void(this.handle, "continue");
  }
  void continuePrimaryKey(T0, T1)(scope auto ref T0 key, scope auto ref T1 primaryKey) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    // Any
    Handle _handle_primaryKey = getOrCreateHandle(primaryKey);
    Serialize_Object_VarArgCall!void(this.handle, "continuePrimaryKey", "Handle;Handle", tuple(_handle_key, _handle_primaryKey));
    dropHandle!(T0)(_handle_key);
    dropHandle!(T1)(_handle_primaryKey);
  }
  auto delete_()() {
    return IDBRequest(Object_Getter__Handle(this.handle, "delete"));
  }
}
enum IDBCursorDirection {
  next,
  nextunique,
  prev,
  prevunique
}
struct IDBCursorWithValue {
  nothrow:
  libwasm.bindings.IDBCursor.IDBCursor _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .IDBCursor(h);
  }
  auto value()() {
    return Any(Object_Getter__Handle(this._parent, "value"));
  }
}


