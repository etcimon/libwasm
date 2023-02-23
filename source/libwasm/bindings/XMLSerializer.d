module libwasm.bindings.XMLSerializer;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Node;

@safe:
nothrow:

struct XMLSerializer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string serializeToString()(scope ref Node root) {
    return Serialize_Object_VarArgCall!string(this.handle, "serializeToString", "Handle", tuple(cast(Handle)root._parent));
  }
  void serializeToStream(T2)(scope ref Node root, scope ref OutputStream stream, scope auto ref Optional!(T2) charset) if (isTOrPointer!(T2, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "serializeToStream", "Handle;Handle;Optional!(string)", tuple(cast(Handle)root._parent, cast(Handle)stream.handle, !charset.empty, charset.front));
  }
}


