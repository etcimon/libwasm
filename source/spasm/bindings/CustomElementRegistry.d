module spasm.bindings.CustomElementRegistry;

import spasm.types;
import spasm.bindings.Function;
import spasm.bindings.Node;

@safe:
nothrow:

alias CustomElementCreationCallback = void delegate(string);
struct CustomElementRegistry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void define()(string name, Function functionConstructor, scope ref ElementDefinitionOptions options) {
    CustomElementRegistry_define(this.handle, name, functionConstructor, options.handle);
  }
  void define()(string name, Function functionConstructor) {
    CustomElementRegistry_define_0(this.handle, name, functionConstructor);
  }
  void setElementCreationCallback()(string name, CustomElementCreationCallback callback) {
    CustomElementRegistry_setElementCreationCallback(this.handle, name, callback);
  }
  auto get()(string name) {
    return Any(Object_Call_string__Handle(this.handle, "get", name));
  }
  auto whenDefined()(string name) {
    return Promise!(void)(Object_Call_string__Handle(this.handle, "whenDefined", name));
  }
  void upgrade()(scope ref Node root) {
    Object_Call_Handle__void(this.handle, "upgrade", root._parent);
  }
}
struct ElementDefinitionOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ElementDefinitionOptions(spasm_add__object());
  }
  void extends()(string extends) {
    Object_Call_string__void(this.handle, "extends", extends);
  }
  string extends()() {
    return Object_Getter__string(this.handle, "extends");
  }
}


extern (C) void CustomElementRegistry_define(Handle, string, Function, Handle);
extern (C) void CustomElementRegistry_define_0(Handle, string, Function);
extern (C) void CustomElementRegistry_setElementCreationCallback(Handle, string, CustomElementCreationCallback);