module libwasm.bindings.IterableIterator;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct IterableKeyAndValueResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IterableKeyAndValueResult(libwasm_add__object());
  }
  void value()(scope ref Sequence!(Any) value) {
    Object_Call_Handle__void(this.handle, "value", value.handle);
  }
  auto value()() {
    return Sequence!(Any)(Object_Getter__Handle(this.handle, "value"));
  }
  void done()(bool done) {
    Object_Call_bool__void(this.handle, "done", done);
  }
  bool done()() {
    return Object_Getter__bool(this.handle, "done");
  }
}
struct IterableKeyOrValueResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IterableKeyOrValueResult(libwasm_add__object());
  }
  void value(T0)(scope auto ref T0 value) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "value", cast(string) value);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "value", cast(long) value);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "value", cast(double) value);
      return;
    }
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    Object_Call_Handle__void(this.handle, "value", _handle_value);
    dropHandle!(T0)(_handle_value);
  }
  auto value()() {
    return Any(Object_Getter__Handle(this.handle, "value"));
  }
  void done()(bool done) {
    Object_Call_bool__void(this.handle, "done", done);
  }
  bool done()() {
    return Object_Getter__bool(this.handle, "done");
  }
}


