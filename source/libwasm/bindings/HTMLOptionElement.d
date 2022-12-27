module libwasm.bindings.HTMLOptionElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;

@safe:
nothrow:

struct HTMLOptionElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  auto form()() {
    return recastOpt!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
  }
  void label()(string label) {
    Object_Call_string__void(this._parent, "label", label);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void defaultSelected()(bool defaultSelected) {
    Object_Call_bool__void(this._parent, "defaultSelected", defaultSelected);
  }
  bool defaultSelected()() {
    return Object_Getter__bool(this._parent, "defaultSelected");
  }
  void selected()(bool selected) {
    Object_Call_bool__void(this._parent, "selected", selected);
  }
  bool selected()() {
    return Object_Getter__bool(this._parent, "selected");
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  int index()() {
    return Object_Getter__int(this._parent, "index");
  }
}


