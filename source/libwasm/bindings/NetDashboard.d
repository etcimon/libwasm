module libwasm.bindings.NetDashboard;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct ConnStatusDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConnStatusDict(libwasm_add__object());
  }
  void status()(string status) {
    Object_Call_string__void(this.handle, "status", status);
  }
  string status()() {
    return Object_Getter__string(this.handle, "status");
  }
}
struct DNSCacheDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DNSCacheDict(libwasm_add__object());
  }
  void entries()(scope ref Sequence!(DnsCacheEntry) entries) {
    Object_Call_Handle__void(this.handle, "entries", entries.handle);
  }
  auto entries()() {
    return Sequence!(DnsCacheEntry)(Object_Getter__Handle(this.handle, "entries"));
  }
}
struct DNSLookupDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DNSLookupDict(libwasm_add__object());
  }
  void address()(scope ref Sequence!(string) address) {
    Object_Call_Handle__void(this.handle, "address", address.handle);
  }
  auto address()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "address"));
  }
  void error()(string error) {
    Object_Call_string__void(this.handle, "error", error);
  }
  string error()() {
    return Object_Getter__string(this.handle, "error");
  }
  void answer()(bool answer) {
    Object_Call_bool__void(this.handle, "answer", answer);
  }
  bool answer()() {
    return Object_Getter__bool(this.handle, "answer");
  }
}
struct DnsCacheEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DnsCacheEntry(libwasm_add__object());
  }
  void hostname()(string hostname) {
    Object_Call_string__void(this.handle, "hostname", hostname);
  }
  string hostname()() {
    return Object_Getter__string(this.handle, "hostname");
  }
  void hostaddr()(scope ref Sequence!(string) hostaddr) {
    Object_Call_Handle__void(this.handle, "hostaddr", hostaddr.handle);
  }
  auto hostaddr()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "hostaddr"));
  }
  void family()(string family) {
    Object_Call_string__void(this.handle, "family", family);
  }
  string family()() {
    return Object_Getter__string(this.handle, "family");
  }
  void expiration()(double expiration) {
    Object_Call_double__void(this.handle, "expiration", expiration);
  }
  double expiration()() {
    return Object_Getter__double(this.handle, "expiration");
  }
  void trr()(bool trr) {
    Object_Call_bool__void(this.handle, "trr", trr);
  }
  bool trr()() {
    return Object_Getter__bool(this.handle, "trr");
  }
}
struct HalfOpenInfoDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return HalfOpenInfoDict(libwasm_add__object());
  }
  void speculative()(bool speculative) {
    Object_Call_bool__void(this.handle, "speculative", speculative);
  }
  bool speculative()() {
    return Object_Getter__bool(this.handle, "speculative");
  }
}
struct HttpConnDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return HttpConnDict(libwasm_add__object());
  }
  void connections()(scope ref Sequence!(HttpConnectionElement) connections) {
    Object_Call_Handle__void(this.handle, "connections", connections.handle);
  }
  auto connections()() {
    return Sequence!(HttpConnectionElement)(Object_Getter__Handle(this.handle, "connections"));
  }
}
struct HttpConnInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return HttpConnInfo(libwasm_add__object());
  }
  void rtt()(uint rtt) {
    Object_Call_uint__void(this.handle, "rtt", rtt);
  }
  uint rtt()() {
    return Object_Getter__uint(this.handle, "rtt");
  }
  void ttl()(uint ttl) {
    Object_Call_uint__void(this.handle, "ttl", ttl);
  }
  uint ttl()() {
    return Object_Getter__uint(this.handle, "ttl");
  }
  void protocolVersion()(string protocolVersion) {
    Object_Call_string__void(this.handle, "protocolVersion", protocolVersion);
  }
  string protocolVersion()() {
    return Object_Getter__string(this.handle, "protocolVersion");
  }
}
struct HttpConnectionElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return HttpConnectionElement(libwasm_add__object());
  }
  void host()(string host) {
    Object_Call_string__void(this.handle, "host", host);
  }
  string host()() {
    return Object_Getter__string(this.handle, "host");
  }
  void port()(uint port) {
    Object_Call_uint__void(this.handle, "port", port);
  }
  uint port()() {
    return Object_Getter__uint(this.handle, "port");
  }
  void spdy()(bool spdy) {
    Object_Call_bool__void(this.handle, "spdy", spdy);
  }
  bool spdy()() {
    return Object_Getter__bool(this.handle, "spdy");
  }
  void ssl()(bool ssl) {
    Object_Call_bool__void(this.handle, "ssl", ssl);
  }
  bool ssl()() {
    return Object_Getter__bool(this.handle, "ssl");
  }
  void active()(scope ref Sequence!(HttpConnInfo) active) {
    Object_Call_Handle__void(this.handle, "active", active.handle);
  }
  auto active()() {
    return Sequence!(HttpConnInfo)(Object_Getter__Handle(this.handle, "active"));
  }
  void idle()(scope ref Sequence!(HttpConnInfo) idle) {
    Object_Call_Handle__void(this.handle, "idle", idle.handle);
  }
  auto idle()() {
    return Sequence!(HttpConnInfo)(Object_Getter__Handle(this.handle, "idle"));
  }
  void halfOpens()(scope ref Sequence!(HalfOpenInfoDict) halfOpens) {
    Object_Call_Handle__void(this.handle, "halfOpens", halfOpens.handle);
  }
  auto halfOpens()() {
    return Sequence!(HalfOpenInfoDict)(Object_Getter__Handle(this.handle, "halfOpens"));
  }
}
struct RcwnPerfStats {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RcwnPerfStats(libwasm_add__object());
  }
  void avgShort()(uint avgShort) {
    Object_Call_uint__void(this.handle, "avgShort", avgShort);
  }
  uint avgShort()() {
    return Object_Getter__uint(this.handle, "avgShort");
  }
  void avgLong()(uint avgLong) {
    Object_Call_uint__void(this.handle, "avgLong", avgLong);
  }
  uint avgLong()() {
    return Object_Getter__uint(this.handle, "avgLong");
  }
  void stddevLong()(uint stddevLong) {
    Object_Call_uint__void(this.handle, "stddevLong", stddevLong);
  }
  uint stddevLong()() {
    return Object_Getter__uint(this.handle, "stddevLong");
  }
}
struct RcwnStatus {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RcwnStatus(libwasm_add__object());
  }
  void totalNetworkRequests()(uint totalNetworkRequests) {
    Object_Call_uint__void(this.handle, "totalNetworkRequests", totalNetworkRequests);
  }
  uint totalNetworkRequests()() {
    return Object_Getter__uint(this.handle, "totalNetworkRequests");
  }
  void rcwnCacheWonCount()(uint rcwnCacheWonCount) {
    Object_Call_uint__void(this.handle, "rcwnCacheWonCount", rcwnCacheWonCount);
  }
  uint rcwnCacheWonCount()() {
    return Object_Getter__uint(this.handle, "rcwnCacheWonCount");
  }
  void rcwnNetWonCount()(uint rcwnNetWonCount) {
    Object_Call_uint__void(this.handle, "rcwnNetWonCount", rcwnNetWonCount);
  }
  uint rcwnNetWonCount()() {
    return Object_Getter__uint(this.handle, "rcwnNetWonCount");
  }
  void cacheSlowCount()(uint cacheSlowCount) {
    Object_Call_uint__void(this.handle, "cacheSlowCount", cacheSlowCount);
  }
  uint cacheSlowCount()() {
    return Object_Getter__uint(this.handle, "cacheSlowCount");
  }
  void cacheNotSlowCount()(uint cacheNotSlowCount) {
    Object_Call_uint__void(this.handle, "cacheNotSlowCount", cacheNotSlowCount);
  }
  uint cacheNotSlowCount()() {
    return Object_Getter__uint(this.handle, "cacheNotSlowCount");
  }
  void perfStats()(scope ref Sequence!(RcwnPerfStats) perfStats) {
    Object_Call_Handle__void(this.handle, "perfStats", perfStats.handle);
  }
  auto perfStats()() {
    return Sequence!(RcwnPerfStats)(Object_Getter__Handle(this.handle, "perfStats"));
  }
}
struct SocketElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return SocketElement(libwasm_add__object());
  }
  void host()(string host) {
    Object_Call_string__void(this.handle, "host", host);
  }
  string host()() {
    return Object_Getter__string(this.handle, "host");
  }
  void port()(uint port) {
    Object_Call_uint__void(this.handle, "port", port);
  }
  uint port()() {
    return Object_Getter__uint(this.handle, "port");
  }
  void active()(bool active) {
    Object_Call_bool__void(this.handle, "active", active);
  }
  bool active()() {
    return Object_Getter__bool(this.handle, "active");
  }
  void tcp()(bool tcp) {
    Object_Call_bool__void(this.handle, "tcp", tcp);
  }
  bool tcp()() {
    return Object_Getter__bool(this.handle, "tcp");
  }
  void sent()(double sent) {
    Object_Call_double__void(this.handle, "sent", sent);
  }
  double sent()() {
    return Object_Getter__double(this.handle, "sent");
  }
  void received()(double received) {
    Object_Call_double__void(this.handle, "received", received);
  }
  double received()() {
    return Object_Getter__double(this.handle, "received");
  }
}
struct SocketsDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return SocketsDict(libwasm_add__object());
  }
  void sockets()(scope ref Sequence!(SocketElement) sockets) {
    Object_Call_Handle__void(this.handle, "sockets", sockets.handle);
  }
  auto sockets()() {
    return Sequence!(SocketElement)(Object_Getter__Handle(this.handle, "sockets"));
  }
  void sent()(double sent) {
    Object_Call_double__void(this.handle, "sent", sent);
  }
  double sent()() {
    return Object_Getter__double(this.handle, "sent");
  }
  void received()(double received) {
    Object_Call_double__void(this.handle, "received", received);
  }
  double received()() {
    return Object_Getter__double(this.handle, "received");
  }
}
struct WebSocketDict {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebSocketDict(libwasm_add__object());
  }
  void websockets()(scope ref Sequence!(WebSocketElement) websockets) {
    Object_Call_Handle__void(this.handle, "websockets", websockets.handle);
  }
  auto websockets()() {
    return Sequence!(WebSocketElement)(Object_Getter__Handle(this.handle, "websockets"));
  }
}
struct WebSocketElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebSocketElement(libwasm_add__object());
  }
  void hostport()(string hostport) {
    Object_Call_string__void(this.handle, "hostport", hostport);
  }
  string hostport()() {
    return Object_Getter__string(this.handle, "hostport");
  }
  void msgsent()(uint msgsent) {
    Object_Call_uint__void(this.handle, "msgsent", msgsent);
  }
  uint msgsent()() {
    return Object_Getter__uint(this.handle, "msgsent");
  }
  void msgreceived()(uint msgreceived) {
    Object_Call_uint__void(this.handle, "msgreceived", msgreceived);
  }
  uint msgreceived()() {
    return Object_Getter__uint(this.handle, "msgreceived");
  }
  void sentsize()(double sentsize) {
    Object_Call_double__void(this.handle, "sentsize", sentsize);
  }
  double sentsize()() {
    return Object_Getter__double(this.handle, "sentsize");
  }
  void receivedsize()(double receivedsize) {
    Object_Call_double__void(this.handle, "receivedsize", receivedsize);
  }
  double receivedsize()() {
    return Object_Getter__double(this.handle, "receivedsize");
  }
  void encrypted()(bool encrypted) {
    Object_Call_bool__void(this.handle, "encrypted", encrypted);
  }
  bool encrypted()() {
    return Object_Getter__bool(this.handle, "encrypted");
  }
}


