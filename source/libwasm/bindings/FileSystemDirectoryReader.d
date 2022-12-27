module libwasm.bindings.FileSystemDirectoryReader;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.FileSystem;
import libwasm.bindings.FileSystemEntry;

@safe:
nothrow:

struct FileSystemDirectoryReader {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void readEntries()(FileSystemEntriesCallback successCallback, ErrorCallback errorCallback) {
    FileSystemDirectoryReader_readEntries(this.handle, successCallback, errorCallback);
  }
  void readEntries()(FileSystemEntriesCallback successCallback) {
    FileSystemDirectoryReader_readEntries_0(this.handle, successCallback);
  }
}
alias FileSystemEntriesCallback = void delegate(Sequence!(FileSystemEntry));


extern (C) void FileSystemDirectoryReader_readEntries(Handle, FileSystemEntriesCallback, ErrorCallback);
extern (C) void FileSystemDirectoryReader_readEntries_0(Handle, FileSystemEntriesCallback);