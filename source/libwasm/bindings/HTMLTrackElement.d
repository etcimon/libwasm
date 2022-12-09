module libwasm.bindings.HTMLTrackElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.TextTrack;

@safe:
nothrow:

struct HTMLTrackElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void kind()(string kind) {
    Object_Call_string__void(this._parent, "kind", kind);
  }
  string kind()() {
    return Object_Getter__string(this._parent, "kind");
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  void srclang()(string srclang) {
    Object_Call_string__void(this._parent, "srclang", srclang);
  }
  string srclang()() {
    return Object_Getter__string(this._parent, "srclang");
  }
  void label()(string label) {
    Object_Call_string__void(this._parent, "label", label);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void default_()(bool default_) {
    Object_Call_bool__void(this._parent, "default", default_);
  }
  bool default_()() {
    return Object_Getter__bool(this._parent, "default");
  }
  enum ushort NONE = 0;
  enum ushort LOADING = 1;
  enum ushort LOADED = 2;
  enum ushort ERROR = 3;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  auto track()() {
    return recastOpt!(TextTrack)(Object_Getter__OptionalHandle(this._parent, "track"));
  }
}


