module spasm.bindings.Navigator;

import spasm.types;
import spasm.bindings.BatteryManager;
import spasm.bindings.Clipboard;
import spasm.bindings.CredentialManagement;
import spasm.bindings.Fetch;
import spasm.bindings.Gamepad;
import spasm.bindings.GamepadServiceTest;
import spasm.bindings.Geolocation;
import spasm.bindings.MIDIAccess;
import spasm.bindings.MIDIOptions;
import spasm.bindings.MediaCapabilities;
import spasm.bindings.MediaDevices;
import spasm.bindings.MediaKeySystemAccess;
import spasm.bindings.MediaStream;
import spasm.bindings.MediaStreamError;
import spasm.bindings.MimeTypeArray;
import spasm.bindings.NetworkInformation;
import spasm.bindings.Permissions;
import spasm.bindings.PluginArray;
import spasm.bindings.Presentation;
import spasm.bindings.ServiceWorkerContainer;
import spasm.bindings.StorageManager;
import spasm.bindings.TCPSocket;
import spasm.bindings.VRDisplay;
import spasm.bindings.VRServiceTest;

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
    return Promise!(BatteryManager)(Object_Getter__Handle(this.handle, "getBattery"));
  }
  bool vibrate()(uint duration) {
    return Navigator_vibrate__uint(this.handle, duration);
  }
  bool vibrate()(scope ref Sequence!(uint) pattern) {
    return Navigator_vibrate__sequence(this.handle, pattern.handle);
  }
  int maxTouchPoints()() {
    return Object_Getter__int(this.handle, "maxTouchPoints");
  }
  auto mediaCapabilities()() {
    return MediaCapabilities(Object_Getter__Handle(this.handle, "mediaCapabilities"));
  }
  void setVibrationPermission()(bool permitted, bool persistent /* = true */) {
    Navigator_setVibrationPermission(this.handle, permitted, persistent);
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
    return Promise!(Sequence!(VRDisplay))(Object_Getter__Handle(this.handle, "getVRDisplays"));
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
    return Promise!(MIDIAccess)(Object_Call_Handle__Handle(this.handle, "requestMIDIAccess", options.handle));
  }
  auto requestMIDIAccess()() {
    return Promise!(MIDIAccess)(Object_Getter__Handle(this.handle, "requestMIDIAccess"));
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
    return Navigator_sendBeacon(this.handle, url, !data.empty, *data.frontRef);
  }
  bool sendBeacon()(string url) {
    return Object_Call_string__bool(this.handle, "sendBeacon", url);
  }
  auto presentation()() {
    return Object_Getter__OptionalHandle(this.handle, "presentation");
  }
  auto mozTCPSocket()() {
    return LegacyMozTCPSocket(Object_Getter__Handle(this.handle, "mozTCPSocket"));
  }
  auto requestMediaKeySystemAccess()(string keySystem, scope ref Sequence!(MediaKeySystemConfiguration) supportedConfigurations) {
    return Promise!(MediaKeySystemAccess)(Navigator_requestMediaKeySystemAccess(this.handle, keySystem, supportedConfigurations.handle));
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
    NavigatorContentUtils_checkProtocolHandlerAllowed(this.handle, scheme, handlerURI.handle, documentURI.handle);
  }
  void registerProtocolHandler()(string scheme, string url, string title) {
    NavigatorContentUtils_registerProtocolHandler(this.handle, scheme, url, title);
  }
  void registerContentHandler()(string mimeType, string url, string title) {
    NavigatorContentUtils_registerContentHandler(this.handle, mimeType, url, title);
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
    NavigatorContentUtils_checkProtocolHandlerAllowed(this.handle, scheme, handlerURI.handle, documentURI.handle);
  }
  void registerProtocolHandler()(string scheme, string url, string title) {
    NavigatorContentUtils_registerProtocolHandler(this.handle, scheme, url, title);
  }
  void registerContentHandler()(string mimeType, string url, string title) {
    NavigatorContentUtils_registerContentHandler(this.handle, mimeType, url, title);
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


extern (C) bool Navigator_vibrate__uint(Handle, uint);
extern (C) bool Navigator_vibrate__sequence(Handle, Handle);
extern (C) void Navigator_setVibrationPermission(Handle, bool, bool);
extern (C) void Navigator_mozGetUserMedia(Handle, Handle, NavigatorUserMediaSuccessCallback, NavigatorUserMediaErrorCallback);
extern (C) void Navigator_mozGetUserMediaDevices(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback, uint, string);
extern (C) void Navigator_mozGetUserMediaDevices_0(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback, uint);
extern (C) void Navigator_mozGetUserMediaDevices_1(Handle, Handle, MozGetUserMediaDevicesSuccessCallback, NavigatorUserMediaErrorCallback);
extern (C) bool Navigator_sendBeacon(Handle, string, bool, scope ref BodyInit);
extern (C) Handle Navigator_requestMediaKeySystemAccess(Handle, string, Handle);
extern (C) void NavigatorContentUtils_checkProtocolHandlerAllowed(Handle, string, Handle, Handle);
extern (C) void NavigatorContentUtils_registerProtocolHandler(Handle, string, string, string);
extern (C) void NavigatorContentUtils_registerContentHandler(Handle, string, string, string);