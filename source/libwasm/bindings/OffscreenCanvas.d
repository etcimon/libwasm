module libwasm.bindings.OffscreenCanvas;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.EventTarget;
import libwasm.bindings.ImageBitmap;

@safe:
nothrow:

struct OffscreenCanvas {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void width()(uint width) {
    Object_Call_uint__void(this._parent, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this._parent, "width");
  }
  void height()(uint height) {
    Object_Call_uint__void(this._parent, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this._parent, "height");
  }
  auto getContext(T1)(string contextId, scope auto ref T1 contextOptions /* = null */) {
    // Any
    Handle _handle_contextOptions = getOrCreateHandle(contextOptions);
    auto result = recastOpt!(nsISupports)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getContext", "string;Handle", tuple(contextId, _handle_contextOptions)));
    dropHandle!(T1)(_handle_contextOptions);
    return result;
  }
  auto getContext()(string contextId) {
    return recastOpt!(nsISupports)(Object_Call_string__OptionalHandle(this._parent, "getContext", contextId));
  }
  auto transferToImageBitmap()() {
    return ImageBitmap(Object_Getter__Handle(this._parent, "transferToImageBitmap"));
  }
  auto toBlob(T1)(string type /* = "" */, scope auto ref T1 encoderOptions) {
    // Any
    Handle _handle_encoderOptions = getOrCreateHandle(encoderOptions);
    auto result = JsPromise!(Blob)(Serialize_Object_VarArgCall!Handle(this._parent, "toBlob", "string;Handle", tuple(type, _handle_encoderOptions)));
    dropHandle!(T1)(_handle_encoderOptions);
    return result;
  }
  auto toBlob()(string type /* = "" */) {
    return JsPromise!(Blob)(Object_Call_string__Handle(this._parent, "toBlob", type));
  }
  auto toBlob()() {
    return JsPromise!(Blob)(Object_Getter__Handle(this._parent, "toBlob"));
  }
}


