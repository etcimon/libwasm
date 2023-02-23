module libwasm.bindings.TreeColumn;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.TreeColumns;

@safe:
nothrow:

struct TreeColumn {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto element()() {
    return Element(Object_Getter__Handle(this.handle, "element"));
  }
  auto columns()() {
    return recastOpt!(TreeColumns)(Object_Getter__OptionalHandle(this.handle, "columns"));
  }
  int x()() {
    return Object_Getter__int(this.handle, "x");
  }
  int width()() {
    return Object_Getter__int(this.handle, "width");
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  int index()() {
    return Object_Getter__int(this.handle, "index");
  }
  bool primary()() {
    return Object_Getter__bool(this.handle, "primary");
  }
  bool cycler()() {
    return Object_Getter__bool(this.handle, "cycler");
  }
  bool editable()() {
    return Object_Getter__bool(this.handle, "editable");
  }
  enum short TYPE_TEXT = 1;
  enum short TYPE_CHECKBOX = 2;
  enum short TYPE_PASSWORD = 3;
  short type()() {
    return Serialize_Object_VarArgCall!short(this.handle, "type", "", tuple());
  }
  auto getNext()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getNext"));
  }
  auto getPrevious()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getPrevious"));
  }
  auto previousColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "previousColumn"));
  }
  void invalidate()() {
    Object_Call__void(this.handle, "invalidate");
  }
}


