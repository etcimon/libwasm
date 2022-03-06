module spasm.bindings.XPathNSResolver;

import spasm.types;
@safe:
nothrow:

struct XPathNSResolver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(string) lookupNamespaceURI(T0)(scope auto ref Optional!(T0) prefix) if (isTOrPointer!(T0, string)) {
    return XPathNSResolver_lookupNamespaceURI(this.handle, !prefix.empty, prefix.front);
  }
}


extern (C) Optional!(string) XPathNSResolver_lookupNamespaceURI(Handle, bool, string);