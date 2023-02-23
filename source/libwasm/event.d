module libwasm.event;

import libwasm.types;
import libwasm.bindings;
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
  void removeEventListener(Handle node, ListenerType type, uint ctx, uint fun, EventType type);
  void addEventListener(Handle node, ListenerType type, uint ctx, uint fun, EventType type);
}
enum eventemitter;

template ToEvent(EventType type) {
  import libwasm.memory.ct : capitalize;
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
  import libwasm.memory.ct : tuple;
  auto ctx = cast(uint)d.ptr;
  auto func = cast(uint)d.funcptr;
  return tuple!("ctx","func")(ctx,func);
}

EventType toEventType(Node)(ListenerType listener) {
  with (ListenerType) {
    final switch(listener) {
    case click:
      return EventType.mouse;
    case input:
      return EventType.input;
    case change:
      return EventType.event;
    case keyup:
    case keydown:
    case keypress:
      return EventType.keyboard;
    case dblclick:
      return EventType.mouse;
    case focus:
      return EventType.focus;
    case blur:
      return EventType.event;
    case mouseup:
    case mousedown:
    case mousemove:
      return EventType.mouse;
      }
  }
}

template toListenerType(string t) {
  mixin("enum toListenerType = ListenerType."~t~";");
}


// TODO: please combine with function below
auto removeEventListenerTyped(string name, T)(Handle node, auto ref T t) {
  import std.traits : fullyQualifiedName, Parameters;
  import std.algorithm : findSplitAfter;
  import libwasm.memory.ct : toLower;
  // TODO: really want to use std.uni.toLower here but prevented by https://issues.dlang.org/show_bug.cgi?id=19268
  enum type = toLower!(name[2..$]);
  enum listenerType = toListenerType!type;
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

auto addEventListenerTyped(string name, T)(Handle node, auto ref T t) {
  import std.traits : fullyQualifiedName, Parameters;
  import std.algorithm : findSplitAfter;
  import libwasm.memory.ct : toLower;
  // TODO: really want to use std.uni.toLower here but prevented by https://issues.dlang.org/show_bug.cgi?id=19268
  enum type = toLower!(name[2..$]);
  enum listenerType = toListenerType!type;
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

struct EventEmitter {
  nothrow:
  //static if (is(T == void)) {
  void delegate() plain = null;
  void add(void delegate() nothrow @safe del) {
    plain = del;
  }
  /*} // todo: add parameters to event emitters
  else {
    void delegate(T) plain = null;
    void add(void delegate(T) nothrow @safe del) {
      plain = del;
    }
  }*/
  void delegate(size_t) addr = null;
  void add(void delegate(size_t) nothrow @safe del) {
    addr = del;
  }
}

mixin template Slot(string type) {
  mixin("@eventemitter EventEmitter "~type~";");
}

auto emit(T)(ref T t, EventEmitter emitter) {
  if (emitter.plain != null)
    emitter.plain();
  if (emitter.addr != null) {
    size_t addr = cast(size_t)(&t);
    emitter.addr(addr);
  }
}

auto emit(EventEmitter emitter, size_t addr) {
  if (emitter.plain != null)
    emitter.plain();
  if (emitter.addr != null) {
    emitter.addr(addr);
  }
}

