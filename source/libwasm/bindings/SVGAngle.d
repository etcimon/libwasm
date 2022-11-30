module libwasm.bindings.SVGAngle;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct SVGAngle {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SVG_ANGLETYPE_UNKNOWN = 0;
  enum ushort SVG_ANGLETYPE_UNSPECIFIED = 1;
  enum ushort SVG_ANGLETYPE_DEG = 2;
  enum ushort SVG_ANGLETYPE_RAD = 3;
  enum ushort SVG_ANGLETYPE_GRAD = 4;
  ushort unitType()() {
    return Object_Getter__ushort(this.handle, "unitType");
  }
  void value()(float value) {
    Object_Call_float__void(this.handle, "value", value);
  }
  float value()() {
    return Object_Getter__float(this.handle, "value");
  }
  void valueInSpecifiedUnits()(float valueInSpecifiedUnits) {
    Object_Call_float__void(this.handle, "valueInSpecifiedUnits", valueInSpecifiedUnits);
  }
  float valueInSpecifiedUnits()() {
    return Object_Getter__float(this.handle, "valueInSpecifiedUnits");
  }
  void valueAsString()(string valueAsString) {
    Object_Call_string__void(this.handle, "valueAsString", valueAsString);
  }
  string valueAsString()() {
    return Object_Getter__string(this.handle, "valueAsString");
  }
  void newValueSpecifiedUnits()(ushort unitType, float valueInSpecifiedUnits) {
    Serialize_Object_VarArgCall!void(this.handle, "newValueSpecifiedUnits", "ushort;float", tuple(unitType, valueInSpecifiedUnits));
  }
  void convertToSpecifiedUnits()(ushort unitType) {
    Serialize_Object_VarArgCall!void(this.handle, "convertToSpecifiedUnits", "ushort", tuple(unitType));
  }
}


