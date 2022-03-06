module spasm.bindings.External;

import spasm.types;
@safe:
nothrow:

struct External {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void AddSearchProvider()(string aDescriptionURL) {
    Object_Call_string__void(this.handle, "AddSearchProvider", aDescriptionURL);
  }
  void IsSearchProviderInstalled()() {
    Object_Call__void(this.handle, "IsSearchProviderInstalled");
  }
}


