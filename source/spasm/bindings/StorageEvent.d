module spasm.bindings.StorageEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.Storage;

@safe:
nothrow:

struct StorageEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
    return Object_Getter__OptionalHandle(this._parent, "storageArea");
  }
  void initStorageEvent(T3, T4, T5, T6, T7)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */, scope auto ref Optional!(T6) url /* = no!(string) */, scope auto ref Optional!(T7) storageArea /* = no!(Storage) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string) && isTOrPointer!(T6, string) && isTOrPointer!(T7, Storage)) {
    StorageEvent_initStorageEvent(this._parent, type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front, !url.empty, url.front, !storageArea.empty, storageArea.front.handle);
  }
  void initStorageEvent(T3, T4, T5, T6)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */, scope auto ref Optional!(T6) url /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string) && isTOrPointer!(T6, string)) {
    StorageEvent_initStorageEvent_0(this._parent, type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front, !url.empty, url.front);
  }
  void initStorageEvent(T3, T4, T5)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */, scope auto ref Optional!(T5) newValue /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string) && isTOrPointer!(T5, string)) {
    StorageEvent_initStorageEvent_1(this._parent, type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front, !newValue.empty, newValue.front);
  }
  void initStorageEvent(T3, T4)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */, scope auto ref Optional!(T4) oldValue /* = no!(string) */) if (isTOrPointer!(T3, string) && isTOrPointer!(T4, string)) {
    StorageEvent_initStorageEvent_2(this._parent, type, canBubble, cancelable, !key.empty, key.front, !oldValue.empty, oldValue.front);
  }
  void initStorageEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) key /* = no!(string) */) if (isTOrPointer!(T3, string)) {
    StorageEvent_initStorageEvent_3(this._parent, type, canBubble, cancelable, !key.empty, key.front);
  }
  void initStorageEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    StorageEvent_initStorageEvent_4(this._parent, type, canBubble, cancelable);
  }
  void initStorageEvent()(string type, bool canBubble /* = false */) {
    StorageEvent_initStorageEvent_5(this._parent, type, canBubble);
  }
  void initStorageEvent()(string type) {
    Object_Call_string__void(this._parent, "initStorageEvent", type);
  }
}
struct StorageEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StorageEventInit(spasm_add__object());
  }
  void key(T0)(scope auto ref Optional!(T0) key) if (isTOrPointer!(T0, string)) {
    StorageEventInit_key_Set(this._parent, !key.empty, key.front);
  }
  Optional!(string) key()() {
    return Object_Getter__OptionalString(this._parent, "key");
  }
  void oldValue(T0)(scope auto ref Optional!(T0) oldValue) if (isTOrPointer!(T0, string)) {
    StorageEventInit_oldValue_Set(this._parent, !oldValue.empty, oldValue.front);
  }
  Optional!(string) oldValue()() {
    return Object_Getter__OptionalString(this._parent, "oldValue");
  }
  void newValue(T0)(scope auto ref Optional!(T0) newValue) if (isTOrPointer!(T0, string)) {
    StorageEventInit_newValue_Set(this._parent, !newValue.empty, newValue.front);
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
    StorageEventInit_storageArea_Set(this._parent, !storageArea.empty, storageArea.front.handle);
  }
  auto storageArea()() {
    return Object_Getter__OptionalHandle(this._parent, "storageArea");
  }
}


extern (C) void StorageEvent_initStorageEvent(Handle, string, bool, bool, bool, string, bool, string, bool, string, bool, string, bool, Handle);
extern (C) void StorageEvent_initStorageEvent_0(Handle, string, bool, bool, bool, string, bool, string, bool, string, bool, string);
extern (C) void StorageEvent_initStorageEvent_1(Handle, string, bool, bool, bool, string, bool, string, bool, string);
extern (C) void StorageEvent_initStorageEvent_2(Handle, string, bool, bool, bool, string, bool, string);
extern (C) void StorageEvent_initStorageEvent_3(Handle, string, bool, bool, bool, string);
extern (C) void StorageEvent_initStorageEvent_4(Handle, string, bool, bool);
extern (C) void StorageEvent_initStorageEvent_5(Handle, string, bool);
extern (C) void StorageEventInit_key_Set(Handle, bool, string);
extern (C) void StorageEventInit_oldValue_Set(Handle, bool, string);
extern (C) void StorageEventInit_newValue_Set(Handle, bool, string);
extern (C) void StorageEventInit_storageArea_Set(Handle, bool, Handle);