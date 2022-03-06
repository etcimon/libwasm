module spasm.bindings.AutocompleteInfo;

import spasm.types;
@safe:
nothrow:

struct AutocompleteInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AutocompleteInfo(spasm_add__object());
  }
  void section()(string section) {
    Object_Call_string__void(this.handle, "section", section);
  }
  string section()() {
    return Object_Getter__string(this.handle, "section");
  }
  void addressType()(string addressType) {
    Object_Call_string__void(this.handle, "addressType", addressType);
  }
  string addressType()() {
    return Object_Getter__string(this.handle, "addressType");
  }
  void contactType()(string contactType) {
    Object_Call_string__void(this.handle, "contactType", contactType);
  }
  string contactType()() {
    return Object_Getter__string(this.handle, "contactType");
  }
  void fieldName()(string fieldName) {
    Object_Call_string__void(this.handle, "fieldName", fieldName);
  }
  string fieldName()() {
    return Object_Getter__string(this.handle, "fieldName");
  }
  void canAutomaticallyPersist()(bool canAutomaticallyPersist) {
    Object_Call_bool__void(this.handle, "canAutomaticallyPersist", canAutomaticallyPersist);
  }
  bool canAutomaticallyPersist()() {
    return Object_Getter__bool(this.handle, "canAutomaticallyPersist");
  }
}


