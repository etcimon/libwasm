module libwasm.bindings.MessageEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.MessagePort;
import libwasm.bindings.ServiceWorker;

@safe:
nothrow:

struct MessageEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
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
    return MessageEvent_source_Get(this._parent);
  }
  auto ports()() {
    return Sequence!(MessagePort)(Object_Getter__Handle(this._parent, "ports"));
  }
  void initMessageEvent(T3, T6)(string type, bool bubbles /* = false */, bool cancelable /* = false */, scope auto ref T3 data /* = null */, string origin /* = "" */, string lastEventId /* = "" */, scope auto ref Optional!(T6) source /* = no!(MessageEventSource) */, scope ref Sequence!(MessagePort) ports /* = [] */) if (isTOrPointer!(T6, MessageEventSource)) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool;Handle;string;string;Optional!SumType!(WindowProxy,Handle,Handle);Handle", tuple(type, bubbles, cancelable, _handle_data, origin, lastEventId, !source.empty, libwasm.sumtype.match!(((WindowProxy v) => 0),((ref source.Types[1] v) => 1),((ref source.Types[2] v) => 2))(source),tuple(libwasm.sumtype.match!(((WindowProxy v) => v),((ref source.Types[1] v) => WindowProxy.init),((ref source.Types[2] v) => WindowProxy.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => cast(Handle)v.handle),((ref source.Types[2] v) => Handle.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => Handle.init),((ref source.Types[2] v) => cast(Handle)v.handle))(source)), cast(Handle)ports.handle));
    dropHandle!(T3)(_handle_data);
  }
  void initMessageEvent(T3, T6)(string type, bool bubbles /* = false */, bool cancelable /* = false */, scope auto ref T3 data /* = null */, string origin /* = "" */, string lastEventId /* = "" */, scope auto ref Optional!(T6) source /* = no!(MessageEventSource) */) if (isTOrPointer!(T6, MessageEventSource)) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool;Handle;string;string;Optional!SumType!(WindowProxy,Handle,Handle)", tuple(type, bubbles, cancelable, _handle_data, origin, lastEventId, !source.empty, libwasm.sumtype.match!(((WindowProxy v) => 0),((ref source.Types[1] v) => 1),((ref source.Types[2] v) => 2))(source),tuple(libwasm.sumtype.match!(((WindowProxy v) => v),((ref source.Types[1] v) => WindowProxy.init),((ref source.Types[2] v) => WindowProxy.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => cast(Handle)v.handle),((ref source.Types[2] v) => Handle.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => Handle.init),((ref source.Types[2] v) => cast(Handle)v.handle))(source))));
    dropHandle!(T3)(_handle_data);
  }
  void initMessageEvent(T3)(string type, bool bubbles /* = false */, bool cancelable /* = false */, scope auto ref T3 data /* = null */, string origin /* = "" */, string lastEventId /* = "" */) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool;Handle;string;string", tuple(type, bubbles, cancelable, _handle_data, origin, lastEventId));
    dropHandle!(T3)(_handle_data);
  }
  void initMessageEvent(T3)(string type, bool bubbles /* = false */, bool cancelable /* = false */, scope auto ref T3 data /* = null */, string origin /* = "" */) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool;Handle;string", tuple(type, bubbles, cancelable, _handle_data, origin));
    dropHandle!(T3)(_handle_data);
  }
  void initMessageEvent(T3)(string type, bool bubbles /* = false */, bool cancelable /* = false */, scope auto ref T3 data /* = null */) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool;Handle", tuple(type, bubbles, cancelable, _handle_data));
    dropHandle!(T3)(_handle_data);
  }
  void initMessageEvent()(string type, bool bubbles /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool;bool", tuple(type, bubbles, cancelable));
  }
  void initMessageEvent()(string type, bool bubbles /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMessageEvent", "string;bool", tuple(type, bubbles));
  }
  void initMessageEvent()(string type) {
    Object_Call_string__void(this._parent, "initMessageEvent", type);
  }
}
struct MessageEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MessageEventInit(libwasm_add__object());
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
  void source(T0)(scope auto ref Optional!(T0) source) if (isTOrPointer!(T0, MessageEventSource)) {
    Serialize_Object_VarArgCall!void(this._parent, "source", "Optional!SumType!(WindowProxy,Handle,Handle)", tuple(!source.empty, libwasm.sumtype.match!(((WindowProxy v) => 0),((ref source.Types[1] v) => 1),((ref source.Types[2] v) => 2))(source),tuple(libwasm.sumtype.match!(((WindowProxy v) => v),((ref source.Types[1] v) => WindowProxy.init),((ref source.Types[2] v) => WindowProxy.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => cast(Handle)v.handle),((ref source.Types[2] v) => Handle.init))(source),libwasm.sumtype.match!(((WindowProxy v) => Handle.init),((ref source.Types[1] v) => Handle.init),((ref source.Types[2] v) => cast(Handle)v.handle))(source))));
  }
  auto source()() {
    return MessageEventInit_source_Get(this._parent);
  }
  void ports()(scope ref Sequence!(MessagePort) ports) {
    Object_Call_Handle__void(this._parent, "ports", ports.handle);
  }
  auto ports()() {
    return Sequence!(MessagePort)(Object_Getter__Handle(this._parent, "ports"));
  }
}
alias MessageEventSource = SumType!(WindowProxy, MessagePort, ServiceWorker);


extern (C) Optional!(MessageEventSource) MessageEvent_source_Get(Handle);
extern (C) Optional!(MessageEventSource) MessageEventInit_source_Get(Handle);