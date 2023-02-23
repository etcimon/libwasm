module libwasm.bindings.MediaKeySystemAccess;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.MediaKeys;

@safe:
nothrow:

struct MediaKeySystemAccess {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string keySystem()() {
    return Object_Getter__string(this.handle, "keySystem");
  }
  auto getConfiguration()() {
    return MediaKeySystemConfiguration(Object_Getter__Handle(this.handle, "getConfiguration"));
  }
  auto createMediaKeys()() {
    return JsPromise!(MediaKeys)(Object_Getter__Handle(this.handle, "createMediaKeys"));
  }
}
struct MediaKeySystemConfiguration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaKeySystemConfiguration(libwasm_add__object());
  }
  void label()(string label) {
    Object_Call_string__void(this.handle, "label", label);
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  void initDataTypes()(scope ref Sequence!(string) initDataTypes) {
    Object_Call_Handle__void(this.handle, "initDataTypes", initDataTypes.handle);
  }
  auto initDataTypes()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "initDataTypes"));
  }
  void audioCapabilities()(scope ref Sequence!(MediaKeySystemMediaCapability) audioCapabilities) {
    Object_Call_Handle__void(this.handle, "audioCapabilities", audioCapabilities.handle);
  }
  auto audioCapabilities()() {
    return Sequence!(MediaKeySystemMediaCapability)(Object_Getter__Handle(this.handle, "audioCapabilities"));
  }
  void videoCapabilities()(scope ref Sequence!(MediaKeySystemMediaCapability) videoCapabilities) {
    Object_Call_Handle__void(this.handle, "videoCapabilities", videoCapabilities.handle);
  }
  auto videoCapabilities()() {
    return Sequence!(MediaKeySystemMediaCapability)(Object_Getter__Handle(this.handle, "videoCapabilities"));
  }
  void distinctiveIdentifier()(MediaKeysRequirement distinctiveIdentifier) {
    Object_Call_int__void(this.handle, "distinctiveIdentifier", distinctiveIdentifier);
  }
  MediaKeysRequirement distinctiveIdentifier()() {
    return Object_Getter__int(this.handle, "distinctiveIdentifier");
  }
  void persistentState()(MediaKeysRequirement persistentState) {
    Object_Call_int__void(this.handle, "persistentState", persistentState);
  }
  MediaKeysRequirement persistentState()() {
    return Object_Getter__int(this.handle, "persistentState");
  }
  void sessionTypes()(scope ref Sequence!(string) sessionTypes) {
    Object_Call_Handle__void(this.handle, "sessionTypes", sessionTypes.handle);
  }
  auto sessionTypes()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "sessionTypes"));
  }
}
struct MediaKeySystemMediaCapability {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaKeySystemMediaCapability(libwasm_add__object());
  }
  void contentType()(string contentType) {
    Object_Call_string__void(this.handle, "contentType", contentType);
  }
  string contentType()() {
    return Object_Getter__string(this.handle, "contentType");
  }
  void robustness()(string robustness) {
    Object_Call_string__void(this.handle, "robustness", robustness);
  }
  string robustness()() {
    return Object_Getter__string(this.handle, "robustness");
  }
}
enum MediaKeysRequirement {
  required,
  optional,
  not_allowed
}


