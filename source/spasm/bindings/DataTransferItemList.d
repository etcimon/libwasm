module spasm.bindings.DataTransferItemList;

import spasm.types;
import spasm.bindings.DataTransferItem;
import spasm.bindings.File;

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
    return DataTransferItemList_add__string_string(this.handle, data, type);
  }
  auto add()(scope ref File data) {
    return DataTransferItemList_add__Handle(this.handle, data._parent);
  }
  void remove()(uint index) {
    Object_Call_uint__void(this.handle, "remove", index);
  }
  void clear()() {
    Object_Call__void(this.handle, "clear");
  }
}


extern (C) Optional!(DataTransferItem) DataTransferItemList_add__string_string(Handle, string, string);
extern (C) Optional!(DataTransferItem) DataTransferItemList_add__Handle(Handle, Handle);