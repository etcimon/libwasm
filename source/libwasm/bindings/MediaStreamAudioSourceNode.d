module libwasm.bindings.MediaStreamAudioSourceNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaStreamAudioSourceNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct MediaStreamAudioSourceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaStreamAudioSourceOptions(libwasm_add__object());
  }
  void mediaStream()(scope ref MediaStream mediaStream) {
    Object_Call_Handle__void(this.handle, "mediaStream", mediaStream.handle);
  }
  auto mediaStream()() {
    return MediaStream(Object_Getter__Handle(this.handle, "mediaStream"));
  }
}


