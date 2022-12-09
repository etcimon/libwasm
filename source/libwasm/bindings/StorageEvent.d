module libwasm.bindings.StorageEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Storage;

@safe:
nothrow:

struct StorageEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  Optional!(string) key()() {
    return Object_Getter__OptionalString(this._parent, "key");
  }
  Optional!(string) oldValue()() {
    return Object_Getter__OptionalString(this._parent, "oldValue");
  }
  Optional!(string) newValue()() {
    return Object_Getter__OptionalString(this._parent, "newValue");
  }
  Optional!(string) url()() {
    return Object_Getter__OptionalString(this._parent, "url");
  }
  auto storageArea()() {
    return recastOpt!(Storage)(Object_Getter__OptionalHandle(this._parent, "storageArea"));
  }
  void initStorageEvent(T3, T4, T5, T6, T7)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */, scope auto ref Optional!(T6) url /* = no!(string) */, scope auto ref Optional!(T7) storageArea /* = no!(Storage) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string) && isTOrPointer!(T6, string) && isTOrPointer!(T7, Storage)) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool;Optional!(string);Optional!(string);Optional!(string);Optional!(string);Optional!Handle", tuple(type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front, !url.empty, url.front, !storageArea.empty, cast(Handle)storageArea.front.handle));
  }
  void initStorageEvent(T3, T4, T5, T6)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */, scope auto ref Optional!(T6) url /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string) && isTOrPointer!(T6, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool;Optional!(string);Optional!(string);Optional!(string);Optional!(string)", tuple(type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front, !url.empty, url.front));
  }
  void initStorageEvent(T3, T4, T5)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool;Optional!(string);Optional!(string);Optional!(string)", tuple(type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front));
  }
  void initStorageEvent(T3, T4)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool;Optional!(string);Optional!(string)", tuple(type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front));
  }
  void initStorageEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */) if (isTOrPointer!(T3, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool;Optional!(string)", tuple(type, canBubble, cancelable, !key.empty, key.front));
  }
  void initStorageEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initStorageEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initStorageEvent", "string;bool", tuple(type, canBubble));
  }
  void initStorageEvent()(string type) {
    Object_Call_string__void(this._parent, "initStorageEvent", type);
  }
}
struct StorageEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StorageEventInit(libwasm_add__object());
  }
  void key(T0)(scope auto ref Optional!(T0) key) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "key", "Optional!(string)", tuple(!key.empty, key.front));
  }
  Optional!(string) key()() {
    return Object_Getter__OptionalString(this._parent, "key");
  }
  void oldValue(T0)(scope auto ref Optional!(T0) oldValue) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "oldValue", "Optional!(string)", tuple(!oldValue.empty, oldValue.front));
  }
  Optional!(string) oldValue()() {
    return Object_Getter__OptionalString(this._parent, "oldValue");
  }
  void newValue(T0)(scope auto ref Optional!(T0) newValue) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "newValue", "Optional!(string)", tuple(!newValue.empty, newValue.front));
  }
  Optional!(string) newValue()() {
    return Object_Getter__OptionalString(this._parent, "newValue");
  }
  void url()(string url) {
    Object_Call_string__void(this._parent, "url", url);
  }
  string url()() {
    return Object_Getter__string(this._parent, "url");
  }
  void storageArea(T0)(scope auto ref Optional!(T0) storageArea) if (isTOrPointer!(T0, Storage)) {
    Serialize_Object_VarArgCall!void(this._parent, "storageArea", "Optional!Handle", tuple(!storageArea.empty, cast(Handle)storageArea.front.handle));
  }
  auto storageArea()() {
    return recastOpt!(Storage)(Object_Getter__OptionalHandle(this._parent, "storageArea"));
  }
}


