module spasm.bindings.AudioNode;

import spasm.types;
import spasm.bindings.AudioParam;
import spasm.bindings.BaseAudioContext;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct AudioNode {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto connect()(scope ref AudioNode destination, uint output /* = 0 */, uint input /* = 0 */) {
    return AudioNode(AudioNode_connect__Handle_uint_uint(this._parent, destination._parent, output, input));
  }
  auto connect()(scope ref AudioNode destination, uint output /* = 0 */) {
    return AudioNode(AudioNode_connect_0_Handle_uint(this._parent, destination._parent, output));
  }
  auto connect()(scope ref AudioNode destination) {
    return AudioNode(Object_Call_Handle__Handle(this._parent, "connect", destination._parent));
  }
  void connect()(scope ref AudioParam destination, uint output /* = 0 */) {
    AudioNode_connect__Handle_uint(this._parent, destination.handle, output);
  }
  void connect()(scope ref AudioParam destination) {
    Object_Call_Handle__void(this._parent, "connect", destination.handle);
  }
  void disconnect()() {
    Object_Call__void(this._parent, "disconnect");
  }
  void disconnect()(uint output) {
    Object_Call_uint__void(this._parent, "disconnect", output);
  }
  void disconnect()(scope ref AudioNode destination) {
    Object_Call_Handle__void(this._parent, "disconnect", destination._parent);
  }
  void disconnect()(scope ref AudioNode destination, uint output) {
    AudioNode_disconnect__Handle_uint(this._parent, destination._parent, output);
  }
  void disconnect()(scope ref AudioNode destination, uint output, uint input) {
    AudioNode_disconnect__Handle_uint_uint(this._parent, destination._parent, output, input);
  }
  void disconnect()(scope ref AudioParam destination) {
    Object_Call_Handle__void(this._parent, "disconnect", destination.handle);
  }
  void disconnect()(scope ref AudioParam destination, uint output) {
    AudioNode_disconnect__Handle_uint(this._parent, destination.handle, output);
  }
  auto context()() {
    return BaseAudioContext(Object_Getter__Handle(this._parent, "context"));
  }
  uint numberOfInputs()() {
    return Object_Getter__uint(this._parent, "numberOfInputs");
  }
  uint numberOfOutputs()() {
    return Object_Getter__uint(this._parent, "numberOfOutputs");
  }
  void channelCount()(uint channelCount) {
    Object_Call_uint__void(this._parent, "channelCount", channelCount);
  }
  uint channelCount()() {
    return Object_Getter__uint(this._parent, "channelCount");
  }
  void channelCountMode()(ChannelCountMode channelCountMode) {
    AudioNode_channelCountMode_Set(this._parent, channelCountMode);
  }
  ChannelCountMode channelCountMode()() {
    return AudioNode_channelCountMode_Get(this._parent);
  }
  void channelInterpretation()(ChannelInterpretation channelInterpretation) {
    AudioNode_channelInterpretation_Set(this._parent, channelInterpretation);
  }
  ChannelInterpretation channelInterpretation()() {
    return AudioNode_channelInterpretation_Get(this._parent);
  }
  uint id()() {
    return Object_Getter__uint(this._parent, "id");
  }
}
struct AudioNodeOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioNodeOptions(spasm_add__object());
  }
  void channelCount()(uint channelCount) {
    Object_Call_uint__void(this.handle, "channelCount", channelCount);
  }
  uint channelCount()() {
    return Object_Getter__uint(this.handle, "channelCount");
  }
  void channelCountMode()(ChannelCountMode channelCountMode) {
    AudioNodeOptions_channelCountMode_Set(this.handle, channelCountMode);
  }
  ChannelCountMode channelCountMode()() {
    return AudioNodeOptions_channelCountMode_Get(this.handle);
  }
  void channelInterpretation()(ChannelInterpretation channelInterpretation) {
    AudioNodeOptions_channelInterpretation_Set(this.handle, channelInterpretation);
  }
  ChannelInterpretation channelInterpretation()() {
    return AudioNodeOptions_channelInterpretation_Get(this.handle);
  }
}
struct AudioNodePassThrough {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this.handle, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this.handle, "passThrough");
  }
}
enum ChannelCountMode {
  max,
  clamped_max,
  explicit
}
enum ChannelInterpretation {
  speakers,
  discrete
}


extern (C) Handle AudioNode_connect__Handle_uint_uint(Handle, Handle, uint, uint);
extern (C) Handle AudioNode_connect_0_Handle_uint(Handle, Handle, uint);
extern (C) void AudioNode_connect__Handle_uint(Handle, Handle, uint);
extern (C) void AudioNode_disconnect__Handle_uint(Handle, Handle, uint);
extern (C) void AudioNode_disconnect__Handle_uint_uint(Handle, Handle, uint, uint);
extern (C) void AudioNode_channelCountMode_Set(Handle, ChannelCountMode);
extern (C) ChannelCountMode AudioNode_channelCountMode_Get(Handle);
extern (C) void AudioNode_channelInterpretation_Set(Handle, ChannelInterpretation);
extern (C) ChannelInterpretation AudioNode_channelInterpretation_Get(Handle);
extern (C) void AudioNodeOptions_channelCountMode_Set(Handle, ChannelCountMode);
extern (C) ChannelCountMode AudioNodeOptions_channelCountMode_Get(Handle);
extern (C) void AudioNodeOptions_channelInterpretation_Set(Handle, ChannelInterpretation);
extern (C) ChannelInterpretation AudioNodeOptions_channelInterpretation_Get(Handle);