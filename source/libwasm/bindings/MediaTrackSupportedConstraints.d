module libwasm.bindings.MediaTrackSupportedConstraints;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct MediaTrackSupportedConstraints {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaTrackSupportedConstraints(libwasm_add__object());
  }
  void width()(bool width) {
    Object_Call_bool__void(this.handle, "width", width);
  }
  bool width()() {
    return Object_Getter__bool(this.handle, "width");
  }
  void height()(bool height) {
    Object_Call_bool__void(this.handle, "height", height);
  }
  bool height()() {
    return Object_Getter__bool(this.handle, "height");
  }
  void aspectRatio()(bool aspectRatio) {
    Object_Call_bool__void(this.handle, "aspectRatio", aspectRatio);
  }
  bool aspectRatio()() {
    return Object_Getter__bool(this.handle, "aspectRatio");
  }
  void frameRate()(bool frameRate) {
    Object_Call_bool__void(this.handle, "frameRate", frameRate);
  }
  bool frameRate()() {
    return Object_Getter__bool(this.handle, "frameRate");
  }
  void facingMode()(bool facingMode) {
    Object_Call_bool__void(this.handle, "facingMode", facingMode);
  }
  bool facingMode()() {
    return Object_Getter__bool(this.handle, "facingMode");
  }
  void volume()(bool volume) {
    Object_Call_bool__void(this.handle, "volume", volume);
  }
  bool volume()() {
    return Object_Getter__bool(this.handle, "volume");
  }
  void sampleRate()(bool sampleRate) {
    Object_Call_bool__void(this.handle, "sampleRate", sampleRate);
  }
  bool sampleRate()() {
    return Object_Getter__bool(this.handle, "sampleRate");
  }
  void sampleSize()(bool sampleSize) {
    Object_Call_bool__void(this.handle, "sampleSize", sampleSize);
  }
  bool sampleSize()() {
    return Object_Getter__bool(this.handle, "sampleSize");
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
  void latency()(bool latency) {
    Object_Call_bool__void(this.handle, "latency", latency);
  }
  bool latency()() {
    return Object_Getter__bool(this.handle, "latency");
  }
  void channelCount()(bool channelCount) {
    Object_Call_bool__void(this.handle, "channelCount", channelCount);
  }
  bool channelCount()() {
    return Object_Getter__bool(this.handle, "channelCount");
  }
  void deviceId()(bool deviceId) {
    Object_Call_bool__void(this.handle, "deviceId", deviceId);
  }
  bool deviceId()() {
    return Object_Getter__bool(this.handle, "deviceId");
  }
  void groupId()(bool groupId) {
    Object_Call_bool__void(this.handle, "groupId", groupId);
  }
  bool groupId()() {
    return Object_Getter__bool(this.handle, "groupId");
  }
  void mediaSource()(bool mediaSource) {
    Object_Call_bool__void(this.handle, "mediaSource", mediaSource);
  }
  bool mediaSource()() {
    return Object_Getter__bool(this.handle, "mediaSource");
  }
  void browserWindow()(bool browserWindow) {
    Object_Call_bool__void(this.handle, "browserWindow", browserWindow);
  }
  bool browserWindow()() {
    return Object_Getter__bool(this.handle, "browserWindow");
  }
  void scrollWithPage()(bool scrollWithPage) {
    Object_Call_bool__void(this.handle, "scrollWithPage", scrollWithPage);
  }
  bool scrollWithPage()() {
    return Object_Getter__bool(this.handle, "scrollWithPage");
  }
  void viewportOffsetX()(bool viewportOffsetX) {
    Object_Call_bool__void(this.handle, "viewportOffsetX", viewportOffsetX);
  }
  bool viewportOffsetX()() {
    return Object_Getter__bool(this.handle, "viewportOffsetX");
  }
  void viewportOffsetY()(bool viewportOffsetY) {
    Object_Call_bool__void(this.handle, "viewportOffsetY", viewportOffsetY);
  }
  bool viewportOffsetY()() {
    return Object_Getter__bool(this.handle, "viewportOffsetY");
  }
  void viewportWidth()(bool viewportWidth) {
    Object_Call_bool__void(this.handle, "viewportWidth", viewportWidth);
  }
  bool viewportWidth()() {
    return Object_Getter__bool(this.handle, "viewportWidth");
  }
  void viewportHeight()(bool viewportHeight) {
    Object_Call_bool__void(this.handle, "viewportHeight", viewportHeight);
  }
  bool viewportHeight()() {
    return Object_Getter__bool(this.handle, "viewportHeight");
  }
}


