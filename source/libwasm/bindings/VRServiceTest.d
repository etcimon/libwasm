module libwasm.bindings.VRServiceTest;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.VRDisplay;

@safe:
nothrow:

struct VRMockController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void newButtonEvent()(uint button, bool pressed) {
    Serialize_Object_VarArgCall!void(this.handle, "newButtonEvent", "uint;bool", tuple(button, pressed));
  }
  void newAxisMoveEvent()(uint axis, double value) {
    Serialize_Object_VarArgCall!void(this.handle, "newAxisMoveEvent", "uint;double", tuple(axis, value));
  }
  void newPoseMove(T0, T1, T2, T3, T4, T5)(scope auto ref Optional!(T0) position, scope auto ref Optional!(T1) linearVelocity, scope auto ref Optional!(T2) linearAcceleration, scope auto ref Optional!(T3) orientation, scope auto ref Optional!(T4) angularVelocity, scope auto ref Optional!(T5) angularAcceleration) if (isTOrPointer!(T0, Float32Array) && isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array)) {
    Serialize_Object_VarArgCall!void(this.handle, "newPoseMove", "Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle", tuple(!position.empty, cast(Handle)position.front.handle, !linearVelocity.empty, cast(Handle)linearVelocity.front.handle, !linearAcceleration.empty, cast(Handle)linearAcceleration.front.handle, !orientation.empty, cast(Handle)orientation.front.handle, !angularVelocity.empty, cast(Handle)angularVelocity.front.handle, !angularAcceleration.empty, cast(Handle)angularAcceleration.front.handle));
  }
}
struct VRMockDisplay {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void setEyeResolution()(uint aRenderWidth, uint aRenderHeight) {
    Serialize_Object_VarArgCall!void(this.handle, "setEyeResolution", "uint;uint", tuple(aRenderWidth, aRenderHeight));
  }
  void setEyeParameter()(VREye eye, double offsetX, double offsetY, double offsetZ, double upDegree, double rightDegree, double downDegree, double leftDegree) {
    Serialize_Object_VarArgCall!void(this.handle, "setEyeParameter", "Enum;double;double;double;double;double;double;double", tuple(eye, offsetX, offsetY, offsetZ, upDegree, rightDegree, downDegree, leftDegree));
  }
  void setPose(T0, T1, T2, T3, T4, T5)(scope auto ref Optional!(T0) position, scope auto ref Optional!(T1) linearVelocity, scope auto ref Optional!(T2) linearAcceleration, scope auto ref Optional!(T3) orientation, scope auto ref Optional!(T4) angularVelocity, scope auto ref Optional!(T5) angularAcceleration) if (isTOrPointer!(T0, Float32Array) && isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array)) {
    Serialize_Object_VarArgCall!void(this.handle, "setPose", "Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle", tuple(!position.empty, cast(Handle)position.front.handle, !linearVelocity.empty, cast(Handle)linearVelocity.front.handle, !linearAcceleration.empty, cast(Handle)linearAcceleration.front.handle, !orientation.empty, cast(Handle)orientation.front.handle, !angularVelocity.empty, cast(Handle)angularVelocity.front.handle, !angularAcceleration.empty, cast(Handle)angularAcceleration.front.handle));
  }
  void setMountState()(bool isMounted) {
    Object_Call_bool__void(this.handle, "setMountState", isMounted);
  }
  void update()() {
    Object_Call__void(this.handle, "update");
  }
}
struct VRServiceTest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto attachVRDisplay()(string id) {
    return JsPromise!(VRMockDisplay)(Object_Call_string__Handle(this.handle, "attachVRDisplay", id));
  }
  auto attachVRController()(string id) {
    return JsPromise!(VRMockController)(Object_Call_string__Handle(this.handle, "attachVRController", id));
  }
}


