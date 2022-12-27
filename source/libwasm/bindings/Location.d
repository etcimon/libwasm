module libwasm.bindings.Location;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct Location {
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
  void hash()(string hash) {
    Object_Call_string__void(this.handle, "hash", hash);
  }
  string hash()() {
    return Object_Getter__string(this.handle, "hash");
  }
  void assign()(string url) {
    Object_Call_string__void(this.handle, "assign", url);
  }
  void replace()(string url) {
    Object_Call_string__void(this.handle, "replace", url);
  }
  void reload()(bool forceget /* = false */) {
    Object_Call_bool__void(this.handle, "reload", forceget);
  }
  void reload()() {
    Object_Call__void(this.handle, "reload");
  }
}


