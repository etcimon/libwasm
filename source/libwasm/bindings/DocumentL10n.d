module libwasm.bindings.DocumentL10n;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.Node;

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
    return JsPromise!(string)(Serialize_Object_VarArgCall!Handle(this.handle, "formatValue", "string;Handle", tuple(aId, cast(Handle)aArgs.handle)));
  }
  auto formatValue()(string aId) {
    return JsPromise!(string)(Object_Call_string__Handle(this.handle, "formatValue", aId));
  }
  auto formatValues()(scope ref Sequence!(L10nKey) aKeys) {
    return JsPromise!(Sequence!(string))(Object_Call_Handle__Handle(this.handle, "formatValues", aKeys.handle));
  }
  auto formatMessages()(scope ref Sequence!(L10nKey) aKeys) {
    return JsPromise!(Sequence!(string))(Object_Call_Handle__Handle(this.handle, "formatMessages", aKeys.handle));
  }
  void setAttributes()(scope ref Element aElement, string aId, scope ref JsObject aArgs) {
    Serialize_Object_VarArgCall!void(this.handle, "setAttributes", "Handle;string;Handle", tuple(cast(Handle)aElement._parent, aId, cast(Handle)aArgs.handle));
  }
  void setAttributes()(scope ref Element aElement, string aId) {
    Serialize_Object_VarArgCall!void(this.handle, "setAttributes", "Handle;string", tuple(cast(Handle)aElement._parent, aId));
  }
  auto getAttributes()(scope ref Element aElement) {
    return L10nKey(Object_Call_Handle__Handle(this.handle, "getAttributes", aElement._parent));
  }
  auto translateFragment()(scope ref Node aNode) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this.handle, "translateFragment", aNode._parent));
  }
  auto translateElements()(scope ref Sequence!(Element) aElements) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this.handle, "translateElements", aElements.handle));
  }
  auto ready()() {
    return JsPromise!(Any)(Object_Getter__Handle(this.handle, "ready"));
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
    return L10nKey(libwasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void args(T0)(scope auto ref Optional!(T0) args) if (isTOrPointer!(T0, JsObject)) {
    Serialize_Object_VarArgCall!void(this.handle, "args", "Optional!Handle", tuple(!args.empty, cast(Handle)args.front.handle));
  }
  auto args()() {
    return recastOpt!(JsObject)(Object_Getter__OptionalHandle(this.handle, "args"));
  }
}


