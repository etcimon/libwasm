module libwasm.bindings.HTMLMenuItemElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLMenuItemElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void label()(string label) {
    Object_Call_string__void(this._parent, "label", label);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void icon()(string icon) {
    Object_Call_string__void(this._parent, "icon", icon);
  }
  string icon()() {
    return Object_Getter__string(this._parent, "icon");
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  void checked()(bool checked) {
    Object_Call_bool__void(this._parent, "checked", checked);
  }
  bool checked()() {
    return Object_Getter__bool(this._parent, "checked");
  }
  void radiogroup()(string radiogroup) {
    Object_Call_string__void(this._parent, "radiogroup", radiogroup);
  }
  string radiogroup()() {
    return Object_Getter__string(this._parent, "radiogroup");
  }
  void defaultChecked()(bool defaultChecked) {
    Object_Call_bool__void(this._parent, "defaultChecked", defaultChecked);
  }
  bool defaultChecked()() {
    return Object_Getter__bool(this._parent, "defaultChecked");
  }
}


