module libwasm.bindings.History;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct History {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  void scrollRestoration()(ScrollRestoration scrollRestoration) {
    Object_Call_int__void(this.handle, "scrollRestoration", scrollRestoration);
  }
  ScrollRestoration scrollRestoration()() {
    return Object_Getter__int(this.handle, "scrollRestoration");
  }
  auto state()() {
    return Any(Object_Getter__Handle(this.handle, "state"));
  }
  void go()(int delta /* = 0 */) {
    Object_Call_int__void(this.handle, "go", delta);
  }
  void go()() {
    Object_Call__void(this.handle, "go");
  }
  void back()() {
    Object_Call__void(this.handle, "back");
  }
  void forward()() {
    Object_Call__void(this.handle, "forward");
  }
  void pushState(T0, T2)(scope auto ref T0 data, string title, scope auto ref Optional!(T2) url /* = no!(string) */) if (isTOrPointer!(T2, string)) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "pushState", "Handle;string;Optional!(string)", tuple(_handle_data, title, !url.empty, url.front));
    dropHandle!(T0)(_handle_data);
  }
  void pushState(T0)(scope auto ref T0 data, string title) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "pushState", "Handle;string", tuple(_handle_data, title));
    dropHandle!(T0)(_handle_data);
  }
  void replaceState(T0, T2)(scope auto ref T0 data, string title, scope auto ref Optional!(T2) url /* = no!(string) */) if (isTOrPointer!(T2, string)) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "replaceState", "Handle;string;Optional!(string)", tuple(_handle_data, title, !url.empty, url.front));
    dropHandle!(T0)(_handle_data);
  }
  void replaceState(T0)(scope auto ref T0 data, string title) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "replaceState", "Handle;string", tuple(_handle_data, title));
    dropHandle!(T0)(_handle_data);
  }
}
enum ScrollRestoration {
  auto_,
  manual
}


