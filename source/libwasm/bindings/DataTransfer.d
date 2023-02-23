module libwasm.bindings.DataTransfer;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DOMStringList;
import libwasm.bindings.DataTransferItemList;
import libwasm.bindings.Directory;
import libwasm.bindings.Element;
import libwasm.bindings.File;
import libwasm.bindings.FileList;
import libwasm.bindings.Node;

@safe:
nothrow:

struct DataTransfer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void dropEffect()(string dropEffect) {
    Object_Call_string__void(this.handle, "dropEffect", dropEffect);
  }
  string dropEffect()() {
    return Object_Getter__string(this.handle, "dropEffect");
  }
  void effectAllowed()(string effectAllowed) {
    Object_Call_string__void(this.handle, "effectAllowed", effectAllowed);
  }
  string effectAllowed()() {
    return Object_Getter__string(this.handle, "effectAllowed");
  }
  auto items()() {
    return DataTransferItemList(Object_Getter__Handle(this.handle, "items"));
  }
  void setDragImage()(scope ref Element image, int x, int y) {
    Serialize_Object_VarArgCall!void(this.handle, "setDragImage", "Handle;int;int", tuple(cast(Handle)image._parent, x, y));
  }
  auto types()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "types"));
  }
  string getData()(string format) {
    return Object_Call_string__string(this.handle, "getData", format);
  }
  void setData()(string format, string data) {
    Object_Call_string_string__void(this.handle, "setData", format, data);
  }
  void clearData()(string format) {
    Object_Call_string__void(this.handle, "clearData", format);
  }
  void clearData()() {
    Object_Call__void(this.handle, "clearData");
  }
  auto files()() {
    return recastOpt!(FileList)(Object_Getter__OptionalHandle(this.handle, "files"));
  }
  auto getFilesAndDirectories()() {
    return JsPromise!(Sequence!(SumType!(File, Directory)))(Object_Getter__Handle(this.handle, "getFilesAndDirectories"));
  }
  auto getFiles()(bool recursiveFlag /* = false */) {
    return JsPromise!(Sequence!(File))(Object_Call_bool__Handle(this.handle, "getFiles", recursiveFlag));
  }
  auto getFiles()() {
    return JsPromise!(Sequence!(File))(Object_Getter__Handle(this.handle, "getFiles"));
  }
  void addElement()(scope ref Element element) {
    Object_Call_Handle__void(this.handle, "addElement", element._parent);
  }
  uint mozItemCount()() {
    return Object_Getter__uint(this.handle, "mozItemCount");
  }
  void mozCursor()(string mozCursor) {
    Object_Call_string__void(this.handle, "mozCursor", mozCursor);
  }
  string mozCursor()() {
    return Object_Getter__string(this.handle, "mozCursor");
  }
  auto mozTypesAt()(uint index) {
    return DOMStringList(Object_Call_uint__Handle(this.handle, "mozTypesAt", index));
  }
  void mozClearDataAt()(string format, uint index) {
    Object_Call_string_uint__void(this.handle, "mozClearDataAt", format, index);
  }
  void mozSetDataAt(T1)(string format, scope auto ref T1 data, uint index) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "mozSetDataAt", "string;Handle;uint", tuple(format, _handle_data, index));
    dropHandle!(T1)(_handle_data);
  }
  auto mozGetDataAt()(string format, uint index) {
    return Any(Object_Call_string_uint__Handle(this.handle, "mozGetDataAt", format, index));
  }
  void updateDragImage()(scope ref Element image, int x, int y) {
    Serialize_Object_VarArgCall!void(this.handle, "updateDragImage", "Handle;int;int", tuple(cast(Handle)image._parent, x, y));
  }
  bool mozUserCancelled()() {
    return Object_Getter__bool(this.handle, "mozUserCancelled");
  }
  auto mozSourceNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "mozSourceNode"));
  }
  string mozTriggeringPrincipalURISpec()() {
    return Object_Getter__string(this.handle, "mozTriggeringPrincipalURISpec");
  }
  auto mozCloneForEvent()(string event) {
    return DataTransfer(Object_Call_string__Handle(this.handle, "mozCloneForEvent", event));
  }
}


