module libwasm.bindings.VRDisplay;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventTarget;
import libwasm.bindings.HTMLCanvasElement;
import libwasm.bindings.OffscreenCanvas;
import libwasm.bindings.Performance;
import libwasm.bindings.Window;

@safe:
nothrow:

struct VRDisplay {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  uint presentingGroups()() {
    return Object_Getter__uint(this._parent, "presentingGroups");
  }
  void groupMask()(uint groupMask) {
    Object_Call_uint__void(this._parent, "groupMask", groupMask);
  }
  uint groupMask()() {
    return Object_Getter__uint(this._parent, "groupMask");
  }
  bool isConnected()() {
    return Object_Getter__bool(this._parent, "isConnected");
  }
  bool isPresenting()() {
    return Object_Getter__bool(this._parent, "isPresenting");
  }
  auto capabilities()() {
    return VRDisplayCapabilities(Object_Getter__Handle(this._parent, "capabilities"));
  }
  auto stageParameters()() {
    return Optional!(VRStageParameters)(Object_Getter__OptionalHandle(this._parent, "stageParameters"));
  }
  auto getEyeParameters()(VREye whichEye) {
    return VREyeParameters(Object_Call_int__Handle(this._parent, "getEyeParameters", whichEye));
  }
  uint displayId()() {
    return Object_Getter__uint(this._parent, "displayId");
  }
  string displayName()() {
    return Object_Getter__string(this._parent, "displayName");
  }
  bool getFrameData()(scope ref VRFrameData frameData) {
    return Serialize_Object_VarArgCall!bool(this._parent, "getFrameData", "Handle", tuple(cast(Handle)frameData.handle));
  }
  auto getPose()() {
    return VRPose(Object_Getter__Handle(this._parent, "getPose"));
  }
  bool getSubmitFrameResult()(scope ref VRSubmitFrameResult result) {
    return Serialize_Object_VarArgCall!bool(this._parent, "getSubmitFrameResult", "Handle", tuple(cast(Handle)result.handle));
  }
  void resetPose()() {
    Object_Call__void(this._parent, "resetPose");
  }
  void depthNear()(double depthNear) {
    Object_Call_double__void(this._parent, "depthNear", depthNear);
  }
  double depthNear()() {
    return Object_Getter__double(this._parent, "depthNear");
  }
  void depthFar()(double depthFar) {
    Object_Call_double__void(this._parent, "depthFar", depthFar);
  }
  double depthFar()() {
    return Object_Getter__double(this._parent, "depthFar");
  }
  int requestAnimationFrame()(FrameRequestCallback callback) {
    return VRDisplay_requestAnimationFrame(this._parent, callback);
  }
  void cancelAnimationFrame()(int handle) {
    Object_Call_int__void(this._parent, "cancelAnimationFrame", handle);
  }
  auto requestPresent()(scope ref Sequence!(VRLayer) layers) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this._parent, "requestPresent", layers.handle));
  }
  auto exitPresent()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "exitPresent"));
  }
  auto getLayers()() {
    return Sequence!(VRLayer)(Object_Getter__Handle(this._parent, "getLayers"));
  }
  void submitFrame()() {
    Object_Call__void(this._parent, "submitFrame");
  }
}
struct VRDisplayCapabilities {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool hasPosition()() {
    return Object_Getter__bool(this.handle, "hasPosition");
  }
  bool hasOrientation()() {
    return Object_Getter__bool(this.handle, "hasOrientation");
  }
  bool hasExternalDisplay()() {
    return Object_Getter__bool(this.handle, "hasExternalDisplay");
  }
  bool canPresent()() {
    return Object_Getter__bool(this.handle, "canPresent");
  }
  uint maxLayers()() {
    return Object_Getter__uint(this.handle, "maxLayers");
  }
}
enum VREye {
  left,
  right
}
struct VREyeParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto offset()() {
    return Float32Array(Object_Getter__Handle(this.handle, "offset"));
  }
  auto fieldOfView()() {
    return VRFieldOfView(Object_Getter__Handle(this.handle, "fieldOfView"));
  }
  uint renderWidth()() {
    return Object_Getter__uint(this.handle, "renderWidth");
  }
  uint renderHeight()() {
    return Object_Getter__uint(this.handle, "renderHeight");
  }
}
struct VRFieldOfView {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double upDegrees()() {
    return Object_Getter__double(this.handle, "upDegrees");
  }
  double rightDegrees()() {
    return Object_Getter__double(this.handle, "rightDegrees");
  }
  double downDegrees()() {
    return Object_Getter__double(this.handle, "downDegrees");
  }
  double leftDegrees()() {
    return Object_Getter__double(this.handle, "leftDegrees");
  }
}
struct VRFrameData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double timestamp()() {
    return Object_Getter__double(this.handle, "timestamp");
  }
  auto leftProjectionMatrix()() {
    return Float32Array(Object_Getter__Handle(this.handle, "leftProjectionMatrix"));
  }
  auto leftViewMatrix()() {
    return Float32Array(Object_Getter__Handle(this.handle, "leftViewMatrix"));
  }
  auto rightProjectionMatrix()() {
    return Float32Array(Object_Getter__Handle(this.handle, "rightProjectionMatrix"));
  }
  auto rightViewMatrix()() {
    return Float32Array(Object_Getter__Handle(this.handle, "rightViewMatrix"));
  }
  auto pose()() {
    return VRPose(Object_Getter__Handle(this.handle, "pose"));
  }
}
struct VRLayer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return VRLayer(libwasm_add__object());
  }
  void source(T0)(scope auto ref Optional!(T0) source) if (isTOrPointer!(T0, HTMLCanvasElement)) {
    Serialize_Object_VarArgCall!void(this.handle, "source", "Optional!Handle", tuple(!source.empty, cast(Handle)source.front._parent));
  }
  auto source()() {
    return Optional!(HTMLCanvasElement)(Object_Getter__OptionalHandle(this.handle, "source"));
  }
  void leftBounds()(scope ref Sequence!(float) leftBounds) {
    Object_Call_Handle__void(this.handle, "leftBounds", leftBounds.handle);
  }
  auto leftBounds()() {
    return Sequence!(float)(Object_Getter__Handle(this.handle, "leftBounds"));
  }
  void rightBounds()(scope ref Sequence!(float) rightBounds) {
    Object_Call_Handle__void(this.handle, "rightBounds", rightBounds.handle);
  }
  auto rightBounds()() {
    return Sequence!(float)(Object_Getter__Handle(this.handle, "rightBounds"));
  }
}
struct VRPose {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto position()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "position"));
  }
  auto linearVelocity()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearVelocity"));
  }
  auto linearAcceleration()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearAcceleration"));
  }
  auto orientation()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "orientation"));
  }
  auto angularVelocity()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularVelocity"));
  }
  auto angularAcceleration()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularAcceleration"));
  }
}
alias VRSource = SumType!(HTMLCanvasElement, OffscreenCanvas);
struct VRStageParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto sittingToStandingTransform()() {
    return Float32Array(Object_Getter__Handle(this.handle, "sittingToStandingTransform"));
  }
  float sizeX()() {
    return Object_Getter__float(this.handle, "sizeX");
  }
  float sizeZ()() {
    return Object_Getter__float(this.handle, "sizeZ");
  }
}
struct VRSubmitFrameResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint frameNum()() {
    return Object_Getter__uint(this.handle, "frameNum");
  }
  Optional!(string) base64Image()() {
    return Object_Getter__OptionalString(this.handle, "base64Image");
  }
}


extern (C) int VRDisplay_requestAnimationFrame(Handle, FrameRequestCallback);