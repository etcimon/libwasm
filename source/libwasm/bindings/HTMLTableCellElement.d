module libwasm.bindings.HTMLTableCellElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTableCellElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void colSpan()(uint colSpan) {
    Object_Call_uint__void(this._parent, "colSpan", colSpan);
  }
  uint colSpan()() {
    return Object_Getter__uint(this._parent, "colSpan");
  }
  void rowSpan()(uint rowSpan) {
    Object_Call_uint__void(this._parent, "rowSpan", rowSpan);
  }
  uint rowSpan()() {
    return Object_Getter__uint(this._parent, "rowSpan");
  }
  void headers()(string headers) {
    Object_Call_string__void(this._parent, "headers", headers);
  }
  string headers()() {
    return Object_Getter__string(this._parent, "headers");
  }
  int cellIndex()() {
    return Object_Getter__int(this._parent, "cellIndex");
  }
  void abbr()(string abbr) {
    Object_Call_string__void(this._parent, "abbr", abbr);
  }
  string abbr()() {
    return Object_Getter__string(this._parent, "abbr");
  }
  void scope_()(string scope_) {
    Object_Call_string__void(this._parent, "scope", scope_);
  }
  string scope_()() {
    return Object_Getter__string(this._parent, "scope");
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void axis()(string axis) {
    Object_Call_string__void(this._parent, "axis", axis);
  }
  string axis()() {
    return Object_Getter__string(this._parent, "axis");
  }
  void height()(string height) {
    Object_Call_string__void(this._parent, "height", height);
  }
  string height()() {
    return Object_Getter__string(this._parent, "height");
  }
  void width()(string width) {
    Object_Call_string__void(this._parent, "width", width);
  }
  string width()() {
    return Object_Getter__string(this._parent, "width");
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
  void noWrap()(bool noWrap) {
    Object_Call_bool__void(this._parent, "noWrap", noWrap);
  }
  bool noWrap()() {
    return Object_Getter__bool(this._parent, "noWrap");
  }
  void vAlign()(string vAlign) {
    Object_Call_string__void(this._parent, "vAlign", vAlign);
  }
  string vAlign()() {
    return Object_Getter__string(this._parent, "vAlign");
  }
  void bgColor()(string bgColor) {
    Object_Call_string__void(this._parent, "bgColor", bgColor);
  }
  string bgColor()() {
    return Object_Getter__string(this._parent, "bgColor");
  }
}


