module libwasm.bindings.WebrtcGlobalInformation;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.RTCStatsReport;

@safe:
nothrow:

struct WebrtcGlobalInformation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void getAllStats()(WebrtcGlobalStatisticsCallback callback, string pcIdFilter) {
    WebrtcGlobalInformation_getAllStats(this.handle, callback, pcIdFilter);
  }
  void getAllStats()(WebrtcGlobalStatisticsCallback callback) {
    WebrtcGlobalInformation_getAllStats_0(this.handle, callback);
  }
  void clearAllStats()() {
    Object_Call__void(this.handle, "clearAllStats");
  }
  void getLogging()(string pattern, WebrtcGlobalLoggingCallback callback) {
    WebrtcGlobalInformation_getLogging(this.handle, pattern, callback);
  }
  void clearLogging()() {
    Object_Call__void(this.handle, "clearLogging");
  }
  void debugLevel()(int debugLevel) {
    Object_Call_int__void(this.handle, "debugLevel", debugLevel);
  }
  int debugLevel()() {
    return Object_Getter__int(this.handle, "debugLevel");
  }
  void aecDebug()(bool aecDebug) {
    Object_Call_bool__void(this.handle, "aecDebug", aecDebug);
  }
  bool aecDebug()() {
    return Object_Getter__bool(this.handle, "aecDebug");
  }
  void aecDebugLogDir()(string aecDebugLogDir) {
    Object_Call_string__void(this.handle, "aecDebugLogDir", aecDebugLogDir);
  }
  string aecDebugLogDir()() {
    return Object_Getter__string(this.handle, "aecDebugLogDir");
  }
}
alias WebrtcGlobalLoggingCallback = void delegate(Sequence!(string));
alias WebrtcGlobalStatisticsCallback = void delegate(WebrtcGlobalStatisticsReport);
struct WebrtcGlobalStatisticsReport {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebrtcGlobalStatisticsReport(libwasm_add__object());
  }
  void reports()(scope ref Sequence!(RTCStatsReportInternal) reports) {
    Object_Call_Handle__void(this.handle, "reports", reports.handle);
  }
  auto reports()() {
    return Sequence!(RTCStatsReportInternal)(Object_Getter__Handle(this.handle, "reports"));
  }
}


extern (C) void WebrtcGlobalInformation_getAllStats(Handle, WebrtcGlobalStatisticsCallback, string);
extern (C) void WebrtcGlobalInformation_getAllStats_0(Handle, WebrtcGlobalStatisticsCallback);
extern (C) void WebrtcGlobalInformation_getLogging(Handle, string, WebrtcGlobalLoggingCallback);