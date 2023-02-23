module libwasm.bindings.CompositionEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.TextClause;
import libwasm.bindings.UIEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct CompositionEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  Optional!(string) data()() {
    return Object_Getter__OptionalString(this._parent, "data");
  }
  string locale()() {
    return Object_Getter__string(this._parent, "locale");
  }
  auto ranges()() {
    return Sequence!(TextClause)(Object_Getter__Handle(this._parent, "ranges"));
  }
  void initCompositionEvent(T3, T4)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, scope auto ref Optional!(T4) dataArg /* = no!(string) */, string localeArg /* = "" */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T4, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCompositionEvent", "string;bool;bool;Optional!Handle;Optional!(string);string", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, !dataArg.empty, dataArg.front, localeArg));
  }
  void initCompositionEvent(T3, T4)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, scope auto ref Optional!(T4) dataArg /* = no!(string) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T4, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCompositionEvent", "string;bool;bool;Optional!Handle;Optional!(string)", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, !dataArg.empty, dataArg.front));
  }
  void initCompositionEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCompositionEvent", "string;bool;bool;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent));
  }
  void initCompositionEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCompositionEvent", "string;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg));
  }
  void initCompositionEvent()(string typeArg, bool canBubbleArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCompositionEvent", "string;bool", tuple(typeArg, canBubbleArg));
  }
  void initCompositionEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initCompositionEvent", typeArg);
  }
}
struct CompositionEventInit {
  nothrow:
  libwasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return CompositionEventInit(libwasm_add__object());
  }
  void data()(string data) {
    Object_Call_string__void(this._parent, "data", data);
  }
  string data()() {
    return Object_Getter__string(this._parent, "data");
  }
}


