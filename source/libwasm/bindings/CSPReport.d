module libwasm.bindings.CSPReport;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct CSPReport {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CSPReport(libwasm_add__object());
  }
  void csp_report()(scope ref CSPReportProperties csp_report) {
    Object_Call_Handle__void(this.handle, "csp-report", csp_report.handle);
  }
  auto csp_report()() {
    return CSPReportProperties(Object_Getter__Handle(this.handle, "csp-report"));
  }
}
struct CSPReportProperties {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CSPReportProperties(libwasm_add__object());
  }
  void document_uri()(string document_uri) {
    Object_Call_string__void(this.handle, "document-uri", document_uri);
  }
  string document_uri()() {
    return Object_Getter__string(this.handle, "document-uri");
  }
  void referrer()(string referrer) {
    Object_Call_string__void(this.handle, "referrer", referrer);
  }
  string referrer()() {
    return Object_Getter__string(this.handle, "referrer");
  }
  void blocked_uri()(string blocked_uri) {
    Object_Call_string__void(this.handle, "blocked-uri", blocked_uri);
  }
  string blocked_uri()() {
    return Object_Getter__string(this.handle, "blocked-uri");
  }
  void violated_directive()(string violated_directive) {
    Object_Call_string__void(this.handle, "violated-directive", violated_directive);
  }
  string violated_directive()() {
    return Object_Getter__string(this.handle, "violated-directive");
  }
  void original_policy()(string original_policy) {
    Object_Call_string__void(this.handle, "original-policy", original_policy);
  }
  string original_policy()() {
    return Object_Getter__string(this.handle, "original-policy");
  }
  void source_file()(string source_file) {
    Object_Call_string__void(this.handle, "source-file", source_file);
  }
  string source_file()() {
    return Object_Getter__string(this.handle, "source-file");
  }
  void script_sample()(string script_sample) {
    Object_Call_string__void(this.handle, "script-sample", script_sample);
  }
  string script_sample()() {
    return Object_Getter__string(this.handle, "script-sample");
  }
  void line_number()(int line_number) {
    Object_Call_int__void(this.handle, "line-number", line_number);
  }
  int line_number()() {
    return Object_Getter__int(this.handle, "line-number");
  }
  void column_number()(int column_number) {
    Object_Call_int__void(this.handle, "column-number", column_number);
  }
  int column_number()() {
    return Object_Getter__int(this.handle, "column-number");
  }
}


