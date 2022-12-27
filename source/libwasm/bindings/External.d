module libwasm.bindings.External;

import libwasm.types;

import memutils.ct: tuple;
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


