module libwasm.bindings.MediaStreamTrack;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MediaTrackConstraintSet;
import libwasm.bindings.MediaTrackSettings;

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
  libwasm.bindings.EventTarget.EventTarget _parent;
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
  void onmute(T0)(scope auto ref Optional!(T0) onmute) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmute", !onmute.empty, onmute.front);
  }
  EventHandler onmute()() {
    return Object_Getter__EventHandler(this._parent, "onmute");
  }
  void onunmute(T0)(scope auto ref Optional!(T0) onunmute) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onunmute", !onunmute.empty, onunmute.front);
  }
  EventHandler onunmute()() {
    return Object_Getter__EventHandler(this._parent, "onunmute");
  }
  MediaStreamTrackState readyState()() {
    return Object_Getter__int(this._parent, "readyState");
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandlerNonNull)) {
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
    return JsPromise!(void)(Object_Call_Handle__Handle(this._parent, "applyConstraints", constraints._parent));
  }
  auto applyConstraints()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "applyConstraints"));
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
    return MediaTrackConstraintSet(libwasm_add__object());
  }
  void width()(scope ref ConstrainLong width) {
    Serialize_Object_VarArgCall!void(this.handle, "width", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref width.Types[1] v) => 1))(width),tuple(libwasm.sumtype.match!(((int v) => v),((ref width.Types[1] v) => int.init))(width),libwasm.sumtype.match!(((int v) => Handle.init),((ref width.Types[1] v) => cast(Handle)v.handle))(width))));
  }
  auto width()() {
    return Object_Getter__Handle(this.handle, "width");
  }
  void height()(scope ref ConstrainLong height) {
    Serialize_Object_VarArgCall!void(this.handle, "height", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref height.Types[1] v) => 1))(height),tuple(libwasm.sumtype.match!(((int v) => v),((ref height.Types[1] v) => int.init))(height),libwasm.sumtype.match!(((int v) => Handle.init),((ref height.Types[1] v) => cast(Handle)v.handle))(height))));
  }
  auto height()() {
    return Object_Getter__Handle(this.handle, "height");
  }
  void frameRate()(scope ref ConstrainDouble frameRate) {
    Serialize_Object_VarArgCall!void(this.handle, "frameRate", "SumType!(double,Handle)", tuple(libwasm.sumtype.match!(((double v) => 0),((ref frameRate.Types[1] v) => 1))(frameRate),tuple(libwasm.sumtype.match!(((double v) => v),((ref frameRate.Types[1] v) => double.init))(frameRate),libwasm.sumtype.match!(((double v) => Handle.init),((ref frameRate.Types[1] v) => cast(Handle)v.handle))(frameRate))));
  }
  auto frameRate()() {
    return Object_Getter__Handle(this.handle, "frameRate");
  }
  void facingMode()(scope ref ConstrainDOMString facingMode) {
    Serialize_Object_VarArgCall!void(this.handle, "facingMode", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref facingMode.Types[1] v) => 1),((ref facingMode.Types[2] v) => 2))(facingMode),tuple(libwasm.sumtype.match!(((string v) => v),((ref facingMode.Types[1] v) => string.init),((ref facingMode.Types[2] v) => string.init))(facingMode),libwasm.sumtype.match!(((string v) => Handle.init),((ref facingMode.Types[1] v) => cast(Handle)v.handle),((ref facingMode.Types[2] v) => Handle.init))(facingMode),libwasm.sumtype.match!(((string v) => Handle.init),((ref facingMode.Types[1] v) => Handle.init),((ref facingMode.Types[2] v) => cast(Handle)v.handle))(facingMode))));
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
    Serialize_Object_VarArgCall!void(this.handle, "deviceId", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref deviceId.Types[1] v) => 1),((ref deviceId.Types[2] v) => 2))(deviceId),tuple(libwasm.sumtype.match!(((string v) => v),((ref deviceId.Types[1] v) => string.init),((ref deviceId.Types[2] v) => string.init))(deviceId),libwasm.sumtype.match!(((string v) => Handle.init),((ref deviceId.Types[1] v) => cast(Handle)v.handle),((ref deviceId.Types[2] v) => Handle.init))(deviceId),libwasm.sumtype.match!(((string v) => Handle.init),((ref deviceId.Types[1] v) => Handle.init),((ref deviceId.Types[2] v) => cast(Handle)v.handle))(deviceId))));
  }
  auto deviceId()() {
    return Object_Getter__Handle(this.handle, "deviceId");
  }
  void viewportOffsetX()(scope ref ConstrainLong viewportOffsetX) {
    Serialize_Object_VarArgCall!void(this.handle, "viewportOffsetX", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref viewportOffsetX.Types[1] v) => 1))(viewportOffsetX),tuple(libwasm.sumtype.match!(((int v) => v),((ref viewportOffsetX.Types[1] v) => int.init))(viewportOffsetX),libwasm.sumtype.match!(((int v) => Handle.init),((ref viewportOffsetX.Types[1] v) => cast(Handle)v.handle))(viewportOffsetX))));
  }
  auto viewportOffsetX()() {
    return Object_Getter__Handle(this.handle, "viewportOffsetX");
  }
  void viewportOffsetY()(scope ref ConstrainLong viewportOffsetY) {
    Serialize_Object_VarArgCall!void(this.handle, "viewportOffsetY", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref viewportOffsetY.Types[1] v) => 1))(viewportOffsetY),tuple(libwasm.sumtype.match!(((int v) => v),((ref viewportOffsetY.Types[1] v) => int.init))(viewportOffsetY),libwasm.sumtype.match!(((int v) => Handle.init),((ref viewportOffsetY.Types[1] v) => cast(Handle)v.handle))(viewportOffsetY))));
  }
  auto viewportOffsetY()() {
    return Object_Getter__Handle(this.handle, "viewportOffsetY");
  }
  void viewportWidth()(scope ref ConstrainLong viewportWidth) {
    Serialize_Object_VarArgCall!void(this.handle, "viewportWidth", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref viewportWidth.Types[1] v) => 1))(viewportWidth),tuple(libwasm.sumtype.match!(((int v) => v),((ref viewportWidth.Types[1] v) => int.init))(viewportWidth),libwasm.sumtype.match!(((int v) => Handle.init),((ref viewportWidth.Types[1] v) => cast(Handle)v.handle))(viewportWidth))));
  }
  auto viewportWidth()() {
    return Object_Getter__Handle(this.handle, "viewportWidth");
  }
  void viewportHeight()(scope ref ConstrainLong viewportHeight) {
    Serialize_Object_VarArgCall!void(this.handle, "viewportHeight", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref viewportHeight.Types[1] v) => 1))(viewportHeight),tuple(libwasm.sumtype.match!(((int v) => v),((ref viewportHeight.Types[1] v) => int.init))(viewportHeight),libwasm.sumtype.match!(((int v) => Handle.init),((ref viewportHeight.Types[1] v) => cast(Handle)v.handle))(viewportHeight))));
  }
  auto viewportHeight()() {
    return Object_Getter__Handle(this.handle, "viewportHeight");
  }
  void echoCancellation()(scope ref ConstrainBoolean echoCancellation) {
    Serialize_Object_VarArgCall!void(this.handle, "echoCancellation", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref echoCancellation.Types[1] v) => 1))(echoCancellation),tuple(libwasm.sumtype.match!(((bool v) => v),((ref echoCancellation.Types[1] v) => bool.init))(echoCancellation),libwasm.sumtype.match!(((bool v) => Handle.init),((ref echoCancellation.Types[1] v) => cast(Handle)v.handle))(echoCancellation))));
  }
  auto echoCancellation()() {
    return Object_Getter__Handle(this.handle, "echoCancellation");
  }
  void noiseSuppression()(scope ref ConstrainBoolean noiseSuppression) {
    Serialize_Object_VarArgCall!void(this.handle, "noiseSuppression", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref noiseSuppression.Types[1] v) => 1))(noiseSuppression),tuple(libwasm.sumtype.match!(((bool v) => v),((ref noiseSuppression.Types[1] v) => bool.init))(noiseSuppression),libwasm.sumtype.match!(((bool v) => Handle.init),((ref noiseSuppression.Types[1] v) => cast(Handle)v.handle))(noiseSuppression))));
  }
  auto noiseSuppression()() {
    return Object_Getter__Handle(this.handle, "noiseSuppression");
  }
  void autoGainControl()(scope ref ConstrainBoolean autoGainControl) {
    Serialize_Object_VarArgCall!void(this.handle, "autoGainControl", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref autoGainControl.Types[1] v) => 1))(autoGainControl),tuple(libwasm.sumtype.match!(((bool v) => v),((ref autoGainControl.Types[1] v) => bool.init))(autoGainControl),libwasm.sumtype.match!(((bool v) => Handle.init),((ref autoGainControl.Types[1] v) => cast(Handle)v.handle))(autoGainControl))));
  }
  auto autoGainControl()() {
    return Object_Getter__Handle(this.handle, "autoGainControl");
  }
  void channelCount()(scope ref ConstrainLong channelCount) {
    Serialize_Object_VarArgCall!void(this.handle, "channelCount", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((int v) => 0),((ref channelCount.Types[1] v) => 1))(channelCount),tuple(libwasm.sumtype.match!(((int v) => v),((ref channelCount.Types[1] v) => int.init))(channelCount),libwasm.sumtype.match!(((int v) => Handle.init),((ref channelCount.Types[1] v) => cast(Handle)v.handle))(channelCount))));
  }
  auto channelCount()() {
    return Object_Getter__Handle(this.handle, "channelCount");
  }
}
struct MediaTrackConstraints {
  nothrow:
  libwasm.bindings.MediaStreamTrack.MediaTrackConstraintSet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MediaTrackConstraintSet(h);
  }
  static auto create() {
    return MediaTrackConstraints(libwasm_add__object());
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


