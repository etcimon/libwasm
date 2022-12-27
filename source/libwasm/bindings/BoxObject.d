module libwasm.bindings.BoxObject;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;

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
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "element"));
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
    return recastOpt!(nsISupports)(Object_Call_string__OptionalHandle(this.handle, "getPropertyAsSupports", propertyName));
  }
  void setPropertyAsSupports()(string propertyName, scope ref nsISupports value) {
    Serialize_Object_VarArgCall!void(this.handle, "setPropertyAsSupports", "string;Handle", tuple(propertyName, cast(Handle)value.handle));
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
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "parentBox"));
  }
  auto firstChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "firstChild"));
  }
  auto lastChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "lastChild"));
  }
  auto nextSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "nextSibling"));
  }
  auto previousSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "previousSibling"));
  }
}


