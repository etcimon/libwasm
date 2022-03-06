module spasm.bindings.IDBKeyRange;

import spasm.types;
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
    auto result = IDBKeyRange_includes(this.handle, _handle_key);
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
    auto result = IDBKeyRange(IDBKeyRange_lowerBound(this.handle, _handle_lower, open));
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
    auto result = IDBKeyRange(IDBKeyRange_upperBound(this.handle, _handle_upper, open));
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
    auto result = IDBKeyRange(IDBKeyRange_bound(this.handle, _handle_lower, _handle_upper, lowerOpen, upperOpen));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(IDBKeyRange_bound_0(this.handle, _handle_lower, _handle_upper, lowerOpen));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBKeyRange(IDBKeyRange_bound_1(this.handle, _handle_lower, _handle_upper));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
}
struct IDBLocaleAwareKeyRange {
  nothrow:
  spasm.bindings.IDBKeyRange.IDBKeyRange _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .IDBKeyRange(h);
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */, bool upperOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(IDBLocaleAwareKeyRange_bound(this._parent, _handle_lower, _handle_upper, lowerOpen, upperOpen));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper, bool lowerOpen /* = false */) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(IDBLocaleAwareKeyRange_bound_0(this._parent, _handle_lower, _handle_upper, lowerOpen));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
  auto bound(T0, T1)(scope auto ref T0 lower, scope auto ref T1 upper) {
    // Any
    Handle _handle_lower = getOrCreateHandle(lower);
    // Any
    Handle _handle_upper = getOrCreateHandle(upper);
    auto result = IDBLocaleAwareKeyRange(IDBLocaleAwareKeyRange_bound_1(this._parent, _handle_lower, _handle_upper));
    dropHandle!(T0)(_handle_lower);
    dropHandle!(T1)(_handle_upper);
    return result;
  }
}


extern (C) bool IDBKeyRange_includes(Handle, Handle);
extern (C) Handle IDBKeyRange_lowerBound(Handle, Handle, bool);
extern (C) Handle IDBKeyRange_upperBound(Handle, Handle, bool);
extern (C) Handle IDBKeyRange_bound(Handle, Handle, Handle, bool, bool);
extern (C) Handle IDBKeyRange_bound_0(Handle, Handle, Handle, bool);
extern (C) Handle IDBKeyRange_bound_1(Handle, Handle, Handle);
extern (C) Handle IDBLocaleAwareKeyRange_bound(Handle, Handle, Handle, bool, bool);
extern (C) Handle IDBLocaleAwareKeyRange_bound_0(Handle, Handle, Handle, bool);
extern (C) Handle IDBLocaleAwareKeyRange_bound_1(Handle, Handle, Handle);