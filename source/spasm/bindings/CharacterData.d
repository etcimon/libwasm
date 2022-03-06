module spasm.bindings.CharacterData;

import spasm.types;
import spasm.bindings.ChildNode;
import spasm.bindings.Element;
import spasm.bindings.Node;

@safe:
nothrow:

struct CharacterData {
  nothrow:
  spasm.bindings.Node.Node _parent;
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
    CharacterData_insertData(this._parent, offset, data);
  }
  void deleteData()(uint offset, uint count) {
    CharacterData_deleteData(this._parent, offset, count);
  }
  void replaceData()(uint offset, uint count, string data) {
    CharacterData_replaceData(this._parent, offset, count, data);
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    ChildNode_before(this._parent, nodes);
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    ChildNode_after(this._parent, nodes);
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    ChildNode_replaceWith(this._parent, nodes);
  }
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
  auto previousElementSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "previousElementSibling");
  }
  auto nextElementSibling()() {
    return Object_Getter__OptionalHandle(this._parent, "nextElementSibling");
  }
}


extern (C) void CharacterData_insertData(Handle, uint, string);
extern (C) void CharacterData_deleteData(Handle, uint, uint);
extern (C) void CharacterData_replaceData(Handle, uint, uint, string);