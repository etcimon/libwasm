module libwasm.bindings.BlobEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.Event;

@safe:
nothrow:

struct BlobEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto data()() {
    return Optional!(Blob)(Object_Getter__OptionalHandle(this._parent, "data"));
  }
}
struct BlobEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return BlobEventInit(libwasm_add__object());
  }
  void data(T0)(scope auto ref Optional!(T0) data) if (isTOrPointer!(T0, Blob)) {
    Serialize_Object_VarArgCall!void(this._parent, "data", "Optional!Handle", tuple(!data.empty, cast(Handle)data.front.handle));
  }
  auto data()() {
    return Optional!(Blob)(Object_Getter__OptionalHandle(this._parent, "data"));
  }
}


