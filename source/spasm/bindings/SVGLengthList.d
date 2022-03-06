module spasm.bindings.SVGLengthList;

import spasm.types;
import spasm.bindings.SVGLength;

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
    return SVGLength(SVGLengthList_insertItemBefore(this.handle, newItem.handle, index));
  }
  auto replaceItem()(scope ref SVGLength newItem, uint index) {
    return SVGLength(SVGLengthList_replaceItem(this.handle, newItem.handle, index));
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


extern (C) Handle SVGLengthList_insertItemBefore(Handle, Handle, uint);
extern (C) Handle SVGLengthList_replaceItem(Handle, Handle, uint);