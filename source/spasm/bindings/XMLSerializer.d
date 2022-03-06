module spasm.bindings.XMLSerializer;

import spasm.types;
import spasm.bindings.Node;

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
    return XMLSerializer_serializeToString(this.handle, root._parent);
  }
  void serializeToStream(T2)(scope ref Node root, scope ref OutputStream stream, scope auto ref Optional!(T2) charset) if (isTOrPointer!(T2, string)) {
    XMLSerializer_serializeToStream(this.handle, root._parent, stream.handle, !charset.empty, charset.front);
  }
}


extern (C) string XMLSerializer_serializeToString(Handle, Handle);
extern (C) void XMLSerializer_serializeToStream(Handle, Handle, Handle, bool, string);