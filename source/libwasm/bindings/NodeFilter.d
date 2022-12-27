module libwasm.bindings.NodeFilter;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Node;

@safe:
nothrow:

struct NodeFilter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort FILTER_ACCEPT = 1;
  enum ushort FILTER_REJECT = 2;
  enum ushort FILTER_SKIP = 3;
  enum uint SHOW_ALL = 0xFFFFFFFF;
  enum uint SHOW_ELEMENT = 0x1;
  enum uint SHOW_ATTRIBUTE = 0x2;
  enum uint SHOW_TEXT = 0x4;
  enum uint SHOW_CDATA_SECTION = 0x8;
  enum uint SHOW_ENTITY_REFERENCE = 0x10;
  enum uint SHOW_ENTITY = 0x20;
  enum uint SHOW_PROCESSING_INSTRUCTION = 0x40;
  enum uint SHOW_COMMENT = 0x80;
  enum uint SHOW_DOCUMENT = 0x100;
  enum uint SHOW_DOCUMENT_TYPE = 0x200;
  enum uint SHOW_DOCUMENT_FRAGMENT = 0x400;
  enum uint SHOW_NOTATION = 0x800;
  ushort acceptNode()(scope ref Node node) {
    return Serialize_Object_VarArgCall!ushort(this.handle, "acceptNode", "Handle", tuple(cast(Handle)node._parent));
  }
}


