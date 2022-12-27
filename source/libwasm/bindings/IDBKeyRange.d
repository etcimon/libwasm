module libwasm.bindings.IDBKeyRange;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct IDBKeyRange {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto lower()() {
    return Any(Object_Getter__Handle(this.handle, "lower"));
  }
  auto upper()() {
    return Any(Object_Getter__Handle(this.handle, "upper"));
  }
  bool lowerOpen()() {
    return Object_Getter__bool(this.handle, "lowerOpen");
  }
  bool upperOpen()() {
    return Object_Getter__bool(this.handle, "upperOpen");
  }
  bool includes(T0)(scope auto ref T0 key) {
    // Any
    Handle _handle_key = getOrCreateHandle(key);
    auto result = Serialize_Object_VarArgCall!bool(this.handle, "includes", "Handle", tuple(_handle_key));
    dropHandle!(T0)(_handle_key);
    return result;
  }
  auto only(T0)(scope auto ref T0 value) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    auto result = IDBKeyRange(Object_Call_Handle__Handle(this.handle, "only", _handle_value));
    dropHandle!(T0)(_handle_value);
    return result;
  }
  auto lowerBound(T0)(scope auto ref T0 lower, bool open /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    auto result = IDBKeyRange(Serialize_Object_VarArgCall!Handle(this.handle, "lowerBound", "Handle;bool", tuple(_handle_lower, open)));
    dropHandle!(T0)(_handle_lower);
    return result;
  }
  auto lowerBound(T0)(scope auto ref T0 lower) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    auto result = IDBKeyRange(Object_Call_Handle__Handle(this.handle, "lowerBound", _handle_lower));
    dropHandle!(T0)(_handle_lower);
    return result;
  }
  auto upperBound(T0)(scope auto ref T0 upper, bool open /* = false */) {
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(Serialize_Object_VarArgCall!Handle(this.handle, "upperBound", "Handle;bool", tuple(_handle_upper, open)));
    dropHandle!(T0)(_handle_upper);
    return result;
  }
  auto upperBound(T0)(scope auto ref T0 upper) {
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(Object_Call_Handle__Handle(this.handle, "upperBound", _handle_upper));
    dropHandle!(T0)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */, bool upperOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(Serialize_Object_VarArgCall!Handle(this.handle, "bound", "Handle;Handle;bool;bool", tuple(_handle_lower, _handle_upper, lowerOpen, upperOpen)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(Serialize_Object_VarArgCall!Handle(this.handle, "bound", "Handle;Handle;bool", tuple(_handle_lower, _handle_upper, lowerOpen)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(Serialize_Object_VarArgCall!Handle(this.handle, "bound", "Handle;Handle", tuple(_handle_lower, _handle_upper)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
}
struct IDBLocaleAwareKeyRange {
  nothrow:
  libwasm.bindings.IDBKeyRange.IDBKeyRange _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .IDBKeyRange(h);
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */, bool upperOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(Serialize_Object_VarArgCall!Handle(this._parent, "bound", "Handle;Handle;bool;bool", tuple(_handle_lower, _handle_upper, lowerOpen, upperOpen)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(Serialize_Object_VarArgCall!Handle(this._parent, "bound", "Handle;Handle;bool", tuple(_handle_lower, _handle_upper, lowerOpen)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(Serialize_Object_VarArgCall!Handle(this._parent, "bound", "Handle;Handle", tuple(_handle_lower, _handle_upper)));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
}


