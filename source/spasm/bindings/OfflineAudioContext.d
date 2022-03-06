module spasm.bindings.OfflineAudioContext;

import spasm.types;
import spasm.bindings.AudioBuffer;
import spasm.bindings.BaseAudioContext;
import spasm.bindings.EventHandler;

@safe:
nothrow:

struct OfflineAudioContext {
  nothrow:
  spasm.bindings.BaseAudioContext.BaseAudioContext _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BaseAudioContext(h);
  }
  auto startRendering()() {
    return Promise!(AudioBuffer)(Object_Getter__Handle(this._parent, "startRendering"));
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  void oncomplete(T0)(scope auto ref Optional!(T0) oncomplete) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncomplete", !oncomplete.empty, oncomplete.front);
  }
  EventHandler oncomplete()() {
    return Object_Getter__EventHandler(this._parent, "oncomplete");
  }
}
struct OfflineAudioContextOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return OfflineAudioContextOptions(spasm_add__object());
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


