module spasm.bindings.LoadURIOptions;

import spasm.types;
@safe:
nothrow:

struct LoadURIOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return LoadURIOptions(spasm_add__object());
  }
  void triggeringPrincipal(T0)(scope auto ref Optional!(T0) triggeringPrincipal) if (isTOrPointer!(T0, Principal)) {
    LoadURIOptions_triggeringPrincipal_Set(this.handle, !triggeringPrincipal.empty, triggeringPrincipal.front.handle);
  }
  auto triggeringPrincipal()() {
    return Object_Getter__OptionalHandle(this.handle, "triggeringPrincipal");
  }
  void csp(T0)(scope auto ref Optional!(T0) csp) if (isTOrPointer!(T0, ContentSecurityPolicy)) {
    LoadURIOptions_csp_Set(this.handle, !csp.empty, csp.front.handle);
  }
  auto csp()() {
    return Object_Getter__OptionalHandle(this.handle, "csp");
  }
  void loadFlags()(int loadFlags) {
    Object_Call_int__void(this.handle, "loadFlags", loadFlags);
  }
  int loadFlags()() {
    return Object_Getter__int(this.handle, "loadFlags");
  }
  void referrerInfo(T0)(scope auto ref Optional!(T0) referrerInfo) if (isTOrPointer!(T0, ReferrerInfo)) {
    LoadURIOptions_referrerInfo_Set(this.handle, !referrerInfo.empty, referrerInfo.front.handle);
  }
  auto referrerInfo()() {
    return Object_Getter__OptionalHandle(this.handle, "referrerInfo");
  }
  void postData(T0)(scope auto ref Optional!(T0) postData) if (isTOrPointer!(T0, InputStream)) {
    LoadURIOptions_postData_Set(this.handle, !postData.empty, postData.front.handle);
  }
  auto postData()() {
    return Object_Getter__OptionalHandle(this.handle, "postData");
  }
  void headers(T0)(scope auto ref Optional!(T0) headers) if (isTOrPointer!(T0, InputStream)) {
    LoadURIOptions_headers_Set(this.handle, !headers.empty, headers.front.handle);
  }
  auto headers()() {
    return Object_Getter__OptionalHandle(this.handle, "headers");
  }
  void baseURI(T0)(scope auto ref Optional!(T0) baseURI) if (isTOrPointer!(T0, URI)) {
    LoadURIOptions_baseURI_Set(this.handle, !baseURI.empty, baseURI.front.handle);
  }
  auto baseURI()() {
    return Object_Getter__OptionalHandle(this.handle, "baseURI");
  }
}


extern (C) void LoadURIOptions_triggeringPrincipal_Set(Handle, bool, Handle);
extern (C) void LoadURIOptions_csp_Set(Handle, bool, Handle);
extern (C) void LoadURIOptions_referrerInfo_Set(Handle, bool, Handle);
extern (C) void LoadURIOptions_postData_Set(Handle, bool, Handle);
extern (C) void LoadURIOptions_headers_Set(Handle, bool, Handle);
extern (C) void LoadURIOptions_baseURI_Set(Handle, bool, Handle);