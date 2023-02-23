module libwasm.bindings.FileReader;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.DOMException;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct FileReader {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void readAsArrayBuffer()(scope ref Blob blob) {
    Object_Call_Handle__void(this._parent, "readAsArrayBuffer", blob.handle);
  }
  void readAsBinaryString()(scope ref Blob filedata) {
    Object_Call_Handle__void(this._parent, "readAsBinaryString", filedata.handle);
  }
  void readAsText()(scope ref Blob blob, string label) {
    Serialize_Object_VarArgCall!void(this._parent, "readAsText", "Handle;string", tuple(cast(Handle)blob.handle, label));
  }
  void readAsText()(scope ref Blob blob) {
    Object_Call_Handle__void(this._parent, "readAsText", blob.handle);
  }
  void readAsDataURL()(scope ref Blob blob) {
    Object_Call_Handle__void(this._parent, "readAsDataURL", blob.handle);
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  enum ushort EMPTY = 0;
  enum ushort LOADING = 1;
  enum ushort DONE = 2;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  auto result()() {
    return Any(Object_Getter__Handle(this._parent, "result"));
  }
  auto error()() {
    return recastOpt!(DOMException)(Object_Getter__OptionalHandle(this._parent, "error"));
  }
  void onloadstart(T0)(scope auto ref Optional!(T0) onloadstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onloadstart", !onloadstart.empty, onloadstart.front);
  }
  EventHandler onloadstart()() {
    return Object_Getter__EventHandler(this._parent, "onloadstart");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
  void onload(T0)(scope auto ref Optional!(T0) onload) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onload", !onload.empty, onload.front);
  }
  EventHandler onload()() {
    return Object_Getter__EventHandler(this._parent, "onload");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onloadend(T0)(scope auto ref Optional!(T0) onloadend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onloadend", !onloadend.empty, onloadend.front);
  }
  EventHandler onloadend()() {
    return Object_Getter__EventHandler(this._parent, "onloadend");
  }
}


