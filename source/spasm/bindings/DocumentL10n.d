module spasm.bindings.DocumentL10n;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.Node;

@safe:
nothrow:

struct DocumentL10n {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto formatValue()(string aId, scope ref JsObject aArgs) {
    return Promise!(string)(DocumentL10n_formatValue(this.handle, aId, aArgs.handle));
  }
  auto formatValue()(string aId) {
    return Promise!(string)(Object_Call_string__Handle(this.handle, "formatValue", aId));
  }
  auto formatValues()(scope ref Sequence!(L10nKey) aKeys) {
    return Promise!(Sequence!(string))(Object_Call_Handle__Handle(this.handle, "formatValues", aKeys.handle));
  }
  auto formatMessages()(scope ref Sequence!(L10nKey) aKeys) {
    return Promise!(Sequence!(string))(Object_Call_Handle__Handle(this.handle, "formatMessages", aKeys.handle));
  }
  void setAttributes()(scope ref Element aElement, string aId, scope ref JsObject aArgs) {
    DocumentL10n_setAttributes(this.handle, aElement._parent, aId, aArgs.handle);
  }
  void setAttributes()(scope ref Element aElement, string aId) {
    DocumentL10n_setAttributes_0(this.handle, aElement._parent, aId);
  }
  auto getAttributes()(scope ref Element aElement) {
    return L10nKey(Object_Call_Handle__Handle(this.handle, "getAttributes", aElement._parent));
  }
  auto translateFragment()(scope ref Node aNode) {
    return Promise!(void)(Object_Call_Handle__Handle(this.handle, "translateFragment", aNode._parent));
  }
  auto translateElements()(scope ref Sequence!(Element) aElements) {
    return Promise!(void)(Object_Call_Handle__Handle(this.handle, "translateElements", aElements.handle));
  }
  auto ready()() {
    return Promise!(Any)(Object_Getter__Handle(this.handle, "ready"));
  }
}
struct L10nKey {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return L10nKey(spasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void args(T0)(scope auto ref Optional!(T0) args) if (isTOrPointer!(T0, JsObject)) {
    L10nKey_args_Set(this.handle, !args.empty, args.front.handle);
  }
  auto args()() {
    return Object_Getter__OptionalHandle(this.handle, "args");
  }
}


extern (C) Handle DocumentL10n_formatValue(Handle, string, Handle);
extern (C) void DocumentL10n_setAttributes(Handle, Handle, string, Handle);
extern (C) void DocumentL10n_setAttributes_0(Handle, Handle, string);
extern (C) void L10nKey_args_Set(Handle, bool, Handle);