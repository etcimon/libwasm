module libwasm.bindings.AudioContext;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.BaseAudioContext;
import libwasm.bindings.HTMLMediaElement;
import libwasm.bindings.MediaElementAudioSourceNode;
import libwasm.bindings.MediaStream;
import libwasm.bindings.MediaStreamAudioDestinationNode;
import libwasm.bindings.MediaStreamAudioSourceNode;

@safe:
nothrow:

struct AudioContext {
  nothrow:
  libwasm.bindings.BaseAudioContext.BaseAudioContext _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BaseAudioContext(h);
  }
  auto suspend()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "suspend"));
  }
  auto close()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "close"));
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
    return AudioContextOptions(libwasm_add__object());
  }
  void sampleRate()(float sampleRate) {
    Object_Call_float__void(this.handle, "sampleRate", sampleRate);
  }
  float sampleRate()() {
    return Object_Getter__float(this.handle, "sampleRate");
  }
}


