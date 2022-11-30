module libwasm.bindings.HTMLTableRowElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTableRowElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  int rowIndex()() {
    return Object_Getter__int(this._parent, "rowIndex");
  }
  int sectionRowIndex()() {
    return Object_Getter__int(this._parent, "sectionRowIndex");
  }
  auto cells()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "cells"));
  }
  auto insertCell()(int index /* = -1 */) {
    return HTMLElement(Object_Call_int__Handle(this._parent, "insertCell", index));
  }
  auto insertCell()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "insertCell"));
  }
  void deleteCell()(int index) {
    Object_Call_int__void(this._parent, "deleteCell", index);
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
  void bgColor()(string bgColor) {
    Object_Call_string__void(this._parent, "bgColor", bgColor);
  }
  string bgColor()() {
    return Object_Getter__string(this._parent, "bgColor");
  }
}


