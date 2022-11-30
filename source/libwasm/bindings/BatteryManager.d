module libwasm.bindings.BatteryManager;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct BatteryManager {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  bool charging()() {
    return Object_Getter__bool(this._parent, "charging");
  }
  double chargingTime()() {
    return Object_Getter__double(this._parent, "chargingTime");
  }
  double dischargingTime()() {
    return Object_Getter__double(this._parent, "dischargingTime");
  }
  double level()() {
    return Object_Getter__double(this._parent, "level");
  }
  void onchargingchange(T0)(scope auto ref Optional!(T0) onchargingchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchargingchange", !onchargingchange.empty, onchargingchange.front);
  }
  EventHandler onchargingchange()() {
    return Object_Getter__EventHandler(this._parent, "onchargingchange");
  }
  void onchargingtimechange(T0)(scope auto ref Optional!(T0) onchargingtimechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchargingtimechange", !onchargingtimechange.empty, onchargingtimechange.front);
  }
  EventHandler onchargingtimechange()() {
    return Object_Getter__EventHandler(this._parent, "onchargingtimechange");
  }
  void ondischargingtimechange(T0)(scope auto ref Optional!(T0) ondischargingtimechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondischargingtimechange", !ondischargingtimechange.empty, ondischargingtimechange.front);
  }
  EventHandler ondischargingtimechange()() {
    return Object_Getter__EventHandler(this._parent, "ondischargingtimechange");
  }
  void onlevelchange(T0)(scope auto ref Optional!(T0) onlevelchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onlevelchange", !onlevelchange.empty, onlevelchange.front);
  }
  EventHandler onlevelchange()() {
    return Object_Getter__EventHandler(this._parent, "onlevelchange");
  }
}


