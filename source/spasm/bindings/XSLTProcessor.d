module spasm.bindings.XSLTProcessor;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.DocumentFragment;
import spasm.bindings.Node;

@safe:
nothrow:

struct XSLTProcessor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void importStylesheet()(scope ref Node style) {
    Object_Call_Handle__void(this.handle, "importStylesheet", style._parent);
  }
  auto transformToFragment()(scope ref Node source, scope ref Document output) {
    return DocumentFragment(XSLTProcessor_transformToFragment(this.handle, source._parent, output._parent));
  }
  auto transformToDocument()(scope ref Node source) {
    return Document(Object_Call_Handle__Handle(this.handle, "transformToDocument", source._parent));
  }
  void setParameter(T2)(string namespaceURI, string localName, scope auto ref T2 value) {
    // Any
    Handle _handle_value = getOrCreateHandle(value);
    XSLTProcessor_setParameter(this.handle, namespaceURI, localName, _handle_value);
    dropHandle!(T2)(_handle_value);
  }
  auto getParameter()(string namespaceURI, string localName) {
    return XSLTProcessor_getParameter(this.handle, namespaceURI, localName);
  }
  void removeParameter()(string namespaceURI, string localName) {
    Object_Call_string_string__void(this.handle, "removeParameter", namespaceURI, localName);
  }
  void clearParameters()() {
    Object_Call__void(this.handle, "clearParameters");
  }
  void reset()() {
    Object_Call__void(this.handle, "reset");
  }
  enum uint DISABLE_ALL_LOADS = 1;
  void flags()(uint flags) {
    Object_Call_uint__void(this.handle, "flags", flags);
  }
  uint flags()() {
    return Object_Getter__uint(this.handle, "flags");
  }
}


extern (C) Handle XSLTProcessor_transformToFragment(Handle, Handle, Handle);
extern (C) void XSLTProcessor_setParameter(Handle, string, string, Handle);
extern (C) Optional!(nsIVariant) XSLTProcessor_getParameter(Handle, string, string);