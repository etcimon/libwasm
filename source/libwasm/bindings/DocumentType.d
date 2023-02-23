module libwasm.bindings.DocumentType;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.ChildNode;
import libwasm.bindings.Node;

@safe:
nothrow:

struct DocumentType {
  nothrow:
  libwasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  string publicId()() {
    return Object_Getter__string(this._parent, "publicId");
  }
  string systemId()() {
    return Object_Getter__string(this._parent, "systemId");
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "before", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "after", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "replaceWith", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
}


