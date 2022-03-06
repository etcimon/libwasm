module spasm.bindings.Presentation;

import spasm.types;
import spasm.bindings.PresentationReceiver;
import spasm.bindings.PresentationRequest;

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
    Presentation_defaultRequest_Set(this.handle, !defaultRequest.empty, defaultRequest.front.handle);
  }
  auto defaultRequest()() {
    return Object_Getter__OptionalHandle(this.handle, "defaultRequest");
  }
  auto receiver()() {
    return Object_Getter__OptionalHandle(this.handle, "receiver");
  }
}


extern (C) void Presentation_defaultRequest_Set(Handle, bool, Handle);