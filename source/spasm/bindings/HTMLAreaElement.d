module spasm.bindings.HTMLAreaElement;

import spasm.types;
import spasm.bindings.DOMTokenList;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLHyperlinkElementUtils;

@safe:
nothrow:

struct HTMLAreaElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void alt()(string alt) {
    Object_Call_string__void(this._parent, "alt", alt);
  }
  string alt()() {
    return Object_Getter__string(this._parent, "alt");
  }
  void coords()(string coords) {
    Object_Call_string__void(this._parent, "coords", coords);
  }
  string coords()() {
    return Object_Getter__string(this._parent, "coords");
  }
  void shape()(string shape) {
    Object_Call_string__void(this._parent, "shape", shape);
  }
  string shape()() {
    return Object_Getter__string(this._parent, "shape");
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
  void noHref()(bool noHref) {
    Object_Call_bool__void(this._parent, "noHref", noHref);
  }
  bool noHref()() {
    return Object_Getter__bool(this._parent, "noHref");
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


