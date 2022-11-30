module libwasm.bindings.ConstantSourceNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioParam;
import libwasm.bindings.AudioScheduledSourceNode;

@safe:
nothrow:

struct ConstantSourceNode {
  nothrow:
  libwasm.bindings.AudioScheduledSourceNode.AudioScheduledSourceNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioScheduledSourceNode(h);
  }
  auto offset()() {
    return AudioParam(Object_Getter__Handle(this._parent, "offset"));
  }
}
struct ConstantSourceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConstantSourceOptions(libwasm_add__object());
  }
  void offset()(float offset) {
    Object_Call_float__void(this.handle, "offset", offset);
  }
  float offset()() {
    return Object_Getter__float(this.handle, "offset");
  }
}


