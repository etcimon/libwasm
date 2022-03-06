module spasm.bindings.BlobEvent;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.Event;

@safe:
nothrow:

struct BlobEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto data()() {
    return Object_Getter__OptionalHandle(this._parent, "data");
  }
}
struct BlobEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return BlobEventInit(spasm_add__object());
  }
  void data(T0)(scope auto ref Optional!(T0) data) if (isTOrPointer!(T0, Blob)) {
    BlobEventInit_data_Set(this._parent, !data.empty, data.front.handle);
  }
  auto data()() {
    return Object_Getter__OptionalHandle(this._parent, "data");
  }
}


extern (C) void BlobEventInit_data_Set(Handle, bool, Handle);