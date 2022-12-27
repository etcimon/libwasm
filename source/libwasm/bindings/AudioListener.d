module libwasm.bindings.AudioListener;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct AudioListener {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void setPosition()(double x, double y, double z) {
    Serialize_Object_VarArgCall!void(this.handle, "setPosition", "double;double;double", tuple(x, y, z));
  }
  void setOrientation()(double x, double y, double z, double xUp, double yUp, double zUp) {
    Serialize_Object_VarArgCall!void(this.handle, "setOrientation", "double;double;double;double;double;double", tuple(x, y, z, xUp, yUp, zUp));
  }
}


