module libwasm.bindings.SecurityPolicyViolationEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct SecurityPolicyViolationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string documentURI()() {
    return Object_Getter__string(this._parent, "documentURI");
  }
  string referrer()() {
    return Object_Getter__string(this._parent, "referrer");
  }
  string blockedURI()() {
    return Object_Getter__string(this._parent, "blockedURI");
  }
  string violatedDirective()() {
    return Object_Getter__string(this._parent, "violatedDirective");
  }
  string effectiveDirective()() {
    return Object_Getter__string(this._parent, "effectiveDirective");
  }
  string originalPolicy()() {
    return Object_Getter__string(this._parent, "originalPolicy");
  }
  string sourceFile()() {
    return Object_Getter__string(this._parent, "sourceFile");
  }
  string sample()() {
    return Object_Getter__string(this._parent, "sample");
  }
  SecurityPolicyViolationEventDisposition disposition()() {
    return Object_Getter__int(this._parent, "disposition");
  }
  ushort statusCode()() {
    return Object_Getter__ushort(this._parent, "statusCode");
  }
  int lineNumber()() {
    return Object_Getter__int(this._parent, "lineNumber");
  }
  int columnNumber()() {
    return Object_Getter__int(this._parent, "columnNumber");
  }
}
enum SecurityPolicyViolationEventDisposition {
  enforce,
  report
}
struct SecurityPolicyViolationEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return SecurityPolicyViolationEventInit(libwasm_add__object());
  }
  void documentURI()(string documentURI) {
    Object_Call_string__void(this._parent, "documentURI", documentURI);
  }
  string documentURI()() {
    return Object_Getter__string(this._parent, "documentURI");
  }
  void referrer()(string referrer) {
    Object_Call_string__void(this._parent, "referrer", referrer);
  }
  string referrer()() {
    return Object_Getter__string(this._parent, "referrer");
  }
  void blockedURI()(string blockedURI) {
    Object_Call_string__void(this._parent, "blockedURI", blockedURI);
  }
  string blockedURI()() {
    return Object_Getter__string(this._parent, "blockedURI");
  }
  void violatedDirective()(string violatedDirective) {
    Object_Call_string__void(this._parent, "violatedDirective", violatedDirective);
  }
  string violatedDirective()() {
    return Object_Getter__string(this._parent, "violatedDirective");
  }
  void effectiveDirective()(string effectiveDirective) {
    Object_Call_string__void(this._parent, "effectiveDirective", effectiveDirective);
  }
  string effectiveDirective()() {
    return Object_Getter__string(this._parent, "effectiveDirective");
  }
  void originalPolicy()(string originalPolicy) {
    Object_Call_string__void(this._parent, "originalPolicy", originalPolicy);
  }
  string originalPolicy()() {
    return Object_Getter__string(this._parent, "originalPolicy");
  }
  void sourceFile()(string sourceFile) {
    Object_Call_string__void(this._parent, "sourceFile", sourceFile);
  }
  string sourceFile()() {
    return Object_Getter__string(this._parent, "sourceFile");
  }
  void sample()(string sample) {
    Object_Call_string__void(this._parent, "sample", sample);
  }
  string sample()() {
    return Object_Getter__string(this._parent, "sample");
  }
  void disposition()(SecurityPolicyViolationEventDisposition disposition) {
    Object_Call_int__void(this._parent, "disposition", disposition);
  }
  SecurityPolicyViolationEventDisposition disposition()() {
    return Object_Getter__int(this._parent, "disposition");
  }
  void statusCode()(ushort statusCode) {
    Serialize_Object_VarArgCall!void(this._parent, "statusCode", "ushort", tuple(statusCode));
  }
  ushort statusCode()() {
    return Object_Getter__ushort(this._parent, "statusCode");
  }
  void lineNumber()(int lineNumber) {
    Object_Call_int__void(this._parent, "lineNumber", lineNumber);
  }
  int lineNumber()() {
    return Object_Getter__int(this._parent, "lineNumber");
  }
  void columnNumber()(int columnNumber) {
    Object_Call_int__void(this._parent, "columnNumber", columnNumber);
  }
  int columnNumber()() {
    return Object_Getter__int(this._parent, "columnNumber");
  }
}


