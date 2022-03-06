module spasm.bindings.AudioBuffer;

import spasm.types;
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
    AudioBuffer_copyFromChannel(this.handle, destination.handle, channelNumber, startInChannel);
  }
  void copyFromChannel()(scope ref Float32Array destination, int channelNumber) {
    AudioBuffer_copyFromChannel_0(this.handle, destination.handle, channelNumber);
  }
  void copyToChannel()(scope ref Float32Array source, int channelNumber, uint startInChannel /* = 0 */) {
    AudioBuffer_copyToChannel(this.handle, source.handle, channelNumber, startInChannel);
  }
  void copyToChannel()(scope ref Float32Array source, int channelNumber) {
    AudioBuffer_copyToChannel_0(this.handle, source.handle, channelNumber);
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
    return AudioBufferOptions(spasm_add__object());
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


extern (C) void AudioBuffer_copyFromChannel(Handle, Handle, int, uint);
extern (C) void AudioBuffer_copyFromChannel_0(Handle, Handle, int);
extern (C) void AudioBuffer_copyToChannel(Handle, Handle, int, uint);
extern (C) void AudioBuffer_copyToChannel_0(Handle, Handle, int);