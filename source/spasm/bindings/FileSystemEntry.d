module spasm.bindings.FileSystemEntry;

import spasm.types;
import spasm.bindings.FileSystem;

@safe:
nothrow:

struct FileSystemEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool isFile()() {
    return Object_Getter__bool(this.handle, "isFile");
  }
  bool isDirectory()() {
    return Object_Getter__bool(this.handle, "isDirectory");
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string fullPath()() {
    return Object_Getter__string(this.handle, "fullPath");
  }
  auto filesystem()() {
    return FileSystem(Object_Getter__Handle(this.handle, "filesystem"));
  }
  void getParent()(FileSystemEntryCallback successCallback, ErrorCallback errorCallback) {
    FileSystemEntry_getParent(this.handle, successCallback, errorCallback);
  }
  void getParent()(FileSystemEntryCallback successCallback) {
    FileSystemEntry_getParent_0(this.handle, successCallback);
  }
  void getParent()() {
    Object_Call__void(this.handle, "getParent");
  }
}


extern (C) void FileSystemEntry_getParent(Handle, FileSystemEntryCallback, ErrorCallback);
extern (C) void FileSystemEntry_getParent_0(Handle, FileSystemEntryCallback);