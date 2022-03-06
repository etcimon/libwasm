module spasm.bindings.AudioParam;

import spasm.types;
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
    return AudioParam(AudioParam_setValueAtTime(this.handle, value, startTime));
  }
  auto linearRampToValueAtTime()(float value, double endTime) {
    return AudioParam(AudioParam_linearRampToValueAtTime(this.handle, value, endTime));
  }
  auto exponentialRampToValueAtTime()(float value, double endTime) {
    return AudioParam(AudioParam_exponentialRampToValueAtTime(this.handle, value, endTime));
  }
  auto setTargetAtTime()(float target, double startTime, double timeConstant) {
    return AudioParam(AudioParam_setTargetAtTime(this.handle, target, startTime, timeConstant));
  }
  auto setValueCurveAtTime()(scope ref Sequence!(float) values, double startTime, double duration) {
    return AudioParam(AudioParam_setValueCurveAtTime(this.handle, values.handle, startTime, duration));
  }
  auto cancelScheduledValues()(double startTime) {
    return AudioParam(AudioParam_cancelScheduledValues(this.handle, startTime));
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


extern (C) Handle AudioParam_setValueAtTime(Handle, float, double);
extern (C) Handle AudioParam_linearRampToValueAtTime(Handle, float, double);
extern (C) Handle AudioParam_exponentialRampToValueAtTime(Handle, float, double);
extern (C) Handle AudioParam_setTargetAtTime(Handle, float, double, double);
extern (C) Handle AudioParam_setValueCurveAtTime(Handle, Handle, double, double);
extern (C) Handle AudioParam_cancelScheduledValues(Handle, double);