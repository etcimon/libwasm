module libwasm.bindings.CharacterData;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.ChildNode;
import libwasm.bindings.Element;
import libwasm.bindings.Node;

@safe:
nothrow:

struct CharacterData {
  nothrow:
  libwasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  void data()(string data) {
    Object_Call_string__void(this._parent, "data", data);
  }
  string data()() {
    return Object_Getter__string(this._parent, "data");
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  string substringData()(uint offset, uint count) {
    return Object_Call_uint_uint__string(this._parent, "substringData", offset, count);
  }
  void appendData()(string data) {
    Object_Call_string__void(this._parent, "appendData", data);
  }
  void insertData()(uint offset, string data) {
    Serialize_Object_VarArgCall!void(this._parent, "insertData", "uint;string", tuple(offset, data));
  }
  void deleteData()(uint offset, uint count) {
    Serialize_Object_VarArgCall!void(this._parent, "deleteData", "uint;uint", tuple(offset, count));
  }
  void replaceData()(uint offset, uint count, string data) {
    Serialize_Object_VarArgCall!void(this._parent, "replaceData", "uint;uint;string", tuple(offset, count, data));
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
  auto previousElementSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "previousElementSibling"));
  }
  auto nextElementSibling()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "nextElementSibling"));
  }
}


