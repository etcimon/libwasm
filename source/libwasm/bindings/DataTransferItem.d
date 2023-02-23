module libwasm.bindings.DataTransferItem;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.File;
import libwasm.bindings.FileSystemEntry;

@safe:
nothrow:

struct DataTransferItem {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string kind()() {
    return Object_Getter__string(this.handle, "kind");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void getAsString(T0)(scope auto ref Optional!(T0) _callback) if (isTOrPointer!(T0, FunctionStringCallback)) {
    DataTransferItem_getAsString(this.handle, !_callback.empty, _callback.front);
  }
  auto getAsFile()() {
    return recastOpt!(File)(Object_Getter__OptionalHandle(this.handle, "getAsFile"));
  }
  auto webkitGetAsEntry()() {
    return recastOpt!(FileSystemEntry)(Object_Getter__OptionalHandle(this.handle, "webkitGetAsEntry"));
  }
}
alias FunctionStringCallback = void delegate(string);


extern (C) void DataTransferItem_getAsString(Handle, bool, FunctionStringCallback);