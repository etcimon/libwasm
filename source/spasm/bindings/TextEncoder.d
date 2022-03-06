module spasm.bindings.TextEncoder;

import spasm.types;
@safe:
nothrow:

struct TextEncoder {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string encoding()() {
    return Object_Getter__string(this.handle, "encoding");
  }
  auto encode()(string input /* = "" */) {
    return Uint8Array(Object_Call_string__Handle(this.handle, "encode", input));
  }
  auto encode()() {
    return Uint8Array(Object_Getter__Handle(this.handle, "encode"));
  }
  auto encodeInto()(string source, scope ref Uint8Array destination) {
    return TextEncoderEncodeIntoResult(TextEncoder_encodeInto(this.handle, source, destination.handle));
  }
}
struct TextEncoderEncodeIntoResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return TextEncoderEncodeIntoResult(spasm_add__object());
  }
  void read()(uint read) {
    Object_Call_uint__void(this.handle, "read", read);
  }
  uint read()() {
    return Object_Getter__uint(this.handle, "read");
  }
  void written()(uint written) {
    Object_Call_uint__void(this.handle, "written", written);
  }
  uint written()() {
    return Object_Getter__uint(this.handle, "written");
  }
}


extern (C) Handle TextEncoder_encodeInto(Handle, string, Handle);