module libwasm.bindings.AudioWorklet;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.EventListener;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Worklet;

@safe:
nothrow:

struct AudioWorklet {
  nothrow:
  libwasm.bindings.Worklet.Worklet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Worklet(h);
  }
  auto EventTarget()() {
    return .EventTarget(Object_Getter__Handle(this._parent, "EventTarget"));
  }
}


