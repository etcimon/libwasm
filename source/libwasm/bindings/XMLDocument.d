module libwasm.bindings.XMLDocument;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Document;

@safe:
nothrow:

struct XMLDocument {
  nothrow:
  libwasm.bindings.Document.Document _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Document(h);
  }
  bool load()(string url) {
    return Object_Call_string__bool(this._parent, "load", url);
  }
  void async()(bool async) {
    Object_Call_bool__void(this._parent, "async", async);
  }
  bool async()() {
    return Object_Getter__bool(this._parent, "async");
  }
}


