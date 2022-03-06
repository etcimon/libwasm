module spasm.bindings.CompositionEvent;

import spasm.types;
import spasm.bindings.TextClause;
import spasm.bindings.UIEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct CompositionEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
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
    CompositionEvent_initCompositionEvent(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, !dataArg.empty, dataArg.front, localeArg);
  }
  void initCompositionEvent(T3, T4)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, scope auto ref Optional!(T4) dataArg /* = no!(string) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T4, string)) {
    CompositionEvent_initCompositionEvent_0(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, !dataArg.empty, dataArg.front);
  }
  void initCompositionEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    CompositionEvent_initCompositionEvent_1(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent);
  }
  void initCompositionEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    CompositionEvent_initCompositionEvent_2(this._parent, typeArg, canBubbleArg, cancelableArg);
  }
  void initCompositionEvent()(string typeArg, bool canBubbleArg /* = false */) {
    CompositionEvent_initCompositionEvent_3(this._parent, typeArg, canBubbleArg);
  }
  void initCompositionEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initCompositionEvent", typeArg);
  }
}
struct CompositionEventInit {
  nothrow:
  spasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return CompositionEventInit(spasm_add__object());
  }
  void data()(string data) {
    Object_Call_string__void(this._parent, "data", data);
  }
  string data()() {
    return Object_Getter__string(this._parent, "data");
  }
}


extern (C) void CompositionEvent_initCompositionEvent(Handle, string, bool, bool, bool, Handle, bool, string, string);
extern (C) void CompositionEvent_initCompositionEvent_0(Handle, string, bool, bool, bool, Handle, bool, string);
extern (C) void CompositionEvent_initCompositionEvent_1(Handle, string, bool, bool, bool, Handle);
extern (C) void CompositionEvent_initCompositionEvent_2(Handle, string, bool, bool);
extern (C) void CompositionEvent_initCompositionEvent_3(Handle, string, bool);