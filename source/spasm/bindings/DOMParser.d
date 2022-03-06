module spasm.bindings.DOMParser;

import spasm.types;
import spasm.bindings.Document;
import spasm.bindings.LegacyQueryInterface;

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
    return Document(DOMParser_parseFromString(this.handle, str, type));
  }
  auto parseFromBuffer()(scope ref Sequence!(ubyte) buf, SupportedType type) {
    return Document(DOMParser_parseFromBuffer__sequence_SupportedType(this.handle, buf.handle, type));
  }
  auto parseFromBuffer()(scope ref Uint8Array buf, SupportedType type) {
    return Document(DOMParser_parseFromBuffer__Handle_SupportedType(this.handle, buf.handle, type));
  }
  auto parseFromStream(T1)(scope ref InputStream stream, scope auto ref Optional!(T1) charset, int contentLength, SupportedType type) if (isTOrPointer!(T1, string)) {
    return Document(DOMParser_parseFromStream(this.handle, stream.handle, !charset.empty, charset.front, contentLength, type));
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


extern (C) Handle DOMParser_parseFromString(Handle, string, SupportedType);
extern (C) Handle DOMParser_parseFromBuffer__sequence_SupportedType(Handle, Handle, SupportedType);
extern (C) Handle DOMParser_parseFromBuffer__Handle_SupportedType(Handle, Handle, SupportedType);
extern (C) Handle DOMParser_parseFromStream(Handle, Handle, bool, string, int, SupportedType);