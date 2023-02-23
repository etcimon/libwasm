module libwasm.bindings.HTMLSelectElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AutocompleteInfo;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.HTMLOptGroupElement;
import libwasm.bindings.HTMLOptionElement;
import libwasm.bindings.HTMLOptionsCollection;
import libwasm.bindings.NodeList;
import libwasm.bindings.ValidityState;

@safe:
nothrow:

struct HTMLSelectElement {
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
    return recastOpt!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
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
    return recastOpt!(Element)(Object_Call_uint__OptionalHandle(this._parent, "item", index));
  }
  auto namedItem()(string name) {
    return recastOpt!(HTMLOptionElement)(Object_Call_string__OptionalHandle(this._parent, "namedItem", name));
  }
  void add(T1)(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element, scope auto ref Optional!(T1) before /* = no!(SumType!(HTMLElement, int)) */) if (isTOrPointer!(T1, SumType!(HTMLElement, int))) {
    Serialize_Object_VarArgCall!void(this._parent, "add", "SumType!(Handle,Handle);Optional!SumType!(Handle,int)", tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => 0),((ref element.Types[1] v) => 1))(element),tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => cast(Handle)v.handle),((ref element.Types[1] v) => Handle.init))(element),libwasm.sumtype.match!(((ref element.Types[0] v) => Handle.init),((ref element.Types[1] v) => cast(Handle)v.handle))(element)), !before.empty, libwasm.sumtype.match!(((ref before.Types[0] v) => 0),((int v) => 1))(before),tuple(libwasm.sumtype.match!(((ref before.Types[0] v) => cast(Handle)v.handle),((int v) => Handle.init))(before),libwasm.sumtype.match!(((ref before.Types[0] v) => int.init),((int v) => v))(before))));
  }
  void add()(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element) {
    Serialize_Object_VarArgCall!void(this._parent, "add", "SumType!(Handle,Handle)", tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => 0),((ref element.Types[1] v) => 1))(element),tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => cast(Handle)v.handle),((ref element.Types[1] v) => Handle.init))(element),libwasm.sumtype.match!(((ref element.Types[0] v) => Handle.init),((ref element.Types[1] v) => cast(Handle)v.handle))(element))));
  }
  void remove()(int index) {
    Object_Call_int__void(this._parent, "remove", index);
  }
  void opIndexAssign(T1)(scope auto ref Optional!(T0) option, uint index) if (isTOrPointer!(T1, HTMLOptionElement)) {
    Serialize_Object_VarArgCall!void(this._parent, "setter", "uint;Optional!Handle", tuple(index, !option.empty, cast(Handle)option.front._parent));
  }
  void opDispatch(uint index)(scope auto ref Optional!(T0) option) if (isTOrPointer!(T1, HTMLOptionElement)) {
    Serialize_Object_VarArgCall!void(this._parent, "setter", "Optional!Handle", tuple(index, !option.empty, cast(Handle)option.front._parent));
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


