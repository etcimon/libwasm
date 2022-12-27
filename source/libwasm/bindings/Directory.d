module libwasm.bindings.Directory;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.File;

@safe:
nothrow:

struct Directory {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string path()() {
    return Object_Getter__string(this.handle, "path");
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
}


