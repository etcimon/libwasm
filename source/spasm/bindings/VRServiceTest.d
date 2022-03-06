module spasm.bindings.VRServiceTest;

import spasm.types;
import spasm.bindings.VRDisplay;

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
    VRMockController_newButtonEvent(this.handle, button, pressed);
  }
  void newAxisMoveEvent()(uint axis, double value) {
    VRMockController_newAxisMoveEvent(this.handle, axis, value);
  }
  void newPoseMove(T0, T1, T2, T3, T4, T5)(scope auto ref Optional!(T0) position, scope auto ref Optional!(T1) linearVelocity, scope auto ref Optional!(T2) linearAcceleration, scope auto ref Optional!(T3) orientation, scope auto ref Optional!(T4) angularVelocity, scope auto ref Optional!(T5) angularAcceleration) if (isTOrPointer!(T0, Float32Array) && isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array)) {
    VRMockController_newPoseMove(this.handle, !position.empty, position.front.handle, !linearVelocity.empty, linearVelocity.front.handle, !linearAcceleration.empty, linearAcceleration.front.handle, !orientation.empty, orientation.front.handle, !angularVelocity.empty, angularVelocity.front.handle, !angularAcceleration.empty, angularAcceleration.front.handle);
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
    VRMockDisplay_setEyeResolution(this.handle, aRenderWidth, aRenderHeight);
  }
  void setEyeParameter()(VREye eye, double offsetX, double offsetY, double offsetZ, double upDegree, double rightDegree, double downDegree, double leftDegree) {
    VRMockDisplay_setEyeParameter(this.handle, eye, offsetX, offsetY, offsetZ, upDegree, rightDegree, downDegree, leftDegree);
  }
  void setPose(T0, T1, T2, T3, T4, T5)(scope auto ref Optional!(T0) position, scope auto ref Optional!(T1) linearVelocity, scope auto ref Optional!(T2) linearAcceleration, scope auto ref Optional!(T3) orientation, scope auto ref Optional!(T4) angularVelocity, scope auto ref Optional!(T5) angularAcceleration) if (isTOrPointer!(T0, Float32Array) && isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array)) {
    VRMockDisplay_setPose(this.handle, !position.empty, position.front.handle, !linearVelocity.empty, linearVelocity.front.handle, !linearAcceleration.empty, linearAcceleration.front.handle, !orientation.empty, orientation.front.handle, !angularVelocity.empty, angularVelocity.front.handle, !angularAcceleration.empty, angularAcceleration.front.handle);
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
    return Promise!(VRMockDisplay)(Object_Call_string__Handle(this.handle, "attachVRDisplay", id));
  }
  auto attachVRController()(string id) {
    return Promise!(VRMockController)(Object_Call_string__Handle(this.handle, "attachVRController", id));
  }
}


extern (C) void VRMockController_newButtonEvent(Handle, uint, bool);
extern (C) void VRMockController_newAxisMoveEvent(Handle, uint, double);
extern (C) void VRMockController_newPoseMove(Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle);
extern (C) void VRMockDisplay_setEyeResolution(Handle, uint, uint);
extern (C) void VRMockDisplay_setEyeParameter(Handle, VREye, double, double, double, double, double, double, double);
extern (C) void VRMockDisplay_setPose(Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle);