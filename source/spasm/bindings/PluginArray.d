module spasm.bindings.PluginArray;

import spasm.types;
import spasm.bindings.Plugin;

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
    return Object_Call_uint__OptionalHandle(this.handle, "item", index);
  }
  auto namedItem()(string name) {
    return Object_Call_string__OptionalHandle(this.handle, "namedItem", name);
  }
  void refresh()(bool reloadDocuments /* = false */) {
    Object_Call_bool__void(this.handle, "refresh", reloadDocuments);
  }
  void refresh()() {
    Object_Call__void(this.handle, "refresh");
  }
}


