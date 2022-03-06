module spasm.bindings.AudioListener;

import spasm.types;
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
    AudioListener_setPosition(this.handle, x, y, z);
  }
  void setOrientation()(double x, double y, double z, double xUp, double yUp, double zUp) {
    AudioListener_setOrientation(this.handle, x, y, z, xUp, yUp, zUp);
  }
}


extern (C) void AudioListener_setPosition(Handle, double, double, double);
extern (C) void AudioListener_setOrientation(Handle, double, double, double, double, double, double);