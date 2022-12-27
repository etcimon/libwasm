module libwasm.bindings.SpeechSynthesisUtterance;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.SpeechSynthesisVoice;

@safe:
nothrow:

struct SpeechSynthesisUtterance {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  void lang()(string lang) {
    Object_Call_string__void(this._parent, "lang", lang);
  }
  string lang()() {
    return Object_Getter__string(this._parent, "lang");
  }
  void voice(T0)(scope auto ref Optional!(T0) voice) if (isTOrPointer!(T0, SpeechSynthesisVoice)) {
    Serialize_Object_VarArgCall!void(this._parent, "voice", "Optional!Handle", tuple(!voice.empty, cast(Handle)voice.front.handle));
  }
  auto voice()() {
    return recastOpt!(SpeechSynthesisVoice)(Object_Getter__OptionalHandle(this._parent, "voice"));
  }
  void volume()(float volume) {
    Object_Call_float__void(this._parent, "volume", volume);
  }
  float volume()() {
    return Object_Getter__float(this._parent, "volume");
  }
  void rate()(float rate) {
    Object_Call_float__void(this._parent, "rate", rate);
  }
  float rate()() {
    return Object_Getter__float(this._parent, "rate");
  }
  void pitch()(float pitch) {
    Object_Call_float__void(this._parent, "pitch", pitch);
  }
  float pitch()() {
    return Object_Getter__float(this._parent, "pitch");
  }
  void onstart(T0)(scope auto ref Optional!(T0) onstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstart", !onstart.empty, onstart.front);
  }
  EventHandler onstart()() {
    return Object_Getter__EventHandler(this._parent, "onstart");
  }
  void onend(T0)(scope auto ref Optional!(T0) onend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onend", !onend.empty, onend.front);
  }
  EventHandler onend()() {
    return Object_Getter__EventHandler(this._parent, "onend");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onpause(T0)(scope auto ref Optional!(T0) onpause) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onpause", !onpause.empty, onpause.front);
  }
  EventHandler onpause()() {
    return Object_Getter__EventHandler(this._parent, "onpause");
  }
  void onresume(T0)(scope auto ref Optional!(T0) onresume) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onresume", !onresume.empty, onresume.front);
  }
  EventHandler onresume()() {
    return Object_Getter__EventHandler(this._parent, "onresume");
  }
  void onmark(T0)(scope auto ref Optional!(T0) onmark) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmark", !onmark.empty, onmark.front);
  }
  EventHandler onmark()() {
    return Object_Getter__EventHandler(this._parent, "onmark");
  }
  void onboundary(T0)(scope auto ref Optional!(T0) onboundary) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onboundary", !onboundary.empty, onboundary.front);
  }
  EventHandler onboundary()() {
    return Object_Getter__EventHandler(this._parent, "onboundary");
  }
  string chosenVoiceURI()() {
    return Object_Getter__string(this._parent, "chosenVoiceURI");
  }
}


