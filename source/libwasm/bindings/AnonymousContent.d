module libwasm.bindings.AnonymousContent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Animation;
import libwasm.bindings.DOMRect;
import libwasm.bindings.KeyframeAnimationOptions;

@safe:
nothrow:

struct AnonymousContent {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string getTextContentForElement()(string elementId) {
    return Object_Call_string__string(this.handle, "getTextContentForElement", elementId);
  }
  void setTextContentForElement()(string elementId, string text) {
    Object_Call_string_string__void(this.handle, "setTextContentForElement", elementId, text);
  }
  Optional!(string) getAttributeForElement()(string elementId, string attributeName) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getAttributeForElement", "string;string", tuple(elementId, attributeName));
  }
  void setAttributeForElement()(string elementId, string attributeName, string value) {
    Serialize_Object_VarArgCall!void(this.handle, "setAttributeForElement", "string;string;string", tuple(elementId, attributeName, value));
  }
  void removeAttributeForElement()(string elementId, string attributeName) {
    Object_Call_string_string__void(this.handle, "removeAttributeForElement", elementId, attributeName);
  }
  auto getCanvasContext()(string elementId, string contextId) {
    return recastOpt!(nsISupports)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getCanvasContext", "string;string", tuple(elementId, contextId)));
  }
  auto setAnimationForElement(T1)(string elementId, scope auto ref Optional!(T1) keyframes, scope ref SumType!(double, KeyframeAnimationOptions) options) if (isTOrPointer!(T1, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this.handle, "setAnimationForElement", "string;Optional!Handle;SumType!(double,Handle)", tuple(elementId, !keyframes.empty, cast(Handle)keyframes.front.handle, libwasm.sumtype.match!(((double v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((double v) => v),((ref options.Types[1] v) => double.init))(options),libwasm.sumtype.match!(((double v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)))));
  }
  auto setAnimationForElement(T1)(string elementId, scope auto ref Optional!(T1) keyframes) if (isTOrPointer!(T1, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this.handle, "setAnimationForElement", "string;Optional!Handle", tuple(elementId, !keyframes.empty, cast(Handle)keyframes.front.handle)));
  }
  void setCutoutRectsForElement()(string elementId, scope ref Sequence!(DOMRect) rects) {
    Serialize_Object_VarArgCall!void(this.handle, "setCutoutRectsForElement", "string;Handle", tuple(elementId, cast(Handle)rects.handle));
  }
  Optional!(string) getComputedStylePropertyValue()(string elementId, string propertyName) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getComputedStylePropertyValue", "string;string", tuple(elementId, propertyName));
  }
}


