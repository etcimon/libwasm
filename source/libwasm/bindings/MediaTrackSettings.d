module libwasm.bindings.MediaTrackSettings;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct MediaTrackSettings {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaTrackSettings(libwasm_add__object());
  }
  void width()(int width) {
    Object_Call_int__void(this.handle, "width", width);
  }
  int width()() {
    return Object_Getter__int(this.handle, "width");
  }
  void height()(int height) {
    Object_Call_int__void(this.handle, "height", height);
  }
  int height()() {
    return Object_Getter__int(this.handle, "height");
  }
  void frameRate()(double frameRate) {
    Object_Call_double__void(this.handle, "frameRate", frameRate);
  }
  double frameRate()() {
    return Object_Getter__double(this.handle, "frameRate");
  }
  void facingMode()(string facingMode) {
    Object_Call_string__void(this.handle, "facingMode", facingMode);
  }
  string facingMode()() {
    return Object_Getter__string(this.handle, "facingMode");
  }
  void deviceId()(string deviceId) {
    Object_Call_string__void(this.handle, "deviceId", deviceId);
  }
  string deviceId()() {
    return Object_Getter__string(this.handle, "deviceId");
  }
  void echoCancellation()(bool echoCancellation) {
    Object_Call_bool__void(this.handle, "echoCancellation", echoCancellation);
  }
  bool echoCancellation()() {
    return Object_Getter__bool(this.handle, "echoCancellation");
  }
  void noiseSuppression()(bool noiseSuppression) {
    Object_Call_bool__void(this.handle, "noiseSuppression", noiseSuppression);
  }
  bool noiseSuppression()() {
    return Object_Getter__bool(this.handle, "noiseSuppression");
  }
  void autoGainControl()(bool autoGainControl) {
    Object_Call_bool__void(this.handle, "autoGainControl", autoGainControl);
  }
  bool autoGainControl()() {
    return Object_Getter__bool(this.handle, "autoGainControl");
  }
  void channelCount()(int channelCount) {
    Object_Call_int__void(this.handle, "channelCount", channelCount);
  }
  int channelCount()() {
    return Object_Getter__int(this.handle, "channelCount");
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
  void viewportOffsetX()(int viewportOffsetX) {
    Object_Call_int__void(this.handle, "viewportOffsetX", viewportOffsetX);
  }
  int viewportOffsetX()() {
    return Object_Getter__int(this.handle, "viewportOffsetX");
  }
  void viewportOffsetY()(int viewportOffsetY) {
    Object_Call_int__void(this.handle, "viewportOffsetY", viewportOffsetY);
  }
  int viewportOffsetY()() {
    return Object_Getter__int(this.handle, "viewportOffsetY");
  }
  void viewportWidth()(int viewportWidth) {
    Object_Call_int__void(this.handle, "viewportWidth", viewportWidth);
  }
  int viewportWidth()() {
    return Object_Getter__int(this.handle, "viewportWidth");
  }
  void viewportHeight()(int viewportHeight) {
    Object_Call_int__void(this.handle, "viewportHeight", viewportHeight);
  }
  int viewportHeight()() {
    return Object_Getter__int(this.handle, "viewportHeight");
  }
}


