module spasm.bindings.HTMLSelectElement;

import spasm.types;
import spasm.bindings.AutocompleteInfo;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLFormElement;
import spasm.bindings.HTMLOptGroupElement;
import spasm.bindings.HTMLOptionElement;
import spasm.bindings.HTMLOptionsCollection;
import spasm.bindings.NodeList;
import spasm.bindings.ValidityState;

@safe:
nothrow:

struct HTMLSelectElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
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
  void autocomplete()(string autocomplete) {
    Object_Call_string__void(this._parent, "autocomplete", autocomplete);
  }
  string autocomplete()() {
    return Object_Getter__string(this._parent, "autocomplete");
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  auto form()() {
    return Object_Getter__OptionalHandle(this._parent, "form");
  }
  void multiple()(bool multiple) {
    Object_Call_bool__void(this._parent, "multiple", multiple);
  }
  bool multiple()() {
    return Object_Getter__bool(this._parent, "multiple");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void required()(bool required) {
    Object_Call_bool__void(this._parent, "required", required);
  }
  bool required()() {
    return Object_Getter__bool(this._parent, "required");
  }
  void size()(uint size) {
    Object_Call_uint__void(this._parent, "size", size);
  }
  uint size()() {
    return Object_Getter__uint(this._parent, "size");
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  auto options()() {
    return HTMLOptionsCollection(Object_Getter__Handle(this._parent, "options"));
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  auto item()(uint index) {
    return Object_Call_uint__OptionalHandle(this._parent, "item", index);
  }
  auto namedItem()(string name) {
    return Object_Call_string__OptionalHandle(this._parent, "namedItem", name);
  }
  void add(T1)(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element, scope auto ref Optional!(T1) before /* = no!(SumType!(HTMLElement, int)) */) if (isTOrPointer!(T1, SumType!(HTMLElement, int))) {
    HTMLSelectElement_add(this._parent, element, !before.empty, *before.frontRef);
  }
  void add()(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element) {
    HTMLSelectElement_add_0(this._parent, element);
  }
  void remove()(int index) {
    Object_Call_int__void(this._parent, "remove", index);
  }
  void opIndexAssign(T1)(scope auto ref Optional!(T0) option, uint index) if (isTOrPointer!(T1, HTMLOptionElement)) {
    HTMLSelectElement_setter__uint_optional_Handle(this._parent, index, !option.empty, option.front._parent);
  }
  void opDispatch(uint index)(scope auto ref Optional!(T0) option) if (isTOrPointer!(T1, HTMLOptionElement)) {
    HTMLSelectElement_setter__uint_optional_Handle(this._parent, index, !option.empty, option.front._parent);
  }
  auto selectedOptions()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "selectedOptions"));
  }
  void selectedIndex()(int selectedIndex) {
    Object_Call_int__void(this._parent, "selectedIndex", selectedIndex);
  }
  int selectedIndex()() {
    return Object_Getter__int(this._parent, "selectedIndex");
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
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
  void openInParentProcess()(bool openInParentProcess) {
    Object_Call_bool__void(this._parent, "openInParentProcess", openInParentProcess);
  }
  bool openInParentProcess()() {
    return Object_Getter__bool(this._parent, "openInParentProcess");
  }
  auto getAutocompleteInfo()() {
    return AutocompleteInfo(Object_Getter__Handle(this._parent, "getAutocompleteInfo"));
  }
  void previewValue()(string previewValue) {
    Object_Call_string__void(this._parent, "previewValue", previewValue);
  }
  string previewValue()() {
    return Object_Getter__string(this._parent, "previewValue");
  }
}


extern (C) void HTMLSelectElement_add(Handle, scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement), bool, scope ref SumType!(HTMLElement, int));
extern (C) void HTMLSelectElement_add_0(Handle, scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement));
extern (C) void HTMLSelectElement_setter__uint_optional_Handle(Handle, uint, bool, Handle);