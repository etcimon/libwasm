module libwasm.bindings.GamepadServiceTest;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Gamepad;

@safe:
nothrow:

struct GamepadServiceTest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  GamepadMappingType noMapping()() {
    return Object_Getter__int(this.handle, "noMapping");
  }
  GamepadMappingType standardMapping()() {
    return Object_Getter__int(this.handle, "standardMapping");
  }
  GamepadHand noHand()() {
    return Object_Getter__int(this.handle, "noHand");
  }
  GamepadHand leftHand()() {
    return Object_Getter__int(this.handle, "leftHand");
  }
  GamepadHand rightHand()() {
    return Object_Getter__int(this.handle, "rightHand");
  }
  auto addGamepad()(string id, GamepadMappingType mapping, GamepadHand hand, uint numButtons, uint numAxes, uint numHaptics) {
    return JsPromise!(uint)(Serialize_Object_VarArgCall!Handle(this.handle, "addGamepad", "string;Enum;Enum;uint;uint;uint", tuple(id, mapping, hand, numButtons, numAxes, numHaptics)));
  }
  void removeGamepad()(uint index) {
    Object_Call_uint__void(this.handle, "removeGamepad", index);
  }
  void newButtonEvent()(uint index, uint button, bool pressed, bool touched) {
    Serialize_Object_VarArgCall!void(this.handle, "newButtonEvent", "uint;uint;bool;bool", tuple(index, button, pressed, touched));
  }
  void newButtonValueEvent()(uint index, uint button, bool pressed, bool touched, double value) {
    Serialize_Object_VarArgCall!void(this.handle, "newButtonValueEvent", "uint;uint;bool;bool;double", tuple(index, button, pressed, touched, value));
  }
  void newAxisMoveEvent()(uint index, uint axis, double value) {
    Serialize_Object_VarArgCall!void(this.handle, "newAxisMoveEvent", "uint;uint;double", tuple(index, axis, value));
  }
  void newPoseMove(T1, T2, T3, T4, T5, T6)(uint index, scope auto ref Optional!(T1) orient, scope auto ref Optional!(T2) pos, scope auto ref Optional!(T3) angVelocity, scope auto ref Optional!(T4) angAcceleration, scope auto ref Optional!(T5) linVelocity, scope auto ref Optional!(T6) linAcceleration) if (isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array) && isTOrPointer!(T6, Float32Array)) {
    Serialize_Object_VarArgCall!void(this.handle, "newPoseMove", "uint;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle;Optional!Handle", tuple(index, !orient.empty, cast(Handle)orient.front.handle, !pos.empty, cast(Handle)pos.front.handle, !angVelocity.empty, cast(Handle)angVelocity.front.handle, !angAcceleration.empty, cast(Handle)angAcceleration.front.handle, !linVelocity.empty, cast(Handle)linVelocity.front.handle, !linAcceleration.empty, cast(Handle)linAcceleration.front.handle));
  }
}


