module spasm.bindings.WaveShaperNode;

import spasm.types;
import spasm.bindings.AudioNode;

@safe:
nothrow:

enum OverSampleType {
  none,
  _2x,
  _4x
}
struct WaveShaperNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void curve(T0)(scope auto ref Optional!(T0) curve) if (isTOrPointer!(T0, Float32Array)) {
    WaveShaperNode_curve_Set(this._parent, !curve.empty, curve.front.handle);
  }
  auto curve()() {
    return Object_Getter__OptionalHandle(this._parent, "curve");
  }
  void oversample()(OverSampleType oversample) {
    WaveShaperNode_oversample_Set(this._parent, oversample);
  }
  OverSampleType oversample()() {
    return WaveShaperNode_oversample_Get(this._parent);
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
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return WaveShaperOptions(spasm_add__object());
  }
  void curve()(scope ref Sequence!(float) curve) {
    Object_Call_Handle__void(this._parent, "curve", curve.handle);
  }
  auto curve()() {
    return Sequence!(float)(Object_Getter__Handle(this._parent, "curve"));
  }
  void oversample()(OverSampleType oversample) {
    WaveShaperOptions_oversample_Set(this._parent, oversample);
  }
  OverSampleType oversample()() {
    return WaveShaperOptions_oversample_Get(this._parent);
  }
}


extern (C) void WaveShaperNode_curve_Set(Handle, bool, Handle);
extern (C) void WaveShaperNode_oversample_Set(Handle, OverSampleType);
extern (C) OverSampleType WaveShaperNode_oversample_Get(Handle);
extern (C) void WaveShaperOptions_oversample_Set(Handle, OverSampleType);
extern (C) OverSampleType WaveShaperOptions_oversample_Get(Handle);