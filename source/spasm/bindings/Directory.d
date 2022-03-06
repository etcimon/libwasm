module spasm.bindings.Directory;

import spasm.types;
import spasm.bindings.File;

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
    return Promise!(Sequence!(SumType!(File, Directory)))(Object_Getter__Handle(this.handle, "getFilesAndDirectories"));
  }
  auto getFiles()(bool recursiveFlag /* = false */) {
    return Promise!(Sequence!(File))(Object_Call_bool__Handle(this.handle, "getFiles", recursiveFlag));
  }
  auto getFiles()() {
    return Promise!(Sequence!(File))(Object_Getter__Handle(this.handle, "getFiles"));
  }
}


