module libwasm.bindings.MediaList;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct MediaList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void mediaText()(string mediaText) {
    Object_Call_string__void(this.handle, "mediaText", mediaText);
  }
  string mediaText()() {
    return Object_Getter__string(this.handle, "mediaText");
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  Optional!(string) item()(uint index) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "item", "uint", tuple(index));
  }
  void deleteMedium()(string oldMedium) {
    Object_Call_string__void(this.handle, "deleteMedium", oldMedium);
  }
  void appendMedium()(string newMedium) {
    Object_Call_string__void(this.handle, "appendMedium", newMedium);
  }
}


