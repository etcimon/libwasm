module spasm.bindings.AudioWorkletNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.AudioParamMap;
import spasm.bindings.EventHandler;
import spasm.bindings.MessagePort;

@safe:
nothrow:

struct AudioWorkletNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto parameters()() {
    return AudioParamMap(Object_Getter__Handle(this._parent, "parameters"));
  }
  auto port()() {
    return MessagePort(Object_Getter__Handle(this._parent, "port"));
  }
  void onprocessorerror(T0)(scope auto ref Optional!(T0) onprocessorerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onprocessorerror", !onprocessorerror.empty, onprocessorerror.front);
  }
  EventHandler onprocessorerror()() {
    return Object_Getter__EventHandler(this._parent, "onprocessorerror");
  }
}
struct AudioWorkletNodeOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return AudioWorkletNodeOptions(spasm_add__object());
  }
  void numberOfInputs()(uint numberOfInputs) {
    Object_Call_uint__void(this._parent, "numberOfInputs", numberOfInputs);
  }
  uint numberOfInputs()() {
    return Object_Getter__uint(this._parent, "numberOfInputs");
  }
  void numberOfOutputs()(uint numberOfOutputs) {
    Object_Call_uint__void(this._parent, "numberOfOutputs", numberOfOutputs);
  }
  uint numberOfOutputs()() {
    return Object_Getter__uint(this._parent, "numberOfOutputs");
  }
  void outputChannelCount()(scope ref Sequence!(uint) outputChannelCount) {
    Object_Call_Handle__void(this._parent, "outputChannelCount", outputChannelCount.handle);
  }
  auto outputChannelCount()() {
    return Sequence!(uint)(Object_Getter__Handle(this._parent, "outputChannelCount"));
  }
  void parameterData()(scope ref Record!(string, double) parameterData) {
    Object_Call_Handle__void(this._parent, "parameterData", parameterData.handle);
  }
  auto parameterData()() {
    return Record!(string, double)(Object_Getter__Handle(this._parent, "parameterData"));
  }
  void processorOptions(T0)(scope auto ref Optional!(T0) processorOptions) if (isTOrPointer!(T0, JsObject)) {
    AudioWorkletNodeOptions_processorOptions_Set(this._parent, !processorOptions.empty, processorOptions.front.handle);
  }
  auto processorOptions()() {
    return Object_Getter__OptionalHandle(this._parent, "processorOptions");
  }
}


extern (C) void AudioWorkletNodeOptions_processorOptions_Set(Handle, bool, Handle);