module spasm.bindings.HTMLTableElement;

import spasm.types;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLTableCaptionElement;
import spasm.bindings.HTMLTableSectionElement;

@safe:
nothrow:

struct HTMLTableElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void caption(T0)(scope auto ref Optional!(T0) caption) if (isTOrPointer!(T0, HTMLTableCaptionElement)) {
    HTMLTableElement_caption_Set(this._parent, !caption.empty, caption.front.handle);
  }
  auto caption()() {
    return Object_Getter__OptionalHandle(this._parent, "caption");
  }
  auto createCaption()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "createCaption"));
  }
  void deleteCaption()() {
    Object_Call__void(this._parent, "deleteCaption");
  }
  void tHead(T0)(scope auto ref Optional!(T0) tHead) if (isTOrPointer!(T0, HTMLTableSectionElement)) {
    HTMLTableElement_tHead_Set(this._parent, !tHead.empty, tHead.front.handle);
  }
  auto tHead()() {
    return Object_Getter__OptionalHandle(this._parent, "tHead");
  }
  auto createTHead()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "createTHead"));
  }
  void deleteTHead()() {
    Object_Call__void(this._parent, "deleteTHead");
  }
  void tFoot(T0)(scope auto ref Optional!(T0) tFoot) if (isTOrPointer!(T0, HTMLTableSectionElement)) {
    HTMLTableElement_tFoot_Set(this._parent, !tFoot.empty, tFoot.front.handle);
  }
  auto tFoot()() {
    return Object_Getter__OptionalHandle(this._parent, "tFoot");
  }
  auto createTFoot()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "createTFoot"));
  }
  void deleteTFoot()() {
    Object_Call__void(this._parent, "deleteTFoot");
  }
  auto tBodies()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "tBodies"));
  }
  auto createTBody()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "createTBody"));
  }
  auto rows()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "rows"));
  }
  auto insertRow()(int index /* = -1 */) {
    return HTMLElement(Object_Call_int__Handle(this._parent, "insertRow", index));
  }
  auto insertRow()() {
    return HTMLElement(Object_Getter__Handle(this._parent, "insertRow"));
  }
  void deleteRow()(int index) {
    Object_Call_int__void(this._parent, "deleteRow", index);
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void border()(string border) {
    Object_Call_string__void(this._parent, "border", border);
  }
  string border()() {
    return Object_Getter__string(this._parent, "border");
  }
  void frame()(string frame) {
    Object_Call_string__void(this._parent, "frame", frame);
  }
  string frame()() {
    return Object_Getter__string(this._parent, "frame");
  }
  void rules()(string rules) {
    Object_Call_string__void(this._parent, "rules", rules);
  }
  string rules()() {
    return Object_Getter__string(this._parent, "rules");
  }
  void summary()(string summary) {
    Object_Call_string__void(this._parent, "summary", summary);
  }
  string summary()() {
    return Object_Getter__string(this._parent, "summary");
  }
  void width()(string width) {
    Object_Call_string__void(this._parent, "width", width);
  }
  string width()() {
    return Object_Getter__string(this._parent, "width");
  }
  void bgColor()(string bgColor) {
    Object_Call_string__void(this._parent, "bgColor", bgColor);
  }
  string bgColor()() {
    return Object_Getter__string(this._parent, "bgColor");
  }
  void cellPadding()(string cellPadding) {
    Object_Call_string__void(this._parent, "cellPadding", cellPadding);
  }
  string cellPadding()() {
    return Object_Getter__string(this._parent, "cellPadding");
  }
  void cellSpacing()(string cellSpacing) {
    Object_Call_string__void(this._parent, "cellSpacing", cellSpacing);
  }
  string cellSpacing()() {
    return Object_Getter__string(this._parent, "cellSpacing");
  }
}


extern (C) void HTMLTableElement_caption_Set(Handle, bool, Handle);
extern (C) void HTMLTableElement_tHead_Set(Handle, bool, Handle);
extern (C) void HTMLTableElement_tFoot_Set(Handle, bool, Handle);