module libwasm.bindings.OfflineResourceList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMStringList;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct OfflineResourceList {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  enum ushort UNCACHED = 0;
  enum ushort IDLE = 1;
  enum ushort CHECKING = 2;
  enum ushort DOWNLOADING = 3;
  enum ushort UPDATEREADY = 4;
  enum ushort OBSOLETE = 5;
  ushort status()() {
    return Object_Getter__ushort(this._parent, "status");
  }
  void update()() {
    Object_Call__void(this._parent, "update");
  }
  void swapCache()() {
    Object_Call__void(this._parent, "swapCache");
  }
  void onchecking(T0)(scope auto ref Optional!(T0) onchecking) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onchecking", !onchecking.empty, onchecking.front);
  }
  EventHandler onchecking()() {
    return Object_Getter__EventHandler(this._parent, "onchecking");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onnoupdate(T0)(scope auto ref Optional!(T0) onnoupdate) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onnoupdate", !onnoupdate.empty, onnoupdate.front);
  }
  EventHandler onnoupdate()() {
    return Object_Getter__EventHandler(this._parent, "onnoupdate");
  }
  void ondownloading(T0)(scope auto ref Optional!(T0) ondownloading) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ondownloading", !ondownloading.empty, ondownloading.front);
  }
  EventHandler ondownloading()() {
    return Object_Getter__EventHandler(this._parent, "ondownloading");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
  void onupdateready(T0)(scope auto ref Optional!(T0) onupdateready) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onupdateready", !onupdateready.empty, onupdateready.front);
  }
  EventHandler onupdateready()() {
    return Object_Getter__EventHandler(this._parent, "onupdateready");
  }
  void oncached(T0)(scope auto ref Optional!(T0) oncached) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oncached", !oncached.empty, oncached.front);
  }
  EventHandler oncached()() {
    return Object_Getter__EventHandler(this._parent, "oncached");
  }
  void onobsolete(T0)(scope auto ref Optional!(T0) onobsolete) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onobsolete", !onobsolete.empty, onobsolete.front);
  }
  EventHandler onobsolete()() {
    return Object_Getter__EventHandler(this._parent, "onobsolete");
  }
  auto mozItems()() {
    return DOMStringList(Object_Getter__Handle(this._parent, "mozItems"));
  }
  bool mozHasItem()(string uri) {
    return Object_Call_string__bool(this._parent, "mozHasItem", uri);
  }
  uint mozLength()() {
    return Object_Getter__uint(this._parent, "mozLength");
  }
  string mozItem()(uint index) {
    return Object_Call_uint__string(this._parent, "mozItem", index);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  void mozAdd()(string uri) {
    Object_Call_string__void(this._parent, "mozAdd", uri);
  }
  void mozRemove()(string uri) {
    Object_Call_string__void(this._parent, "mozRemove", uri);
  }
}


