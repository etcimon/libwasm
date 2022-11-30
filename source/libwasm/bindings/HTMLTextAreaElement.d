module libwasm.bindings.HTMLTextAreaElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.HTMLInputElement;
import libwasm.bindings.NodeList;
import libwasm.bindings.ValidityState;

@safe:
nothrow:

struct HTMLTextAreaElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void autocomplete()(string autocomplete) {
    Object_Call_string__void(this._parent, "autocomplete", autocomplete);
  }
  string autocomplete()() {
    return Object_Getter__string(this._parent, "autocomplete");
  }
  void autofocus()(bool autofocus) {
    Object_Call_bool__void(this._parent, "autofocus", autofocus);
  }
  bool autofocus()() {
    return Object_Getter__bool(this._parent, "autofocus");
  }
  void cols()(uint cols) {
    Object_Call_uint__void(this._parent, "cols", cols);
  }
  uint cols()() {
    return Object_Getter__uint(this._parent, "cols");
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  auto form()() {
    return Optional!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
  }
  void maxLength()(int maxLength) {
    Object_Call_int__void(this._parent, "maxLength", maxLength);
  }
  int maxLength()() {
    return Object_Getter__int(this._parent, "maxLength");
  }
  void minLength()(int minLength) {
    Object_Call_int__void(this._parent, "minLength", minLength);
  }
  int minLength()() {
    return Object_Getter__int(this._parent, "minLength");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void placeholder()(string placeholder) {
    Object_Call_string__void(this._parent, "placeholder", placeholder);
  }
  string placeholder()() {
    return Object_Getter__string(this._parent, "placeholder");
  }
  void readOnly()(bool readOnly) {
    Object_Call_bool__void(this._parent, "readOnly", readOnly);
  }
  bool readOnly()() {
    return Object_Getter__bool(this._parent, "readOnly");
  }
  void required()(bool required) {
    Object_Call_bool__void(this._parent, "required", required);
  }
  bool required()() {
    return Object_Getter__bool(this._parent, "required");
  }
  void rows()(uint rows) {
    Object_Call_uint__void(this._parent, "rows", rows);
  }
  uint rows()() {
    return Object_Getter__uint(this._parent, "rows");
  }
  void wrap()(string wrap) {
    Object_Call_string__void(this._parent, "wrap", wrap);
  }
  string wrap()() {
    return Object_Getter__string(this._parent, "wrap");
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void defaultValue()(string defaultValue) {
    Object_Call_string__void(this._parent, "defaultValue", defaultValue);
  }
  string defaultValue()() {
    return Object_Getter__string(this._parent, "defaultValue");
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
  uint textLength()() {
    return Object_Getter__uint(this._parent, "textLength");
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
  void select()() {
    Object_Call__void(this._parent, "select");
  }
  void selectionStart(T0)(scope auto ref Optional!(T0) selectionStart) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionStart", "Optional!(uint)", tuple(!selectionStart.empty, selectionStart.front));
  }
  Optional!(uint) selectionStart()() {
    return Object_Getter__OptionalUint(this._parent, "selectionStart");
  }
  void selectionEnd(T0)(scope auto ref Optional!(T0) selectionEnd) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionEnd", "Optional!(uint)", tuple(!selectionEnd.empty, selectionEnd.front));
  }
  Optional!(uint) selectionEnd()() {
    return Object_Getter__OptionalUint(this._parent, "selectionEnd");
  }
  void selectionDirection(T0)(scope auto ref Optional!(T0) selectionDirection) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionDirection", "Optional!(string)", tuple(!selectionDirection.empty, selectionDirection.front));
  }
  Optional!(string) selectionDirection()() {
    return Object_Getter__OptionalString(this._parent, "selectionDirection");
  }
  void setRangeText()(string replacement) {
    Object_Call_string__void(this._parent, "setRangeText", replacement);
  }
  void setRangeText()(string replacement, uint start, uint end, SelectionMode selectionMode /* = "preserve" */) {
    Serialize_Object_VarArgCall!void(this._parent, "setRangeText", "string;uint;uint;Enum", tuple(replacement, start, end, selectionMode));
  }
  void setRangeText()(string replacement, uint start, uint end) {
    Serialize_Object_VarArgCall!void(this._parent, "setRangeText", "string;uint;uint", tuple(replacement, start, end));
  }
  void setSelectionRange()(uint start, uint end, string direction) {
    Serialize_Object_VarArgCall!void(this._parent, "setSelectionRange", "uint;uint;string", tuple(start, end, direction));
  }
  void setSelectionRange()(uint start, uint end) {
    Serialize_Object_VarArgCall!void(this._parent, "setSelectionRange", "uint;uint", tuple(start, end));
  }
  auto controllers()() {
    return XULControllers(Object_Getter__Handle(this._parent, "controllers"));
  }
  void previewValue()(string previewValue) {
    Object_Call_string__void(this._parent, "previewValue", previewValue);
  }
  string previewValue()() {
    return Object_Getter__string(this._parent, "previewValue");
  }
  auto editor()() {
    return Optional!(nsIEditor)(Object_Getter__OptionalHandle(this._parent, "editor"));
  }
  bool isInputEventTarget()() {
    return Object_Getter__bool(this._parent, "isInputEventTarget");
  }
  void setUserInput()(string input) {
    Object_Call_string__void(this._parent, "setUserInput", input);
  }
}


