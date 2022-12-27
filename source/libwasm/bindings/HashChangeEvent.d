module libwasm.bindings.HashChangeEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct HashChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "initHashChangeEvent", "string;bool;bool;string;string", tuple(typeArg, canBubbleArg, cancelableArg, oldURLArg, newURLArg));
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, string oldURLArg /* = "" */) {
    Serialize_Object_VarArgCall!void(this._parent, "initHashChangeEvent", "string;bool;bool;string", tuple(typeArg, canBubbleArg, cancelableArg, oldURLArg));
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initHashChangeEvent", "string;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg));
  }
  void initHashChangeEvent()(string typeArg, bool canBubbleArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initHashChangeEvent", "string;bool", tuple(typeArg, canBubbleArg));
  }
  void initHashChangeEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initHashChangeEvent", typeArg);
  }
}
struct HashChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return HashChangeEventInit(libwasm_add__object());
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


