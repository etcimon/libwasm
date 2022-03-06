module spasm.bindings.Blob;

import spasm.types;
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
    return Blob(Blob_slice(this.handle, start, end, contentType));
  }
  auto slice()(int start, int end) {
    return Blob(Blob_slice_0(this.handle, start, end));
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
    return BlobPropertyBag(spasm_add__object());
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void endings()(EndingTypes endings) {
    BlobPropertyBag_endings_Set(this.handle, endings);
  }
  EndingTypes endings()() {
    return BlobPropertyBag_endings_Get(this.handle);
  }
}
enum EndingTypes {
  transparent,
  native
}


extern (C) Handle Blob_slice(Handle, int, int, string);
extern (C) Handle Blob_slice_0(Handle, int, int);
extern (C) void BlobPropertyBag_endings_Set(Handle, EndingTypes);
extern (C) EndingTypes BlobPropertyBag_endings_Get(Handle);