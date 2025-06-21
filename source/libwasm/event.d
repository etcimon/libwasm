module libwasm.event;

import libwasm.types;
import libwasm.bindings;
import memutils.vector;
version (LDC)
import ldc.attributes;

@trusted
extern(C)
export
@assumeUsed
nothrow
void domEvent(uint ctx, uint fun, Handle event) {
  // NOTE: since all the Event structs (MouseEvent, KeyboardEvent)
  // are all just empty structs with only static functions,
  // the type signature of the delegate doesn't really matter much,
  // as long as there is one param
  // This allows us to sidestep the fact that we should have had
  // one event handler per event type
  // Type safety is ensured with static asserts in addEventListenerTyped
  static struct Handler
  {
    union
    {
      void delegate(Event) nothrow handle;
      struct
      {
        void* contextPtr;
        void* funcPtr;
      }
    }
  }
  Handler c;
  c.contextPtr = cast(void*) ctx;
  c.funcPtr = cast(void*) fun;
  c.handle(Event(event));
}

@safe:
nothrow:

private extern(C) {
  nothrow:
  void removeEventListener(Handle node, string listener_type, uint ctx, uint fun, EventType type);
  void addEventListener(Handle node, string listener_type, uint ctx, uint fun, EventType type);
}
enum eventemitter;

template ToEvent(EventType type) {
  import memutils.ct : capitalize;
  static if (type == EventType.event)
    alias ToEvent = Event;
  else {
    // TODO: really want to use phobos functions to extract name but prevented by https://issues.dlang.org/show_bug.cgi?id=19268
    static foreach (t; __traits(allMembers, EventType))
    {
      static if (__traits(getMember, EventType, t) == type)
        mixin("alias ToEvent = "~capitalize!(t)~"Event;");
    }
  }
}

auto toTuple(Delegate)(Delegate d) {
  import memutils.ct : tuple;
  auto ctx = cast(uint)d.ptr;
  auto func = cast(uint)d.funcptr;
  return tuple!("ctx","func")(ctx,func);
}

EventType toEventType(Node)(string listener) {
  switch(listener) {
      case "click":
        return EventType.mouse;
      case "input":
        return EventType.input;
      case "change":
        return EventType.event;
      case "keyup":
      case "keydown":
      case "keypress":
        return EventType.keyboard;
      case "dblclick":
        return EventType.mouse;
      case "focus":
        return EventType.focus;
      case "blur":
        return EventType.event;
      case "mouseup":
      case "mousedown":
      case "mousemove":
        return EventType.mouse;
      default:
        return EventType.custom;
    }
}

// TODO: please combine with function below
auto removeEventListenerTyped(string name, T)(Handle node, auto ref T t) {
  import std.traits : fullyQualifiedName, Parameters;
  import memutils.ct : toLower;
  // TODO: really want to use std.uni.toLower here but prevented by https://issues.dlang.org/show_bug.cgi?id=19268
  enum listenerType = toLower!(name[2..$]);
  auto delPtr = &__traits(getMember, t, name);
  enum eventType = listenerType.toEventType!T;
  alias Event = ToEvent!eventType;
  alias delParams = Parameters!(typeof(delPtr));
  static if (delParams.length != 1)
    static assert(false, "Expected 1 param of type "~Event.stringof~" in "~fullyQualifiedName!T~"."~name);
  else static if (!is(delParams[0] == Event))
    static assert(false,
        "Expected param 1 of type " ~ Event.stringof ~ " instead of "
        ~ delParams[0].stringof ~ " in ..." ~ name); // TODO: next line is not working so using ... instead. Due to bug https://issues.dlang.org/show_bug.cgi?id=19268
    // static assert(false, "Expected param 1 of type "~Event.stringof~" instead of "~delParams[0].stringof~" in "~fullyQualifiedName!T~"."~name);
  removeEventListener(node, listenerType, toTuple(delPtr).expand, eventType);
}

auto addEventListenerTyped(string listenerType, string name, T)(Handle node, auto ref T t) {
  import std.traits : fullyQualifiedName, Parameters;
  import memutils.ct : toLower;
  // TODO: really want to use std.uni.toLower here but prevented by https://issues.dlang.org/show_bug.cgi?id=19268
  
  auto delPtr = &__traits(getMember, t, name);
  enum eventType = listenerType.toEventType!T;
  alias Event = ToEvent!eventType;
  alias delParams = Parameters!(typeof(delPtr));
  static if (delParams.length != 1)
    static assert(false, "Expected 1 param of type "~Event.stringof~" in "~fullyQualifiedName!T~"."~name);
  else static if (!is(delParams[0] == Event))
    static assert(false,
        "Expected param 1 of type " ~ Event.stringof ~ " instead of "
        ~ delParams[0].stringof ~ " in ..." ~ name); // TODO: next line is not working so using ... instead. Due to bug https://issues.dlang.org/show_bug.cgi?id=19268
    // static assert(false, "Expected param 1 of type "~Event.stringof~" instead of "~delParams[0].stringof~" in "~fullyQualifiedName!T~"."~name);
  addEventListener(node, listenerType, toTuple(delPtr).expand, eventType);
}

struct EventEmitter(Params...) {
  nothrow:
  static if (Params.length == 0) {    
    Vector!(void delegate() nothrow @safe) cbs;
    void add(void delegate() nothrow @safe del) {
      cbs = del;
    }
    
    Vector!(void delegate(size_t) nothrow @safe) addrs;
    void add(void delegate(size_t) nothrow @safe del) {
      addrs = del;
    }
  }
  else {
    Vector!(void delegate(Params) nothrow @safe) cbs;
    void add(void delegate(Params) nothrow @safe del) {
      cbs ~= del;
    }    
    Vector!(void delegate(size_t, Params) nothrow @safe) addrs;
    void add(void delegate(size_t, Params) nothrow @safe del) {
      addrs ~= del;
    }
  }

}

mixin template Slot(string type, Params...) {
  mixin("@eventemitter EventEmitter!Params "~type~";");
}

auto emit(T, U: EventEmitter!Params, Params...)(auto ref T t, auto ref U emitter, auto ref Params params)
{
  //console.log("emit " ~ U.stringof);
  //static assert(is(U : EventEmitter!Params), "Cannot call emit with a type that is not an event emitter as the first parameter (" ~ U.stringof ~ "). " ~ ((U.stringof == "string") ? "Did you mean to pass the slot identifier without quotes?" : "Did you use the Slot mixin properly?"));
  if (emitter.addrs.length > 0) {
    import std.conv : to;
    size_t addr = cast(size_t)(&t);
    //console.log("emitter.addr(" ~ addr.to!string ~ ", " ~ params.to!string ~ ")");
    foreach(ref addrfct; emitter.addrs[]) addrfct(addr, params);
  }
  if (emitter.cbs.length > 0) {
    import std.conv : to;
    //console.log("emitter.cb(" ~ params.to!string ~ ")");
    foreach(ref cbfct; emitter.cbs[]) cbfct(params);
  }
}

auto emitIdx(T, U: EventEmitter!Params, Params...)(auto ref T t, auto ref U emitter, size_t idx, auto ref Params params)
{
  //console.log("emitIdx1");
  //static assert(is(U : EventEmitter!Params), "Cannot call emit with a type that is not an event emitter as the first parameter (" ~ U.stringof ~ "). " ~ ((U.stringof == "string") ? "Did you mean to pass the slot identifier without quotes?" : "Did you use the Slot mixin properly?"));
  if (emitter.addrs.length > 0) foreach(ref addrfct; emitter.addrs[]) addrfct(idx, params);  
  if (emitter.cbs.length > 0) foreach(ref cbfct; emitter.cbs[]) cbfct(params);
}
auto emitIdx(T : EventEmitter!Params, Params...)(auto ref T emitter, size_t idx, auto ref Params params)
{
  //console.log("emitIdx2");
  if (emitter.addrs.length > 0) 
    foreach(ref addrfct; emitter.addrs[]) addrfct(idx, params);
  if (emitter.cbs.length > 0)
    foreach(ref cbfct; emitter.cbs[]) cbfct(params);  
}