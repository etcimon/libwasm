module spasm.bindings.RTCDTMFSender;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct RTCDTMFSender {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void insertDTMF()(string tones, uint duration /* = 100 */, uint interToneGap /* = 70 */) {
    RTCDTMFSender_insertDTMF(this._parent, tones, duration, interToneGap);
  }
  void insertDTMF()(string tones, uint duration /* = 100 */) {
    Object_Call_string_uint__void(this._parent, "insertDTMF", tones, duration);
  }
  void insertDTMF()(string tones) {
    Object_Call_string__void(this._parent, "insertDTMF", tones);
  }
  void ontonechange(T0)(scope auto ref Optional!(T0) ontonechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontonechange", !ontonechange.empty, ontonechange.front);
  }
  EventHandler ontonechange()() {
    return Object_Getter__EventHandler(this._parent, "ontonechange");
  }
  string toneBuffer()() {
    return Object_Getter__string(this._parent, "toneBuffer");
  }
}


extern (C) void RTCDTMFSender_insertDTMF(Handle, string, uint, uint);