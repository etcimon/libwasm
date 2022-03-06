module spasm.bindings.AnonymousContent;

import spasm.types;
import spasm.bindings.Animation;
import spasm.bindings.Animatable;
import spasm.bindings.DOMRect;
import spasm.bindings.KeyframeAnimationOptions;

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
    return AnonymousContent_getAttributeForElement(this.handle, elementId, attributeName);
  }
  void setAttributeForElement()(string elementId, string attributeName, string value) {
    AnonymousContent_setAttributeForElement(this.handle, elementId, attributeName, value);
  }
  void removeAttributeForElement()(string elementId, string attributeName) {
    Object_Call_string_string__void(this.handle, "removeAttributeForElement", elementId, attributeName);
  }
  auto getCanvasContext()(string elementId, string contextId) {
    return AnonymousContent_getCanvasContext(this.handle, elementId, contextId);
  }
  auto setAnimationForElement(T1)(string elementId, scope auto ref Optional!(T1) keyframes, scope ref SumType!(double, KeyframeAnimationOptions) options) if (isTOrPointer!(T1, JsObject)) {
    return Animation(AnonymousContent_setAnimationForElement(this.handle, elementId, !keyframes.empty, keyframes.front.handle, options));
  }
  auto setAnimationForElement(T1)(string elementId, scope auto ref Optional!(T1) keyframes) if (isTOrPointer!(T1, JsObject)) {
    return Animation(AnonymousContent_setAnimationForElement_0(this.handle, elementId, !keyframes.empty, keyframes.front.handle));
  }
  void setCutoutRectsForElement()(string elementId, scope ref Sequence!(DOMRect) rects) {
    AnonymousContent_setCutoutRectsForElement(this.handle, elementId, rects.handle);
  }
  Optional!(string) getComputedStylePropertyValue()(string elementId, string propertyName) {
    return AnonymousContent_getComputedStylePropertyValue(this.handle, elementId, propertyName);
  }
}


extern (C) Optional!(string) AnonymousContent_getAttributeForElement(Handle, string, string);
extern (C) void AnonymousContent_setAttributeForElement(Handle, string, string, string);
extern (C) Optional!(nsISupports) AnonymousContent_getCanvasContext(Handle, string, string);
extern (C) Handle AnonymousContent_setAnimationForElement(Handle, string, bool, Handle, scope ref SumType!(double, KeyframeAnimationOptions));
extern (C) Handle AnonymousContent_setAnimationForElement_0(Handle, string, bool, Handle);
extern (C) void AnonymousContent_setCutoutRectsForElement(Handle, string, Handle);
extern (C) Optional!(string) AnonymousContent_getComputedStylePropertyValue(Handle, string, string);