module spasm.bindings.MediaEncryptedEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MediaEncryptedEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string initDataType()() {
    return Object_Getter__string(this._parent, "initDataType");
  }
  auto initData()() {
    return Object_Getter__OptionalHandle(this._parent, "initData");
  }
}
struct MediaKeyNeededEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaKeyNeededEventInit(spasm_add__object());
  }
  void initDataType()(string initDataType) {
    Object_Call_string__void(this._parent, "initDataType", initDataType);
  }
  string initDataType()() {
    return Object_Getter__string(this._parent, "initDataType");
  }
  void initData(T0)(scope auto ref Optional!(T0) initData) if (isTOrPointer!(T0, ArrayBuffer)) {
    MediaKeyNeededEventInit_initData_Set(this._parent, !initData.empty, initData.front.handle);
  }
  auto initData()() {
    return Object_Getter__OptionalHandle(this._parent, "initData");
  }
}


extern (C) void MediaKeyNeededEventInit_initData_Set(Handle, bool, Handle);