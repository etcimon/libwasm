module spasm.bindings.HTMLFormElement;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLFormElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void acceptCharset()(string acceptCharset) {
    Object_Call_string__void(this._parent, "acceptCharset", acceptCharset);
  }
  string acceptCharset()() {
    return Object_Getter__string(this._parent, "acceptCharset");
  }
  void action()(string action) {
    Object_Call_string__void(this._parent, "action", action);
  }
  string action()() {
    return Object_Getter__string(this._parent, "action");
  }
  void autocomplete()(string autocomplete) {
    Object_Call_string__void(this._parent, "autocomplete", autocomplete);
  }
  string autocomplete()() {
    return Object_Getter__string(this._parent, "autocomplete");
  }
  void enctype()(string enctype) {
    Object_Call_string__void(this._parent, "enctype", enctype);
  }
  string enctype()() {
    return Object_Getter__string(this._parent, "enctype");
  }
  void encoding()(string encoding) {
    Object_Call_string__void(this._parent, "encoding", encoding);
  }
  string encoding()() {
    return Object_Getter__string(this._parent, "encoding");
  }
  void method()(string method) {
    Object_Call_string__void(this._parent, "method", method);
  }
  string method()() {
    return Object_Getter__string(this._parent, "method");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void noValidate()(bool noValidate) {
    Object_Call_bool__void(this._parent, "noValidate", noValidate);
  }
  bool noValidate()() {
    return Object_Getter__bool(this._parent, "noValidate");
  }
  void target()(string target) {
    Object_Call_string__void(this._parent, "target", target);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
  auto elements()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "elements"));
  }
  int length()() {
    return Object_Getter__int(this._parent, "length");
  }
  auto opIndex()(uint index) {
    return Element(Object_Call_uint__Handle(this._parent, "getter", index));
  }
  auto opDispatch(uint index)() {
    return Element(Object_Call_uint__Handle(this._parent, "getter", index));
  }
  auto opIndex()(string name) {
    return nsISupports(Object_Call_string__Handle(this._parent, "getter", name));
  }
  auto opDispatch(string name)() {
    return nsISupports(Object_Call_string__Handle(this._parent, "getter", name));
  }
  void submit()() {
    Object_Call__void(this._parent, "submit");
  }
  void reset()() {
    Object_Call__void(this._parent, "reset");
  }
  bool checkValidity()() {
    return Object_Getter__bool(this._parent, "checkValidity");
  }
  bool reportValidity()() {
    return Object_Getter__bool(this._parent, "reportValidity");
  }
}


