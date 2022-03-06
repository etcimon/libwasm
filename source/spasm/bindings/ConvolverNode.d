module spasm.bindings.ConvolverNode;

import spasm.types;
import spasm.bindings.AudioBuffer;
import spasm.bindings.AudioNode;

@safe:
nothrow:

struct ConvolverNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    ConvolverNode_buffer_Set(this._parent, !buffer.empty, buffer.front.handle);
  }
  auto buffer()() {
    return Object_Getter__OptionalHandle(this._parent, "buffer");
  }
  void normalize()(bool normalize) {
    Object_Call_bool__void(this._parent, "normalize", normalize);
  }
  bool normalize()() {
    return Object_Getter__bool(this._parent, "normalize");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct ConvolverOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ConvolverOptions(spasm_add__object());
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    ConvolverOptions_buffer_Set(this._parent, !buffer.empty, buffer.front.handle);
  }
  auto buffer()() {
    return Object_Getter__OptionalHandle(this._parent, "buffer");
  }
  void disableNormalization()(bool disableNormalization) {
    Object_Call_bool__void(this._parent, "disableNormalization", disableNormalization);
  }
  bool disableNormalization()() {
    return Object_Getter__bool(this._parent, "disableNormalization");
  }
}


extern (C) void ConvolverNode_buffer_Set(Handle, bool, Handle);
extern (C) void ConvolverOptions_buffer_Set(Handle, bool, Handle);