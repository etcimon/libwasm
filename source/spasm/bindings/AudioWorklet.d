module spasm.bindings.AudioWorklet;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.EventListener;
import spasm.bindings.EventTarget;
import spasm.bindings.Worklet;

@safe:
nothrow:

struct AudioWorklet {
  nothrow:
  spasm.bindings.Worklet.Worklet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Worklet(h);
  }
  auto EventTarget()() {
    return .EventTarget(Object_Getter__Handle(this._parent, "EventTarget"));
  }
}


