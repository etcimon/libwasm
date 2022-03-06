module spasm.bindings.RTCDataChannel;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct RTCDataChannel {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  bool reliable()() {
    return Object_Getter__bool(this._parent, "reliable");
  }
  Optional!(ushort) maxPacketLifeTime()() {
    return RTCDataChannel_maxPacketLifeTime_Get(this._parent);
  }
  Optional!(ushort) maxRetransmits()() {
    return RTCDataChannel_maxRetransmits_Get(this._parent);
  }
  RTCDataChannelState readyState()() {
    return RTCDataChannel_readyState_Get(this._parent);
  }
  uint bufferedAmount()() {
    return Object_Getter__uint(this._parent, "bufferedAmount");
  }
  void bufferedAmountLowThreshold()(uint bufferedAmountLowThreshold) {
    Object_Call_uint__void(this._parent, "bufferedAmountLowThreshold", bufferedAmountLowThreshold);
  }
  uint bufferedAmountLowThreshold()() {
    return Object_Getter__uint(this._parent, "bufferedAmountLowThreshold");
  }
  void onopen(T0)(scope auto ref Optional!(T0) onopen) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onopen", !onopen.empty, onopen.front);
  }
  EventHandler onopen()() {
    return Object_Getter__EventHandler(this._parent, "onopen");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onbufferedamountlow(T0)(scope auto ref Optional!(T0) onbufferedamountlow) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onbufferedamountlow", !onbufferedamountlow.empty, onbufferedamountlow.front);
  }
  EventHandler onbufferedamountlow()() {
    return Object_Getter__EventHandler(this._parent, "onbufferedamountlow");
  }
  void binaryType()(RTCDataChannelType binaryType) {
    RTCDataChannel_binaryType_Set(this._parent, binaryType);
  }
  RTCDataChannelType binaryType()() {
    return RTCDataChannel_binaryType_Get(this._parent);
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
  string protocol()() {
    return Object_Getter__string(this._parent, "protocol");
  }
  bool ordered()() {
    return Object_Getter__bool(this._parent, "ordered");
  }
  ushort id()() {
    return Object_Getter__ushort(this._parent, "id");
  }
}
enum RTCDataChannelState {
  connecting,
  open,
  closing,
  closed
}
enum RTCDataChannelType {
  arraybuffer,
  blob
}


extern (C) Optional!(ushort) RTCDataChannel_maxPacketLifeTime_Get(Handle);
extern (C) Optional!(ushort) RTCDataChannel_maxRetransmits_Get(Handle);
extern (C) RTCDataChannelState RTCDataChannel_readyState_Get(Handle);
extern (C) void RTCDataChannel_binaryType_Set(Handle, RTCDataChannelType);
extern (C) RTCDataChannelType RTCDataChannel_binaryType_Get(Handle);