module spasm.bindings.Headers;

import spasm.types;
@safe:
nothrow:

struct Headers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void append()(string name, string value) {
    Object_Call_string_string__void(this.handle, "append", name, value);
  }
  void delete_()(string name) {
    Object_Call_string__void(this.handle, "delete", name);
  }
  Optional!(string) get()(string name) {
    return Object_Call_string__OptionalString(this.handle, "get", name);
  }
  bool has()(string name) {
    return Object_Call_string__bool(this.handle, "has", name);
  }
  void set()(string name, string value) {
    Object_Call_string_string__void(this.handle, "set", name, value);
  }
  void guard()(HeadersGuardEnum guard) {
    Headers_guard_Set(this.handle, guard);
  }
  HeadersGuardEnum guard()() {
    return Headers_guard_Get(this.handle);
  }
}
enum HeadersGuardEnum {
  none,
  request,
  request_no_cors,
  response,
  immutable_
}
alias HeadersInit = SumType!(Headers, Sequence!(Sequence!(string)), Record!(string, string));


extern (C) void Headers_guard_Set(Handle, HeadersGuardEnum);
extern (C) HeadersGuardEnum Headers_guard_Get(Handle);