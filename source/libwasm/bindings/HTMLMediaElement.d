module libwasm.bindings.HTMLMediaElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioTrackList;
import libwasm.bindings.EventHandler;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.MediaError;
import libwasm.bindings.MediaKeys;
import libwasm.bindings.MediaSource;
import libwasm.bindings.MediaStream;
import libwasm.bindings.TextTrack;
import libwasm.bindings.TextTrackList;
import libwasm.bindings.TimeRanges;
import libwasm.bindings.VideoTrackList;

@safe:
nothrow:

struct HTMLMediaElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto error()() {
    return recastOpt!(MediaError)(Object_Getter__OptionalHandle(this._parent, "error"));
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  string currentSrc()() {
    return Object_Getter__string(this._parent, "currentSrc");
  }
  void crossOrigin(T0)(scope auto ref Optional!(T0) crossOrigin) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "crossOrigin", "Optional!(string)", tuple(!crossOrigin.empty, crossOrigin.front));
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  enum ushort NETWORK_EMPTY = 0;
  enum ushort NETWORK_IDLE = 1;
  enum ushort NETWORK_LOADING = 2;
  enum ushort NETWORK_NO_SOURCE = 3;
  ushort networkState()() {
    return Object_Getter__ushort(this._parent, "networkState");
  }
  void preload()(string preload) {
    Object_Call_string__void(this._parent, "preload", preload);
  }
  string preload()() {
    return Object_Getter__string(this._parent, "preload");
  }
  auto buffered()() {
    return TimeRanges(Object_Getter__Handle(this._parent, "buffered"));
  }
  void load()() {
    Object_Call__void(this._parent, "load");
  }
  string canPlayType()(string type) {
    return Object_Call_string__string(this._parent, "canPlayType", type);
  }
  enum ushort HAVE_NOTHING = 0;
  enum ushort HAVE_METADATA = 1;
  enum ushort HAVE_CURRENT_DATA = 2;
  enum ushort HAVE_FUTURE_DATA = 3;
  enum ushort HAVE_ENOUGH_DATA = 4;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  bool seeking()() {
    return Object_Getter__bool(this._parent, "seeking");
  }
  void currentTime()(double currentTime) {
    Object_Call_double__void(this._parent, "currentTime", currentTime);
  }
  double currentTime()() {
    return Object_Getter__double(this._parent, "currentTime");
  }
  void fastSeek()(double time) {
    Object_Call_double__void(this._parent, "fastSeek", time);
  }
  double duration()() {
    return Object_Getter__double(this._parent, "duration");
  }
  bool isEncrypted()() {
    return Object_Getter__bool(this._parent, "isEncrypted");
  }
  bool paused()() {
    return Object_Getter__bool(this._parent, "paused");
  }
  void defaultPlaybackRate()(double defaultPlaybackRate) {
    Object_Call_double__void(this._parent, "defaultPlaybackRate", defaultPlaybackRate);
  }
  double defaultPlaybackRate()() {
    return Object_Getter__double(this._parent, "defaultPlaybackRate");
  }
  void playbackRate()(double playbackRate) {
    Object_Call_double__void(this._parent, "playbackRate", playbackRate);
  }
  double playbackRate()() {
    return Object_Getter__double(this._parent, "playbackRate");
  }
  auto played()() {
    return TimeRanges(Object_Getter__Handle(this._parent, "played"));
  }
  auto seekable()() {
    return TimeRanges(Object_Getter__Handle(this._parent, "seekable"));
  }
  bool ended()() {
    return Object_Getter__bool(this._parent, "ended");
  }
  void autoplay()(bool autoplay) {
    Object_Call_bool__void(this._parent, "autoplay", autoplay);
  }
  bool autoplay()() {
    return Object_Getter__bool(this._parent, "autoplay");
  }
  void loop()(bool loop) {
    Object_Call_bool__void(this._parent, "loop", loop);
  }
  bool loop()() {
    return Object_Getter__bool(this._parent, "loop");
  }
  auto play()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "play"));
  }
  void pause()() {
    Object_Call__void(this._parent, "pause");
  }
  void controls()(bool controls) {
    Object_Call_bool__void(this._parent, "controls", controls);
  }
  bool controls()() {
    return Object_Getter__bool(this._parent, "controls");
  }
  void volume()(double volume) {
    Object_Call_double__void(this._parent, "volume", volume);
  }
  double volume()() {
    return Object_Getter__double(this._parent, "volume");
  }
  void muted()(bool muted) {
    Object_Call_bool__void(this._parent, "muted", muted);
  }
  bool muted()() {
    return Object_Getter__bool(this._parent, "muted");
  }
  void defaultMuted()(bool defaultMuted) {
    Object_Call_bool__void(this._parent, "defaultMuted", defaultMuted);
  }
  bool defaultMuted()() {
    return Object_Getter__bool(this._parent, "defaultMuted");
  }
  auto audioTracks()() {
    return AudioTrackList(Object_Getter__Handle(this._parent, "audioTracks"));
  }
  auto videoTracks()() {
    return VideoTrackList(Object_Getter__Handle(this._parent, "videoTracks"));
  }
  auto textTracks()() {
    return recastOpt!(TextTrackList)(Object_Getter__OptionalHandle(this._parent, "textTracks"));
  }
  auto addTextTrack()(TextTrackKind kind, string label /* = "" */, string language /* = "" */) {
    return TextTrack(Serialize_Object_VarArgCall!Handle(this._parent, "addTextTrack", "Enum;string;string", tuple(kind, label, language)));
  }
  auto addTextTrack()(TextTrackKind kind, string label /* = "" */) {
    return TextTrack(Serialize_Object_VarArgCall!Handle(this._parent, "addTextTrack", "Enum;string", tuple(kind, label)));
  }
  auto addTextTrack()(TextTrackKind kind) {
    return TextTrack(Object_Call_int__Handle(this._parent, "addTextTrack", kind));
  }
  auto mozMediaSourceObject()() {
    return recastOpt!(MediaSource)(Object_Getter__OptionalHandle(this._parent, "mozMediaSourceObject"));
  }
  string mozDebugReaderData()() {
    return Object_Getter__string(this._parent, "mozDebugReaderData");
  }
  auto mozRequestDebugInfo()() {
    return JsPromise!(string)(Object_Getter__Handle(this._parent, "mozRequestDebugInfo"));
  }
  void mozEnableDebugLog()() {
    Object_Call__void(this._parent, "mozEnableDebugLog");
  }
  auto mozRequestDebugLog()() {
    return JsPromise!(string)(Object_Getter__Handle(this._parent, "mozRequestDebugLog"));
  }
  auto mozDumpDebugInfo()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "mozDumpDebugInfo"));
  }
  void srcObject(T0)(scope auto ref Optional!(T0) srcObject) if (isTOrPointer!(T0, MediaStream)) {
    Serialize_Object_VarArgCall!void(this._parent, "srcObject", "Optional!Handle", tuple(!srcObject.empty, cast(Handle)srcObject.front.handle));
  }
  auto srcObject()() {
    return recastOpt!(MediaStream)(Object_Getter__OptionalHandle(this._parent, "srcObject"));
  }
  void mozPreservesPitch()(bool mozPreservesPitch) {
    Object_Call_bool__void(this._parent, "mozPreservesPitch", mozPreservesPitch);
  }
  bool mozPreservesPitch()() {
    return Object_Getter__bool(this._parent, "mozPreservesPitch");
  }
  void mozAllowCasting()(bool mozAllowCasting) {
    Object_Call_bool__void(this._parent, "mozAllowCasting", mozAllowCasting);
  }
  bool mozAllowCasting()() {
    return Object_Getter__bool(this._parent, "mozAllowCasting");
  }
  void mozIsCasting()(bool mozIsCasting) {
    Object_Call_bool__void(this._parent, "mozIsCasting", mozIsCasting);
  }
  bool mozIsCasting()() {
    return Object_Getter__bool(this._parent, "mozIsCasting");
  }
  auto mozCaptureStream()() {
    return MediaStream(Object_Getter__Handle(this._parent, "mozCaptureStream"));
  }
  auto mozCaptureStreamUntilEnded()() {
    return MediaStream(Object_Getter__Handle(this._parent, "mozCaptureStreamUntilEnded"));
  }
  bool mozAudioCaptured()() {
    return Object_Getter__bool(this._parent, "mozAudioCaptured");
  }
  auto mozGetMetadata()() {
    return recastOpt!(JsObject)(Object_Getter__OptionalHandle(this._parent, "mozGetMetadata"));
  }
  double mozFragmentEnd()() {
    return Object_Getter__double(this._parent, "mozFragmentEnd");
  }
  void reportCanPlayTelemetry()() {
    Object_Call__void(this._parent, "reportCanPlayTelemetry");
  }
  auto mediaKeys()() {
    return recastOpt!(MediaKeys)(Object_Getter__OptionalHandle(this._parent, "mediaKeys"));
  }
  auto setMediaKeys(T0)(scope auto ref Optional!(T0) mediaKeys) if (isTOrPointer!(T0, MediaKeys)) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this._parent, "setMediaKeys", "Optional!Handle", tuple(!mediaKeys.empty, cast(Handle)mediaKeys.front.handle)));
  }
  void onencrypted(T0)(scope auto ref Optional!(T0) onencrypted) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onencrypted", !onencrypted.empty, onencrypted.front);
  }
  EventHandler onencrypted()() {
    return Object_Getter__EventHandler(this._parent, "onencrypted");
  }
  void onwaitingforkey(T0)(scope auto ref Optional!(T0) onwaitingforkey) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onwaitingforkey", !onwaitingforkey.empty, onwaitingforkey.front);
  }
  EventHandler onwaitingforkey()() {
    return Object_Getter__EventHandler(this._parent, "onwaitingforkey");
  }
  double computedVolume()() {
    return Object_Getter__double(this._parent, "computedVolume");
  }
  bool computedMuted()() {
    return Object_Getter__bool(this._parent, "computedMuted");
  }
  uint computedSuspended()() {
    return Object_Getter__uint(this._parent, "computedSuspended");
  }
  auto seekToNextFrame()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "seekToNextFrame"));
  }
  void setVisible()(bool aVisible) {
    Object_Call_bool__void(this._parent, "setVisible", aVisible);
  }
  bool hasSuspendTaint()() {
    return Object_Getter__bool(this._parent, "hasSuspendTaint");
  }
  bool isVisible()() {
    return Object_Getter__bool(this._parent, "isVisible");
  }
  bool isVideoDecodingSuspended()() {
    return Object_Getter__bool(this._parent, "isVideoDecodingSuspended");
  }
  string sinkId()() {
    return Object_Getter__string(this._parent, "sinkId");
  }
  auto setSinkId()(string sinkId) {
    return JsPromise!(void)(Object_Call_string__Handle(this._parent, "setSinkId", sinkId));
  }
  bool allowedToPlay()() {
    return Object_Getter__bool(this._parent, "allowedToPlay");
  }
}


