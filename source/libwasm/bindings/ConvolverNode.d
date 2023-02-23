module libwasm.bindings.ConvolverNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioBuffer;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct ConvolverNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    Serialize_Object_VarArgCall!void(this._parent, "buffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  auto buffer()() {
    return recastOpt!(AudioBuffer)(Object_Getter__OptionalHandle(this._parent, "buffer"));
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
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ConvolverOptions(libwasm_add__object());
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    Serialize_Object_VarArgCall!void(this._parent, "buffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  auto buffer()() {
    return recastOpt!(AudioBuffer)(Object_Getter__OptionalHandle(this._parent, "buffer"));
  }
  void disableNormalization()(bool disableNormalization) {
    Object_Call_bool__void(this._parent, "disableNormalization", disableNormalization);
  }
  bool disableNormalization()() {
    return Object_Getter__bool(this._parent, "disableNormalization");
  }
}


