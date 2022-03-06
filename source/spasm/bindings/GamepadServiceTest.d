module spasm.bindings.GamepadServiceTest;

import spasm.types;
import spasm.bindings.Gamepad;

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
    return GamepadServiceTest_noMapping_Get(this.handle);
  }
  GamepadMappingType standardMapping()() {
    return GamepadServiceTest_standardMapping_Get(this.handle);
  }
  GamepadHand noHand()() {
    return GamepadServiceTest_noHand_Get(this.handle);
  }
  GamepadHand leftHand()() {
    return GamepadServiceTest_leftHand_Get(this.handle);
  }
  GamepadHand rightHand()() {
    return GamepadServiceTest_rightHand_Get(this.handle);
  }
  auto addGamepad()(string id, GamepadMappingType mapping, GamepadHand hand, uint numButtons, uint numAxes, uint numHaptics) {
    return Promise!(uint)(GamepadServiceTest_addGamepad(this.handle, id, mapping, hand, numButtons, numAxes, numHaptics));
  }
  void removeGamepad()(uint index) {
    Object_Call_uint__void(this.handle, "removeGamepad", index);
  }
  void newButtonEvent()(uint index, uint button, bool pressed, bool touched) {
    GamepadServiceTest_newButtonEvent(this.handle, index, button, pressed, touched);
  }
  void newButtonValueEvent()(uint index, uint button, bool pressed, bool touched, double value) {
    GamepadServiceTest_newButtonValueEvent(this.handle, index, button, pressed, touched, value);
  }
  void newAxisMoveEvent()(uint index, uint axis, double value) {
    GamepadServiceTest_newAxisMoveEvent(this.handle, index, axis, value);
  }
  void newPoseMove(T1, T2, T3, T4, T5, T6)(uint index, scope auto ref Optional!(T1) orient, scope auto ref Optional!(T2) pos, scope auto ref Optional!(T3) angVelocity, scope auto ref Optional!(T4) angAcceleration, scope auto ref Optional!(T5) linVelocity, scope auto ref Optional!(T6) linAcceleration) if (isTOrPointer!(T1, Float32Array) && isTOrPointer!(T2, Float32Array) && isTOrPointer!(T3, Float32Array) && isTOrPointer!(T4, Float32Array) && isTOrPointer!(T5, Float32Array) && isTOrPointer!(T6, Float32Array)) {
    GamepadServiceTest_newPoseMove(this.handle, index, !orient.empty, orient.front.handle, !pos.empty, pos.front.handle, !angVelocity.empty, angVelocity.front.handle, !angAcceleration.empty, angAcceleration.front.handle, !linVelocity.empty, linVelocity.front.handle, !linAcceleration.empty, linAcceleration.front.handle);
  }
}


extern (C) GamepadMappingType GamepadServiceTest_noMapping_Get(Handle);
extern (C) GamepadMappingType GamepadServiceTest_standardMapping_Get(Handle);
extern (C) GamepadHand GamepadServiceTest_noHand_Get(Handle);
extern (C) GamepadHand GamepadServiceTest_leftHand_Get(Handle);
extern (C) GamepadHand GamepadServiceTest_rightHand_Get(Handle);
extern (C) Handle GamepadServiceTest_addGamepad(Handle, string, GamepadMappingType, GamepadHand, uint, uint, uint);
extern (C) void GamepadServiceTest_newButtonEvent(Handle, uint, uint, bool, bool);
extern (C) void GamepadServiceTest_newButtonValueEvent(Handle, uint, uint, bool, bool, double);
extern (C) void GamepadServiceTest_newAxisMoveEvent(Handle, uint, uint, double);
extern (C) void GamepadServiceTest_newPoseMove(Handle, uint, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle, bool, Handle);