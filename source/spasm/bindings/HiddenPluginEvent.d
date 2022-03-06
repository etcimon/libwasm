module spasm.bindings.HiddenPluginEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct HiddenPluginEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto tag()() {
    return Object_Getter__OptionalHandle(this._parent, "tag");
  }
}
struct HiddenPluginEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return HiddenPluginEventInit(spasm_add__object());
  }
  void tag(T0)(scope auto ref Optional!(T0) tag) if (isTOrPointer!(T0, PluginTag)) {
    HiddenPluginEventInit_tag_Set(this._parent, !tag.empty, tag.front.handle);
  }
  auto tag()() {
    return Object_Getter__OptionalHandle(this._parent, "tag");
  }
}


extern (C) void HiddenPluginEventInit_tag_Set(Handle, bool, Handle);