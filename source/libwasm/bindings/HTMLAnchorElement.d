module libwasm.bindings.HTMLAnchorElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMTokenList;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLHyperlinkElementUtils;

@safe:
nothrow:

struct HTMLAnchorElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void target()(string target) {
    Object_Call_string__void(this._parent, "target", target);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
  void download()(string download) {
    Object_Call_string__void(this._parent, "download", download);
  }
  string download()() {
    return Object_Getter__string(this._parent, "download");
  }
  void ping()(string ping) {
    Object_Call_string__void(this._parent, "ping", ping);
  }
  string ping()() {
    return Object_Getter__string(this._parent, "ping");
  }
  void rel()(string rel) {
    Object_Call_string__void(this._parent, "rel", rel);
  }
  string rel()() {
    return Object_Getter__string(this._parent, "rel");
  }
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  auto relList()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "relList"));
  }
  void hreflang()(string hreflang) {
    Object_Call_string__void(this._parent, "hreflang", hreflang);
  }
  string hreflang()() {
    return Object_Getter__string(this._parent, "hreflang");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  void coords()(string coords) {
    Object_Call_string__void(this._parent, "coords", coords);
  }
  string coords()() {
    return Object_Getter__string(this._parent, "coords");
  }
  void charset()(string charset) {
    Object_Call_string__void(this._parent, "charset", charset);
  }
  string charset()() {
    return Object_Getter__string(this._parent, "charset");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void rev()(string rev) {
    Object_Call_string__void(this._parent, "rev", rev);
  }
  string rev()() {
    return Object_Getter__string(this._parent, "rev");
  }
  void shape()(string shape) {
    Object_Call_string__void(this._parent, "shape", shape);
  }
  string shape()() {
    return Object_Getter__string(this._parent, "shape");
  }
  void href()(string href) {
    Object_Call_string__void(this._parent, "href", href);
  }
  string href()() {
    return Object_Getter__string(this._parent, "href");
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this._parent, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this._parent, "protocol");
  }
  void username()(string username) {
    Object_Call_string__void(this._parent, "username", username);
  }
  string username()() {
    return Object_Getter__string(this._parent, "username");
  }
  void password()(string password) {
    Object_Call_string__void(this._parent, "password", password);
  }
  string password()() {
    return Object_Getter__string(this._parent, "password");
  }
  void host()(string host) {
    Object_Call_string__void(this._parent, "host", host);
  }
  string host()() {
    return Object_Getter__string(this._parent, "host");
  }
  void hostname()(string hostname) {
    Object_Call_string__void(this._parent, "hostname", hostname);
  }
  string hostname()() {
    return Object_Getter__string(this._parent, "hostname");
  }
  void port()(string port) {
    Object_Call_string__void(this._parent, "port", port);
  }
  string port()() {
    return Object_Getter__string(this._parent, "port");
  }
  void pathname()(string pathname) {
    Object_Call_string__void(this._parent, "pathname", pathname);
  }
  string pathname()() {
    return Object_Getter__string(this._parent, "pathname");
  }
  void search()(string search) {
    Object_Call_string__void(this._parent, "search", search);
  }
  string search()() {
    return Object_Getter__string(this._parent, "search");
  }
  void hash()(string hash) {
    Object_Call_string__void(this._parent, "hash", hash);
  }
  string hash()() {
    return Object_Getter__string(this._parent, "hash");
  }
}


