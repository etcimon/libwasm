module libwasm.bindings.DOMParser;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Document;
import libwasm.bindings.LegacyQueryInterface;

@safe:
nothrow:

struct DOMParser {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto parseFromString()(string str, SupportedType type) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "parseFromString", "string;Enum", tuple(str, type)));
  }
  auto parseFromBuffer()(scope ref Sequence!(ubyte) buf, SupportedType type) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "parseFromBuffer", "Handle;Enum", tuple(cast(Handle)buf.handle, type)));
  }
  auto parseFromBuffer()(scope ref Uint8Array buf, SupportedType type) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "parseFromBuffer", "Handle;Enum", tuple(cast(Handle)buf.handle, type)));
  }
  auto parseFromStream(T1)(scope ref InputStream stream, scope auto ref Optional!(T1) charset, int contentLength, SupportedType type) if (isTOrPointer!(T1, string)) {
    return Document(Serialize_Object_VarArgCall!Handle(this.handle, "parseFromStream", "Handle;Optional!(string);int;Enum", tuple(cast(Handle)stream.handle, !charset.empty, charset.front, contentLength, type)));
  }
  void forceEnableXULXBL()() {
    Object_Call__void(this.handle, "forceEnableXULXBL");
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this.handle, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}
enum SupportedType {
  text_html,
  text_xml,
  application_xml,
  application_xhtml_xml,
  image_svg_xml
}


