module spasm.bindings.CheckerboardReportService;

import spasm.types;
@safe:
nothrow:

enum CheckerboardReason {
  severe,
  recent
}
struct CheckerboardReport {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CheckerboardReport(spasm_add__object());
  }
  void severity()(uint severity) {
    Object_Call_uint__void(this.handle, "severity", severity);
  }
  uint severity()() {
    return Object_Getter__uint(this.handle, "severity");
  }
  void timestamp()(scope ref DOMTimeStamp timestamp) {
    Object_Call_Handle__void(this.handle, "timestamp", timestamp.handle);
  }
  auto timestamp()() {
    return DOMTimeStamp(Object_Getter__Handle(this.handle, "timestamp"));
  }
  void log()(string log) {
    Object_Call_string__void(this.handle, "log", log);
  }
  string log()() {
    return Object_Getter__string(this.handle, "log");
  }
  void reason()(CheckerboardReason reason) {
    CheckerboardReport_reason_Set(this.handle, reason);
  }
  CheckerboardReason reason()() {
    return CheckerboardReport_reason_Get(this.handle);
  }
}
struct CheckerboardReportService {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getReports()() {
    return Sequence!(CheckerboardReport)(Object_Getter__Handle(this.handle, "getReports"));
  }
  bool isRecordingEnabled()() {
    return Object_Getter__bool(this.handle, "isRecordingEnabled");
  }
  void setRecordingEnabled()(bool aEnabled) {
    Object_Call_bool__void(this.handle, "setRecordingEnabled", aEnabled);
  }
  void flushActiveReports()() {
    Object_Call__void(this.handle, "flushActiveReports");
  }
}


extern (C) void CheckerboardReport_reason_Set(Handle, CheckerboardReason);
extern (C) CheckerboardReason CheckerboardReport_reason_Get(Handle);