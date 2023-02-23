module libwasm.bindings.Presentation;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.PresentationReceiver;
import libwasm.bindings.PresentationRequest;

@safe:
nothrow:

struct Presentation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void defaultRequest(T0)(scope auto ref Optional!(T0) defaultRequest) if (isTOrPointer!(T0, PresentationRequest)) {
    Serialize_Object_VarArgCall!void(this.handle, "defaultRequest", "Optional!Handle", tuple(!defaultRequest.empty, cast(Handle)defaultRequest.front.handle));
  }
  auto defaultRequest()() {
    return recastOpt!(PresentationRequest)(Object_Getter__OptionalHandle(this.handle, "defaultRequest"));
  }
  auto receiver()() {
    return recastOpt!(PresentationReceiver)(Object_Getter__OptionalHandle(this.handle, "receiver"));
  }
}


