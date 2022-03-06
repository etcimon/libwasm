module spasm.bindings.MediaCapabilities;

import spasm.types;
@safe:
nothrow:

struct AudioConfiguration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioConfiguration(spasm_add__object());
  }
  void contentType()(string contentType) {
    Object_Call_string__void(this.handle, "contentType", contentType);
  }
  string contentType()() {
    return Object_Getter__string(this.handle, "contentType");
  }
  void channels()(string channels) {
    Object_Call_string__void(this.handle, "channels", channels);
  }
  string channels()() {
    return Object_Getter__string(this.handle, "channels");
  }
  void bitrate()(uint bitrate) {
    Object_Call_uint__void(this.handle, "bitrate", bitrate);
  }
  uint bitrate()() {
    return Object_Getter__uint(this.handle, "bitrate");
  }
  void samplerate()(uint samplerate) {
    Object_Call_uint__void(this.handle, "samplerate", samplerate);
  }
  uint samplerate()() {
    return Object_Getter__uint(this.handle, "samplerate");
  }
}
struct MediaCapabilities {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto decodingInfo()(scope ref MediaDecodingConfiguration configuration) {
    return Promise!(MediaCapabilitiesInfo)(Object_Call_Handle__Handle(this.handle, "decodingInfo", configuration._parent));
  }
  auto encodingInfo()(scope ref MediaEncodingConfiguration configuration) {
    return Promise!(MediaCapabilitiesInfo)(Object_Call_Handle__Handle(this.handle, "encodingInfo", configuration._parent));
  }
}
struct MediaCapabilitiesInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool supported()() {
    return Object_Getter__bool(this.handle, "supported");
  }
  bool smooth()() {
    return Object_Getter__bool(this.handle, "smooth");
  }
  bool powerEfficient()() {
    return Object_Getter__bool(this.handle, "powerEfficient");
  }
}
struct MediaConfiguration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaConfiguration(spasm_add__object());
  }
  void video()(scope ref VideoConfiguration video) {
    Object_Call_Handle__void(this.handle, "video", video.handle);
  }
  auto video()() {
    return VideoConfiguration(Object_Getter__Handle(this.handle, "video"));
  }
  void audio()(scope ref AudioConfiguration audio) {
    Object_Call_Handle__void(this.handle, "audio", audio.handle);
  }
  auto audio()() {
    return AudioConfiguration(Object_Getter__Handle(this.handle, "audio"));
  }
}
struct MediaDecodingConfiguration {
  nothrow:
  spasm.bindings.MediaCapabilities.MediaConfiguration _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MediaConfiguration(h);
  }
  static auto create() {
    return MediaDecodingConfiguration(spasm_add__object());
  }
  void type()(MediaDecodingType type) {
    MediaDecodingConfiguration_type_Set(this._parent, type);
  }
  MediaDecodingType type()() {
    return MediaDecodingConfiguration_type_Get(this._parent);
  }
}
enum MediaDecodingType {
  file,
  media_source
}
struct MediaEncodingConfiguration {
  nothrow:
  spasm.bindings.MediaCapabilities.MediaConfiguration _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MediaConfiguration(h);
  }
  static auto create() {
    return MediaEncodingConfiguration(spasm_add__object());
  }
  void type()(MediaEncodingType type) {
    MediaEncodingConfiguration_type_Set(this._parent, type);
  }
  MediaEncodingType type()() {
    return MediaEncodingConfiguration_type_Get(this._parent);
  }
}
enum MediaEncodingType {
  record,
  transmission
}
struct VideoConfiguration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return VideoConfiguration(spasm_add__object());
  }
  void contentType()(string contentType) {
    Object_Call_string__void(this.handle, "contentType", contentType);
  }
  string contentType()() {
    return Object_Getter__string(this.handle, "contentType");
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
  void bitrate()(uint bitrate) {
    Object_Call_uint__void(this.handle, "bitrate", bitrate);
  }
  uint bitrate()() {
    return Object_Getter__uint(this.handle, "bitrate");
  }
  void framerate()(string framerate) {
    Object_Call_string__void(this.handle, "framerate", framerate);
  }
  string framerate()() {
    return Object_Getter__string(this.handle, "framerate");
  }
}


extern (C) void MediaDecodingConfiguration_type_Set(Handle, MediaDecodingType);
extern (C) MediaDecodingType MediaDecodingConfiguration_type_Get(Handle);
extern (C) void MediaEncodingConfiguration_type_Set(Handle, MediaEncodingType);
extern (C) MediaEncodingType MediaEncodingConfiguration_type_Get(Handle);