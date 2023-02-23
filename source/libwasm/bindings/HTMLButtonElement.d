module libwasm.bindings.HTMLButtonElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.NodeList;
import libwasm.bindings.ValidityState;

@safe:
nothrow:

struct HTMLButtonElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void autofocus()(bool autofocus) {
    Object_Call_bool__void(this._parent, "autofocus", autofocus);
  }
  bool autofocus()() {
    return Object_Getter__bool(this._parent, "autofocus");
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
  void formAction()(string formAction) {
    Object_Call_string__void(this._parent, "formAction", formAction);
  }
  string formAction()() {
    return Object_Getter__string(this._parent, "formAction");
  }
  void formEnctype()(string formEnctype) {
    Object_Call_string__void(this._parent, "formEnctype", formEnctype);
  }
  string formEnctype()() {
    return Object_Getter__string(this._parent, "formEnctype");
  }
  void formMethod()(string formMethod) {
    Object_Call_string__void(this._parent, "formMethod", formMethod);
  }
  string formMethod()() {
    return Object_Getter__string(this._parent, "formMethod");
  }
  void formNoValidate()(bool formNoValidate) {
    Object_Call_bool__void(this._parent, "formNoValidate", formNoValidate);
  }
  bool formNoValidate()() {
    return Object_Getter__bool(this._parent, "formNoValidate");
  }
  void formTarget()(string formTarget) {
    Object_Call_string__void(this._parent, "formTarget", formTarget);
  }
  string formTarget()() {
    return Object_Getter__string(this._parent, "formTarget");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
  bool willValidate()() {
    return Object_Getter__bool(this._parent, "willValidate");
  }
  auto validity()() {
    return ValidityState(Object_Getter__Handle(this._parent, "validity"));
  }
  string validationMessage()() {
    return Object_Getter__string(this._parent, "validationMessage");
  }
  bool checkValidity()() {
    return Object_Getter__bool(this._parent, "checkValidity");
  }
  bool reportValidity()() {
    return Object_Getter__bool(this._parent, "reportValidity");
  }
  void setCustomValidity()(string error) {
    Object_Call_string__void(this._parent, "setCustomValidity", error);
  }
  auto labels()() {
    return NodeList(Object_Getter__Handle(this._parent, "labels"));
  }
}


