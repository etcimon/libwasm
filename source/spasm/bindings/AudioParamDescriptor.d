module spasm.bindings.AudioParamDescriptor;

import spasm.types;
@safe:
nothrow:

struct AudioParamDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioParamDescriptor(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void defaultValue()(float defaultValue) {
    Object_Call_float__void(this.handle, "defaultValue", defaultValue);
  }
  float defaultValue()() {
    return Object_Getter__float(this.handle, "defaultValue");
  }
  void minValue()(float minValue) {
    Object_Call_float__void(this.handle, "minValue", minValue);
  }
  float minValue()() {
    return Object_Getter__float(this.handle, "minValue");
  }
  void maxValue()(float maxValue) {
    Object_Call_float__void(this.handle, "maxValue", maxValue);
  }
  float maxValue()() {
    return Object_Getter__float(this.handle, "maxValue");
  }
}


