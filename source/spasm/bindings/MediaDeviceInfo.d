module spasm.bindings.MediaDeviceInfo;

import spasm.types;
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
    return MediaDeviceInfo_kind_Get(this.handle);
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


extern (C) MediaDeviceKind MediaDeviceInfo_kind_Get(Handle);