module libwasm.bindings.SpeechRecognition;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MediaStream;
import libwasm.bindings.SpeechGrammarList;

@safe:
nothrow:

struct SpeechRecognition {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void grammars()(scope ref SpeechGrammarList grammars) {
    Object_Call_Handle__void(this._parent, "grammars", grammars.handle);
  }
  auto grammars()() {
    return SpeechGrammarList(Object_Getter__Handle(this._parent, "grammars"));
  }
  void lang()(string lang) {
    Object_Call_string__void(this._parent, "lang", lang);
  }
  string lang()() {
    return Object_Getter__string(this._parent, "lang");
  }
  void continuous()(bool continuous) {
    Object_Call_bool__void(this._parent, "continuous", continuous);
  }
  bool continuous()() {
    return Object_Getter__bool(this._parent, "continuous");
  }
  void interimResults()(bool interimResults) {
    Object_Call_bool__void(this._parent, "interimResults", interimResults);
  }
  bool interimResults()() {
    return Object_Getter__bool(this._parent, "interimResults");
  }
  void maxAlternatives()(uint maxAlternatives) {
    Object_Call_uint__void(this._parent, "maxAlternatives", maxAlternatives);
  }
  uint maxAlternatives()() {
    return Object_Getter__uint(this._parent, "maxAlternatives");
  }
  void serviceURI()(string serviceURI) {
    Object_Call_string__void(this._parent, "serviceURI", serviceURI);
  }
  string serviceURI()() {
    return Object_Getter__string(this._parent, "serviceURI");
  }
  void start()(scope ref MediaStream stream) {
    Object_Call_Handle__void(this._parent, "start", stream._parent);
  }
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  void onaudiostart(T0)(scope auto ref Optional!(T0) onaudiostart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onaudiostart", !onaudiostart.empty, onaudiostart.front);
  }
  EventHandler onaudiostart()() {
    return Object_Getter__EventHandler(this._parent, "onaudiostart");
  }
  void onsoundstart(T0)(scope auto ref Optional!(T0) onsoundstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onsoundstart", !onsoundstart.empty, onsoundstart.front);
  }
  EventHandler onsoundstart()() {
    return Object_Getter__EventHandler(this._parent, "onsoundstart");
  }
  void onspeechstart(T0)(scope auto ref Optional!(T0) onspeechstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onspeechstart", !onspeechstart.empty, onspeechstart.front);
  }
  EventHandler onspeechstart()() {
    return Object_Getter__EventHandler(this._parent, "onspeechstart");
  }
  void onspeechend(T0)(scope auto ref Optional!(T0) onspeechend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onspeechend", !onspeechend.empty, onspeechend.front);
  }
  EventHandler onspeechend()() {
    return Object_Getter__EventHandler(this._parent, "onspeechend");
  }
  void onsoundend(T0)(scope auto ref Optional!(T0) onsoundend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onsoundend", !onsoundend.empty, onsoundend.front);
  }
  EventHandler onsoundend()() {
    return Object_Getter__EventHandler(this._parent, "onsoundend");
  }
  void onaudioend(T0)(scope auto ref Optional!(T0) onaudioend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onaudioend", !onaudioend.empty, onaudioend.front);
  }
  EventHandler onaudioend()() {
    return Object_Getter__EventHandler(this._parent, "onaudioend");
  }
  void onresult(T0)(scope auto ref Optional!(T0) onresult) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onresult", !onresult.empty, onresult.front);
  }
  EventHandler onresult()() {
    return Object_Getter__EventHandler(this._parent, "onresult");
  }
  void onnomatch(T0)(scope auto ref Optional!(T0) onnomatch) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onnomatch", !onnomatch.empty, onnomatch.front);
  }
  EventHandler onnomatch()() {
    return Object_Getter__EventHandler(this._parent, "onnomatch");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
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
}


