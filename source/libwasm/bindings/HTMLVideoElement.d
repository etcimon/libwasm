module libwasm.bindings.HTMLVideoElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLMediaElement;
import libwasm.bindings.VideoPlaybackQuality;

@safe:
nothrow:

struct HTMLVideoElement {
  nothrow:
  libwasm.bindings.HTMLMediaElement.HTMLMediaElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLMediaElement(h);
  }
  void width()(uint width) {
    Object_Call_uint__void(this._parent, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this._parent, "width");
  }
  void height()(uint height) {
    Object_Call_uint__void(this._parent, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this._parent, "height");
  }
  uint videoWidth()() {
    return Object_Getter__uint(this._parent, "videoWidth");
  }
  uint videoHeight()() {
    return Object_Getter__uint(this._parent, "videoHeight");
  }
  void poster()(string poster) {
    Object_Call_string__void(this._parent, "poster", poster);
  }
  string poster()() {
    return Object_Getter__string(this._parent, "poster");
  }
  uint mozParsedFrames()() {
    return Object_Getter__uint(this._parent, "mozParsedFrames");
  }
  uint mozDecodedFrames()() {
    return Object_Getter__uint(this._parent, "mozDecodedFrames");
  }
  uint mozPresentedFrames()() {
    return Object_Getter__uint(this._parent, "mozPresentedFrames");
  }
  uint mozPaintedFrames()() {
    return Object_Getter__uint(this._parent, "mozPaintedFrames");
  }
  double mozFrameDelay()() {
    return Object_Getter__double(this._parent, "mozFrameDelay");
  }
  bool mozHasAudio()() {
    return Object_Getter__bool(this._parent, "mozHasAudio");
  }
  bool mozOrientationLockEnabled()() {
    return Object_Getter__bool(this._parent, "mozOrientationLockEnabled");
  }
  void mozIsOrientationLocked()(bool mozIsOrientationLocked) {
    Object_Call_bool__void(this._parent, "mozIsOrientationLocked", mozIsOrientationLocked);
  }
  bool mozIsOrientationLocked()() {
    return Object_Getter__bool(this._parent, "mozIsOrientationLocked");
  }
  void cloneElementVisually()(scope ref HTMLVideoElement target) {
    Object_Call_Handle__void(this._parent, "cloneElementVisually", target._parent);
  }
  auto getVideoPlaybackQuality()() {
    return VideoPlaybackQuality(Object_Getter__Handle(this._parent, "getVideoPlaybackQuality"));
  }
}


