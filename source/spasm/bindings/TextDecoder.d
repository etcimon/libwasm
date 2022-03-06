module spasm.bindings.TextDecoder;

import spasm.types;
@safe:
nothrow:

struct TextDecodeOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return TextDecodeOptions(spasm_add__object());
  }
  void stream()(bool stream) {
    Object_Call_bool__void(this.handle, "stream", stream);
  }
  bool stream()() {
    return Object_Getter__bool(this.handle, "stream");
  }
}
struct TextDecoder {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string encoding()() {
    return Object_Getter__string(this.handle, "encoding");
  }
  bool fatal()() {
    return Object_Getter__bool(this.handle, "fatal");
  }
  bool ignoreBOM()() {
    return Object_Getter__bool(this.handle, "ignoreBOM");
  }
  string decode()(scope ref BufferSource input, scope ref TextDecodeOptions options) {
    return TextDecoder_decode(this.handle, input.handle, options.handle);
  }
  string decode()(scope ref BufferSource input) {
    return TextDecoder_decode_0(this.handle, input.handle);
  }
  string decode()() {
    return Object_Getter__string(this.handle, "decode");
  }
}
struct TextDecoderOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return TextDecoderOptions(spasm_add__object());
  }
  void fatal()(bool fatal) {
    Object_Call_bool__void(this.handle, "fatal", fatal);
  }
  bool fatal()() {
    return Object_Getter__bool(this.handle, "fatal");
  }
  void ignoreBOM()(bool ignoreBOM) {
    Object_Call_bool__void(this.handle, "ignoreBOM", ignoreBOM);
  }
  bool ignoreBOM()() {
    return Object_Getter__bool(this.handle, "ignoreBOM");
  }
}


extern (C) string TextDecoder_decode(Handle, Handle, Handle);
extern (C) string TextDecoder_decode_0(Handle, Handle);