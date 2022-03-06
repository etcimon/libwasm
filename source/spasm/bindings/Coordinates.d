module spasm.bindings.Coordinates;

import spasm.types;
@safe:
nothrow:

struct Coordinates {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double latitude()() {
    return Object_Getter__double(this.handle, "latitude");
  }
  double longitude()() {
    return Object_Getter__double(this.handle, "longitude");
  }
  Optional!(double) altitude()() {
    return Object_Getter__OptionalDouble(this.handle, "altitude");
  }
  double accuracy()() {
    return Object_Getter__double(this.handle, "accuracy");
  }
  Optional!(double) altitudeAccuracy()() {
    return Object_Getter__OptionalDouble(this.handle, "altitudeAccuracy");
  }
  Optional!(double) heading()() {
    return Object_Getter__OptionalDouble(this.handle, "heading");
  }
  Optional!(double) speed()() {
    return Object_Getter__OptionalDouble(this.handle, "speed");
  }
}


