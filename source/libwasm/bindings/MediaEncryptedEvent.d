module libwasm.bindings.MediaEncryptedEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MediaEncryptedEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string initDataType()() {
    return Object_Getter__string(this._parent, "initDataType");
  }
  auto initData()() {
    return recastOpt!(ArrayBuffer)(Object_Getter__OptionalHandle(this._parent, "initData"));
  }
}
struct MediaKeyNeededEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaKeyNeededEventInit(libwasm_add__object());
  }
  void initDataType()(string initDataType) {
    Object_Call_string__void(this._parent, "initDataType", initDataType);
  }
  string initDataType()() {
    return Object_Getter__string(this._parent, "initDataType");
  }
  void initData(T0)(scope auto ref Optional!(T0) initData) if (isTOrPointer!(T0, ArrayBuffer)) {
    Serialize_Object_VarArgCall!void(this._parent, "initData", "Optional!Handle", tuple(!initData.empty, cast(Handle)initData.front.handle));
  }
  auto initData()() {
    return recastOpt!(ArrayBuffer)(Object_Getter__OptionalHandle(this._parent, "initData"));
  }
}


