module libwasm.bindings.FeaturePolicy;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Reporting;

@safe:
nothrow:

struct FeaturePolicyViolationReportBody {
  nothrow:
  libwasm.bindings.Reporting.ReportBody _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ReportBody(h);
  }
  string featureId()() {
    return Object_Getter__string(this._parent, "featureId");
  }
  Optional!(string) sourceFile()() {
    return Object_Getter__OptionalString(this._parent, "sourceFile");
  }
  Optional!(int) lineNumber()() {
    return FeaturePolicyViolationReportBody_lineNumber_Get(this._parent);
  }
  Optional!(int) columnNumber()() {
    return FeaturePolicyViolationReportBody_columnNumber_Get(this._parent);
  }
  string disposition()() {
    return Object_Getter__string(this._parent, "disposition");
  }
}
struct Policy {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool allowsFeature()(string feature, string origin) {
    return Serialize_Object_VarArgCall!bool(this.handle, "allowsFeature", "string;string", tuple(feature, origin));
  }
  bool allowsFeature()(string feature) {
    return Object_Call_string__bool(this.handle, "allowsFeature", feature);
  }
  auto allowedFeatures()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "allowedFeatures"));
  }
  auto getAllowlistForFeature()(string feature) {
    return Sequence!(string)(Object_Call_string__Handle(this.handle, "getAllowlistForFeature", feature));
  }
}


extern (C) Optional!(int) FeaturePolicyViolationReportBody_lineNumber_Get(Handle);
extern (C) Optional!(int) FeaturePolicyViolationReportBody_columnNumber_Get(Handle);