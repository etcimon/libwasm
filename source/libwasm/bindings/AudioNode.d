module libwasm.bindings.AudioNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioParam;
import libwasm.bindings.BaseAudioContext;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct AudioNode {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto connect()(scope ref AudioNode destination, uint output /* = 0 */, uint input /* = 0 */) {
    return AudioNode(Serialize_Object_VarArgCall!Handle(this._parent, "connect", "Handle;uint;uint", tuple(cast(Handle)destination._parent, output, input)));
  }
  auto connect()(scope ref AudioNode destination, uint output /* = 0 */) {
    return AudioNode(Serialize_Object_VarArgCall!Handle(this._parent, "connect", "Handle;uint", tuple(cast(Handle)destination._parent, output)));
  }
  auto connect()(scope ref AudioNode destination) {
    return AudioNode(Object_Call_Handle__Handle(this._parent, "connect", destination._parent));
  }
  void connect()(scope ref AudioParam destination, uint output /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "connect", "Handle;uint", tuple(cast(Handle)destination.handle, output));
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
    Serialize_Object_VarArgCall!void(this._parent, "disconnect", "Handle;uint", tuple(cast(Handle)destination._parent, output));
  }
  void disconnect()(scope ref AudioNode destination, uint output, uint input) {
    Serialize_Object_VarArgCall!void(this._parent, "disconnect", "Handle;uint;uint", tuple(cast(Handle)destination._parent, output, input));
  }
  void disconnect()(scope ref AudioParam destination) {
    Object_Call_Handle__void(this._parent, "disconnect", destination.handle);
  }
  void disconnect()(scope ref AudioParam destination, uint output) {
    Serialize_Object_VarArgCall!void(this._parent, "disconnect", "Handle;uint", tuple(cast(Handle)destination.handle, output));
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
    Object_Call_int__void(this._parent, "channelCountMode", channelCountMode);
  }
  ChannelCountMode channelCountMode()() {
    return Object_Getter__int(this._parent, "channelCountMode");
  }
  void channelInterpretation()(ChannelInterpretation channelInterpretation) {
    Object_Call_int__void(this._parent, "channelInterpretation", channelInterpretation);
  }
  ChannelInterpretation channelInterpretation()() {
    return Object_Getter__int(this._parent, "channelInterpretation");
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
    return AudioNodeOptions(libwasm_add__object());
  }
  void channelCount()(uint channelCount) {
    Object_Call_uint__void(this.handle, "channelCount", channelCount);
  }
  uint channelCount()() {
    return Object_Getter__uint(this.handle, "channelCount");
  }
  void channelCountMode()(ChannelCountMode channelCountMode) {
    Object_Call_int__void(this.handle, "channelCountMode", channelCountMode);
  }
  ChannelCountMode channelCountMode()() {
    return Object_Getter__int(this.handle, "channelCountMode");
  }
  void channelInterpretation()(ChannelInterpretation channelInterpretation) {
    Object_Call_int__void(this.handle, "channelInterpretation", channelInterpretation);
  }
  ChannelInterpretation channelInterpretation()() {
    return Object_Getter__int(this.handle, "channelInterpretation");
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


