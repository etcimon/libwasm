module spasm.bindings.MediaElementAudioSourceNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.HTMLMediaElement;

@safe:
nothrow:

struct MediaElementAudioSourceNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
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
struct MediaElementAudioSourceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaElementAudioSourceOptions(spasm_add__object());
  }
  void mediaElement()(scope ref HTMLMediaElement mediaElement) {
    Object_Call_Handle__void(this.handle, "mediaElement", mediaElement.handle);
  }
  auto mediaElement()() {
    return HTMLMediaElement(Object_Getter__Handle(this.handle, "mediaElement"));
  }
}


