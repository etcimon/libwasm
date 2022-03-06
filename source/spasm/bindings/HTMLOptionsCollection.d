module spasm.bindings.HTMLOptionsCollection;

import spasm.types;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLOptGroupElement;
import spasm.bindings.HTMLOptionElement;

@safe:
nothrow:

struct HTMLOptionsCollection {
  nothrow:
  spasm.bindings.HTMLCollection.HTMLCollection _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLCollection(h);
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  void opIndexAssign(T1)(scope auto ref Optional!(T0) option, uint index) if (isTOrPointer!(T1, HTMLOptionElement)) {
    HTMLOptionsCollection_setter__uint_optional_Handle(this._parent, index, !option.empty, option.front._parent);
  }
  void opDispatch(uint index)(scope auto ref Optional!(T0) option) if (isTOrPointer!(T1, HTMLOptionElement)) {
    HTMLOptionsCollection_setter__uint_optional_Handle(this._parent, index, !option.empty, option.front._parent);
  }
  void add(T1)(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element, scope auto ref Optional!(T1) before /* = no!(SumType!(HTMLElement, int)) */) if (isTOrPointer!(T1, SumType!(HTMLElement, int))) {
    HTMLOptionsCollection_add(this._parent, element, !before.empty, *before.frontRef);
  }
  void add()(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element) {
    HTMLOptionsCollection_add_0(this._parent, element);
  }
  void remove()(int index) {
    Object_Call_int__void(this._parent, "remove", index);
  }
  void selectedIndex()(int selectedIndex) {
    Object_Call_int__void(this._parent, "selectedIndex", selectedIndex);
  }
  int selectedIndex()() {
    return Object_Getter__int(this._parent, "selectedIndex");
  }
}


extern (C) void HTMLOptionsCollection_setter__uint_optional_Handle(Handle, uint, bool, Handle);
extern (C) void HTMLOptionsCollection_add(Handle, scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement), bool, scope ref SumType!(HTMLElement, int));
extern (C) void HTMLOptionsCollection_add_0(Handle, scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement));