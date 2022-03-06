module spasm.bindings.DocumentOrShadowRoot;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.Node;
import spasm.bindings.StyleSheetList;

@safe:
nothrow:

struct DocumentOrShadowRoot {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto elementFromPoint()(float x, float y) {
    return DocumentOrShadowRoot_elementFromPoint(this.handle, x, y);
  }
  auto elementsFromPoint()(float x, float y) {
    return Sequence!(Element)(DocumentOrShadowRoot_elementsFromPoint(this.handle, x, y));
  }
  auto nodeFromPoint()(float x, float y) {
    return DocumentOrShadowRoot_nodeFromPoint(this.handle, x, y);
  }
  auto nodesFromPoint()(float x, float y) {
    return Sequence!(Node)(DocumentOrShadowRoot_nodesFromPoint(this.handle, x, y));
  }
  auto activeElement()() {
    return Object_Getter__OptionalHandle(this.handle, "activeElement");
  }
  auto styleSheets()() {
    return StyleSheetList(Object_Getter__Handle(this.handle, "styleSheets"));
  }
  auto pointerLockElement()() {
    return Object_Getter__OptionalHandle(this.handle, "pointerLockElement");
  }
  auto fullscreenElement()() {
    return Object_Getter__OptionalHandle(this.handle, "fullscreenElement");
  }
  auto mozFullScreenElement()() {
    return Object_Getter__OptionalHandle(this.handle, "mozFullScreenElement");
  }
}


extern (C) Optional!(Element) DocumentOrShadowRoot_elementFromPoint(Handle, float, float);
extern (C) Handle DocumentOrShadowRoot_elementsFromPoint(Handle, float, float);
extern (C) Optional!(Node) DocumentOrShadowRoot_nodeFromPoint(Handle, float, float);
extern (C) Handle DocumentOrShadowRoot_nodesFromPoint(Handle, float, float);