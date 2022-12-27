module libwasm.bindings.XPathResult;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Node;

@safe:
nothrow:

struct XPathResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort ANY_TYPE = 0;
  enum ushort NUMBER_TYPE = 1;
  enum ushort STRING_TYPE = 2;
  enum ushort BOOLEAN_TYPE = 3;
  enum ushort UNORDERED_NODE_ITERATOR_TYPE = 4;
  enum ushort ORDERED_NODE_ITERATOR_TYPE = 5;
  enum ushort UNORDERED_NODE_SNAPSHOT_TYPE = 6;
  enum ushort ORDERED_NODE_SNAPSHOT_TYPE = 7;
  enum ushort ANY_UNORDERED_NODE_TYPE = 8;
  enum ushort FIRST_ORDERED_NODE_TYPE = 9;
  ushort resultType()() {
    return Object_Getter__ushort(this.handle, "resultType");
  }
  double numberValue()() {
    return Object_Getter__double(this.handle, "numberValue");
  }
  string stringValue()() {
    return Object_Getter__string(this.handle, "stringValue");
  }
  bool booleanValue()() {
    return Object_Getter__bool(this.handle, "booleanValue");
  }
  auto singleNodeValue()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "singleNodeValue"));
  }
  bool invalidIteratorState()() {
    return Object_Getter__bool(this.handle, "invalidIteratorState");
  }
  uint snapshotLength()() {
    return Object_Getter__uint(this.handle, "snapshotLength");
  }
  auto iterateNext()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "iterateNext"));
  }
  auto snapshotItem()(uint index) {
    return recastOpt!(Node)(Object_Call_uint__OptionalHandle(this.handle, "snapshotItem", index));
  }
}


