module libwasm.bindings.Navigator;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.BatteryManager;
import libwasm.bindings.Clipboard;
import libwasm.bindings.CredentialManagement;
import libwasm.bindings.Fetch;
import libwasm.bindings.Gamepad;
import libwasm.bindings.GamepadServiceTest;
import libwasm.bindings.Geolocation;
import libwasm.bindings.MIDIAccess;
import libwasm.bindings.MIDIOptions;
import libwasm.bindings.MediaCapabilities;
import libwasm.bindings.MediaDevices;
import libwasm.bindings.MediaKeySystemAccess;
import libwasm.bindings.MediaStream;
import libwasm.bindings.MediaStreamError;
import libwasm.bindings.MimeTypeArray;
import libwasm.bindings.NetworkInformation;
import libwasm.bindings.Permissions;
import libwasm.bindings.PluginArray;
import libwasm.bindings.Presentation;
import libwasm.bindings.ServiceWorkerContainer;
import libwasm.bindings.StorageManager;
import libwasm.bindings.TCPSocket;
import libwasm.bindings.VRDisplay;
import libwasm.bindings.VRServiceTest;

@safe:
nothrow:

alias MozGetUserMediaDevicesSuccessCallback = void delegate(Optional!(nsIVariant));
struct Navigator {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto permissions()() {
    return Permissions(Object_Getter__Handle(this.handle, "permissions"));
  }
  auto mimeTypes()() {
    return MimeTypeArray(Object_Getter__Handle(this.handle, "mimeTypes"));
  }
  auto plugins()() {
    return PluginArray(Object_Getter__Handle(this.handle, "plugins"));
  }
  string doNotTrack()() {
    return Object_Getter__string(this.handle, "doNotTrack");
  }
  auto getBattery()() {
    return JsPromise!(BatteryManager)(Object_Getter__Handle(this.handle, "getBattery"));
  }
  bool vibrate()(uint duration) {
    return Serialize_Object_VarArgCall!bool(this.handle, "vibrate", "uint", tuple(duration));
  }
  bool vibrate()(scope ref Sequence!(uint) pattern) {
    return Serialize_Object_VarArgCall!bool(this.handle, "vibrate", "Handle", tuple(cast(Handle)pattern.handle));
  }
  int maxTouchPoints()() {
    return Object_Getter__int(this.handle, "maxTouchPoints");
  }
  auto mediaCapabilities()() {
    return MediaCapabilities(Object_Getter__Handle(this.handle, "mediaCapabilities"));
  }
  void setVibrationPermission()(bool permitted, bool persistent /* = true */) {
    Serialize_Object_VarArgCall!void(this.handle, "setVibrationPermission", "bool;bool", tuple(permitted, persistent));
  }
  void setVibrationPermission()(bool permitted) {
    Object_Call_bool__void(this.handle, "setVibrationPermission", permitted);
  }
  string oscpu()() {
    return Object_Getter__string(this.handle, "oscpu");
  }
  string vendor()() {
    return Object_Getter__string(this.handle, "vendor");
  }
  string vendorSub()() {
    return Object_Getter__string(this.handle, "vendorSub");
  }
  string productSub()() {
    return Object_Getter__string(this.handle, "productSub");
  }
  bool cookieEnabled()() {
    return Object_Getter__bool(this.handle, "cookieEnabled");
  }
  string buildID()() {
    return Object_Getter__string(this.handle, "buildID");
  }
  bool javaEnabled()() {
    return Object_Getter__bool(this.handle, "javaEnabled");
  }
  auto connection()() {
    return NetworkInformation(Object_Getter__Handle(this.handle, "connection"));
  }
  auto getGamepads()() {
    return Sequence!(Optional!(Gamepad))(Object_Getter__Handle(this.handle, "getGamepads"));
  }
  auto requestGamepadServiceTest()() {
    return GamepadServiceTest(Object_Getter__Handle(this.handle, "requestGamepadServiceTest"));
  }
  auto getVRDisplays()() {
    return JsPromise!(Sequence!(VRDisplay))(Object_Getter__Handle(this.handle, "getVRDisplays"));
  }
  auto activeVRDisplays()() {
    return Sequence!(VRDisplay)(Object_Getter__Handle(this.handle, "activeVRDisplays"));
  }
  bool isWebVRContentDetected()() {
    return Object_Getter__bool(this.handle, "isWebVRContentDetected");
  }
  bool isWebVRContentPresenting()() {
    return Object_Getter__bool(this.handle, "isWebVRContentPresenting");
  }
  void requestVRPresentation()(scope ref VRDisplay display) {
    Object_Call_Handle__void(this.handle, "requestVRPresentation", display._parent);
  }
  auto requestVRServiceTest()() {
    return VRServiceTest(Object_Getter__Handle(this.handle, "requestVRServiceTest"));
  }
  auto requestMIDIAccess()(scope ref MIDIOptions options) {
    return JsPromise!(MIDIAccess)(Object_Call_Handle__Handle(this.handle, "requestMIDIAccess", options.handle));
  }
  auto requestMIDIAccess()() {
    return JsPromise!(MIDIAccess)(Object_Getter__Handle(this.handle, "requestMIDIAccess"));
  }
  auto mediaDevices()() {
    return MediaDevices(Object_Getter__Handle(this.handle, "mediaDevices"));
  }
  void mozGetUserMedia()(scope ref MediaStreamConstraints constraints, NavigatorUserMediaSuccessCallback successCallback, NavigatorUserMediaErrorCallback errorCallback) {
    Navigator_mozGetUserMedia(this.handle, constraints.handle, successCallback, errorCallback);
  }
  void mozGetUserMediaDevices()(scope ref MediaStreamConstraints constraints, MozGetUserMediaDevicesSuccessCallback onsuccess, NavigatorUserMediaErrorCallback onerror, uint innerWindowID /* = 0 */, string callID /* = "" */) {
    Navigator_mozGetUserMediaDevices(this.handle, constraints.handle, onsuccess, onerror, innerWindowID, callID);
  }
  void mozGetUserMediaDevices()(scope ref MediaStreamConstraints constraints, MozGetUserMediaDevicesSuccessCallback onsuccess, NavigatorUserMediaErrorCallback onerror, uint innerWindowID /* = 0 */) {
    Navigator_mozGetUserMediaDevices_0(this.handle, constraints.handle, onsuccess, onerror, innerWindowID);
  }
  void mozGetUserMediaDevices()(scope ref MediaStreamConstraints constraints, MozGetUserMediaDevicesSuccessCallback onsuccess, NavigatorUserMediaErrorCallback onerror) {
    Navigator_mozGetUserMediaDevices_1(this.handle, constraints.handle, onsuccess, onerror);
  }
  auto serviceWorker()() {
    return ServiceWorkerContainer(Object_Getter__Handle(this.handle, "serviceWorker"));
  }
  bool sendBeacon(T1)(string url, scope auto ref Optional!(T1) data /* = no!(BodyInit) */) if (isTOrPointer!(T1, BodyInit)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "sendBeacon", "string;Optional!SumType!(Handle,Handle,Handle,Handle,string)", tuple(url, !data.empty, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1),((ref data.Types[2] v) => 2),((ref data.Types[3] v) => 3),((string v) => 4))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => Handle.init),((string v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => Handle.init),((string v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => cast(Handle)v.handle),((ref data.Types[3] v) => Handle.init),((string v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => cast(Handle)v.handle),((string v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => string.init),((ref data.Types[1] v) => string.init),((ref data.Types[2] v) => string.init),((ref data.Types[3] v) => string.init),((string v) => v))(data))));
  }
  bool sendBeacon()(string url) {
    return Object_Call_string__bool(this.handle, "sendBeacon", url);
  }
  auto presentation()() {
    return recastOpt!(Presentation)(Object_Getter__OptionalHandle(this.handle, "presentation"));
  }
  auto mozTCPSocket()() {
    return LegacyMozTCPSocket(Object_Getter__Handle(this.handle, "mozTCPSocket"));
  }
  auto requestMediaKeySystemAccess()(string keySystem, scope ref Sequence!(MediaKeySystemConfiguration) supportedConfigurations) {
    return JsPromise!(MediaKeySystemAccess)(Serialize_Object_VarArgCall!Handle(this.handle, "requestMediaKeySystemAccess", "string;Handle", tuple(keySystem, cast(Handle)supportedConfigurations.handle)));
  }
  auto credentials()() {
    return CredentialsContainer(Object_Getter__Handle(this.handle, "credentials"));
  }
  auto clipboard()() {
    return Clipboard(Object_Getter__Handle(this.handle, "clipboard"));
  }
  string appCodeName()() {
    return Object_Getter__string(this.handle, "appCodeName");
  }
  string appName()() {
    return Object_Getter__string(this.handle, "appName");
  }
  string appVersion()() {
    return Object_Getter__string(this.handle, "appVersion");
  }
  string platform()() {
    return Object_Getter__string(this.handle, "platform");
  }
  string userAgent()() {
    return Object_Getter__string(this.handle, "userAgent");
  }
  string product()() {
    return Object_Getter__string(this.handle, "product");
  }
  bool taintEnabled()() {
    return Object_Getter__bool(this.handle, "taintEnabled");
  }
  Optional!(string) language()() {
    return Object_Getter__OptionalString(this.handle, "language");
  }
  auto languages()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "languages"));
  }
  bool onLine()() {
    return Object_Getter__bool(this.handle, "onLine");
  }
  void checkProtocolHandlerAllowed()(string scheme, scope ref URI handlerURI, scope ref URI documentURI) {
    Serialize_Object_VarArgCall!void(this.handle, "checkProtocolHandlerAllowed", "string;Handle;Handle", tuple(scheme, cast(Handle)handlerURI.handle, cast(Handle)documentURI.handle));
  }
  void registerProtocolHandler()(string scheme, string url, string title) {
    Serialize_Object_VarArgCall!void(this.handle, "registerProtocolHandler", "string;string;string", tuple(scheme, url, title));
  }
  void registerContentHandler()(string mimeType, string url, string title) {
    Serialize_Object_VarArgCall!void(this.handle, "registerContentHandler", "string;string;string", tuple(mimeType, url, title));
  }
  uint hardwareConcurrency()() {
    return Object_Getter__uint(this.handle, "hardwareConcurrency");
  }
  auto storage()() {
    return StorageManager(Object_Getter__Handle(this.handle, "storage"));
  }
  bool webdriver()() {
    return Object_Getter__bool(this.handle, "webdriver");
  }
  auto geolocation()() {
    return Geolocation(Object_Getter__Handle(this.handle, "geolocation"));
  }
}
struct NavigatorAutomationInformation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool webdriver()() {
    return Object_Getter__bool(this.handle, "webdriver");
  }
}
struct NavigatorConcurrentHardware {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint hardwareConcurrency()() {
    return Object_Getter__uint(this.handle, "hardwareConcurrency");
  }
}
struct NavigatorContentUtils {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void checkProtocolHandlerAllowed()(string scheme, scope ref URI handlerURI, scope ref URI documentURI) {
    Serialize_Object_VarArgCall!void(this.handle, "checkProtocolHandlerAllowed", "string;Handle;Handle", tuple(scheme, cast(Handle)handlerURI.handle, cast(Handle)documentURI.handle));
  }
  void registerProtocolHandler()(string scheme, string url, string title) {
    Serialize_Object_VarArgCall!void(this.handle, "registerProtocolHandler", "string;string;string", tuple(scheme, url, title));
  }
  void registerContentHandler()(string mimeType, string url, string title) {
    Serialize_Object_VarArgCall!void(this.handle, "registerContentHandler", "string;string;string", tuple(mimeType, url, title));
  }
}
struct NavigatorGeolocation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto geolocation()() {
    return Geolocation(Object_Getter__Handle(this.handle, "geolocation"));
  }
}
struct NavigatorID {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string appCodeName()() {
    return Object_Getter__string(this.handle, "appCodeName");
  }
  string appName()() {
    return Object_Getter__string(this.handle, "appName");
  }
  string appVersion()() {
    return Object_Getter__string(this.handle, "appVersion");
  }
  string platform()() {
    return Object_Getter__string(this.handle, "platform");
  }
  string userAgent()() {
    return Object_Getter__string(this.handle, "userAgent");
  }
  string product()() {
    return Object_Getter__string(this.handle, "product");
  }
  bool taintEnabled()() {
    return Object_Getter__bool(this.handle, "taintEnabled");
  }
}
struct NavigatorLanguage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(string) language()() {
    return Object_Getter__OptionalString(this.handle, "language");
  }
  auto languages()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "languages"));
  }
}
struct NavigatorOnLine {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool onLine()() {
    return Object_Getter__bool(this.handle, "onLine");
  }
}
struct NavigatorStorage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto storage()() {
    return StorageManager(Object_Getter__Handle(this.handle, "storage"));
  }
}
struct NavigatorStorageUtils {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
alias NavigatorUserMediaErrorCallback = void delegate(MediaStreamError);
alias NavigatorUserMediaSuccessCallback = void delegate(MediaStream);


extern (C) void Navigator_mozGetUserMedia(Handle, Handle, NavigatorUserMediaSuccessCallback, NavigatorUserMediaErrorCallback);
extern (C) void Navigator_mozGetUserMediaDevices(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback, uint, string);
extern (C) void Navigator_mozGetUserMediaDevices_0(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback, uint);
extern (C) void Navigator_mozGetUserMediaDevices_1(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback);