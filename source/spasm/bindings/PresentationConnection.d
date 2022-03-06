module spasm.bindings.PresentationConnection;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct PresentationConnection {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return PresentationConnection_state_Get(this._parent);
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
    PresentationConnection_binaryType_Set(this._parent, binaryType);
  }
  PresentationConnectionBinaryType binaryType()() {
    return PresentationConnection_binaryType_Get(this._parent);
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


extern (C) PresentationConnectionState PresentationConnection_state_Get(Handle);
extern (C) void PresentationConnection_binaryType_Set(Handle, PresentationConnectionBinaryType);
extern (C) PresentationConnectionBinaryType PresentationConnection_binaryType_Get(Handle);