module spasm.bindings.NotifyPaintEvent;

import spasm.types;
import spasm.bindings.DOMRect;
import spasm.bindings.DOMRectList;
import spasm.bindings.Event;
import spasm.bindings.PaintRequestList;
import spasm.bindings.Performance;

@safe:
nothrow:

struct NotifyPaintEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto clientRects()() {
    return DOMRectList(Object_Getter__Handle(this._parent, "clientRects"));
  }
  auto boundingClientRect()() {
    return DOMRect(Object_Getter__Handle(this._parent, "boundingClientRect"));
  }
  auto paintRequests()() {
    return PaintRequestList(Object_Getter__Handle(this._parent, "paintRequests"));
  }
  uint transactionId()() {
    return Object_Getter__uint(this._parent, "transactionId");
  }
  double paintTimeStamp()() {
    return Object_Getter__double(this._parent, "paintTimeStamp");
  }
}


