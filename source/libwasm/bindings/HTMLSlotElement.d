module libwasm.bindings.HTMLSlotElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.Node;

@safe:
nothrow:

struct AssignedNodesOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AssignedNodesOptions(libwasm_add__object());
  }
  void flatten()(bool flatten) {
    Object_Call_bool__void(this.handle, "flatten", flatten);
  }
  bool flatten()() {
    return Object_Getter__bool(this.handle, "flatten");
  }
}
struct HTMLSlotElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  auto assignedNodes()(scope ref AssignedNodesOptions options) {
    return Sequence!(Node)(Object_Call_Handle__Handle(this._parent, "assignedNodes", options.handle));
  }
  auto assignedNodes()() {
    return Sequence!(Node)(Object_Getter__Handle(this._parent, "assignedNodes"));
  }
  auto assignedElements()(scope ref AssignedNodesOptions options) {
    return Sequence!(Element)(Object_Call_Handle__Handle(this._parent, "assignedElements", options.handle));
  }
  auto assignedElements()() {
    return Sequence!(Element)(Object_Getter__Handle(this._parent, "assignedElements"));
  }
}


