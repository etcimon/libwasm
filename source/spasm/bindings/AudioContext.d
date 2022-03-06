module spasm.bindings.AudioContext;

import spasm.types;
import spasm.bindings.BaseAudioContext;
import spasm.bindings.HTMLMediaElement;
import spasm.bindings.MediaElementAudioSourceNode;
import spasm.bindings.MediaStream;
import spasm.bindings.MediaStreamAudioDestinationNode;
import spasm.bindings.MediaStreamAudioSourceNode;

@safe:
nothrow:

struct AudioContext {
  nothrow:
  spasm.bindings.BaseAudioContext.BaseAudioContext _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BaseAudioContext(h);
  }
  auto suspend()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "suspend"));
  }
  auto close()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "close"));
  }
  auto createMediaElementSource()(scope ref HTMLMediaElement mediaElement) {
    return MediaElementAudioSourceNode(Object_Call_Handle__Handle(this._parent, "createMediaElementSource", mediaElement._parent));
  }
  auto createMediaStreamSource()(scope ref MediaStream mediaStream) {
    return MediaStreamAudioSourceNode(Object_Call_Handle__Handle(this._parent, "createMediaStreamSource", mediaStream._parent));
  }
  auto createMediaStreamDestination()() {
    return MediaStreamAudioDestinationNode(Object_Getter__Handle(this._parent, "createMediaStreamDestination"));
  }
}
struct AudioContextOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioContextOptions(spasm_add__object());
  }
  void sampleRate()(float sampleRate) {
    Object_Call_float__void(this.handle, "sampleRate", sampleRate);
  }
  float sampleRate()() {
    return Object_Getter__float(this.handle, "sampleRate");
  }
}


