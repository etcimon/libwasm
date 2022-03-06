module spasm.bindings.Fetch;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.FormData;
import spasm.bindings.URLSearchParams;

@safe:
nothrow:

struct Body {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool bodyUsed()() {
    return Object_Getter__bool(this.handle, "bodyUsed");
  }
  auto arrayBuffer()() {
    return Promise!(ArrayBuffer)(Object_Getter__Handle(this.handle, "arrayBuffer"));
  }
  auto blob()() {
    return Promise!(Blob)(Object_Getter__Handle(this.handle, "blob"));
  }
  auto formData()() {
    return Promise!(FormData)(Object_Getter__Handle(this.handle, "formData"));
  }
  auto json()() {
    return Promise!(JSON)(Object_Getter__Handle(this.handle, "json"));
  }
  auto text()() {
    return Promise!(string)(Object_Getter__Handle(this.handle, "text"));
  }
}
alias BodyInit = SumType!(Blob, BufferSource, FormData, URLSearchParams, string);
struct FetchReadableStreamReadDataArray {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FetchReadableStreamReadDataArray(spasm_add__object());
  }
  void value()(scope ref Uint8Array value) {
    Object_Call_Handle__void(this.handle, "value", value.handle);
  }
  auto value()() {
    return Uint8Array(Object_Getter__Handle(this.handle, "value"));
  }
}
struct FetchReadableStreamReadDataDone {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FetchReadableStreamReadDataDone(spasm_add__object());
  }
  void done()(bool done) {
    Object_Call_bool__void(this.handle, "done", done);
  }
  bool done()() {
    return Object_Getter__bool(this.handle, "done");
  }
}
alias JSON = JsObject;


