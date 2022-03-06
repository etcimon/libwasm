module spasm.bindings.FileSystemDirectoryEntry;

import spasm.types;
import spasm.bindings.FileSystem;
import spasm.bindings.FileSystemDirectoryReader;
import spasm.bindings.FileSystemEntry;

@safe:
nothrow:

struct FileSystemDirectoryEntry {
  nothrow:
  spasm.bindings.FileSystemEntry.FileSystemEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .FileSystemEntry(h);
  }
  auto createReader()() {
    return FileSystemDirectoryReader(Object_Getter__Handle(this._parent, "createReader"));
  }
  void getFile(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options, FileSystemEntryCallback successCallback, ErrorCallback errorCallback) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getFile(this._parent, !path.empty, path.front, options.handle, successCallback, errorCallback);
  }
  void getFile(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options, FileSystemEntryCallback successCallback) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getFile_0(this._parent, !path.empty, path.front, options.handle, successCallback);
  }
  void getFile(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getFile_1(this._parent, !path.empty, path.front, options.handle);
  }
  void getFile(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getFile_2(this._parent, !path.empty, path.front);
  }
  void getFile()() {
    Object_Call__void(this._parent, "getFile");
  }
  void getDirectory(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options, FileSystemEntryCallback successCallback, ErrorCallback errorCallback) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getDirectory(this._parent, !path.empty, path.front, options.handle, successCallback, errorCallback);
  }
  void getDirectory(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options, FileSystemEntryCallback successCallback) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getDirectory_0(this._parent, !path.empty, path.front, options.handle, successCallback);
  }
  void getDirectory(T0)(scope auto ref Optional!(T0) path, scope ref FileSystemFlags options) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getDirectory_1(this._parent, !path.empty, path.front, options.handle);
  }
  void getDirectory(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, string)) {
    FileSystemDirectoryEntry_getDirectory_2(this._parent, !path.empty, path.front);
  }
  void getDirectory()() {
    Object_Call__void(this._parent, "getDirectory");
  }
}


extern (C) void FileSystemDirectoryEntry_getFile(Handle, bool, string, Handle, FileSystemEntryCallback, ErrorCallback);
extern (C) void FileSystemDirectoryEntry_getFile_0(Handle, bool, string, Handle, FileSystemEntryCallback);
extern (C) void FileSystemDirectoryEntry_getFile_1(Handle, bool, string, Handle);
extern (C) void FileSystemDirectoryEntry_getFile_2(Handle, bool, string);
extern (C) void FileSystemDirectoryEntry_getDirectory(Handle, bool, string, Handle, FileSystemEntryCallback, ErrorCallback);
extern (C) void FileSystemDirectoryEntry_getDirectory_0(Handle, bool, string, Handle, FileSystemEntryCallback);
extern (C) void FileSystemDirectoryEntry_getDirectory_1(Handle, bool, string, Handle);
extern (C) void FileSystemDirectoryEntry_getDirectory_2(Handle, bool, string);