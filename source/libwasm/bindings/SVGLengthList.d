module libwasm.bindings.SVGLengthList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGLength;

@safe:
nothrow:

struct SVGLengthList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint numberOfItems()() {
    return Object_Getter__uint(this.handle, "numberOfItems");
  }
  void clear()() {
    Object_Call__void(this.handle, "clear");
  }
  auto initialize()(scope ref SVGLength newItem) {
    return SVGLength(Object_Call_Handle__Handle(this.handle, "initialize", newItem.handle));
  }
  auto getItem()(uint index) {
    return SVGLength(Object_Call_uint__Handle(this.handle, "getItem", index));
  }
  auto insertItemBefore()(scope ref SVGLength newItem, uint index) {
    return SVGLength(Serialize_Object_VarArgCall!Handle(this.handle, "insertItemBefore", "Handle;uint", tuple(cast(Handle)newItem.handle, index)));
  }
  auto replaceItem()(scope ref SVGLength newItem, uint index) {
    return SVGLength(Serialize_Object_VarArgCall!Handle(this.handle, "replaceItem", "Handle;uint", tuple(cast(Handle)newItem.handle, index)));
  }
  auto removeItem()(uint index) {
    return SVGLength(Object_Call_uint__Handle(this.handle, "removeItem", index));
  }
  auto appendItem()(scope ref SVGLength newItem) {
    return SVGLength(Object_Call_Handle__Handle(this.handle, "appendItem", newItem.handle));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


