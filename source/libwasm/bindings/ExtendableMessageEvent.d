module libwasm.bindings.ExtendableMessageEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Client;
import libwasm.bindings.ExtendableEvent;
import libwasm.bindings.MessagePort;
import libwasm.bindings.ServiceWorker;

@safe:
nothrow:

struct ExtendableMessageEvent {
  nothrow:
  libwasm.bindings.ExtendableEvent.ExtendableEvent _parent;
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
  libwasm.bindings.ExtendableEvent.ExtendableEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ExtendableEventInit(h);
  }
  static auto create() {
    return ExtendableMessageEventInit(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "source", "Optional!SumType!(Handle,Handle,Handle)", tuple(!source.empty, libwasm.sumtype.match!(((ref source.Types[0] v) => 0),((ref source.Types[1] v) => 1),((ref source.Types[2] v) => 2))(source),tuple(libwasm.sumtype.match!(((ref source.Types[0] v) => cast(Handle)v.handle),((ref source.Types[1] v) => Handle.init),((ref source.Types[2] v) => Handle.init))(source),libwasm.sumtype.match!(((ref source.Types[0] v) => Handle.init),((ref source.Types[1] v) => cast(Handle)v.handle),((ref source.Types[2] v) => Handle.init))(source),libwasm.sumtype.match!(((ref source.Types[0] v) => Handle.init),((ref source.Types[1] v) => Handle.init),((ref source.Types[2] v) => cast(Handle)v.handle))(source))));
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
extern (C) Optional!(SumType!(Client, ServiceWorker, MessagePort)) ExtendableMessageEventInit_source_Get(Handle);