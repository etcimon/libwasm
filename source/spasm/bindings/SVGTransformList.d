module spasm.bindings.SVGTransformList;

import spasm.types;
import spasm.bindings.SVGMatrix;
import spasm.bindings.SVGTransform;

@safe:
nothrow:

struct SVGTransformList {
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
  auto initialize()(scope ref SVGTransform newItem) {
    return SVGTransform(Object_Call_Handle__Handle(this.handle, "initialize", newItem.handle));
  }
  auto getItem()(uint index) {
    return SVGTransform(Object_Call_uint__Handle(this.handle, "getItem", index));
  }
  auto insertItemBefore()(scope ref SVGTransform newItem, uint index) {
    return SVGTransform(SVGTransformList_insertItemBefore(this.handle, newItem.handle, index));
  }
  auto replaceItem()(scope ref SVGTransform newItem, uint index) {
    return SVGTransform(SVGTransformList_replaceItem(this.handle, newItem.handle, index));
  }
  auto removeItem()(uint index) {
    return SVGTransform(Object_Call_uint__Handle(this.handle, "removeItem", index));
  }
  auto appendItem()(scope ref SVGTransform newItem) {
    return SVGTransform(Object_Call_Handle__Handle(this.handle, "appendItem", newItem.handle));
  }
  auto createSVGTransformFromMatrix()(scope ref SVGMatrix matrix) {
    return SVGTransform(Object_Call_Handle__Handle(this.handle, "createSVGTransformFromMatrix", matrix.handle));
  }
  auto consolidate()() {
    return Object_Getter__OptionalHandle(this.handle, "consolidate");
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


extern (C) Handle SVGTransformList_insertItemBefore(Handle, Handle, uint);
extern (C) Handle SVGTransformList_replaceItem(Handle, Handle, uint);