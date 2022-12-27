module libwasm.bindings.FileSystemFileEntry;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.File;
import libwasm.bindings.FileSystem;
import libwasm.bindings.FileSystemEntry;

@safe:
nothrow:

alias FileCallback = void delegate(File);
struct FileSystemFileEntry {
  nothrow:
  libwasm.bindings.FileSystemEntry.FileSystemEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .FileSystemEntry(h);
  }
  void file()(FileCallback successCallback, ErrorCallback errorCallback) {
    FileSystemFileEntry_file(this._parent, successCallback, errorCallback);
  }
  void file()(FileCallback successCallback) {
    FileSystemFileEntry_file_0(this._parent, successCallback);
  }
}


extern (C) void FileSystemFileEntry_file(Handle, FileCallback, ErrorCallback);
extern (C) void FileSystemFileEntry_file_0(Handle, FileCallback);