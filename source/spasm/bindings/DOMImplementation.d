module spasm.bindings.DOMImplementation;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.DocumentType;

@safe:
nothrow:

struct DOMImplementation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool hasFeature()() {
    return Object_Getter__bool(this.handle, "hasFeature");
  }
  auto createDocumentType()(string qualifiedName, string publicId, string systemId) {
    return DocumentType(DOMImplementation_createDocumentType(this.handle, qualifiedName, publicId, systemId));
  }
  auto createDocument(T0, T2)(scope auto ref Optional!(T0) namespace, string qualifiedName, scope auto ref Optional!(T2) doctype /* = no!(DocumentType) */) if (isTOrPointer!(T0, string) && isTOrPointer!(T2, DocumentType)) {
    return Document(DOMImplementation_createDocument(this.handle, !namespace.empty, namespace.front, qualifiedName, !doctype.empty, doctype.front._parent));
  }
  auto createDocument(T0)(scope auto ref Optional!(T0) namespace, string qualifiedName) if (isTOrPointer!(T0, string)) {
    return Document(DOMImplementation_createDocument_0(this.handle, !namespace.empty, namespace.front, qualifiedName));
  }
  auto createHTMLDocument()(string title) {
    return Document(Object_Call_string__Handle(this.handle, "createHTMLDocument", title));
  }
  auto createHTMLDocument()() {
    return Document(Object_Getter__Handle(this.handle, "createHTMLDocument"));
  }
}


extern (C) Handle DOMImplementation_createDocumentType(Handle, string, string, string);
extern (C) Handle DOMImplementation_createDocument(Handle, bool, string, string, bool, Handle);
extern (C) Handle DOMImplementation_createDocument_0(Handle, bool, string, string);