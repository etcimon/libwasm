module spasm.bindings.RTCRtpSources;

import spasm.types;
import spasm.bindings.Performance;

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
    return RTCRtpContributingSource(spasm_add__object());
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
  spasm.bindings.RTCRtpSources.RTCRtpSynchronizationSource _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpSynchronizationSource(h);
  }
  static auto create() {
    return RTCRtpSourceEntry(spasm_add__object());
  }
  void sourceType()(RTCRtpSourceEntryType sourceType) {
    RTCRtpSourceEntry_sourceType_Set(this._parent, sourceType);
  }
  RTCRtpSourceEntryType sourceType()() {
    return RTCRtpSourceEntry_sourceType_Get(this._parent);
  }
}
enum RTCRtpSourceEntryType {
  contributing,
  synchronization
}
struct RTCRtpSynchronizationSource {
  nothrow:
  spasm.bindings.RTCRtpSources.RTCRtpContributingSource _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpContributingSource(h);
  }
  static auto create() {
    return RTCRtpSynchronizationSource(spasm_add__object());
  }
  void voiceActivityFlag(T0)(scope auto ref Optional!(T0) voiceActivityFlag) if (isTOrPointer!(T0, bool)) {
    RTCRtpSynchronizationSource_voiceActivityFlag_Set(this._parent, !voiceActivityFlag.empty, voiceActivityFlag.front);
  }
  Optional!(bool) voiceActivityFlag()() {
    return Object_Getter__OptionalBool(this._parent, "voiceActivityFlag");
  }
}


extern (C) void RTCRtpSourceEntry_sourceType_Set(Handle, RTCRtpSourceEntryType);
extern (C) RTCRtpSourceEntryType RTCRtpSourceEntry_sourceType_Get(Handle);
extern (C) void RTCRtpSynchronizationSource_voiceActivityFlag_Set(Handle, bool, bool);