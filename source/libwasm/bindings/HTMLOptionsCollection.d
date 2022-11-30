module libwasm.bindings.HTMLOptionsCollection;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLOptGroupElement;
import libwasm.bindings.HTMLOptionElement;

@safe:
nothrow:

struct HTMLOptionsCollection {
  nothrow:
  libwasm.bindings.HTMLCollection.HTMLCollection _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "setter", "uint;Optional!Handle", tuple(index, !option.empty, cast(Handle)option.front._parent));
  }
  void opDispatch(uint index)(scope auto ref Optional!(T0) option) if (isTOrPointer!(T1, HTMLOptionElement)) {
    Serialize_Object_VarArgCall!void(this._parent, "setter", "Optional!Handle", tuple(index, !option.empty, cast(Handle)option.front._parent));
  }
  void add(T1)(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element, scope auto ref Optional!(T1) before /* = no!(SumType!(HTMLElement, int)) */) if (isTOrPointer!(T1, SumType!(HTMLElement, int))) {
    Serialize_Object_VarArgCall!void(this._parent, "add", "SumType!(Handle,Handle);Optional!SumType!(Handle,int)", tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => 0),((ref element.Types[1] v) => 1))(element),tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => cast(Handle)v.handle),((ref element.Types[1] v) => Handle.init))(element),libwasm.sumtype.match!(((ref element.Types[0] v) => Handle.init),((ref element.Types[1] v) => cast(Handle)v.handle))(element)), !before.empty, libwasm.sumtype.match!(((ref before.Types[0] v) => 0),((int v) => 1))(before),tuple(libwasm.sumtype.match!(((ref before.Types[0] v) => cast(Handle)v.handle),((int v) => Handle.init))(before),libwasm.sumtype.match!(((ref before.Types[0] v) => int.init),((int v) => v))(before))));
  }
  void add()(scope ref SumType!(HTMLOptionElement, HTMLOptGroupElement) element) {
    Serialize_Object_VarArgCall!void(this._parent, "add", "SumType!(Handle,Handle)", tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => 0),((ref element.Types[1] v) => 1))(element),tuple(libwasm.sumtype.match!(((ref element.Types[0] v) => cast(Handle)v.handle),((ref element.Types[1] v) => Handle.init))(element),libwasm.sumtype.match!(((ref element.Types[0] v) => Handle.init),((ref element.Types[1] v) => cast(Handle)v.handle))(element))));
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


