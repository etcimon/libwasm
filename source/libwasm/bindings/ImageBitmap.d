module libwasm.bindings.ImageBitmap;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.CanvasRenderingContext2D;
import libwasm.bindings.ImageData;

@safe:
nothrow:

struct ChannelPixelLayout {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ChannelPixelLayout(libwasm_add__object());
  }
  void offset()(uint offset) {
    Object_Call_uint__void(this.handle, "offset", offset);
  }
  uint offset()() {
    return Object_Getter__uint(this.handle, "offset");
  }
  void width()(uint width) {
    Object_Call_uint__void(this.handle, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this.handle, "width");
  }
  void height()(uint height) {
    Object_Call_uint__void(this.handle, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this.handle, "height");
  }
  void dataType()(ChannelPixelLayoutDataType dataType) {
    Object_Call_int__void(this.handle, "dataType", dataType);
  }
  ChannelPixelLayoutDataType dataType()() {
    return Object_Getter__int(this.handle, "dataType");
  }
  void stride()(uint stride) {
    Object_Call_uint__void(this.handle, "stride", stride);
  }
  uint stride()() {
    return Object_Getter__uint(this.handle, "stride");
  }
  void skip()(uint skip) {
    Object_Call_uint__void(this.handle, "skip", skip);
  }
  uint skip()() {
    return Object_Getter__uint(this.handle, "skip");
  }
}
enum ChannelPixelLayoutDataType {
  uint8,
  int8,
  uint16,
  int16,
  uint32,
  int32,
  float32,
  float64
}
struct ImageBitmap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint width()() {
    return Object_Getter__uint(this.handle, "width");
  }
  uint height()() {
    return Object_Getter__uint(this.handle, "height");
  }
  void close()() {
    Object_Call__void(this.handle, "close");
  }
}
enum ImageBitmapFormat {
  RGBA32,
  BGRA32,
  RGB24,
  BGR24,
  GRAY8,
  YUV444P,
  YUV422P,
  YUV420P,
  YUV420SP_NV12,
  YUV420SP_NV21,
  HSV,
  Lab,
  DEPTH
}
alias ImageBitmapSource = SumType!(CanvasImageSource, Blob, CanvasRenderingContext2D, ImageData);
alias ImagePixelLayout = Sequence!(ChannelPixelLayout);


