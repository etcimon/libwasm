module libwasm.bindings.VideoTrack;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct VideoTrack {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  string kind()() {
    return Object_Getter__string(this.handle, "kind");
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  string language()() {
    return Object_Getter__string(this.handle, "language");
  }
  void selected()(bool selected) {
    Object_Call_bool__void(this.handle, "selected", selected);
  }
  bool selected()() {
    return Object_Getter__bool(this.handle, "selected");
  }
}


