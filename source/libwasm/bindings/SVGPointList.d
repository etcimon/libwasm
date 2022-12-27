module libwasm.bindings.SVGPointList;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGPoint;

@safe:
nothrow:

struct SVGPointList {
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
  auto initialize()(scope ref SVGPoint newItem) {
    return SVGPoint(Object_Call_Handle__Handle(this.handle, "initialize", newItem.handle));
  }
  auto getItem()(uint index) {
    return SVGPoint(Object_Call_uint__Handle(this.handle, "getItem", index));
  }
  auto insertItemBefore()(scope ref SVGPoint newItem, uint index) {
    return SVGPoint(Serialize_Object_VarArgCall!Handle(this.handle, "insertItemBefore", "Handle;uint", tuple(cast(Handle)newItem.handle, index)));
  }
  auto replaceItem()(scope ref SVGPoint newItem, uint index) {
    return SVGPoint(Serialize_Object_VarArgCall!Handle(this.handle, "replaceItem", "Handle;uint", tuple(cast(Handle)newItem.handle, index)));
  }
  auto removeItem()(uint index) {
    return SVGPoint(Object_Call_uint__Handle(this.handle, "removeItem", index));
  }
  auto appendItem()(scope ref SVGPoint newItem) {
    return SVGPoint(Object_Call_Handle__Handle(this.handle, "appendItem", newItem.handle));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


