module libwasm.bindings.AudioBuffer;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct AudioBuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  float sampleRate()() {
    return Object_Getter__float(this.handle, "sampleRate");
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  double duration()() {
    return Object_Getter__double(this.handle, "duration");
  }
  uint numberOfChannels()() {
    return Object_Getter__uint(this.handle, "numberOfChannels");
  }
  auto getChannelData()(uint channel) {
    return Float32Array(Object_Call_uint__Handle(this.handle, "getChannelData", channel));
  }
  void copyFromChannel()(scope ref Float32Array destination, int channelNumber, uint startInChannel /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "copyFromChannel", "Handle;int;uint", tuple(cast(Handle)destination.handle, channelNumber, startInChannel));
  }
  void copyFromChannel()(scope ref Float32Array destination, int channelNumber) {
    Serialize_Object_VarArgCall!void(this.handle, "copyFromChannel", "Handle;int", tuple(cast(Handle)destination.handle, channelNumber));
  }
  void copyToChannel()(scope ref Float32Array source, int channelNumber, uint startInChannel /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "copyToChannel", "Handle;int;uint", tuple(cast(Handle)source.handle, channelNumber, startInChannel));
  }
  void copyToChannel()(scope ref Float32Array source, int channelNumber) {
    Serialize_Object_VarArgCall!void(this.handle, "copyToChannel", "Handle;int", tuple(cast(Handle)source.handle, channelNumber));
  }
}
struct AudioBufferOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioBufferOptions(libwasm_add__object());
  }
  void numberOfChannels()(uint numberOfChannels) {
    Object_Call_uint__void(this.handle, "numberOfChannels", numberOfChannels);
  }
  uint numberOfChannels()() {
    return Object_Getter__uint(this.handle, "numberOfChannels");
  }
  void length()(uint length) {
    Object_Call_uint__void(this.handle, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  void sampleRate()(float sampleRate) {
    Object_Call_float__void(this.handle, "sampleRate", sampleRate);
  }
  float sampleRate()() {
    return Object_Getter__float(this.handle, "sampleRate");
  }
}


