module libwasm.bindings.TreeColumns;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.TreeColumn;

@safe:
nothrow:

struct TreeColumns {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto tree()() {
    return recastOpt!(XULTreeElement)(Object_Getter__OptionalHandle(this.handle, "tree"));
  }
  uint count()() {
    return Object_Getter__uint(this.handle, "count");
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto getFirstColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getFirstColumn"));
  }
  auto getLastColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getLastColumn"));
  }
  auto getPrimaryColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getPrimaryColumn"));
  }
  auto getSortedColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getSortedColumn"));
  }
  auto getKeyColumn()() {
    return recastOpt!(TreeColumn)(Object_Getter__OptionalHandle(this.handle, "getKeyColumn"));
  }
  auto getColumnFor(T0)(scope auto ref Optional!(T0) element) if (isTOrPointer!(T0, Element)) {
    return recastOpt!(TreeColumn)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getColumnFor", "Optional!Handle", tuple(!element.empty, cast(Handle)element.front._parent)));
  }
  auto getNamedColumn()(string name) {
    return recastOpt!(TreeColumn)(Object_Call_string__OptionalHandle(this.handle, "getNamedColumn", name));
  }
  auto getColumnAt()(uint index) {
    return recastOpt!(TreeColumn)(Object_Call_uint__OptionalHandle(this.handle, "getColumnAt", index));
  }
  void invalidateColumns()() {
    Object_Call__void(this.handle, "invalidateColumns");
  }
  void restoreNaturalOrder()() {
    Object_Call__void(this.handle, "restoreNaturalOrder");
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this.handle, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}


