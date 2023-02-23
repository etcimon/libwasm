module libwasm.bindings.ProgressEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct ProgressEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  bool lengthComputable()() {
    return Object_Getter__bool(this._parent, "lengthComputable");
  }
  uint loaded()() {
    return Object_Getter__uint(this._parent, "loaded");
  }
  uint total()() {
    return Object_Getter__uint(this._parent, "total");
  }
}
struct ProgressEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ProgressEventInit(libwasm_add__object());
  }
  void lengthComputable()(bool lengthComputable) {
    Object_Call_bool__void(this._parent, "lengthComputable", lengthComputable);
  }
  bool lengthComputable()() {
    return Object_Getter__bool(this._parent, "lengthComputable");
  }
  void loaded()(uint loaded) {
    Object_Call_uint__void(this._parent, "loaded", loaded);
  }
  uint loaded()() {
    return Object_Getter__uint(this._parent, "loaded");
  }
  void total()(uint total) {
    Object_Call_uint__void(this._parent, "total", total);
  }
  uint total()() {
    return Object_Getter__uint(this._parent, "total");
  }
}


