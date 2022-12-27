module libwasm.bindings.LoadURIOptions;

import libwasm.types;

import memutils.ct: tuple;
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
    return LoadURIOptions(libwasm_add__object());
  }
  void triggeringPrincipal(T0)(scope auto ref Optional!(T0) triggeringPrincipal) if (isTOrPointer!(T0, Principal)) {
    Serialize_Object_VarArgCall!void(this.handle, "triggeringPrincipal", "Optional!Handle", tuple(!triggeringPrincipal.empty, cast(Handle)triggeringPrincipal.front.handle));
  }
  auto triggeringPrincipal()() {
    return recastOpt!(Principal)(Object_Getter__OptionalHandle(this.handle, "triggeringPrincipal"));
  }
  void csp(T0)(scope auto ref Optional!(T0) csp) if (isTOrPointer!(T0, ContentSecurityPolicy)) {
    Serialize_Object_VarArgCall!void(this.handle, "csp", "Optional!Handle", tuple(!csp.empty, cast(Handle)csp.front.handle));
  }
  auto csp()() {
    return recastOpt!(ContentSecurityPolicy)(Object_Getter__OptionalHandle(this.handle, "csp"));
  }
  void loadFlags()(int loadFlags) {
    Object_Call_int__void(this.handle, "loadFlags", loadFlags);
  }
  int loadFlags()() {
    return Object_Getter__int(this.handle, "loadFlags");
  }
  void referrerInfo(T0)(scope auto ref Optional!(T0) referrerInfo) if (isTOrPointer!(T0, ReferrerInfo)) {
    Serialize_Object_VarArgCall!void(this.handle, "referrerInfo", "Optional!Handle", tuple(!referrerInfo.empty, cast(Handle)referrerInfo.front.handle));
  }
  auto referrerInfo()() {
    return recastOpt!(ReferrerInfo)(Object_Getter__OptionalHandle(this.handle, "referrerInfo"));
  }
  void postData(T0)(scope auto ref Optional!(T0) postData) if (isTOrPointer!(T0, InputStream)) {
    Serialize_Object_VarArgCall!void(this.handle, "postData", "Optional!Handle", tuple(!postData.empty, cast(Handle)postData.front.handle));
  }
  auto postData()() {
    return recastOpt!(InputStream)(Object_Getter__OptionalHandle(this.handle, "postData"));
  }
  void headers(T0)(scope auto ref Optional!(T0) headers) if (isTOrPointer!(T0, InputStream)) {
    Serialize_Object_VarArgCall!void(this.handle, "headers", "Optional!Handle", tuple(!headers.empty, cast(Handle)headers.front.handle));
  }
  auto headers()() {
    return recastOpt!(InputStream)(Object_Getter__OptionalHandle(this.handle, "headers"));
  }
  void baseURI(T0)(scope auto ref Optional!(T0) baseURI) if (isTOrPointer!(T0, URI)) {
    Serialize_Object_VarArgCall!void(this.handle, "baseURI", "Optional!Handle", tuple(!baseURI.empty, cast(Handle)baseURI.front.handle));
  }
  auto baseURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this.handle, "baseURI"));
  }
}


