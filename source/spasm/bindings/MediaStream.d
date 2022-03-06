module spasm.bindings.MediaStream;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MediaStreamTrack;

@safe:
nothrow:

struct DisplayMediaStreamConstraints {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DisplayMediaStreamConstraints(spasm_add__object());
  }
  void video()(scope ref SumType!(bool, MediaTrackConstraints) video) {
    DisplayMediaStreamConstraints_video_Set(this.handle, video);
  }
  auto video()() {
    return Object_Getter__Handle(this.handle, "video");
  }
  void audio()(scope ref SumType!(bool, MediaTrackConstraints) audio) {
    DisplayMediaStreamConstraints_audio_Set(this.handle, audio);
  }
  auto audio()() {
    return Object_Getter__Handle(this.handle, "audio");
  }
}
struct MediaStream {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  auto getAudioTracks()() {
    return Sequence!(MediaStreamTrack)(Object_Getter__Handle(this._parent, "getAudioTracks"));
  }
  auto getVideoTracks()() {
    return Sequence!(MediaStreamTrack)(Object_Getter__Handle(this._parent, "getVideoTracks"));
  }
  auto getTracks()() {
    return Sequence!(MediaStreamTrack)(Object_Getter__Handle(this._parent, "getTracks"));
  }
  auto getTrackById()(string trackId) {
    return Object_Call_string__OptionalHandle(this._parent, "getTrackById", trackId);
  }
  void addTrack()(scope ref MediaStreamTrack track) {
    Object_Call_Handle__void(this._parent, "addTrack", track._parent);
  }
  void removeTrack()(scope ref MediaStreamTrack track) {
    Object_Call_Handle__void(this._parent, "removeTrack", track._parent);
  }
  auto clone()() {
    return MediaStream(Object_Getter__Handle(this._parent, "clone"));
  }
  bool active()() {
    return Object_Getter__bool(this._parent, "active");
  }
  void onaddtrack(T0)(scope auto ref Optional!(T0) onaddtrack) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onaddtrack", !onaddtrack.empty, onaddtrack.front);
  }
  EventHandler onaddtrack()() {
    return Object_Getter__EventHandler(this._parent, "onaddtrack");
  }
  void onremovetrack(T0)(scope auto ref Optional!(T0) onremovetrack) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onremovetrack", !onremovetrack.empty, onremovetrack.front);
  }
  EventHandler onremovetrack()() {
    return Object_Getter__EventHandler(this._parent, "onremovetrack");
  }
  auto countUnderlyingStreams()() {
    return Promise!(int)(Object_Getter__Handle(this._parent, "countUnderlyingStreams"));
  }
  void assignId()(string id) {
    Object_Call_string__void(this._parent, "assignId", id);
  }
}
struct MediaStreamConstraints {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaStreamConstraints(spasm_add__object());
  }
  void audio()(scope ref SumType!(bool, MediaTrackConstraints) audio) {
    MediaStreamConstraints_audio_Set(this.handle, audio);
  }
  auto audio()() {
    return Object_Getter__Handle(this.handle, "audio");
  }
  void video()(scope ref SumType!(bool, MediaTrackConstraints) video) {
    MediaStreamConstraints_video_Set(this.handle, video);
  }
  auto video()() {
    return Object_Getter__Handle(this.handle, "video");
  }
  void picture()(bool picture) {
    Object_Call_bool__void(this.handle, "picture", picture);
  }
  bool picture()() {
    return Object_Getter__bool(this.handle, "picture");
  }
  void fake()(bool fake) {
    Object_Call_bool__void(this.handle, "fake", fake);
  }
  bool fake()() {
    return Object_Getter__bool(this.handle, "fake");
  }
  void peerIdentity(T0)(scope auto ref Optional!(T0) peerIdentity) if (isTOrPointer!(T0, string)) {
    MediaStreamConstraints_peerIdentity_Set(this.handle, !peerIdentity.empty, peerIdentity.front);
  }
  Optional!(string) peerIdentity()() {
    return Object_Getter__OptionalString(this.handle, "peerIdentity");
  }
}


extern (C) void DisplayMediaStreamConstraints_video_Set(Handle, scope ref SumType!(bool, MediaTrackConstraints));
extern (C) void DisplayMediaStreamConstraints_audio_Set(Handle, scope ref SumType!(bool, MediaTrackConstraints));
extern (C) void MediaStreamConstraints_audio_Set(Handle, scope ref SumType!(bool, MediaTrackConstraints));
extern (C) void MediaStreamConstraints_video_Set(Handle, scope ref SumType!(bool, MediaTrackConstraints));
extern (C) void MediaStreamConstraints_peerIdentity_Set(Handle, bool, string);