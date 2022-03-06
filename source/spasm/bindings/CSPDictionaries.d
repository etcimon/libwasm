module spasm.bindings.CSPDictionaries;

import spasm.types;
@safe:
nothrow:

struct CSP {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CSP(spasm_add__object());
  }
  void report_only()(bool report_only) {
    Object_Call_bool__void(this.handle, "report-only", report_only);
  }
  bool report_only()() {
    return Object_Getter__bool(this.handle, "report-only");
  }
  void default_src()(scope ref Sequence!(string) default_src) {
    Object_Call_Handle__void(this.handle, "default-src", default_src.handle);
  }
  auto default_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "default-src"));
  }
  void script_src()(scope ref Sequence!(string) script_src) {
    Object_Call_Handle__void(this.handle, "script-src", script_src.handle);
  }
  auto script_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "script-src"));
  }
  void object_src()(scope ref Sequence!(string) object_src) {
    Object_Call_Handle__void(this.handle, "object-src", object_src.handle);
  }
  auto object_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "object-src"));
  }
  void style_src()(scope ref Sequence!(string) style_src) {
    Object_Call_Handle__void(this.handle, "style-src", style_src.handle);
  }
  auto style_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "style-src"));
  }
  void img_src()(scope ref Sequence!(string) img_src) {
    Object_Call_Handle__void(this.handle, "img-src", img_src.handle);
  }
  auto img_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "img-src"));
  }
  void media_src()(scope ref Sequence!(string) media_src) {
    Object_Call_Handle__void(this.handle, "media-src", media_src.handle);
  }
  auto media_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "media-src"));
  }
  void frame_src()(scope ref Sequence!(string) frame_src) {
    Object_Call_Handle__void(this.handle, "frame-src", frame_src.handle);
  }
  auto frame_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "frame-src"));
  }
  void font_src()(scope ref Sequence!(string) font_src) {
    Object_Call_Handle__void(this.handle, "font-src", font_src.handle);
  }
  auto font_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "font-src"));
  }
  void connect_src()(scope ref Sequence!(string) connect_src) {
    Object_Call_Handle__void(this.handle, "connect-src", connect_src.handle);
  }
  auto connect_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "connect-src"));
  }
  void report_uri()(scope ref Sequence!(string) report_uri) {
    Object_Call_Handle__void(this.handle, "report-uri", report_uri.handle);
  }
  auto report_uri()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "report-uri"));
  }
  void frame_ancestors()(scope ref Sequence!(string) frame_ancestors) {
    Object_Call_Handle__void(this.handle, "frame-ancestors", frame_ancestors.handle);
  }
  auto frame_ancestors()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "frame-ancestors"));
  }
  void base_uri()(scope ref Sequence!(string) base_uri) {
    Object_Call_Handle__void(this.handle, "base-uri", base_uri.handle);
  }
  auto base_uri()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "base-uri"));
  }
  void form_action()(scope ref Sequence!(string) form_action) {
    Object_Call_Handle__void(this.handle, "form-action", form_action.handle);
  }
  auto form_action()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "form-action"));
  }
  void referrer()(scope ref Sequence!(string) referrer) {
    Object_Call_Handle__void(this.handle, "referrer", referrer.handle);
  }
  auto referrer()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "referrer"));
  }
  void manifest_src()(scope ref Sequence!(string) manifest_src) {
    Object_Call_Handle__void(this.handle, "manifest-src", manifest_src.handle);
  }
  auto manifest_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "manifest-src"));
  }
  void upgrade_insecure_requests()(scope ref Sequence!(string) upgrade_insecure_requests) {
    Object_Call_Handle__void(this.handle, "upgrade-insecure-requests", upgrade_insecure_requests.handle);
  }
  auto upgrade_insecure_requests()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "upgrade-insecure-requests"));
  }
  void child_src()(scope ref Sequence!(string) child_src) {
    Object_Call_Handle__void(this.handle, "child-src", child_src.handle);
  }
  auto child_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "child-src"));
  }
  void block_all_mixed_content()(scope ref Sequence!(string) block_all_mixed_content) {
    Object_Call_Handle__void(this.handle, "block-all-mixed-content", block_all_mixed_content.handle);
  }
  auto block_all_mixed_content()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "block-all-mixed-content"));
  }
  void require_sri_for()(scope ref Sequence!(string) require_sri_for) {
    Object_Call_Handle__void(this.handle, "require-sri-for", require_sri_for.handle);
  }
  auto require_sri_for()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "require-sri-for"));
  }
  void sandbox()(scope ref Sequence!(string) sandbox) {
    Object_Call_Handle__void(this.handle, "sandbox", sandbox.handle);
  }
  auto sandbox()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "sandbox"));
  }
  void worker_src()(scope ref Sequence!(string) worker_src) {
    Object_Call_Handle__void(this.handle, "worker-src", worker_src.handle);
  }
  auto worker_src()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "worker-src"));
  }
}
struct CSPPolicies {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CSPPolicies(spasm_add__object());
  }
  void csp_policies()(scope ref Sequence!(CSP) csp_policies) {
    Object_Call_Handle__void(this.handle, "csp-policies", csp_policies.handle);
  }
  auto csp_policies()() {
    return Sequence!(CSP)(Object_Getter__Handle(this.handle, "csp-policies"));
  }
}


