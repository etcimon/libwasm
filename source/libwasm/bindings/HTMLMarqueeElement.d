module libwasm.bindings.HTMLMarqueeElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLMarqueeElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void behavior()(string behavior) {
    Object_Call_string__void(this._parent, "behavior", behavior);
  }
  string behavior()() {
    return Object_Getter__string(this._parent, "behavior");
  }
  void bgColor()(string bgColor) {
    Object_Call_string__void(this._parent, "bgColor", bgColor);
  }
  string bgColor()() {
    return Object_Getter__string(this._parent, "bgColor");
  }
  void direction()(string direction) {
    Object_Call_string__void(this._parent, "direction", direction);
  }
  string direction()() {
    return Object_Getter__string(this._parent, "direction");
  }
  void height()(string height) {
    Object_Call_string__void(this._parent, "height", height);
  }
  string height()() {
    return Object_Getter__string(this._parent, "height");
  }
  void hspace()(uint hspace) {
    Object_Call_uint__void(this._parent, "hspace", hspace);
  }
  uint hspace()() {
    return Object_Getter__uint(this._parent, "hspace");
  }
  void loop()(int loop) {
    Object_Call_int__void(this._parent, "loop", loop);
  }
  int loop()() {
    return Object_Getter__int(this._parent, "loop");
  }
  void scrollAmount()(uint scrollAmount) {
    Object_Call_uint__void(this._parent, "scrollAmount", scrollAmount);
  }
  uint scrollAmount()() {
    return Object_Getter__uint(this._parent, "scrollAmount");
  }
  void scrollDelay()(uint scrollDelay) {
    Object_Call_uint__void(this._parent, "scrollDelay", scrollDelay);
  }
  uint scrollDelay()() {
    return Object_Getter__uint(this._parent, "scrollDelay");
  }
  void trueSpeed()(bool trueSpeed) {
    Object_Call_bool__void(this._parent, "trueSpeed", trueSpeed);
  }
  bool trueSpeed()() {
    return Object_Getter__bool(this._parent, "trueSpeed");
  }
  void vspace()(uint vspace) {
    Object_Call_uint__void(this._parent, "vspace", vspace);
  }
  uint vspace()() {
    return Object_Getter__uint(this._parent, "vspace");
  }
  void width()(string width) {
    Object_Call_string__void(this._parent, "width", width);
  }
  string width()() {
    return Object_Getter__string(this._parent, "width");
  }
  void onbounce(T0)(scope auto ref Optional!(T0) onbounce) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onbounce", !onbounce.empty, onbounce.front);
  }
  EventHandler onbounce()() {
    return Object_Getter__EventHandler(this._parent, "onbounce");
  }
  void onfinish(T0)(scope auto ref Optional!(T0) onfinish) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onfinish", !onfinish.empty, onfinish.front);
  }
  EventHandler onfinish()() {
    return Object_Getter__EventHandler(this._parent, "onfinish");
  }
  void onstart(T0)(scope auto ref Optional!(T0) onstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstart", !onstart.empty, onstart.front);
  }
  EventHandler onstart()() {
    return Object_Getter__EventHandler(this._parent, "onstart");
  }
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
}


