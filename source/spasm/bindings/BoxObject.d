module spasm.bindings.BoxObject;

import spasm.types;
import spasm.bindings.Element;

@safe:
nothrow:

struct BoxObject {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto element()() {
    return Object_Getter__OptionalHandle(this.handle, "element");
  }
  int x()() {
    return Object_Getter__int(this.handle, "x");
  }
  int y()() {
    return Object_Getter__int(this.handle, "y");
  }
  int screenX()() {
    return Object_Getter__int(this.handle, "screenX");
  }
  int screenY()() {
    return Object_Getter__int(this.handle, "screenY");
  }
  int width()() {
    return Object_Getter__int(this.handle, "width");
  }
  int height()() {
    return Object_Getter__int(this.handle, "height");
  }
  auto getPropertyAsSupports()(string propertyName) {
    return Object_Call_string__OptionalHandle(this.handle, "getPropertyAsSupports", propertyName);
  }
  void setPropertyAsSupports()(string propertyName, scope ref nsISupports value) {
    BoxObject_setPropertyAsSupports(this.handle, propertyName, value.handle);
  }
  Optional!(string) getProperty()(string propertyName) {
    return Object_Call_string__OptionalString(this.handle, "getProperty", propertyName);
  }
  void setProperty()(string propertyName, string propertyValue) {
    Object_Call_string_string__void(this.handle, "setProperty", propertyName, propertyValue);
  }
  void removeProperty()(string propertyName) {
    Object_Call_string__void(this.handle, "removeProperty", propertyName);
  }
  auto parentBox()() {
    return Object_Getter__OptionalHandle(this.handle, "parentBox");
  }
  auto firstChild()() {
    return Object_Getter__OptionalHandle(this.handle, "firstChild");
  }
  auto lastChild()() {
    return Object_Getter__OptionalHandle(this.handle, "lastChild");
  }
  auto nextSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "nextSibling");
  }
  auto previousSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "previousSibling");
  }
}


extern (C) void BoxObject_setPropertyAsSupports(Handle, string, Handle);