module libwasm.bindings.Blob;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct Blob {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint size()() {
    return Object_Getter__uint(this.handle, "size");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  auto slice()(int start, int end, string contentType) {
    return Blob(Serialize_Object_VarArgCall!Handle(this.handle, "slice", "int;int;string", tuple(start, end, contentType)));
  }
  auto slice()(int start, int end) {
    return Blob(Serialize_Object_VarArgCall!Handle(this.handle, "slice", "int;int", tuple(start, end)));
  }
  auto slice()(int start) {
    return Blob(Object_Call_int__Handle(this.handle, "slice", start));
  }
  auto slice()() {
    return Blob(Object_Getter__Handle(this.handle, "slice"));
  }
  string blobImplType()() {
    return Object_Getter__string(this.handle, "blobImplType");
  }
}
alias BlobPart = SumType!(BufferSource, Blob, string);
struct BlobPropertyBag {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BlobPropertyBag(libwasm_add__object());
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void endings()(EndingTypes endings) {
    Object_Call_int__void(this.handle, "endings", endings);
  }
  EndingTypes endings()() {
    return Object_Getter__int(this.handle, "endings");
  }
}
enum EndingTypes {
  transparent,
  native
}


