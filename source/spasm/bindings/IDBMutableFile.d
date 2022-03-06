module spasm.bindings.IDBMutableFile;

import spasm.types;
import spasm.bindings.DOMRequest;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.FileMode;
import spasm.bindings.IDBDatabase;
import spasm.bindings.IDBFileHandle;

@safe:
nothrow:

struct IDBMutableFile {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  auto database()() {
    return IDBDatabase(Object_Getter__Handle(this._parent, "database"));
  }
  auto open()(FileMode mode /* = "readonly" */) {
    return IDBFileHandle(IDBMutableFile_open(this._parent, mode));
  }
  auto open()() {
    return IDBFileHandle(Object_Getter__Handle(this._parent, "open"));
  }
  auto getFile()() {
    return DOMRequest(Object_Getter__Handle(this._parent, "getFile"));
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}


extern (C) Handle IDBMutableFile_open(Handle, FileMode);