module libwasm.bindings.BaseAudioContext;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AnalyserNode;
import libwasm.bindings.AudioBuffer;
import libwasm.bindings.AudioBufferSourceNode;
import libwasm.bindings.AudioDestinationNode;
import libwasm.bindings.AudioListener;
import libwasm.bindings.AudioWorklet;
import libwasm.bindings.BiquadFilterNode;
import libwasm.bindings.ChannelMergerNode;
import libwasm.bindings.ChannelSplitterNode;
import libwasm.bindings.ConstantSourceNode;
import libwasm.bindings.ConvolverNode;
import libwasm.bindings.DOMException;
import libwasm.bindings.DelayNode;
import libwasm.bindings.DynamicsCompressorNode;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.GainNode;
import libwasm.bindings.IIRFilterNode;
import libwasm.bindings.OscillatorNode;
import libwasm.bindings.PannerNode;
import libwasm.bindings.PeriodicWave;
import libwasm.bindings.ScriptProcessorNode;
import libwasm.bindings.StereoPannerNode;
import libwasm.bindings.WaveShaperNode;

@safe:
nothrow:

enum AudioContextState {
  suspended,
  running,
  closed
}
struct BaseAudioContext {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto destination()() {
    return AudioDestinationNode(Object_Getter__Handle(this._parent, "destination"));
  }
  float sampleRate()() {
    return Object_Getter__float(this._parent, "sampleRate");
  }
  double currentTime()() {
    return Object_Getter__double(this._parent, "currentTime");
  }
  auto listener()() {
    return AudioListener(Object_Getter__Handle(this._parent, "listener"));
  }
  AudioContextState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  auto audioWorklet()() {
    return AudioWorklet(Object_Getter__Handle(this._parent, "audioWorklet"));
  }
  auto resume()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "resume"));
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  auto createBuffer()(uint numberOfChannels, uint length, float sampleRate) {
    return AudioBuffer(Serialize_Object_VarArgCall!Handle(this._parent, "createBuffer", "uint;uint;float", tuple(numberOfChannels, length, sampleRate)));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData, DecodeSuccessCallback successCallback, DecodeErrorCallback errorCallback) {
    return JsPromise!(AudioBuffer)(BaseAudioContext_decodeAudioData(this._parent, audioData.handle, successCallback, errorCallback));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData, DecodeSuccessCallback successCallback) {
    return JsPromise!(AudioBuffer)(BaseAudioContext_decodeAudioData_0(this._parent, audioData.handle, successCallback));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData) {
    return JsPromise!(AudioBuffer)(Object_Call_Handle__Handle(this._parent, "decodeAudioData", audioData.handle));
  }
  auto createBufferSource()() {
    return AudioBufferSourceNode(Object_Getter__Handle(this._parent, "createBufferSource"));
  }
  auto createConstantSource()() {
    return ConstantSourceNode(Object_Getter__Handle(this._parent, "createConstantSource"));
  }
  auto createScriptProcessor()(uint bufferSize /* = 0 */, uint numberOfInputChannels /* = 2 */, uint numberOfOutputChannels /* = 2 */) {
    return ScriptProcessorNode(Serialize_Object_VarArgCall!Handle(this._parent, "createScriptProcessor", "uint;uint;uint", tuple(bufferSize, numberOfInputChannels, numberOfOutputChannels)));
  }
  auto createScriptProcessor()(uint bufferSize /* = 0 */, uint numberOfInputChannels /* = 2 */) {
    return ScriptProcessorNode(Serialize_Object_VarArgCall!Handle(this._parent, "createScriptProcessor", "uint;uint", tuple(bufferSize, numberOfInputChannels)));
  }
  auto createScriptProcessor()(uint bufferSize /* = 0 */) {
    return ScriptProcessorNode(Object_Call_uint__Handle(this._parent, "createScriptProcessor", bufferSize));
  }
  auto createScriptProcessor()() {
    return ScriptProcessorNode(Object_Getter__Handle(this._parent, "createScriptProcessor"));
  }
  auto createAnalyser()() {
    return AnalyserNode(Object_Getter__Handle(this._parent, "createAnalyser"));
  }
  auto createGain()() {
    return GainNode(Object_Getter__Handle(this._parent, "createGain"));
  }
  auto createDelay()(double maxDelayTime /* = 1 */) {
    return DelayNode(Serialize_Object_VarArgCall!Handle(this._parent, "createDelay", "double", tuple(maxDelayTime)));
  }
  auto createDelay()() {
    return DelayNode(Object_Getter__Handle(this._parent, "createDelay"));
  }
  auto createBiquadFilter()() {
    return BiquadFilterNode(Object_Getter__Handle(this._parent, "createBiquadFilter"));
  }
  auto createIIRFilter()(scope ref Sequence!(double) feedforward, scope ref Sequence!(double) feedback) {
    return IIRFilterNode(Serialize_Object_VarArgCall!Handle(this._parent, "createIIRFilter", "Handle;Handle", tuple(cast(Handle)feedforward.handle, cast(Handle)feedback.handle)));
  }
  auto createWaveShaper()() {
    return WaveShaperNode(Object_Getter__Handle(this._parent, "createWaveShaper"));
  }
  auto createPanner()() {
    return PannerNode(Object_Getter__Handle(this._parent, "createPanner"));
  }
  auto createStereoPanner()() {
    return StereoPannerNode(Object_Getter__Handle(this._parent, "createStereoPanner"));
  }
  auto createConvolver()() {
    return ConvolverNode(Object_Getter__Handle(this._parent, "createConvolver"));
  }
  auto createChannelSplitter()(uint numberOfOutputs /* = 6 */) {
    return ChannelSplitterNode(Object_Call_uint__Handle(this._parent, "createChannelSplitter", numberOfOutputs));
  }
  auto createChannelSplitter()() {
    return ChannelSplitterNode(Object_Getter__Handle(this._parent, "createChannelSplitter"));
  }
  auto createChannelMerger()(uint numberOfInputs /* = 6 */) {
    return ChannelMergerNode(Object_Call_uint__Handle(this._parent, "createChannelMerger", numberOfInputs));
  }
  auto createChannelMerger()() {
    return ChannelMergerNode(Object_Getter__Handle(this._parent, "createChannelMerger"));
  }
  auto createDynamicsCompressor()() {
    return DynamicsCompressorNode(Object_Getter__Handle(this._parent, "createDynamicsCompressor"));
  }
  auto createOscillator()() {
    return OscillatorNode(Object_Getter__Handle(this._parent, "createOscillator"));
  }
  auto createPeriodicWave()(scope ref Float32Array real_, scope ref Float32Array imag, scope ref PeriodicWaveConstraints constraints) {
    return PeriodicWave(Serialize_Object_VarArgCall!Handle(this._parent, "createPeriodicWave", "Handle;Handle;Handle", tuple(cast(Handle)real_.handle, cast(Handle)imag.handle, cast(Handle)constraints.handle)));
  }
  auto createPeriodicWave()(scope ref Float32Array real_, scope ref Float32Array imag) {
    return PeriodicWave(Serialize_Object_VarArgCall!Handle(this._parent, "createPeriodicWave", "Handle;Handle", tuple(cast(Handle)real_.handle, cast(Handle)imag.handle)));
  }
}
alias DecodeErrorCallback = void delegate(DOMException);
alias DecodeSuccessCallback = void delegate(AudioBuffer);


extern (C) Handle BaseAudioContext_decodeAudioData(Handle, Handle, DecodeSuccessCallback, DecodeErrorCallback);
extern (C) Handle BaseAudioContext_decodeAudioData_0(Handle, Handle, DecodeSuccessCallback);