module spasm.bindings.HTMLMenuElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLMenuElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void label()(string label) {
    Object_Call_string__void(this._parent, "label", label);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void compact()(bool compact) {
    Object_Call_bool__void(this._parent, "compact", compact);
  }
  bool compact()() {
    return Object_Getter__bool(this._parent, "compact");
  }
  void sendShowEvent()() {
    Object_Call__void(this._parent, "sendShowEvent");
  }
  auto createBuilder()() {
    return Object_Getter__OptionalHandle(this._parent, "createBuilder");
  }
  void build()(scope ref MenuBuilder aBuilder) {
    Object_Call_Handle__void(this._parent, "build", aBuilder.handle);
  }
}


