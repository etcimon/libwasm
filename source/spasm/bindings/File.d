module spasm.bindings.File;

import spasm.types;
import spasm.bindings.Blob;

@safe:
nothrow:

struct ChromeFilePropertyBag {
  nothrow:
  spasm.bindings.File.FilePropertyBag _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .FilePropertyBag(h);
  }
  static auto create() {
    return ChromeFilePropertyBag(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void existenceCheck()(bool existenceCheck) {
    Object_Call_bool__void(this._parent, "existenceCheck", existenceCheck);
  }
  bool existenceCheck()() {
    return Object_Getter__bool(this._parent, "existenceCheck");
  }
}
struct File {
  nothrow:
  spasm.bindings.Blob.Blob _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Blob(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  int lastModified()() {
    return Object_Getter__int(this._parent, "lastModified");
  }
  string webkitRelativePath()() {
    return Object_Getter__string(this._parent, "webkitRelativePath");
  }
  string mozFullPath()() {
    return Object_Getter__string(this._parent, "mozFullPath");
  }
  auto createFromNsIFile()(scope ref nsIFile file, scope ref ChromeFilePropertyBag options) {
    return Promise!(File)(File_createFromNsIFile(this._parent, file.handle, options._parent));
  }
  auto createFromNsIFile()(scope ref nsIFile file) {
    return Promise!(File)(Object_Call_Handle__Handle(this._parent, "createFromNsIFile", file.handle));
  }
  auto createFromFileName()(string fileName, scope ref ChromeFilePropertyBag options) {
    return Promise!(File)(File_createFromFileName(this._parent, fileName, options._parent));
  }
  auto createFromFileName()(string fileName) {
    return Promise!(File)(Object_Call_string__Handle(this._parent, "createFromFileName", fileName));
  }
}
struct FilePropertyBag {
  nothrow:
  spasm.bindings.Blob.BlobPropertyBag _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BlobPropertyBag(h);
  }
  static auto create() {
    return FilePropertyBag(spasm_add__object());
  }
  void lastModified()(int lastModified) {
    Object_Call_int__void(this._parent, "lastModified", lastModified);
  }
  int lastModified()() {
    return Object_Getter__int(this._parent, "lastModified");
  }
}


extern (C) Handle File_createFromNsIFile(Handle, Handle, Handle);
extern (C) Handle File_createFromFileName(Handle, string, Handle);