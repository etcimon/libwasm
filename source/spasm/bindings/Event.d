module spasm.bindings.Event;

import spasm.types;
import spasm.bindings.EventTarget;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.Performance;

@safe:
nothrow:

struct Event {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  auto target()() {
    return Object_Getter__OptionalHandle(this.handle, "target");
  }
  auto currentTarget()() {
    return Object_Getter__OptionalHandle(this.handle, "currentTarget");
  }
  auto composedPath()() {
    return Sequence!(EventTarget)(Object_Getter__Handle(this.handle, "composedPath"));
  }
  enum ushort NONE = 0;
  enum ushort CAPTURING_PHASE = 1;
  enum ushort AT_TARGET = 2;
  enum ushort BUBBLING_PHASE = 3;
  ushort eventPhase()() {
    return Object_Getter__ushort(this.handle, "eventPhase");
  }
  void stopPropagation()() {
    Object_Call__void(this.handle, "stopPropagation");
  }
  void stopImmediatePropagation()() {
    Object_Call__void(this.handle, "stopImmediatePropagation");
  }
  bool bubbles()() {
    return Object_Getter__bool(this.handle, "bubbles");
  }
  bool cancelable()() {
    return Object_Getter__bool(this.handle, "cancelable");
  }
  void returnValue()(bool returnValue) {
    Object_Call_bool__void(this.handle, "returnValue", returnValue);
  }
  bool returnValue()() {
    return Object_Getter__bool(this.handle, "returnValue");
  }
  void preventDefault()() {
    Object_Call__void(this.handle, "preventDefault");
  }
  bool defaultPrevented()() {
    return Object_Getter__bool(this.handle, "defaultPrevented");
  }
  bool defaultPreventedByChrome()() {
    return Object_Getter__bool(this.handle, "defaultPreventedByChrome");
  }
  bool defaultPreventedByContent()() {
    return Object_Getter__bool(this.handle, "defaultPreventedByContent");
  }
  bool composed()() {
    return Object_Getter__bool(this.handle, "composed");
  }
  bool isTrusted()() {
    return Object_Getter__bool(this.handle, "isTrusted");
  }
  double timeStamp()() {
    return Object_Getter__double(this.handle, "timeStamp");
  }
  void initEvent()(string type, bool bubbles /* = false */, bool cancelable /* = false */) {
    Event_initEvent(this.handle, type, bubbles, cancelable);
  }
  void initEvent()(string type, bool bubbles /* = false */) {
    Event_initEvent_0(this.handle, type, bubbles);
  }
  void initEvent()(string type) {
    Object_Call_string__void(this.handle, "initEvent", type);
  }
  void cancelBubble()(bool cancelBubble) {
    Object_Call_bool__void(this.handle, "cancelBubble", cancelBubble);
  }
  bool cancelBubble()() {
    return Object_Getter__bool(this.handle, "cancelBubble");
  }
  auto originalTarget()() {
    return Object_Getter__OptionalHandle(this.handle, "originalTarget");
  }
  auto explicitOriginalTarget()() {
    return Object_Getter__OptionalHandle(this.handle, "explicitOriginalTarget");
  }
  auto composedTarget()() {
    return Object_Getter__OptionalHandle(this.handle, "composedTarget");
  }
  void preventMultipleActions()() {
    Object_Call__void(this.handle, "preventMultipleActions");
  }
  bool multipleActionsPrevented()() {
    return Object_Getter__bool(this.handle, "multipleActionsPrevented");
  }
  bool isSynthesized()() {
    return Object_Getter__bool(this.handle, "isSynthesized");
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this.handle, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}
struct EventInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return EventInit(spasm_add__object());
  }
  void bubbles()(bool bubbles) {
    Object_Call_bool__void(this.handle, "bubbles", bubbles);
  }
  bool bubbles()() {
    return Object_Getter__bool(this.handle, "bubbles");
  }
  void cancelable()(bool cancelable) {
    Object_Call_bool__void(this.handle, "cancelable", cancelable);
  }
  bool cancelable()() {
    return Object_Getter__bool(this.handle, "cancelable");
  }
  void composed()(bool composed) {
    Object_Call_bool__void(this.handle, "composed", composed);
  }
  bool composed()() {
    return Object_Getter__bool(this.handle, "composed");
  }
}


extern (C) void Event_initEvent(Handle, string, bool, bool);
extern (C) void Event_initEvent_0(Handle, string, bool);