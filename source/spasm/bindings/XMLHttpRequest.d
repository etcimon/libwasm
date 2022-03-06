module spasm.bindings.XMLHttpRequest;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.EventHandler;
import spasm.bindings.Fetch;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.XMLHttpRequestEventTarget;
import spasm.bindings.XMLHttpRequestUpload;

@safe:
nothrow:

struct MozXMLHttpRequestParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MozXMLHttpRequestParameters(spasm_add__object());
  }
  void mozAnon()(bool mozAnon) {
    Object_Call_bool__void(this.handle, "mozAnon", mozAnon);
  }
  bool mozAnon()() {
    return Object_Getter__bool(this.handle, "mozAnon");
  }
  void mozSystem()(bool mozSystem) {
    Object_Call_bool__void(this.handle, "mozSystem", mozSystem);
  }
  bool mozSystem()() {
    return Object_Getter__bool(this.handle, "mozSystem");
  }
}
struct XMLHttpRequest {
  nothrow:
  spasm.bindings.XMLHttpRequestEventTarget.XMLHttpRequestEventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .XMLHttpRequestEventTarget(h);
  }
  void onreadystatechange(T0)(scope auto ref Optional!(T0) onreadystatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onreadystatechange", !onreadystatechange.empty, onreadystatechange.front);
  }
  EventHandler onreadystatechange()() {
    return Object_Getter__EventHandler(this._parent, "onreadystatechange");
  }
  enum ushort UNSENT = 0;
  enum ushort OPENED = 1;
  enum ushort HEADERS_RECEIVED = 2;
  enum ushort LOADING = 3;
  enum ushort DONE = 4;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  void open()(string method, string url) {
    Object_Call_string_string__void(this._parent, "open", method, url);
  }
  void open(T3, T4)(string method, string url, bool async, scope auto ref Optional!(T3) user /* = no!(string) */, scope auto ref Optional!(T4) password /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string)) {
    XMLHttpRequest_open__string_string_bool_optional_string_optional_string(this._parent, method, url, async, !user.empty, user.front, !password.empty, password.front);
  }
  void open(T3)(string method, string url, bool async, scope auto ref Optional!(T3) user /* = no!(string) */) if (isTOrPointer!(T3, string)) {
    XMLHttpRequest_open_0(this._parent, method, url, async, !user.empty, user.front);
  }
  void open()(string method, string url, bool async) {
    XMLHttpRequest_open_1(this._parent, method, url, async);
  }
  void setRequestHeader()(string header, string value) {
    Object_Call_string_string__void(this._parent, "setRequestHeader", header, value);
  }
  void timeout()(uint timeout) {
    Object_Call_uint__void(this._parent, "timeout", timeout);
  }
  uint timeout()() {
    return Object_Getter__uint(this._parent, "timeout");
  }
  void withCredentials()(bool withCredentials) {
    Object_Call_bool__void(this._parent, "withCredentials", withCredentials);
  }
  bool withCredentials()() {
    return Object_Getter__bool(this._parent, "withCredentials");
  }
  auto upload()() {
    return XMLHttpRequestUpload(Object_Getter__Handle(this._parent, "upload"));
  }
  void send(T0)(scope auto ref Optional!(T0) body_ /* = no!(SumType!(Document, BodyInit)) */) if (isTOrPointer!(T0, SumType!(Document, BodyInit))) {
    XMLHttpRequest_send(this._parent, !body_.empty, *body_.frontRef);
  }
  void send()() {
    Object_Call__void(this._parent, "send");
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  string responseURL()() {
    return Object_Getter__string(this._parent, "responseURL");
  }
  ushort status()() {
    return Object_Getter__ushort(this._parent, "status");
  }
  string statusText()() {
    return Object_Getter__string(this._parent, "statusText");
  }
  Optional!(string) getResponseHeader()(string header) {
    return Object_Call_string__OptionalString(this._parent, "getResponseHeader", header);
  }
  string getAllResponseHeaders()() {
    return Object_Getter__string(this._parent, "getAllResponseHeaders");
  }
  void overrideMimeType()(string mime) {
    Object_Call_string__void(this._parent, "overrideMimeType", mime);
  }
  void responseType()(XMLHttpRequestResponseType responseType) {
    XMLHttpRequest_responseType_Set(this._parent, responseType);
  }
  XMLHttpRequestResponseType responseType()() {
    return XMLHttpRequest_responseType_Get(this._parent);
  }
  auto response()() {
    return Any(Object_Getter__Handle(this._parent, "response"));
  }
  Optional!(string) responseText()() {
    return Object_Getter__OptionalString(this._parent, "responseText");
  }
  auto responseXML()() {
    return Object_Getter__OptionalHandle(this._parent, "responseXML");
  }
  void mozBackgroundRequest()(bool mozBackgroundRequest) {
    Object_Call_bool__void(this._parent, "mozBackgroundRequest", mozBackgroundRequest);
  }
  bool mozBackgroundRequest()() {
    return Object_Getter__bool(this._parent, "mozBackgroundRequest");
  }
  auto channel()() {
    return Object_Getter__OptionalHandle(this._parent, "channel");
  }
  auto getInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = Any(Object_Call_Handle__Handle(this._parent, "getInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
  void setOriginAttributes()(scope ref OriginAttributesDictionary originAttributes) {
    Object_Call_Handle__void(this._parent, "setOriginAttributes", originAttributes.handle);
  }
  void setOriginAttributes()() {
    Object_Call__void(this._parent, "setOriginAttributes");
  }
  void sendInputStream()(scope ref InputStream body_) {
    Object_Call_Handle__void(this._parent, "sendInputStream", body_.handle);
  }
  ushort errorCode()() {
    return Object_Getter__ushort(this._parent, "errorCode");
  }
  bool mozAnon()() {
    return Object_Getter__bool(this._parent, "mozAnon");
  }
  bool mozSystem()() {
    return Object_Getter__bool(this._parent, "mozSystem");
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}
enum XMLHttpRequestResponseType {
  none,
  arraybuffer,
  blob,
  document,
  json,
  text,
  moz_chunked_arraybuffer
}


extern (C) void XMLHttpRequest_open__string_string_bool_optional_string_optional_string(Handle, string, string, bool, bool, string, bool, string);
extern (C) void XMLHttpRequest_open_0(Handle, string, string, bool, bool, string);
extern (C) void XMLHttpRequest_open_1(Handle, string, string, bool);
extern (C) void XMLHttpRequest_send(Handle, bool, scope ref SumType!(Document, BodyInit));
extern (C) void XMLHttpRequest_responseType_Set(Handle, XMLHttpRequestResponseType);
extern (C) XMLHttpRequestResponseType XMLHttpRequest_responseType_Get(Handle);