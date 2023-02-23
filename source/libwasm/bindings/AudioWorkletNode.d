module libwasm.bindings.AudioWorkletNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParamMap;
import libwasm.bindings.EventHandler;
import libwasm.bindings.MessagePort;

@safe:
nothrow:

struct AudioWorkletNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
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
  void onprocessorerror(T0)(scope auto ref Optional!(T0) onprocessorerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onprocessorerror", !onprocessorerror.empty, onprocessorerror.front);
  }
  EventHandler onprocessorerror()() {
    return Object_Getter__EventHandler(this._parent, "onprocessorerror");
  }
}
struct AudioWorkletNodeOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return AudioWorkletNodeOptions(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "processorOptions", "Optional!Handle", tuple(!processorOptions.empty, cast(Handle)processorOptions.front.handle));
  }
  auto processorOptions()() {
    return recastOpt!(JsObject)(Object_Getter__OptionalHandle(this._parent, "processorOptions"));
  }
}


