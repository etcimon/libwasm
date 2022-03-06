module spasm.bindings.ExtendableMessageEvent;

import spasm.types;
import spasm.bindings.Client;
import spasm.bindings.ExtendableEvent;
import spasm.bindings.MessagePort;
import spasm.bindings.ServiceWorker;

@safe:
nothrow:

struct ExtendableMessageEvent {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEvent(h);
  }
  auto data()() {
    return Any(Object_Getter__Handle(this._parent, "data"));
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
  string lastEventId()() {
    return Object_Getter__string(this._parent, "lastEventId");
  }
  auto source()() {
    return ExtendableMessageEvent_source_Get(this._parent);
  }
  auto ports()() {
    return Sequence!(MessagePort)(Object_Getter__Handle(this._parent, "ports"));
  }
}
struct ExtendableMessageEventInit {
  nothrow:
  spasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return ExtendableMessageEventInit(spasm_add__object());
  }
  void data(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "data", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "data", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "data", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this._parent, "data", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  auto data()() {
    return Any(Object_Getter__Handle(this._parent, "data"));
  }
  void origin()(string origin) {
    Object_Call_string__void(this._parent, "origin", origin);
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
  void lastEventId()(string lastEventId) {
    Object_Call_string__void(this._parent, "lastEventId", lastEventId);
  }
  string lastEventId()() {
    return Object_Getter__string(this._parent, "lastEventId");
  }
  void source(T0)(scope auto ref Optional!(T0) source) if (isTOrPointer!(T0, SumType!(Client, ServiceWorker, MessagePort))) {
    ExtendableMessageEventInit_source_Set(this._parent, !source.empty, *source.frontRef);
  }
  auto source()() {
    return ExtendableMessageEventInit_source_Get(this._parent);
  }
  void ports()(scope ref Sequence!(MessagePort) ports) {
    Object_Call_Handle__void(this._parent, "ports", ports.handle);
  }
  auto ports()() {
    return Sequence!(MessagePort)(Object_Getter__Handle(this._parent, "ports"));
  }
}


extern (C) Optional!(SumType!(Client, ServiceWorker, MessagePort)) ExtendableMessageEvent_source_Get(Handle);
extern (C) void ExtendableMessageEventInit_source_Set(Handle, bool, scope ref SumType!(Client, ServiceWorker, MessagePort));
extern (C) Optional!(SumType!(Client, ServiceWorker, MessagePort)) ExtendableMessageEventInit_source_Get(Handle);