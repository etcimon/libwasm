module libwasm.bindings.PresentationConnection;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct PresentationConnection {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  string url()() {
    return Object_Getter__string(this._parent, "url");
  }
  PresentationConnectionState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  void onconnect(T0)(scope auto ref Optional!(T0) onconnect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onconnect", !onconnect.empty, onconnect.front);
  }
  EventHandler onconnect()() {
    return Object_Getter__EventHandler(this._parent, "onconnect");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void onterminate(T0)(scope auto ref Optional!(T0) onterminate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onterminate", !onterminate.empty, onterminate.front);
  }
  EventHandler onterminate()() {
    return Object_Getter__EventHandler(this._parent, "onterminate");
  }
  void binaryType()(PresentationConnectionBinaryType binaryType) {
    Object_Call_int__void(this._parent, "binaryType", binaryType);
  }
  PresentationConnectionBinaryType binaryType()() {
    return Object_Getter__int(this._parent, "binaryType");
  }
  void send()(string data) {
    Object_Call_string__void(this._parent, "send", data);
  }
  void send()(scope ref Blob data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void send()(scope ref ArrayBuffer data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void send()(scope ref ArrayBufferView data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void terminate()() {
    Object_Call__void(this._parent, "terminate");
  }
}
enum PresentationConnectionBinaryType {
  blob,
  arraybuffer
}
enum PresentationConnectionState {
  connecting,
  connected,
  closed,
  terminated
}


