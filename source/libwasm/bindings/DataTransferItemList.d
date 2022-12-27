module libwasm.bindings.DataTransferItemList;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DataTransferItem;
import libwasm.bindings.File;

@safe:
nothrow:

struct DataTransferItemList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto opIndex()(uint index) {
    return DataTransferItem(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto opDispatch(uint index)() {
    return DataTransferItem(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto add()(string data, string type) {
    return recastOpt!(DataTransferItem)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "add", "string;string", tuple(data, type)));
  }
  auto add()(scope ref File data) {
    return recastOpt!(DataTransferItem)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "add", "Handle", tuple(cast(Handle)data._parent)));
  }
  void remove()(uint index) {
    Object_Call_uint__void(this.handle, "remove", index);
  }
  void clear()() {
    Object_Call__void(this.handle, "clear");
  }
}


