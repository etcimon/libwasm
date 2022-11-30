module libwasm.bindings.XPathNSResolver;

import libwasm.types;

import std.typecons: tuple;
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
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "lookupNamespaceURI", "Optional!(string)", tuple(!prefix.empty, prefix.front));
  }
}


