module libwasm.bindings.AudioParam;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct AudioParam {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void value()(float value) {
    Object_Call_float__void(this.handle, "value", value);
  }
  float value()() {
    return Object_Getter__float(this.handle, "value");
  }
  float defaultValue()() {
    return Object_Getter__float(this.handle, "defaultValue");
  }
  float minValue()() {
    return Object_Getter__float(this.handle, "minValue");
  }
  float maxValue()() {
    return Object_Getter__float(this.handle, "maxValue");
  }
  auto setValueAtTime()(float value, double startTime) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "setValueAtTime", "float;double", tuple(value, startTime)));
  }
  auto linearRampToValueAtTime()(float value, double endTime) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "linearRampToValueAtTime", "float;double", tuple(value, endTime)));
  }
  auto exponentialRampToValueAtTime()(float value, double endTime) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "exponentialRampToValueAtTime", "float;double", tuple(value, endTime)));
  }
  auto setTargetAtTime()(float target, double startTime, double timeConstant) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "setTargetAtTime", "float;double;double", tuple(target, startTime, timeConstant)));
  }
  auto setValueCurveAtTime()(scope ref Sequence!(float) values, double startTime, double duration) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "setValueCurveAtTime", "Handle;double;double", tuple(cast(Handle)values.handle, startTime, duration)));
  }
  auto cancelScheduledValues()(double startTime) {
    return AudioParam(Serialize_Object_VarArgCall!Handle(this.handle, "cancelScheduledValues", "double", tuple(startTime)));
  }
  uint parentNodeId()() {
    return Object_Getter__uint(this.handle, "parentNodeId");
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  bool isStreamSuspended()() {
    return Object_Getter__bool(this.handle, "isStreamSuspended");
  }
}
enum AutomationRate {
  a_rate,
  k_rate
}


