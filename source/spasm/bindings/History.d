module spasm.bindings.History;

import spasm.types;
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
    History_scrollRestoration_Set(this.handle, scrollRestoration);
  }
  ScrollRestoration scrollRestoration()() {
    return History_scrollRestoration_Get(this.handle);
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
    History_pushState(this.handle, _handle_data, title, !url.empty, url.front);
    dropHandle!(T0)(_handle_data);
  }
  void pushState(T0)(scope auto ref T0 data, string title) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    History_pushState_0(this.handle, _handle_data, title);
    dropHandle!(T0)(_handle_data);
  }
  void replaceState(T0, T2)(scope auto ref T0 data, string title, scope auto ref Optional!(T2) url /* = no!(string) */) if (isTOrPointer!(T2, string)) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    History_replaceState(this.handle, _handle_data, title, !url.empty, url.front);
    dropHandle!(T0)(_handle_data);
  }
  void replaceState(T0)(scope auto ref T0 data, string title) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    History_replaceState_0(this.handle, _handle_data, title);
    dropHandle!(T0)(_handle_data);
  }
}
enum ScrollRestoration {
  auto_,
  manual
}


extern (C) void History_scrollRestoration_Set(Handle, ScrollRestoration);
extern (C) ScrollRestoration History_scrollRestoration_Get(Handle);
extern (C) void History_pushState(Handle, Handle, string, bool, string);
extern (C) void History_pushState_0(Handle, Handle, string);
extern (C) void History_replaceState(Handle, Handle, string, bool, string);
extern (C) void History_replaceState_0(Handle, Handle, string);