module libwasm.bindings.PluginArray;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Plugin;

@safe:
nothrow:

struct PluginArray {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return recastOpt!(Plugin)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  auto namedItem()(string name) {
    return recastOpt!(Plugin)(Object_Call_string__OptionalHandle(this.handle, "namedItem", name));
  }
  void refresh()(bool reloadDocuments /* = false */) {
    Object_Call_bool__void(this.handle, "refresh", reloadDocuments);
  }
  void refresh()() {
    Object_Call__void(this.handle, "refresh");
  }
}


