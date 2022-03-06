module spasm.bindings.CaretStateChangedEvent;

import spasm.types;
import spasm.bindings.DOMRect;
import spasm.bindings.Event;

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
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  bool collapsed()() {
    return Object_Getter__bool(this._parent, "collapsed");
  }
  auto boundingClientRect()() {
    return Object_Getter__OptionalHandle(this._parent, "boundingClientRect");
  }
  CaretChangedReason reason()() {
    return CaretStateChangedEvent_reason_Get(this._parent);
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return CaretStateChangedEventInit(spasm_add__object());
  }
  void collapsed()(bool collapsed) {
    Object_Call_bool__void(this._parent, "collapsed", collapsed);
  }
  bool collapsed()() {
    return Object_Getter__bool(this._parent, "collapsed");
  }
  void boundingClientRect(T0)(scope auto ref Optional!(T0) boundingClientRect) if (isTOrPointer!(T0, DOMRectReadOnly)) {
    CaretStateChangedEventInit_boundingClientRect_Set(this._parent, !boundingClientRect.empty, boundingClientRect.front.handle);
  }
  auto boundingClientRect()() {
    return Object_Getter__OptionalHandle(this._parent, "boundingClientRect");
  }
  void reason()(CaretChangedReason reason) {
    CaretStateChangedEventInit_reason_Set(this._parent, reason);
  }
  CaretChangedReason reason()() {
    return CaretStateChangedEventInit_reason_Get(this._parent);
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


extern (C) CaretChangedReason CaretStateChangedEvent_reason_Get(Handle);
extern (C) void CaretStateChangedEventInit_boundingClientRect_Set(Handle, bool, Handle);
extern (C) void CaretStateChangedEventInit_reason_Set(Handle, CaretChangedReason);
extern (C) CaretChangedReason CaretStateChangedEventInit_reason_Get(Handle);