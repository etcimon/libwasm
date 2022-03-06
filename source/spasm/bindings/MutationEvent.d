module spasm.bindings.MutationEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.Node;

@safe:
nothrow:

struct MutationEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  enum ushort MODIFICATION = 1;
  enum ushort ADDITION = 2;
  enum ushort REMOVAL = 3;
  enum ushort SMIL = 4;
  auto relatedNode()() {
    return Object_Getter__OptionalHandle(this._parent, "relatedNode");
  }
  string prevValue()() {
    return Object_Getter__string(this._parent, "prevValue");
  }
  string newValue()() {
    return Object_Getter__string(this._parent, "newValue");
  }
  string attrName()() {
    return Object_Getter__string(this._parent, "attrName");
  }
  ushort attrChange()() {
    return Object_Getter__ushort(this._parent, "attrChange");
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */, string newValue /* = "" */, string attrName /* = "" */, ushort attrChange /* = 0 */) if (isTOrPointer!(T3, Node)) {
    MutationEvent_initMutationEvent(this._parent, type, canBubble, cancelable, !relatedNode.empty, relatedNode.front._parent, prevValue, newValue, attrName, attrChange);
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */, string newValue /* = "" */, string attrName /* = "" */) if (isTOrPointer!(T3, Node)) {
    MutationEvent_initMutationEvent_0(this._parent, type, canBubble, cancelable, !relatedNode.empty, relatedNode.front._parent, prevValue, newValue, attrName);
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */, string newValue /* = "" */) if (isTOrPointer!(T3, Node)) {
    MutationEvent_initMutationEvent_1(this._parent, type, canBubble, cancelable, !relatedNode.empty, relatedNode.front._parent, prevValue, newValue);
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */) if (isTOrPointer!(T3, Node)) {
    MutationEvent_initMutationEvent_2(this._parent, type, canBubble, cancelable, !relatedNode.empty, relatedNode.front._parent, prevValue);
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */) if (isTOrPointer!(T3, Node)) {
    MutationEvent_initMutationEvent_3(this._parent, type, canBubble, cancelable, !relatedNode.empty, relatedNode.front._parent);
  }
  void initMutationEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    MutationEvent_initMutationEvent_4(this._parent, type, canBubble, cancelable);
  }
  void initMutationEvent()(string type, bool canBubble /* = false */) {
    MutationEvent_initMutationEvent_5(this._parent, type, canBubble);
  }
  void initMutationEvent()(string type) {
    Object_Call_string__void(this._parent, "initMutationEvent", type);
  }
}


extern (C) void MutationEvent_initMutationEvent(Handle, string, bool, bool, bool, Handle, string, string, string, ushort);
extern (C) void MutationEvent_initMutationEvent_0(Handle, string, bool, bool, bool, Handle, string, string, string);
extern (C) void MutationEvent_initMutationEvent_1(Handle, string, bool, bool, bool, Handle, string, string);
extern (C) void MutationEvent_initMutationEvent_2(Handle, string, bool, bool, bool, Handle, string);
extern (C) void MutationEvent_initMutationEvent_3(Handle, string, bool, bool, bool, Handle);
extern (C) void MutationEvent_initMutationEvent_4(Handle, string, bool, bool);
extern (C) void MutationEvent_initMutationEvent_5(Handle, string, bool);