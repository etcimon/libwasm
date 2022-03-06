module spasm.bindings.ConstantSourceNode;

import spasm.types;
import spasm.bindings.AudioParam;
import spasm.bindings.AudioScheduledSourceNode;

@safe:
nothrow:

struct ConstantSourceNode {
  nothrow:
  spasm.bindings.AudioScheduledSourceNode.AudioScheduledSourceNode _parent;
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
    return ConstantSourceOptions(spasm_add__object());
  }
  void offset()(float offset) {
    Object_Call_float__void(this.handle, "offset", offset);
  }
  float offset()() {
    return Object_Getter__float(this.handle, "offset");
  }
}


