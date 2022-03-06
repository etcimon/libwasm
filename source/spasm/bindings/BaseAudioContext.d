module spasm.bindings.BaseAudioContext;

import spasm.types;
import spasm.bindings.AnalyserNode;
import spasm.bindings.AudioBuffer;
import spasm.bindings.AudioBufferSourceNode;
import spasm.bindings.AudioDestinationNode;
import spasm.bindings.AudioListener;
import spasm.bindings.AudioWorklet;
import spasm.bindings.BiquadFilterNode;
import spasm.bindings.ChannelMergerNode;
import spasm.bindings.ChannelSplitterNode;
import spasm.bindings.ConstantSourceNode;
import spasm.bindings.ConvolverNode;
import spasm.bindings.DOMException;
import spasm.bindings.DelayNode;
import spasm.bindings.DynamicsCompressorNode;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.GainNode;
import spasm.bindings.IIRFilterNode;
import spasm.bindings.OscillatorNode;
import spasm.bindings.PannerNode;
import spasm.bindings.PeriodicWave;
import spasm.bindings.ScriptProcessorNode;
import spasm.bindings.StereoPannerNode;
import spasm.bindings.WaveShaperNode;

@safe:
nothrow:

enum AudioContextState {
  suspended,
  running,
  closed
}
struct BaseAudioContext {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return BaseAudioContext_state_Get(this._parent);
  }
  auto audioWorklet()() {
    return AudioWorklet(Object_Getter__Handle(this._parent, "audioWorklet"));
  }
  auto resume()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "resume"));
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  auto createBuffer()(uint numberOfChannels, uint length, float sampleRate) {
    return AudioBuffer(BaseAudioContext_createBuffer(this._parent, numberOfChannels, length, sampleRate));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData, DecodeSuccessCallback successCallback, DecodeErrorCallback errorCallback) {
    return Promise!(AudioBuffer)(BaseAudioContext_decodeAudioData(this._parent, audioData.handle, successCallback, errorCallback));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData, DecodeSuccessCallback successCallback) {
    return Promise!(AudioBuffer)(BaseAudioContext_decodeAudioData_0(this._parent, audioData.handle, successCallback));
  }
  auto decodeAudioData()(scope ref ArrayBuffer audioData) {
    return Promise!(AudioBuffer)(Object_Call_Handle__Handle(this._parent, "decodeAudioData", audioData.handle));
  }
  auto createBufferSource()() {
    return AudioBufferSourceNode(Object_Getter__Handle(this._parent, "createBufferSource"));
  }
  auto createConstantSource()() {
    return ConstantSourceNode(Object_Getter__Handle(this._parent, "createConstantSource"));
  }
  auto createScriptProcessor()(uint bufferSize /* = 0 */, uint numberOfInputChannels /* = 2 */, uint numberOfOutputChannels /* = 2 */) {
    return ScriptProcessorNode(BaseAudioContext_createScriptProcessor(this._parent, bufferSize, numberOfInputChannels, numberOfOutputChannels));
  }
  auto createScriptProcessor()(uint bufferSize /* = 0 */, uint numberOfInputChannels /* = 2 */) {
    return ScriptProcessorNode(BaseAudioContext_createScriptProcessor_0(this._parent, bufferSize, numberOfInputChannels));
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
    return DelayNode(BaseAudioContext_createDelay(this._parent, maxDelayTime));
  }
  auto createDelay()() {
    return DelayNode(Object_Getter__Handle(this._parent, "createDelay"));
  }
  auto createBiquadFilter()() {
    return BiquadFilterNode(Object_Getter__Handle(this._parent, "createBiquadFilter"));
  }
  auto createIIRFilter()(scope ref Sequence!(double) feedforward, scope ref Sequence!(double) feedback) {
    return IIRFilterNode(BaseAudioContext_createIIRFilter(this._parent, feedforward.handle, feedback.handle));
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
    return PeriodicWave(BaseAudioContext_createPeriodicWave(this._parent, real_.handle, imag.handle, constraints.handle));
  }
  auto createPeriodicWave()(scope ref Float32Array real_, scope ref Float32Array imag) {
    return PeriodicWave(BaseAudioContext_createPeriodicWave_0(this._parent, real_.handle, imag.handle));
  }
}
alias DecodeErrorCallback = void delegate(DOMException);
alias DecodeSuccessCallback = void delegate(AudioBuffer);


extern (C) AudioContextState BaseAudioContext_state_Get(Handle);
extern (C) Handle BaseAudioContext_createBuffer(Handle, uint, uint, float);
extern (C) Handle BaseAudioContext_decodeAudioData(Handle, Handle, DecodeSuccessCallback, DecodeErrorCallback);
extern (C) Handle BaseAudioContext_decodeAudioData_0(Handle, Handle, DecodeSuccessCallback);
extern (C) Handle BaseAudioContext_createScriptProcessor(Handle, uint, uint, uint);
extern (C) Handle BaseAudioContext_createScriptProcessor_0(Handle, uint, uint);
extern (C) Handle BaseAudioContext_createDelay(Handle, double);
extern (C) Handle BaseAudioContext_createIIRFilter(Handle, Handle, Handle);
extern (C) Handle BaseAudioContext_createPeriodicWave(Handle, Handle, Handle, Handle);
extern (C) Handle BaseAudioContext_createPeriodicWave_0(Handle, Handle, Handle);