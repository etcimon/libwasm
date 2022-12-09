module libwasm.bindings.HiddenPluginEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct HiddenPluginEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto tag()() {
    return recastOpt!(PluginTag)(Object_Getter__OptionalHandle(this._parent, "tag"));
  }
}
struct HiddenPluginEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return HiddenPluginEventInit(libwasm_add__object());
  }
  void tag(T0)(scope auto ref Optional!(T0) tag) if (isTOrPointer!(T0, PluginTag)) {
    Serialize_Object_VarArgCall!void(this._parent, "tag", "Optional!Handle", tuple(!tag.empty, cast(Handle)tag.front.handle));
  }
  auto tag()() {
    return recastOpt!(PluginTag)(Object_Getter__OptionalHandle(this._parent, "tag"));
  }
}


