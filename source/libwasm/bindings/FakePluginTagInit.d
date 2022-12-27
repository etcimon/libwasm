module libwasm.bindings.FakePluginTagInit;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct FakePluginMimeEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FakePluginMimeEntry(libwasm_add__object());
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void description()(string description) {
    Object_Call_string__void(this.handle, "description", description);
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  void extension()(string extension) {
    Object_Call_string__void(this.handle, "extension", extension);
  }
  string extension()() {
    return Object_Getter__string(this.handle, "extension");
  }
}
struct FakePluginTagInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FakePluginTagInit(libwasm_add__object());
  }
  void handlerURI()(string handlerURI) {
    Object_Call_string__void(this.handle, "handlerURI", handlerURI);
  }
  string handlerURI()() {
    return Object_Getter__string(this.handle, "handlerURI");
  }
  void mimeEntries()(scope ref Sequence!(FakePluginMimeEntry) mimeEntries) {
    Object_Call_Handle__void(this.handle, "mimeEntries", mimeEntries.handle);
  }
  auto mimeEntries()() {
    return Sequence!(FakePluginMimeEntry)(Object_Getter__Handle(this.handle, "mimeEntries"));
  }
  void niceName()(string niceName) {
    Object_Call_string__void(this.handle, "niceName", niceName);
  }
  string niceName()() {
    return Object_Getter__string(this.handle, "niceName");
  }
  void fullPath()(string fullPath) {
    Object_Call_string__void(this.handle, "fullPath", fullPath);
  }
  string fullPath()() {
    return Object_Getter__string(this.handle, "fullPath");
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void description()(string description) {
    Object_Call_string__void(this.handle, "description", description);
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  void fileName()(string fileName) {
    Object_Call_string__void(this.handle, "fileName", fileName);
  }
  string fileName()() {
    return Object_Getter__string(this.handle, "fileName");
  }
  void version_()(string version_) {
    Object_Call_string__void(this.handle, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  void sandboxScript()(string sandboxScript) {
    Object_Call_string__void(this.handle, "sandboxScript", sandboxScript);
  }
  string sandboxScript()() {
    return Object_Getter__string(this.handle, "sandboxScript");
  }
}


