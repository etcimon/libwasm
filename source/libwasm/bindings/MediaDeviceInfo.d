module libwasm.bindings.MediaDeviceInfo;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct MediaDeviceInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string deviceId()() {
    return Object_Getter__string(this.handle, "deviceId");
  }
  MediaDeviceKind kind()() {
    return Object_Getter__int(this.handle, "kind");
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  string groupId()() {
    return Object_Getter__string(this.handle, "groupId");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}
enum MediaDeviceKind {
  audioinput,
  audiooutput,
  videoinput
}


