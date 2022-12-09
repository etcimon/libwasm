module libwasm.bindings.MediaStream;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MediaStreamTrack;

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
    return DisplayMediaStreamConstraints(libwasm_add__object());
  }
  void video()(scope ref SumType!(bool, MediaTrackConstraints) video) {
    Serialize_Object_VarArgCall!void(this.handle, "video", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref video.Types[1] v) => 1))(video),tuple(libwasm.sumtype.match!(((bool v) => v),((ref video.Types[1] v) => bool.init))(video),libwasm.sumtype.match!(((bool v) => Handle.init),((ref video.Types[1] v) => cast(Handle)v.handle))(video))));
  }
  auto video()() {
    return Object_Getter__Handle(this.handle, "video");
  }
  void audio()(scope ref SumType!(bool, MediaTrackConstraints) audio) {
    Serialize_Object_VarArgCall!void(this.handle, "audio", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref audio.Types[1] v) => 1))(audio),tuple(libwasm.sumtype.match!(((bool v) => v),((ref audio.Types[1] v) => bool.init))(audio),libwasm.sumtype.match!(((bool v) => Handle.init),((ref audio.Types[1] v) => cast(Handle)v.handle))(audio))));
  }
  auto audio()() {
    return Object_Getter__Handle(this.handle, "audio");
  }
}
struct MediaStream {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
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
    return recastOpt!(MediaStreamTrack)(Object_Call_string__OptionalHandle(this._parent, "getTrackById", trackId));
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
  void onaddtrack(T0)(scope auto ref Optional!(T0) onaddtrack) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onaddtrack", !onaddtrack.empty, onaddtrack.front);
  }
  EventHandler onaddtrack()() {
    return Object_Getter__EventHandler(this._parent, "onaddtrack");
  }
  void onremovetrack(T0)(scope auto ref Optional!(T0) onremovetrack) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onremovetrack", !onremovetrack.empty, onremovetrack.front);
  }
  EventHandler onremovetrack()() {
    return Object_Getter__EventHandler(this._parent, "onremovetrack");
  }
  auto countUnderlyingStreams()() {
    return JsPromise!(int)(Object_Getter__Handle(this._parent, "countUnderlyingStreams"));
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
    return MediaStreamConstraints(libwasm_add__object());
  }
  void audio()(scope ref SumType!(bool, MediaTrackConstraints) audio) {
    Serialize_Object_VarArgCall!void(this.handle, "audio", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref audio.Types[1] v) => 1))(audio),tuple(libwasm.sumtype.match!(((bool v) => v),((ref audio.Types[1] v) => bool.init))(audio),libwasm.sumtype.match!(((bool v) => Handle.init),((ref audio.Types[1] v) => cast(Handle)v.handle))(audio))));
  }
  auto audio()() {
    return Object_Getter__Handle(this.handle, "audio");
  }
  void video()(scope ref SumType!(bool, MediaTrackConstraints) video) {
    Serialize_Object_VarArgCall!void(this.handle, "video", "SumType!(bool,Handle)", tuple(libwasm.sumtype.match!(((bool v) => 0),((ref video.Types[1] v) => 1))(video),tuple(libwasm.sumtype.match!(((bool v) => v),((ref video.Types[1] v) => bool.init))(video),libwasm.sumtype.match!(((bool v) => Handle.init),((ref video.Types[1] v) => cast(Handle)v.handle))(video))));
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
    Serialize_Object_VarArgCall!void(this.handle, "peerIdentity", "Optional!(string)", tuple(!peerIdentity.empty, peerIdentity.front));
  }
  Optional!(string) peerIdentity()() {
    return Object_Getter__OptionalString(this.handle, "peerIdentity");
  }
}


