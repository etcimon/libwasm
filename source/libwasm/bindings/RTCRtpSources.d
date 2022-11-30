module libwasm.bindings.RTCRtpSources;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct RTCRtpContributingSource {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCRtpContributingSource(libwasm_add__object());
  }
  void timestamp()(double timestamp) {
    Object_Call_double__void(this.handle, "timestamp", timestamp);
  }
  double timestamp()() {
    return Object_Getter__double(this.handle, "timestamp");
  }
  void source()(uint source) {
    Object_Call_uint__void(this.handle, "source", source);
  }
  uint source()() {
    return Object_Getter__uint(this.handle, "source");
  }
  void audioLevel()(double audioLevel) {
    Object_Call_double__void(this.handle, "audioLevel", audioLevel);
  }
  double audioLevel()() {
    return Object_Getter__double(this.handle, "audioLevel");
  }
}
struct RTCRtpSourceEntry {
  nothrow:
  libwasm.bindings.RTCRtpSources.RTCRtpSynchronizationSource _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpSynchronizationSource(h);
  }
  static auto create() {
    return RTCRtpSourceEntry(libwasm_add__object());
  }
  void sourceType()(RTCRtpSourceEntryType sourceType) {
    Object_Call_int__void(this._parent, "sourceType", sourceType);
  }
  RTCRtpSourceEntryType sourceType()() {
    return Object_Getter__int(this._parent, "sourceType");
  }
}
enum RTCRtpSourceEntryType {
  contributing,
  synchronization
}
struct RTCRtpSynchronizationSource {
  nothrow:
  libwasm.bindings.RTCRtpSources.RTCRtpContributingSource _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpContributingSource(h);
  }
  static auto create() {
    return RTCRtpSynchronizationSource(libwasm_add__object());
  }
  void voiceActivityFlag(T0)(scope auto ref Optional!(T0) voiceActivityFlag) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this._parent, "voiceActivityFlag", "Optional!(bool)", tuple(!voiceActivityFlag.empty, voiceActivityFlag.front));
  }
  Optional!(bool) voiceActivityFlag()() {
    return Object_Getter__OptionalBool(this._parent, "voiceActivityFlag");
  }
}


