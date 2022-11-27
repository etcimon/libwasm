module canvas;

import libwasm.types;
import libwasm.spa;
import libwasm.dom;

nothrow:
@safe:

struct Canvas {
  mixin Slot!"toggle";
  mixin Node!"canvas";
  @prop id = "c";
  @prop width = 320;
  @prop height = 180;
}
