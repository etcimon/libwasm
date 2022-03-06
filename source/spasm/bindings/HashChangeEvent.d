module spasm.bindings.HashChangeEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct HashChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string oldURL()() {
    return Object_Getter__string(this._parent, "oldURL");
  }
  string newURL()() {
    return Object_Getter__string(this._parent, "newURL");
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, string oldURLArg /* = "" */, string newURLArg /* = "" */) {
    HashChangeEvent_initHashChangeEvent(this._parent, typeArg, canBubbleArg, cancelableArg, oldURLArg, newURLArg);
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, string oldURLArg /* = "" */) {
    HashChangeEvent_initHashChangeEvent_0(this._parent, typeArg, canBubbleArg, cancelableArg, oldURLArg);
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    HashChangeEvent_initHashChangeEvent_1(this._parent, typeArg, canBubbleArg, cancelableArg);
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */) {
    HashChangeEvent_initHashChangeEvent_2(this._parent, typeArg, canBubbleArg);
  }
  void initHashChangeEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initHashChangeEvent", typeArg);
  }
}
struct HashChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return HashChangeEventInit(spasm_add__object());
  }
  void oldURL()(string oldURL) {
    Object_Call_string__void(this._parent, "oldURL", oldURL);
  }
  string oldURL()() {
    return Object_Getter__string(this._parent, "oldURL");
  }
  void newURL()(string newURL) {
    Object_Call_string__void(this._parent, "newURL", newURL);
  }
  string newURL()() {
    return Object_Getter__string(this._parent, "newURL");
  }
}


extern (C) void HashChangeEvent_initHashChangeEvent(Handle, string, bool, bool, string, string);
extern (C) void HashChangeEvent_initHashChangeEvent_0(Handle, string, bool, bool, string);
extern (C) void HashChangeEvent_initHashChangeEvent_1(Handle, string, bool, bool);
extern (C) void HashChangeEvent_initHashChangeEvent_2(Handle, string, bool);