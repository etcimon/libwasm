module spasm.bindings.StyleSheet;

import spasm.types;
import spasm.bindings.MediaList;
import spasm.bindings.Node;

@safe:
nothrow:

struct StyleSheet {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  Optional!(string) href()() {
    return Object_Getter__OptionalString(this.handle, "href");
  }
  auto ownerNode()() {
    return Object_Getter__OptionalHandle(this.handle, "ownerNode");
  }
  auto parentStyleSheet()() {
    return Object_Getter__OptionalHandle(this.handle, "parentStyleSheet");
  }
  Optional!(string) title()() {
    return Object_Getter__OptionalString(this.handle, "title");
  }
  auto media()() {
    return MediaList(Object_Getter__Handle(this.handle, "media"));
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this.handle, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this.handle, "disabled");
  }
  string sourceMapURL()() {
    return Object_Getter__string(this.handle, "sourceMapURL");
  }
  string sourceURL()() {
    return Object_Getter__string(this.handle, "sourceURL");
  }
}


