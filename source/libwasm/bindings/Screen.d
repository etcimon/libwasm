module libwasm.bindings.Screen;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.ScreenOrientation;

@safe:
nothrow:

struct Screen {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  int availWidth()() {
    return Object_Getter__int(this._parent, "availWidth");
  }
  int availHeight()() {
    return Object_Getter__int(this._parent, "availHeight");
  }
  int width()() {
    return Object_Getter__int(this._parent, "width");
  }
  int height()() {
    return Object_Getter__int(this._parent, "height");
  }
  int colorDepth()() {
    return Object_Getter__int(this._parent, "colorDepth");
  }
  int pixelDepth()() {
    return Object_Getter__int(this._parent, "pixelDepth");
  }
  int top()() {
    return Object_Getter__int(this._parent, "top");
  }
  int left()() {
    return Object_Getter__int(this._parent, "left");
  }
  int availTop()() {
    return Object_Getter__int(this._parent, "availTop");
  }
  int availLeft()() {
    return Object_Getter__int(this._parent, "availLeft");
  }
  string mozOrientation()() {
    return Object_Getter__string(this._parent, "mozOrientation");
  }
  void onmozorientationchange(T0)(scope auto ref Optional!(T0) onmozorientationchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmozorientationchange", !onmozorientationchange.empty, onmozorientationchange.front);
  }
  EventHandler onmozorientationchange()() {
    return Object_Getter__EventHandler(this._parent, "onmozorientationchange");
  }
  bool mozLockOrientation()(string orientation) {
    return Object_Call_string__bool(this._parent, "mozLockOrientation", orientation);
  }
  bool mozLockOrientation()(scope ref Sequence!(string) orientation) {
    return Serialize_Object_VarArgCall!bool(this._parent, "mozLockOrientation", "Handle", tuple(cast(Handle)orientation.handle));
  }
  void mozUnlockOrientation()() {
    Object_Call__void(this._parent, "mozUnlockOrientation");
  }
  auto orientation()() {
    return ScreenOrientation(Object_Getter__Handle(this._parent, "orientation"));
  }
  ScreenColorGamut colorGamut()() {
    return Object_Getter__int(this._parent, "colorGamut");
  }
  auto luminance()() {
    return Optional!(ScreenLuminance)(Object_Getter__OptionalHandle(this._parent, "luminance"));
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
}
enum ScreenColorGamut {
  srgb,
  p3,
  rec2020
}
struct ScreenLuminance {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double min()() {
    return Object_Getter__double(this.handle, "min");
  }
  double max()() {
    return Object_Getter__double(this.handle, "max");
  }
  double maxAverage()() {
    return Object_Getter__double(this.handle, "maxAverage");
  }
}


