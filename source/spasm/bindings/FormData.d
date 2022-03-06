module spasm.bindings.FormData;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.Directory;

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
    FormData_append__string_Handle_string(this.handle, name, value.handle, filename);
  }
  void append()(string name, scope ref Blob value) {
    FormData_append_0(this.handle, name, value.handle);
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
    FormData_set__string_Handle_string(this.handle, name, value.handle, filename);
  }
  void set()(string name, scope ref Blob value) {
    FormData_set_0(this.handle, name, value.handle);
  }
  void set()(string name, string value) {
    Object_Call_string_string__void(this.handle, "set", name, value);
  }
}
alias FormDataEntryValue = SumType!(Blob, Directory, string);


extern (C) void FormData_append__string_Handle_string(Handle, string, Handle, string);
extern (C) void FormData_append_0(Handle, string, Handle);
extern (C) Optional!(FormDataEntryValue) FormData_get(Handle, string);
extern (C) void FormData_set__string_Handle_string(Handle, string, Handle, string);
extern (C) void FormData_set_0(Handle, string, Handle);