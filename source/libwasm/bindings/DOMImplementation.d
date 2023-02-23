module libwasm.bindings.DOMImplementation;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Document;
import libwasm.bindings.DocumentType;

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
    return DocumentType(Serialize_Object_VarArgCall!Handle(this.handle, "createDocumentType", "string;string;string", tuple(qualifiedName, publicId, systemId)));
  }
  auto createDocument(T0, T2)(scope auto ref Optional!(T0) namespace, string qualifiedName, scope auto ref Optional!(T2) doctype /* = no!(DocumentType) */) if (isTOrPointer!(T0, string) && isTOrPointer!(T2, DocumentType)) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "createDocument", "Optional!(string);string;Optional!Handle", tuple(!namespace.empty, namespace.front, qualifiedName, !doctype.empty, cast(Handle)doctype.front._parent)));
  }
  auto createDocument(T0)(scope auto ref Optional!(T0) namespace, string qualifiedName) if (isTOrPointer!(T0, string)) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "createDocument", "Optional!(string);string", tuple(!namespace.empty, namespace.front, qualifiedName)));
  }
  auto createHTMLDocument()(string title) {
    return Document(Object_Call_string__Handle(this.handle, "createHTMLDocument", title));
  }
  auto createHTMLDocument()() {
    return Document(Object_Getter__Handle(this.handle, "createHTMLDocument"));
  }
}


