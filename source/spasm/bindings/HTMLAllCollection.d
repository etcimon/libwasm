module spasm.bindings.HTMLAllCollection;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;

@safe:
nothrow:

struct HTMLAllCollection {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto opIndex()(uint index) {
    return Element(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto opDispatch(uint index)() {
    return Element(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto namedItem()(string name) {
    return HTMLAllCollection_namedItem_getter(this.handle, name);
  }
  auto item()(string nameOrIndex) {
    return HTMLAllCollection_item(this.handle, nameOrIndex);
  }
  auto item()() {
    return HTMLAllCollection_item_0(this.handle);
  }
  auto opIndex()(string nameOrIndex) {
    return HTMLAllCollection_getter__string(this.handle, nameOrIndex);
  }
  auto opDispatch(string nameOrIndex)() {
    return HTMLAllCollection_getter__string(this.handle, nameOrIndex);
  }
}


extern (C) Optional!(SumType!(HTMLCollection, Element)) HTMLAllCollection_namedItem_getter(Handle, string);
extern (C) Optional!(SumType!(HTMLCollection, Element)) HTMLAllCollection_item(Handle, string);
extern (C) Optional!(SumType!(HTMLCollection, Element)) HTMLAllCollection_item_0(Handle);
extern (C) Optional!(SumType!(HTMLCollection, Element)) HTMLAllCollection_getter__string(Handle, string);