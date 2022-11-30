module libwasm.bindings.GetUserMediaRequest;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.MediaStream;

@safe:
nothrow:

struct GetUserMediaRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint windowID()() {
    return Object_Getter__uint(this.handle, "windowID");
  }
  uint innerWindowID()() {
    return Object_Getter__uint(this.handle, "innerWindowID");
  }
  string callID()() {
    return Object_Getter__string(this.handle, "callID");
  }
  string rawID()() {
    return Object_Getter__string(this.handle, "rawID");
  }
  string mediaSource()() {
    return Object_Getter__string(this.handle, "mediaSource");
  }
  auto getConstraints()() {
    return MediaStreamConstraints(Object_Getter__Handle(this.handle, "getConstraints"));
  }
  bool isSecure()() {
    return Object_Getter__bool(this.handle, "isSecure");
  }
  bool isHandlingUserInput()() {
    return Object_Getter__bool(this.handle, "isHandlingUserInput");
  }
}


