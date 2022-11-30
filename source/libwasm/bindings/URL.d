module libwasm.bindings.URL;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.MediaSource;
import libwasm.bindings.URLSearchParams;

@safe:
nothrow:

struct URL {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void href()(string href) {
    Object_Call_string__void(this.handle, "href", href);
  }
  string href()() {
    return Object_Getter__string(this.handle, "href");
  }
  string origin()() {
    return Object_Getter__string(this.handle, "origin");
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this.handle, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this.handle, "protocol");
  }
  void username()(string username) {
    Object_Call_string__void(this.handle, "username", username);
  }
  string username()() {
    return Object_Getter__string(this.handle, "username");
  }
  void password()(string password) {
    Object_Call_string__void(this.handle, "password", password);
  }
  string password()() {
    return Object_Getter__string(this.handle, "password");
  }
  void host()(string host) {
    Object_Call_string__void(this.handle, "host", host);
  }
  string host()() {
    return Object_Getter__string(this.handle, "host");
  }
  void hostname()(string hostname) {
    Object_Call_string__void(this.handle, "hostname", hostname);
  }
  string hostname()() {
    return Object_Getter__string(this.handle, "hostname");
  }
  void port()(string port) {
    Object_Call_string__void(this.handle, "port", port);
  }
  string port()() {
    return Object_Getter__string(this.handle, "port");
  }
  void pathname()(string pathname) {
    Object_Call_string__void(this.handle, "pathname", pathname);
  }
  string pathname()() {
    return Object_Getter__string(this.handle, "pathname");
  }
  void search()(string search) {
    Object_Call_string__void(this.handle, "search", search);
  }
  string search()() {
    return Object_Getter__string(this.handle, "search");
  }
  auto searchParams()() {
    return URLSearchParams(Object_Getter__Handle(this.handle, "searchParams"));
  }
  void hash()(string hash) {
    Object_Call_string__void(this.handle, "hash", hash);
  }
  string hash()() {
    return Object_Getter__string(this.handle, "hash");
  }
  string toJSON()() {
    return Object_Getter__string(this.handle, "toJSON");
  }
  string createObjectURL()(scope ref Blob blob) {
    return Serialize_Object_VarArgCall!string(this.handle, "createObjectURL", "Handle", tuple(cast(Handle)blob.handle));
  }
  void revokeObjectURL()(string url) {
    Object_Call_string__void(this.handle, "revokeObjectURL", url);
  }
  bool isValidURL()(string url) {
    return Object_Call_string__bool(this.handle, "isValidURL", url);
  }
  string createObjectURL()(scope ref MediaSource source) {
    return Serialize_Object_VarArgCall!string(this.handle, "createObjectURL", "Handle", tuple(cast(Handle)source._parent));
  }
}


