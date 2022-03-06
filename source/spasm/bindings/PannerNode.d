module spasm.bindings.PannerNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.AudioParam;

@safe:
nothrow:

enum DistanceModelType {
  linear,
  inverse,
  exponential
}
struct PannerNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void panningModel()(PanningModelType panningModel) {
    PannerNode_panningModel_Set(this._parent, panningModel);
  }
  PanningModelType panningModel()() {
    return PannerNode_panningModel_Get(this._parent);
  }
  void setPosition()(double x, double y, double z) {
    PannerNode_setPosition(this._parent, x, y, z);
  }
  void setOrientation()(double x, double y, double z) {
    PannerNode_setOrientation(this._parent, x, y, z);
  }
  auto positionX()() {
    return AudioParam(Object_Getter__Handle(this._parent, "positionX"));
  }
  auto positionY()() {
    return AudioParam(Object_Getter__Handle(this._parent, "positionY"));
  }
  auto positionZ()() {
    return AudioParam(Object_Getter__Handle(this._parent, "positionZ"));
  }
  auto orientationX()() {
    return AudioParam(Object_Getter__Handle(this._parent, "orientationX"));
  }
  auto orientationY()() {
    return AudioParam(Object_Getter__Handle(this._parent, "orientationY"));
  }
  auto orientationZ()() {
    return AudioParam(Object_Getter__Handle(this._parent, "orientationZ"));
  }
  void distanceModel()(DistanceModelType distanceModel) {
    PannerNode_distanceModel_Set(this._parent, distanceModel);
  }
  DistanceModelType distanceModel()() {
    return PannerNode_distanceModel_Get(this._parent);
  }
  void refDistance()(double refDistance) {
    Object_Call_double__void(this._parent, "refDistance", refDistance);
  }
  double refDistance()() {
    return Object_Getter__double(this._parent, "refDistance");
  }
  void maxDistance()(double maxDistance) {
    Object_Call_double__void(this._parent, "maxDistance", maxDistance);
  }
  double maxDistance()() {
    return Object_Getter__double(this._parent, "maxDistance");
  }
  void rolloffFactor()(double rolloffFactor) {
    Object_Call_double__void(this._parent, "rolloffFactor", rolloffFactor);
  }
  double rolloffFactor()() {
    return Object_Getter__double(this._parent, "rolloffFactor");
  }
  void coneInnerAngle()(double coneInnerAngle) {
    Object_Call_double__void(this._parent, "coneInnerAngle", coneInnerAngle);
  }
  double coneInnerAngle()() {
    return Object_Getter__double(this._parent, "coneInnerAngle");
  }
  void coneOuterAngle()(double coneOuterAngle) {
    Object_Call_double__void(this._parent, "coneOuterAngle", coneOuterAngle);
  }
  double coneOuterAngle()() {
    return Object_Getter__double(this._parent, "coneOuterAngle");
  }
  void coneOuterGain()(double coneOuterGain) {
    Object_Call_double__void(this._parent, "coneOuterGain", coneOuterGain);
  }
  double coneOuterGain()() {
    return Object_Getter__double(this._parent, "coneOuterGain");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct PannerOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return PannerOptions(spasm_add__object());
  }
  void panningModel()(PanningModelType panningModel) {
    PannerOptions_panningModel_Set(this._parent, panningModel);
  }
  PanningModelType panningModel()() {
    return PannerOptions_panningModel_Get(this._parent);
  }
  void distanceModel()(DistanceModelType distanceModel) {
    PannerOptions_distanceModel_Set(this._parent, distanceModel);
  }
  DistanceModelType distanceModel()() {
    return PannerOptions_distanceModel_Get(this._parent);
  }
  void positionX()(float positionX) {
    Object_Call_float__void(this._parent, "positionX", positionX);
  }
  float positionX()() {
    return Object_Getter__float(this._parent, "positionX");
  }
  void positionY()(float positionY) {
    Object_Call_float__void(this._parent, "positionY", positionY);
  }
  float positionY()() {
    return Object_Getter__float(this._parent, "positionY");
  }
  void positionZ()(float positionZ) {
    Object_Call_float__void(this._parent, "positionZ", positionZ);
  }
  float positionZ()() {
    return Object_Getter__float(this._parent, "positionZ");
  }
  void orientationX()(float orientationX) {
    Object_Call_float__void(this._parent, "orientationX", orientationX);
  }
  float orientationX()() {
    return Object_Getter__float(this._parent, "orientationX");
  }
  void orientationY()(float orientationY) {
    Object_Call_float__void(this._parent, "orientationY", orientationY);
  }
  float orientationY()() {
    return Object_Getter__float(this._parent, "orientationY");
  }
  void orientationZ()(float orientationZ) {
    Object_Call_float__void(this._parent, "orientationZ", orientationZ);
  }
  float orientationZ()() {
    return Object_Getter__float(this._parent, "orientationZ");
  }
  void refDistance()(double refDistance) {
    Object_Call_double__void(this._parent, "refDistance", refDistance);
  }
  double refDistance()() {
    return Object_Getter__double(this._parent, "refDistance");
  }
  void maxDistance()(double maxDistance) {
    Object_Call_double__void(this._parent, "maxDistance", maxDistance);
  }
  double maxDistance()() {
    return Object_Getter__double(this._parent, "maxDistance");
  }
  void rolloffFactor()(double rolloffFactor) {
    Object_Call_double__void(this._parent, "rolloffFactor", rolloffFactor);
  }
  double rolloffFactor()() {
    return Object_Getter__double(this._parent, "rolloffFactor");
  }
  void coneInnerAngle()(double coneInnerAngle) {
    Object_Call_double__void(this._parent, "coneInnerAngle", coneInnerAngle);
  }
  double coneInnerAngle()() {
    return Object_Getter__double(this._parent, "coneInnerAngle");
  }
  void coneOuterAngle()(double coneOuterAngle) {
    Object_Call_double__void(this._parent, "coneOuterAngle", coneOuterAngle);
  }
  double coneOuterAngle()() {
    return Object_Getter__double(this._parent, "coneOuterAngle");
  }
  void coneOuterGain()(double coneOuterGain) {
    Object_Call_double__void(this._parent, "coneOuterGain", coneOuterGain);
  }
  double coneOuterGain()() {
    return Object_Getter__double(this._parent, "coneOuterGain");
  }
}
enum PanningModelType {
  equalpower,
  HRTF
}


extern (C) void PannerNode_panningModel_Set(Handle, PanningModelType);
extern (C) PanningModelType PannerNode_panningModel_Get(Handle);
extern (C) void PannerNode_setPosition(Handle, double, double, double);
extern (C) void PannerNode_setOrientation(Handle, double, double, double);
extern (C) void PannerNode_distanceModel_Set(Handle, DistanceModelType);
extern (C) DistanceModelType PannerNode_distanceModel_Get(Handle);
extern (C) void PannerOptions_panningModel_Set(Handle, PanningModelType);
extern (C) PanningModelType PannerOptions_panningModel_Get(Handle);
extern (C) void PannerOptions_distanceModel_Set(Handle, DistanceModelType);
extern (C) DistanceModelType PannerOptions_distanceModel_Get(Handle);