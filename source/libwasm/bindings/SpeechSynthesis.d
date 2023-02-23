module libwasm.bindings.SpeechSynthesis;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.SpeechSynthesisUtterance;
import libwasm.bindings.SpeechSynthesisVoice;

@safe:
nothrow:

struct SpeechSynthesis {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  bool pending()() {
    return Object_Getter__bool(this._parent, "pending");
  }
  bool speaking()() {
    return Object_Getter__bool(this._parent, "speaking");
  }
  bool paused()() {
    return Object_Getter__bool(this._parent, "paused");
  }
  void speak()(scope ref SpeechSynthesisUtterance utterance) {
    Object_Call_Handle__void(this._parent, "speak", utterance._parent);
  }
  void cancel()() {
    Object_Call__void(this._parent, "cancel");
  }
  void pause()() {
    Object_Call__void(this._parent, "pause");
  }
  void resume()() {
    Object_Call__void(this._parent, "resume");
  }
  auto getVoices()() {
    return Sequence!(SpeechSynthesisVoice)(Object_Getter__Handle(this._parent, "getVoices"));
  }
  void onvoiceschanged(T0)(scope auto ref Optional!(T0) onvoiceschanged) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onvoiceschanged", !onvoiceschanged.empty, onvoiceschanged.front);
  }
  EventHandler onvoiceschanged()() {
    return Object_Getter__EventHandler(this._parent, "onvoiceschanged");
  }
  void forceEnd()() {
    Object_Call__void(this._parent, "forceEnd");
  }
}


