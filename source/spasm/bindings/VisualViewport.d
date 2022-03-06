module spasm.bindings.VisualViewport;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct VisualViewport {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  double offsetLeft()() {
    return Object_Getter__double(this._parent, "offsetLeft");
  }
  double offsetTop()() {
    return Object_Getter__double(this._parent, "offsetTop");
  }
  double pageLeft()() {
    return Object_Getter__double(this._parent, "pageLeft");
  }
  double pageTop()() {
    return Object_Getter__double(this._parent, "pageTop");
  }
  double width()() {
    return Object_Getter__double(this._parent, "width");
  }
  double height()() {
    return Object_Getter__double(this._parent, "height");
  }
  double scale()() {
    return Object_Getter__double(this._parent, "scale");
  }
  void onresize(T0)(scope auto ref Optional!(T0) onresize) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onresize", !onresize.empty, onresize.front);
  }
  EventHandler onresize()() {
    return Object_Getter__EventHandler(this._parent, "onresize");
  }
  void onscroll(T0)(scope auto ref Optional!(T0) onscroll) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onscroll", !onscroll.empty, onscroll.front);
  }
  EventHandler onscroll()() {
    return Object_Getter__EventHandler(this._parent, "onscroll");
  }
}


