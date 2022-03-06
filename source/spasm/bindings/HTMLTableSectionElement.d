module spasm.bindings.HTMLTableSectionElement;

import spasm.types;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTableSectionElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto rows()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "rows"));
  }
  auto insertRow()(int index /* = -1 */) {
    return HTMLElement(Object_Call_int__Handle(this._parent, "insertRow", index));
  }
  auto insertRow()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "insertRow"));
  }
  void deleteRow()(int index) {
    Object_Call_int__void(this._parent, "deleteRow", index);
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void ch()(string ch) {
    Object_Call_string__void(this._parent, "ch", ch);
  }
  string ch()() {
    return Object_Getter__string(this._parent, "ch");
  }
  void chOff()(string chOff) {
    Object_Call_string__void(this._parent, "chOff", chOff);
  }
  string chOff()() {
    return Object_Getter__string(this._parent, "chOff");
  }
  void vAlign()(string vAlign) {
    Object_Call_string__void(this._parent, "vAlign", vAlign);
  }
  string vAlign()() {
    return Object_Getter__string(this._parent, "vAlign");
  }
}


