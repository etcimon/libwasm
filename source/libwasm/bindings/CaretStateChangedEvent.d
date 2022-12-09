module libwasm.bindings.CaretStateChangedEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMRect;
import libwasm.bindings.Event;

@safe:
nothrow:

enum CaretChangedReason {
  visibilitychange,
  updateposition,
  longpressonemptycontent,
  taponcaret,
  presscaret,
  releasecaret,
  scroll
}
struct CaretStateChangedEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  bool collapsed()() {
    return Object_Getter__bool(this._parent, "collapsed");
  }
  auto boundingClientRect()() {
    return recastOpt!(DOMRectReadOnly)(Object_Getter__OptionalHandle(this._parent, "boundingClientRect"));
  }
  CaretChangedReason reason()() {
    return Object_Getter__int(this._parent, "reason");
  }
  bool caretVisible()() {
    return Object_Getter__bool(this._parent, "caretVisible");
  }
  bool caretVisuallyVisible()() {
    return Object_Getter__bool(this._parent, "caretVisuallyVisible");
  }
  bool selectionVisible()() {
    return Object_Getter__bool(this._parent, "selectionVisible");
  }
  bool selectionEditable()() {
    return Object_Getter__bool(this._parent, "selectionEditable");
  }
  string selectedTextContent()() {
    return Object_Getter__string(this._parent, "selectedTextContent");
  }
}
struct CaretStateChangedEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return CaretStateChangedEventInit(libwasm_add__object());
  }
  void collapsed()(bool collapsed) {
    Object_Call_bool__void(this._parent, "collapsed", collapsed);
  }
  bool collapsed()() {
    return Object_Getter__bool(this._parent, "collapsed");
  }
  void boundingClientRect(T0)(scope auto ref Optional!(T0) boundingClientRect) if (isTOrPointer!(T0, DOMRectReadOnly)) {
    Serialize_Object_VarArgCall!void(this._parent, "boundingClientRect", "Optional!Handle", tuple(!boundingClientRect.empty, cast(Handle)boundingClientRect.front.handle));
  }
  auto boundingClientRect()() {
    return recastOpt!(DOMRectReadOnly)(Object_Getter__OptionalHandle(this._parent, "boundingClientRect"));
  }
  void reason()(CaretChangedReason reason) {
    Object_Call_int__void(this._parent, "reason", reason);
  }
  CaretChangedReason reason()() {
    return Object_Getter__int(this._parent, "reason");
  }
  void caretVisible()(bool caretVisible) {
    Object_Call_bool__void(this._parent, "caretVisible", caretVisible);
  }
  bool caretVisible()() {
    return Object_Getter__bool(this._parent, "caretVisible");
  }
  void caretVisuallyVisible()(bool caretVisuallyVisible) {
    Object_Call_bool__void(this._parent, "caretVisuallyVisible", caretVisuallyVisible);
  }
  bool caretVisuallyVisible()() {
    return Object_Getter__bool(this._parent, "caretVisuallyVisible");
  }
  void selectionVisible()(bool selectionVisible) {
    Object_Call_bool__void(this._parent, "selectionVisible", selectionVisible);
  }
  bool selectionVisible()() {
    return Object_Getter__bool(this._parent, "selectionVisible");
  }
  void selectionEditable()(bool selectionEditable) {
    Object_Call_bool__void(this._parent, "selectionEditable", selectionEditable);
  }
  bool selectionEditable()() {
    return Object_Getter__bool(this._parent, "selectionEditable");
  }
  void selectedTextContent()(string selectedTextContent) {
    Object_Call_string__void(this._parent, "selectedTextContent", selectedTextContent);
  }
  string selectedTextContent()() {
    return Object_Getter__string(this._parent, "selectedTextContent");
  }
}


