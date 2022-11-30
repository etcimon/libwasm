module libwasm.bindings.NetworkOptions;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct NetworkCommandOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NetworkCommandOptions(libwasm_add__object());
  }
  void id()(int id) {
    Object_Call_int__void(this.handle, "id", id);
  }
  int id()() {
    return Object_Getter__int(this.handle, "id");
  }
  void cmd()(string cmd) {
    Object_Call_string__void(this.handle, "cmd", cmd);
  }
  string cmd()() {
    return Object_Getter__string(this.handle, "cmd");
  }
  void ifname()(string ifname) {
    Object_Call_string__void(this.handle, "ifname", ifname);
  }
  string ifname()() {
    return Object_Getter__string(this.handle, "ifname");
  }
  void ip()(string ip) {
    Object_Call_string__void(this.handle, "ip", ip);
  }
  string ip()() {
    return Object_Getter__string(this.handle, "ip");
  }
  void prefixLength()(uint prefixLength) {
    Object_Call_uint__void(this.handle, "prefixLength", prefixLength);
  }
  uint prefixLength()() {
    return Object_Getter__uint(this.handle, "prefixLength");
  }
  void domain()(string domain) {
    Object_Call_string__void(this.handle, "domain", domain);
  }
  string domain()() {
    return Object_Getter__string(this.handle, "domain");
  }
  void dnses()(scope ref Sequence!(string) dnses) {
    Object_Call_Handle__void(this.handle, "dnses", dnses.handle);
  }
  auto dnses()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "dnses"));
  }
  void gateway()(string gateway) {
    Object_Call_string__void(this.handle, "gateway", gateway);
  }
  string gateway()() {
    return Object_Getter__string(this.handle, "gateway");
  }
  void gateways()(scope ref Sequence!(string) gateways) {
    Object_Call_Handle__void(this.handle, "gateways", gateways.handle);
  }
  auto gateways()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "gateways"));
  }
  void mode()(string mode) {
    Object_Call_string__void(this.handle, "mode", mode);
  }
  string mode()() {
    return Object_Getter__string(this.handle, "mode");
  }
  void report()(bool report) {
    Object_Call_bool__void(this.handle, "report", report);
  }
  bool report()() {
    return Object_Getter__bool(this.handle, "report");
  }
  void enabled()(bool enabled) {
    Object_Call_bool__void(this.handle, "enabled", enabled);
  }
  bool enabled()() {
    return Object_Getter__bool(this.handle, "enabled");
  }
  void wifictrlinterfacename()(string wifictrlinterfacename) {
    Object_Call_string__void(this.handle, "wifictrlinterfacename", wifictrlinterfacename);
  }
  string wifictrlinterfacename()() {
    return Object_Getter__string(this.handle, "wifictrlinterfacename");
  }
  void internalIfname()(string internalIfname) {
    Object_Call_string__void(this.handle, "internalIfname", internalIfname);
  }
  string internalIfname()() {
    return Object_Getter__string(this.handle, "internalIfname");
  }
  void externalIfname()(string externalIfname) {
    Object_Call_string__void(this.handle, "externalIfname", externalIfname);
  }
  string externalIfname()() {
    return Object_Getter__string(this.handle, "externalIfname");
  }
  void enable()(bool enable) {
    Object_Call_bool__void(this.handle, "enable", enable);
  }
  bool enable()() {
    return Object_Getter__bool(this.handle, "enable");
  }
  void ssid()(string ssid) {
    Object_Call_string__void(this.handle, "ssid", ssid);
  }
  string ssid()() {
    return Object_Getter__string(this.handle, "ssid");
  }
  void security()(string security) {
    Object_Call_string__void(this.handle, "security", security);
  }
  string security()() {
    return Object_Getter__string(this.handle, "security");
  }
  void key()(string key) {
    Object_Call_string__void(this.handle, "key", key);
  }
  string key()() {
    return Object_Getter__string(this.handle, "key");
  }
  void prefix()(string prefix) {
    Object_Call_string__void(this.handle, "prefix", prefix);
  }
  string prefix()() {
    return Object_Getter__string(this.handle, "prefix");
  }
  void link()(string link) {
    Object_Call_string__void(this.handle, "link", link);
  }
  string link()() {
    return Object_Getter__string(this.handle, "link");
  }
  void interfaceList()(scope ref Sequence!(string) interfaceList) {
    Object_Call_Handle__void(this.handle, "interfaceList", interfaceList.handle);
  }
  auto interfaceList()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "interfaceList"));
  }
  void wifiStartIp()(string wifiStartIp) {
    Object_Call_string__void(this.handle, "wifiStartIp", wifiStartIp);
  }
  string wifiStartIp()() {
    return Object_Getter__string(this.handle, "wifiStartIp");
  }
  void wifiEndIp()(string wifiEndIp) {
    Object_Call_string__void(this.handle, "wifiEndIp", wifiEndIp);
  }
  string wifiEndIp()() {
    return Object_Getter__string(this.handle, "wifiEndIp");
  }
  void usbStartIp()(string usbStartIp) {
    Object_Call_string__void(this.handle, "usbStartIp", usbStartIp);
  }
  string usbStartIp()() {
    return Object_Getter__string(this.handle, "usbStartIp");
  }
  void usbEndIp()(string usbEndIp) {
    Object_Call_string__void(this.handle, "usbEndIp", usbEndIp);
  }
  string usbEndIp()() {
    return Object_Getter__string(this.handle, "usbEndIp");
  }
  void dns1()(string dns1) {
    Object_Call_string__void(this.handle, "dns1", dns1);
  }
  string dns1()() {
    return Object_Getter__string(this.handle, "dns1");
  }
  void dns2()(string dns2) {
    Object_Call_string__void(this.handle, "dns2", dns2);
  }
  string dns2()() {
    return Object_Getter__string(this.handle, "dns2");
  }
  void threshold()(int threshold) {
    Object_Call_int__void(this.handle, "threshold", threshold);
  }
  int threshold()() {
    return Object_Getter__int(this.handle, "threshold");
  }
  void startIp()(string startIp) {
    Object_Call_string__void(this.handle, "startIp", startIp);
  }
  string startIp()() {
    return Object_Getter__string(this.handle, "startIp");
  }
  void endIp()(string endIp) {
    Object_Call_string__void(this.handle, "endIp", endIp);
  }
  string endIp()() {
    return Object_Getter__string(this.handle, "endIp");
  }
  void serverIp()(string serverIp) {
    Object_Call_string__void(this.handle, "serverIp", serverIp);
  }
  string serverIp()() {
    return Object_Getter__string(this.handle, "serverIp");
  }
  void maskLength()(string maskLength) {
    Object_Call_string__void(this.handle, "maskLength", maskLength);
  }
  string maskLength()() {
    return Object_Getter__string(this.handle, "maskLength");
  }
  void preInternalIfname()(string preInternalIfname) {
    Object_Call_string__void(this.handle, "preInternalIfname", preInternalIfname);
  }
  string preInternalIfname()() {
    return Object_Getter__string(this.handle, "preInternalIfname");
  }
  void preExternalIfname()(string preExternalIfname) {
    Object_Call_string__void(this.handle, "preExternalIfname", preExternalIfname);
  }
  string preExternalIfname()() {
    return Object_Getter__string(this.handle, "preExternalIfname");
  }
  void curInternalIfname()(string curInternalIfname) {
    Object_Call_string__void(this.handle, "curInternalIfname", curInternalIfname);
  }
  string curInternalIfname()() {
    return Object_Getter__string(this.handle, "curInternalIfname");
  }
  void curExternalIfname()(string curExternalIfname) {
    Object_Call_string__void(this.handle, "curExternalIfname", curExternalIfname);
  }
  string curExternalIfname()() {
    return Object_Getter__string(this.handle, "curExternalIfname");
  }
  void ipaddr()(int ipaddr) {
    Object_Call_int__void(this.handle, "ipaddr", ipaddr);
  }
  int ipaddr()() {
    return Object_Getter__int(this.handle, "ipaddr");
  }
  void mask()(int mask) {
    Object_Call_int__void(this.handle, "mask", mask);
  }
  int mask()() {
    return Object_Getter__int(this.handle, "mask");
  }
  void gateway_long()(int gateway_long) {
    Object_Call_int__void(this.handle, "gateway_long", gateway_long);
  }
  int gateway_long()() {
    return Object_Getter__int(this.handle, "gateway_long");
  }
  void dns1_long()(int dns1_long) {
    Object_Call_int__void(this.handle, "dns1_long", dns1_long);
  }
  int dns1_long()() {
    return Object_Getter__int(this.handle, "dns1_long");
  }
  void dns2_long()(int dns2_long) {
    Object_Call_int__void(this.handle, "dns2_long", dns2_long);
  }
  int dns2_long()() {
    return Object_Getter__int(this.handle, "dns2_long");
  }
  void mtu()(int mtu) {
    Object_Call_int__void(this.handle, "mtu", mtu);
  }
  int mtu()() {
    return Object_Getter__int(this.handle, "mtu");
  }
}
struct NetworkResultOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NetworkResultOptions(libwasm_add__object());
  }
  void id()(int id) {
    Object_Call_int__void(this.handle, "id", id);
  }
  int id()() {
    return Object_Getter__int(this.handle, "id");
  }
  void ret()(bool ret) {
    Object_Call_bool__void(this.handle, "ret", ret);
  }
  bool ret()() {
    return Object_Getter__bool(this.handle, "ret");
  }
  void broadcast()(bool broadcast) {
    Object_Call_bool__void(this.handle, "broadcast", broadcast);
  }
  bool broadcast()() {
    return Object_Getter__bool(this.handle, "broadcast");
  }
  void topic()(string topic) {
    Object_Call_string__void(this.handle, "topic", topic);
  }
  string topic()() {
    return Object_Getter__string(this.handle, "topic");
  }
  void reason()(string reason) {
    Object_Call_string__void(this.handle, "reason", reason);
  }
  string reason()() {
    return Object_Getter__string(this.handle, "reason");
  }
  void resultCode()(int resultCode) {
    Object_Call_int__void(this.handle, "resultCode", resultCode);
  }
  int resultCode()() {
    return Object_Getter__int(this.handle, "resultCode");
  }
  void resultReason()(string resultReason) {
    Object_Call_string__void(this.handle, "resultReason", resultReason);
  }
  string resultReason()() {
    return Object_Getter__string(this.handle, "resultReason");
  }
  void error()(bool error) {
    Object_Call_bool__void(this.handle, "error", error);
  }
  bool error()() {
    return Object_Getter__bool(this.handle, "error");
  }
  void enable()(bool enable) {
    Object_Call_bool__void(this.handle, "enable", enable);
  }
  bool enable()() {
    return Object_Getter__bool(this.handle, "enable");
  }
  void result()(bool result) {
    Object_Call_bool__void(this.handle, "result", result);
  }
  bool result()() {
    return Object_Getter__bool(this.handle, "result");
  }
  void success()(bool success) {
    Object_Call_bool__void(this.handle, "success", success);
  }
  bool success()() {
    return Object_Getter__bool(this.handle, "success");
  }
  void curExternalIfname()(string curExternalIfname) {
    Object_Call_string__void(this.handle, "curExternalIfname", curExternalIfname);
  }
  string curExternalIfname()() {
    return Object_Getter__string(this.handle, "curExternalIfname");
  }
  void curInternalIfname()(string curInternalIfname) {
    Object_Call_string__void(this.handle, "curInternalIfname", curInternalIfname);
  }
  string curInternalIfname()() {
    return Object_Getter__string(this.handle, "curInternalIfname");
  }
  void reply()(string reply) {
    Object_Call_string__void(this.handle, "reply", reply);
  }
  string reply()() {
    return Object_Getter__string(this.handle, "reply");
  }
  void route()(string route) {
    Object_Call_string__void(this.handle, "route", route);
  }
  string route()() {
    return Object_Getter__string(this.handle, "route");
  }
  void ipaddr_str()(string ipaddr_str) {
    Object_Call_string__void(this.handle, "ipaddr_str", ipaddr_str);
  }
  string ipaddr_str()() {
    return Object_Getter__string(this.handle, "ipaddr_str");
  }
  void gateway_str()(string gateway_str) {
    Object_Call_string__void(this.handle, "gateway_str", gateway_str);
  }
  string gateway_str()() {
    return Object_Getter__string(this.handle, "gateway_str");
  }
  void dns1_str()(string dns1_str) {
    Object_Call_string__void(this.handle, "dns1_str", dns1_str);
  }
  string dns1_str()() {
    return Object_Getter__string(this.handle, "dns1_str");
  }
  void dns2_str()(string dns2_str) {
    Object_Call_string__void(this.handle, "dns2_str", dns2_str);
  }
  string dns2_str()() {
    return Object_Getter__string(this.handle, "dns2_str");
  }
  void mask_str()(string mask_str) {
    Object_Call_string__void(this.handle, "mask_str", mask_str);
  }
  string mask_str()() {
    return Object_Getter__string(this.handle, "mask_str");
  }
  void server_str()(string server_str) {
    Object_Call_string__void(this.handle, "server_str", server_str);
  }
  string server_str()() {
    return Object_Getter__string(this.handle, "server_str");
  }
  void vendor_str()(string vendor_str) {
    Object_Call_string__void(this.handle, "vendor_str", vendor_str);
  }
  string vendor_str()() {
    return Object_Getter__string(this.handle, "vendor_str");
  }
  void lease()(int lease) {
    Object_Call_int__void(this.handle, "lease", lease);
  }
  int lease()() {
    return Object_Getter__int(this.handle, "lease");
  }
  void prefixLength()(int prefixLength) {
    Object_Call_int__void(this.handle, "prefixLength", prefixLength);
  }
  int prefixLength()() {
    return Object_Getter__int(this.handle, "prefixLength");
  }
  void mask()(int mask) {
    Object_Call_int__void(this.handle, "mask", mask);
  }
  int mask()() {
    return Object_Getter__int(this.handle, "mask");
  }
  void ipaddr()(int ipaddr) {
    Object_Call_int__void(this.handle, "ipaddr", ipaddr);
  }
  int ipaddr()() {
    return Object_Getter__int(this.handle, "ipaddr");
  }
  void gateway()(int gateway) {
    Object_Call_int__void(this.handle, "gateway", gateway);
  }
  int gateway()() {
    return Object_Getter__int(this.handle, "gateway");
  }
  void dns1()(int dns1) {
    Object_Call_int__void(this.handle, "dns1", dns1);
  }
  int dns1()() {
    return Object_Getter__int(this.handle, "dns1");
  }
  void dns2()(int dns2) {
    Object_Call_int__void(this.handle, "dns2", dns2);
  }
  int dns2()() {
    return Object_Getter__int(this.handle, "dns2");
  }
  void server()(int server) {
    Object_Call_int__void(this.handle, "server", server);
  }
  int server()() {
    return Object_Getter__int(this.handle, "server");
  }
  void netId()(string netId) {
    Object_Call_string__void(this.handle, "netId", netId);
  }
  string netId()() {
    return Object_Getter__string(this.handle, "netId");
  }
  void interfaceList()(scope ref Sequence!(string) interfaceList) {
    Object_Call_Handle__void(this.handle, "interfaceList", interfaceList.handle);
  }
  auto interfaceList()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "interfaceList"));
  }
  void flag()(string flag) {
    Object_Call_string__void(this.handle, "flag", flag);
  }
  string flag()() {
    return Object_Getter__string(this.handle, "flag");
  }
  void macAddr()(string macAddr) {
    Object_Call_string__void(this.handle, "macAddr", macAddr);
  }
  string macAddr()() {
    return Object_Getter__string(this.handle, "macAddr");
  }
  void ipAddr()(string ipAddr) {
    Object_Call_string__void(this.handle, "ipAddr", ipAddr);
  }
  string ipAddr()() {
    return Object_Getter__string(this.handle, "ipAddr");
  }
}


