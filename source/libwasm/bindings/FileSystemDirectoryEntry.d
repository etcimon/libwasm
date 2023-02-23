module libwasm.bindings.FileSystemDirectoryEntry;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.FileSystem;
import libwasm.bindings.FileSystemDirectoryReader;
import libwasm.bindings.FileSystemEntry;

@safe:
nothrow:

struct FileSystemDirectoryEntry {
  nothrow:
  libwasm.bindings.FileSystemEntry.FileSystemEntry _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "getFile", "Optional!(string);Handle", tuple(!path.empty, path.front, cast(Handle)options.handle));
  }
  void getFile(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "getFile", "Optional!(string)", tuple(!path.empty, path.front));
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
    Serialize_Object_VarArgCall!void(this._parent, "getDirectory", "Optional!(string);Handle", tuple(!path.empty, path.front, cast(Handle)options.handle));
  }
  void getDirectory(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "getDirectory", "Optional!(string)", tuple(!path.empty, path.front));
  }
  void getDirectory()() {
    Object_Call__void(this._parent, "getDirectory");
  }
}


extern (C) void FileSystemDirectoryEntry_getFile(Handle, bool, string, Handle, FileSystemEntryCallback, ErrorCallback);
extern (C) void FileSystemDirectoryEntry_getFile_0(Handle, bool, string, Handle, FileSystemEntryCallback);
extern (C) void FileSystemDirectoryEntry_getDirectory(Handle, bool, string, Handle, FileSystemEntryCallback, ErrorCallback);
extern (C) void FileSystemDirectoryEntry_getDirectory_0(Handle, bool, string, Handle, FileSystemEntryCallback);