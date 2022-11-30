module libwasm.bindings.FormData;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.Directory;

@safe:
nothrow:

struct FormData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void append()(string name, scope ref Blob value, string filename) {
    Serialize_Object_VarArgCall!void(this.handle, "append", "string;Handle;string", tuple(name, cast(Handle)value.handle, filename));
  }
  void append()(string name, scope ref Blob value) {
    Serialize_Object_VarArgCall!void(this.handle, "append", "string;Handle", tuple(name, cast(Handle)value.handle));
  }
  void append()(string name, string value) {
    Object_Call_string_string__void(this.handle, "append", name, value);
  }
  void delete_()(string name) {
    Object_Call_string__void(this.handle, "delete", name);
  }
  auto get()(string name) {
    return FormData_get(this.handle, name);
  }
  auto getAll()(string name) {
    return Sequence!(FormDataEntryValue)(Object_Call_string__Handle(this.handle, "getAll", name));
  }
  bool has()(string name) {
    return Object_Call_string__bool(this.handle, "has", name);
  }
  void set()(string name, scope ref Blob value, string filename) {
    Serialize_Object_VarArgCall!void(this.handle, "set", "string;Handle;string", tuple(name, cast(Handle)value.handle, filename));
  }
  void set()(string name, scope ref Blob value) {
    Serialize_Object_VarArgCall!void(this.handle, "set", "string;Handle", tuple(name, cast(Handle)value.handle));
  }
  void set()(string name, string value) {
    Object_Call_string_string__void(this.handle, "set", name, value);
  }
}
alias FormDataEntryValue = SumType!(Blob, Directory, string);


extern (C) Optional!(FormDataEntryValue) FormData_get(Handle, string);