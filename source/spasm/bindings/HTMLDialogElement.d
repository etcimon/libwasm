module spasm.bindings.HTMLDialogElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDialogElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void open()(bool open) {
    Object_Call_bool__void(this._parent, "open", open);
  }
  bool open()() {
    return Object_Getter__bool(this._parent, "open");
  }
  void returnValue()(string returnValue) {
    Object_Call_string__void(this._parent, "returnValue", returnValue);
  }
  string returnValue()() {
    return Object_Getter__string(this._parent, "returnValue");
  }
  void show()() {
    Object_Call__void(this._parent, "show");
  }
  void showModal()() {
    Object_Call__void(this._parent, "showModal");
  }
  void close()(string returnValue) {
    Object_Call_string__void(this._parent, "close", returnValue);
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
}


