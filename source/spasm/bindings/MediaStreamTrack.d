module spasm.bindings.MediaStreamTrack;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MediaTrackConstraintSet;
import spasm.bindings.MediaTrackSettings;

@safe:
nothrow:

alias ConstrainBoolean = SumType!(bool, ConstrainBooleanParameters);
alias ConstrainDOMString = SumType!(string, Sequence!(string), ConstrainDOMStringParameters);
alias ConstrainDouble = SumType!(double, ConstrainDoubleRange);
alias ConstrainLong = SumType!(int, ConstrainLongRange);
enum MediaSourceEnum {
  camera,
  screen,
  application,
  window,
  browser,
  microphone,
  audioCapture,
  other
}
struct MediaStreamTrack {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string kind()() {
    return Object_Getter__string(this._parent, "kind");
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void enabled()(bool enabled) {
    Object_Call_bool__void(this._parent, "enabled", enabled);
  }
  bool enabled()() {
    return Object_Getter__bool(this._parent, "enabled");
  }
  bool muted()() {
    return Object_Getter__bool(this._parent, "muted");
  }
  void onmute(T0)(scope auto ref Optional!(T0) onmute) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmute", !onmute.empty, onmute.front);
  }
  EventHandler onmute()() {
    return Object_Getter__EventHandler(this._parent, "onmute");
  }
  void onunmute(T0)(scope auto ref Optional!(T0) onunmute) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onunmute", !onunmute.empty, onunmute.front);
  }
  EventHandler onunmute()() {
    return Object_Getter__EventHandler(this._parent, "onunmute");
  }
  MediaStreamTrackState readyState()() {
    return MediaStreamTrack_readyState_Get(this._parent);
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onended", !onended.empty, onended.front);
  }
  EventHandler onended()() {
    return Object_Getter__EventHandler(this._parent, "onended");
  }
  auto clone()() {
    return MediaStreamTrack(Object_Getter__Handle(this._parent, "clone"));
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
  auto getConstraints()() {
    return MediaTrackConstraints(Object_Getter__Handle(this._parent, "getConstraints"));
  }
  auto getSettings()() {
    return MediaTrackSettings(Object_Getter__Handle(this._parent, "getSettings"));
  }
  auto applyConstraints()(scope ref MediaTrackConstraints constraints) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "applyConstraints", constraints._parent));
  }
  auto applyConstraints()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "applyConstraints"));
  }
  void mutedChanged()(bool muted) {
    Object_Call_bool__void(this._parent, "mutedChanged", muted);
  }
}
enum MediaStreamTrackState {
  live,
  ended
}
struct MediaTrackConstraintSet {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaTrackConstraintSet(spasm_add__object());
  }
  void width()(scope ref ConstrainLong width) {
    MediaTrackConstraintSet_width_Set(this.handle, width);
  }
  auto width()() {
    return Object_Getter__Handle(this.handle, "width");
  }
  void height()(scope ref ConstrainLong height) {
    MediaTrackConstraintSet_height_Set(this.handle, height);
  }
  auto height()() {
    return Object_Getter__Handle(this.handle, "height");
  }
  void frameRate()(scope ref ConstrainDouble frameRate) {
    MediaTrackConstraintSet_frameRate_Set(this.handle, frameRate);
  }
  auto frameRate()() {
    return Object_Getter__Handle(this.handle, "frameRate");
  }
  void facingMode()(scope ref ConstrainDOMString facingMode) {
    MediaTrackConstraintSet_facingMode_Set(this.handle, facingMode);
  }
  auto facingMode()() {
    return Object_Getter__Handle(this.handle, "facingMode");
  }
  void mediaSource()(string mediaSource) {
    Object_Call_string__void(this.handle, "mediaSource", mediaSource);
  }
  string mediaSource()() {
    return Object_Getter__string(this.handle, "mediaSource");
  }
  void browserWindow()(int browserWindow) {
    Object_Call_int__void(this.handle, "browserWindow", browserWindow);
  }
  int browserWindow()() {
    return Object_Getter__int(this.handle, "browserWindow");
  }
  void scrollWithPage()(bool scrollWithPage) {
    Object_Call_bool__void(this.handle, "scrollWithPage", scrollWithPage);
  }
  bool scrollWithPage()() {
    return Object_Getter__bool(this.handle, "scrollWithPage");
  }
  void deviceId()(scope ref ConstrainDOMString deviceId) {
    MediaTrackConstraintSet_deviceId_Set(this.handle, deviceId);
  }
  auto deviceId()() {
    return Object_Getter__Handle(this.handle, "deviceId");
  }
  void viewportOffsetX()(scope ref ConstrainLong viewportOffsetX) {
    MediaTrackConstraintSet_viewportOffsetX_Set(this.handle, viewportOffsetX);
  }
  auto viewportOffsetX()() {
    return Object_Getter__Handle(this.handle, "viewportOffsetX");
  }
  void viewportOffsetY()(scope ref ConstrainLong viewportOffsetY) {
    MediaTrackConstraintSet_viewportOffsetY_Set(this.handle, viewportOffsetY);
  }
  auto viewportOffsetY()() {
    return Object_Getter__Handle(this.handle, "viewportOffsetY");
  }
  void viewportWidth()(scope ref ConstrainLong viewportWidth) {
    MediaTrackConstraintSet_viewportWidth_Set(this.handle, viewportWidth);
  }
  auto viewportWidth()() {
    return Object_Getter__Handle(this.handle, "viewportWidth");
  }
  void viewportHeight()(scope ref ConstrainLong viewportHeight) {
    MediaTrackConstraintSet_viewportHeight_Set(this.handle, viewportHeight);
  }
  auto viewportHeight()() {
    return Object_Getter__Handle(this.handle, "viewportHeight");
  }
  void echoCancellation()(scope ref ConstrainBoolean echoCancellation) {
    MediaTrackConstraintSet_echoCancellation_Set(this.handle, echoCancellation);
  }
  auto echoCancellation()() {
    return Object_Getter__Handle(this.handle, "echoCancellation");
  }
  void noiseSuppression()(scope ref ConstrainBoolean noiseSuppression) {
    MediaTrackConstraintSet_noiseSuppression_Set(this.handle, noiseSuppression);
  }
  auto noiseSuppression()() {
    return Object_Getter__Handle(this.handle, "noiseSuppression");
  }
  void autoGainControl()(scope ref ConstrainBoolean autoGainControl) {
    MediaTrackConstraintSet_autoGainControl_Set(this.handle, autoGainControl);
  }
  auto autoGainControl()() {
    return Object_Getter__Handle(this.handle, "autoGainControl");
  }
  void channelCount()(scope ref ConstrainLong channelCount) {
    MediaTrackConstraintSet_channelCount_Set(this.handle, channelCount);
  }
  auto channelCount()() {
    return Object_Getter__Handle(this.handle, "channelCount");
  }
}
struct MediaTrackConstraints {
  nothrow:
  spasm.bindings.MediaStreamTrack.MediaTrackConstraintSet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MediaTrackConstraintSet(h);
  }
  static auto create() {
    return MediaTrackConstraints(spasm_add__object());
  }
  void advanced()(scope ref Sequence!(MediaTrackConstraintSet) advanced) {
    Object_Call_Handle__void(this._parent, "advanced", advanced.handle);
  }
  auto advanced()() {
    return Sequence!(MediaTrackConstraintSet)(Object_Getter__Handle(this._parent, "advanced"));
  }
}
enum VideoFacingModeEnum {
  user,
  environment,
  left,
  right
}


extern (C) MediaStreamTrackState MediaStreamTrack_readyState_Get(Handle);
extern (C) void MediaTrackConstraintSet_width_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_height_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_frameRate_Set(Handle, scope ref ConstrainDouble);
extern (C) void MediaTrackConstraintSet_facingMode_Set(Handle, scope ref ConstrainDOMString);
extern (C) void MediaTrackConstraintSet_deviceId_Set(Handle, scope ref ConstrainDOMString);
extern (C) void MediaTrackConstraintSet_viewportOffsetX_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_viewportOffsetY_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_viewportWidth_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_viewportHeight_Set(Handle, scope ref ConstrainLong);
extern (C) void MediaTrackConstraintSet_echoCancellation_Set(Handle, scope ref ConstrainBoolean);
extern (C) void MediaTrackConstraintSet_noiseSuppression_Set(Handle, scope ref ConstrainBoolean);
extern (C) void MediaTrackConstraintSet_autoGainControl_Set(Handle, scope ref ConstrainBoolean);
extern (C) void MediaTrackConstraintSet_channelCount_Set(Handle, scope ref ConstrainLong);