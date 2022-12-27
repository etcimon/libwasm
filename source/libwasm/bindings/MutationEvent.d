module libwasm.bindings.MutationEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Node;

@safe:
nothrow:

struct MutationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  enum ushort MODIFICATION = 1;
  enum ushort ADDITION = 2;
  enum ushort REMOVAL = 3;
  enum ushort SMIL = 4;
  auto relatedNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "relatedNode"));
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
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool;Optional!Handle;string;string;string;ushort", tuple(type, canBubble, cancelable, !relatedNode.empty, cast(Handle)relatedNode.front._parent, prevValue, newValue, attrName, attrChange));
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */, string newValue /* = "" */, string attrName /* = "" */) if (isTOrPointer!(T3, Node)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool;Optional!Handle;string;string;string", tuple(type, canBubble, cancelable, !relatedNode.empty, cast(Handle)relatedNode.front._parent, prevValue, newValue, attrName));
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */, string newValue /* = "" */) if (isTOrPointer!(T3, Node)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool;Optional!Handle;string;string", tuple(type, canBubble, cancelable, !relatedNode.empty, cast(Handle)relatedNode.front._parent, prevValue, newValue));
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */, string prevValue /* = "" */) if (isTOrPointer!(T3, Node)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool;Optional!Handle;string", tuple(type, canBubble, cancelable, !relatedNode.empty, cast(Handle)relatedNode.front._parent, prevValue));
  }
  void initMutationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) relatedNode /* = no!(Node) */) if (isTOrPointer!(T3, Node)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !relatedNode.empty, cast(Handle)relatedNode.front._parent));
  }
  void initMutationEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initMutationEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMutationEvent", "string;bool", tuple(type, canBubble));
  }
  void initMutationEvent()(string type) {
    Object_Call_string__void(this._parent, "initMutationEvent", type);
  }
}


