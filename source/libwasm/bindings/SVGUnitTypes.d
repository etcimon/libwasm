module libwasm.bindings.SVGUnitTypes;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct SVGUnitTypes {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SVG_UNIT_TYPE_UNKNOWN = 0;
  enum ushort SVG_UNIT_TYPE_USERSPACEONUSE = 1;
  enum ushort SVG_UNIT_TYPE_OBJECTBOUNDINGBOX = 2;
}


