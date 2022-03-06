module spasm.bindings.AudioWorkletGlobalScope;

import spasm.types;
import spasm.bindings.Function;
import spasm.bindings.WorkletGlobalScope;

@safe:
nothrow:

struct AudioWorkletGlobalScope {
  nothrow:
  spasm.bindings.WorkletGlobalScope.WorkletGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkletGlobalScope(h);
  }
  void registerProcessor()(string name, VoidFunction processorCtor) {
    AudioWorkletGlobalScope_registerProcessor(this._parent, name, processorCtor);
  }
  uint currentFrame()() {
    return Object_Getter__uint(this._parent, "currentFrame");
  }
  double currentTime()() {
    return Object_Getter__double(this._parent, "currentTime");
  }
  float sampleRate()() {
    return Object_Getter__float(this._parent, "sampleRate");
  }
}


extern (C) void AudioWorkletGlobalScope_registerProcessor(Handle, string, VoidFunction);