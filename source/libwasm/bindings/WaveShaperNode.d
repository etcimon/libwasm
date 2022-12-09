module libwasm.bindings.WaveShaperNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

enum OverSampleType {
  none,
  _2x,
  _4x
}
struct WaveShaperNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void curve(T0)(scope auto ref Optional!(T0) curve) if (isTOrPointer!(T0, Float32Array)) {
    Serialize_Object_VarArgCall!void(this._parent, "curve", "Optional!Handle", tuple(!curve.empty, cast(Handle)curve.front.handle));
  }
  auto curve()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this._parent, "curve"));
  }
  void oversample()(OverSampleType oversample) {
    Object_Call_int__void(this._parent, "oversample", oversample);
  }
  OverSampleType oversample()() {
    return Object_Getter__int(this._parent, "oversample");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct WaveShaperOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return WaveShaperOptions(libwasm_add__object());
  }
  void curve()(scope ref Sequence!(float) curve) {
    Object_Call_Handle__void(this._parent, "curve", curve.handle);
  }
  auto curve()() {
    return Sequence!(float)(Object_Getter__Handle(this._parent, "curve"));
  }
  void oversample()(OverSampleType oversample) {
    Object_Call_int__void(this._parent, "oversample", oversample);
  }
  OverSampleType oversample()() {
    return Object_Getter__int(this._parent, "oversample");
  }
}


