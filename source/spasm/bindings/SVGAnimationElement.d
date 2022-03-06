module spasm.bindings.SVGAnimationElement;

import spasm.types;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGStringList;
import spasm.bindings.SVGTests;

@safe:
nothrow:

struct SVGAnimationElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto targetElement()() {
    return Object_Getter__OptionalHandle(this._parent, "targetElement");
  }
  float getStartTime()() {
    return Object_Getter__float(this._parent, "getStartTime");
  }
  float getCurrentTime()() {
    return Object_Getter__float(this._parent, "getCurrentTime");
  }
  float getSimpleDuration()() {
    return Object_Getter__float(this._parent, "getSimpleDuration");
  }
  void beginElement()() {
    Object_Call__void(this._parent, "beginElement");
  }
  void beginElementAt()(float offset) {
    Object_Call_float__void(this._parent, "beginElementAt", offset);
  }
  void endElement()() {
    Object_Call__void(this._parent, "endElement");
  }
  void endElementAt()(float offset) {
    Object_Call_float__void(this._parent, "endElementAt", offset);
  }
  auto requiredFeatures()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "requiredFeatures"));
  }
  auto requiredExtensions()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "requiredExtensions"));
  }
  auto systemLanguage()() {
    return SVGStringList(Object_Getter__Handle(this._parent, "systemLanguage"));
  }
  bool hasExtension()(string extension) {
    return Object_Call_string__bool(this._parent, "hasExtension", extension);
  }
}


