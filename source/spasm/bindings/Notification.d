module spasm.bindings.Notification;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct GetNotificationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return GetNotificationOptions(spasm_add__object());
  }
  void tag()(string tag) {
    Object_Call_string__void(this.handle, "tag", tag);
  }
  string tag()() {
    return Object_Getter__string(this.handle, "tag");
  }
}
struct Notification {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void permission()(NotificationPermission permission) {
    Notification_permission_Set(this._parent, permission);
  }
  NotificationPermission permission()() {
    return Notification_permission_Get(this._parent);
  }
  auto requestPermission()(NotificationPermissionCallback permissionCallback) {
    return Promise!(NotificationPermission)(Notification_requestPermission(this._parent, permissionCallback));
  }
  auto requestPermission()() {
    return Promise!(NotificationPermission)(Object_Getter__Handle(this._parent, "requestPermission"));
  }
  auto get()(scope ref GetNotificationOptions filter) {
    return Promise!(Sequence!(Notification))(Object_Call_Handle__Handle(this._parent, "get", filter.handle));
  }
  auto get()() {
    return Promise!(Sequence!(Notification))(Object_Getter__Handle(this._parent, "get"));
  }
  void onclick(T0)(scope auto ref Optional!(T0) onclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclick", !onclick.empty, onclick.front);
  }
  EventHandler onclick()() {
    return Object_Getter__EventHandler(this._parent, "onclick");
  }
  void onshow(T0)(scope auto ref Optional!(T0) onshow) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onshow", !onshow.empty, onshow.front);
  }
  EventHandler onshow()() {
    return Object_Getter__EventHandler(this._parent, "onshow");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  string title()() {
    return Object_Getter__string(this._parent, "title");
  }
  NotificationDirection dir()() {
    return Notification_dir_Get(this._parent);
  }
  Optional!(string) lang()() {
    return Object_Getter__OptionalString(this._parent, "lang");
  }
  Optional!(string) body_()() {
    return Object_Getter__OptionalString(this._parent, "body");
  }
  Optional!(string) tag()() {
    return Object_Getter__OptionalString(this._parent, "tag");
  }
  Optional!(string) icon()() {
    return Object_Getter__OptionalString(this._parent, "icon");
  }
  bool requireInteraction()() {
    return Object_Getter__bool(this._parent, "requireInteraction");
  }
  auto data()() {
    return Any(Object_Getter__Handle(this._parent, "data"));
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
}
struct NotificationBehavior {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NotificationBehavior(spasm_add__object());
  }
  void noscreen()(bool noscreen) {
    Object_Call_bool__void(this.handle, "noscreen", noscreen);
  }
  bool noscreen()() {
    return Object_Getter__bool(this.handle, "noscreen");
  }
  void noclear()(bool noclear) {
    Object_Call_bool__void(this.handle, "noclear", noclear);
  }
  bool noclear()() {
    return Object_Getter__bool(this.handle, "noclear");
  }
  void showOnlyOnce()(bool showOnlyOnce) {
    Object_Call_bool__void(this.handle, "showOnlyOnce", showOnlyOnce);
  }
  bool showOnlyOnce()() {
    return Object_Getter__bool(this.handle, "showOnlyOnce");
  }
  void soundFile()(string soundFile) {
    Object_Call_string__void(this.handle, "soundFile", soundFile);
  }
  string soundFile()() {
    return Object_Getter__string(this.handle, "soundFile");
  }
  void vibrationPattern()(scope ref Sequence!(uint) vibrationPattern) {
    Object_Call_Handle__void(this.handle, "vibrationPattern", vibrationPattern.handle);
  }
  auto vibrationPattern()() {
    return Sequence!(uint)(Object_Getter__Handle(this.handle, "vibrationPattern"));
  }
}
enum NotificationDirection {
  auto_,
  ltr,
  rtl
}
struct NotificationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NotificationOptions(spasm_add__object());
  }
  void dir()(NotificationDirection dir) {
    NotificationOptions_dir_Set(this.handle, dir);
  }
  NotificationDirection dir()() {
    return NotificationOptions_dir_Get(this.handle);
  }
  void lang()(string lang) {
    Object_Call_string__void(this.handle, "lang", lang);
  }
  string lang()() {
    return Object_Getter__string(this.handle, "lang");
  }
  void body_()(string body_) {
    Object_Call_string__void(this.handle, "body", body_);
  }
  string body_()() {
    return Object_Getter__string(this.handle, "body");
  }
  void tag()(string tag) {
    Object_Call_string__void(this.handle, "tag", tag);
  }
  string tag()() {
    return Object_Getter__string(this.handle, "tag");
  }
  void icon()(string icon) {
    Object_Call_string__void(this.handle, "icon", icon);
  }
  string icon()() {
    return Object_Getter__string(this.handle, "icon");
  }
  void requireInteraction()(bool requireInteraction) {
    Object_Call_bool__void(this.handle, "requireInteraction", requireInteraction);
  }
  bool requireInteraction()() {
    return Object_Getter__bool(this.handle, "requireInteraction");
  }
  void data(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "data", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "data", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "data", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "data", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  auto data()() {
    return Any(Object_Getter__Handle(this.handle, "data"));
  }
  void mozbehavior()(scope ref NotificationBehavior mozbehavior) {
    Object_Call_Handle__void(this.handle, "mozbehavior", mozbehavior.handle);
  }
  auto mozbehavior()() {
    return NotificationBehavior(Object_Getter__Handle(this.handle, "mozbehavior"));
  }
}
enum NotificationPermission {
  default_,
  denied,
  granted
}
alias NotificationPermissionCallback = void delegate(NotificationPermission);


extern (C) void Notification_permission_Set(Handle, NotificationPermission);
extern (C) NotificationPermission Notification_permission_Get(Handle);
extern (C) Handle Notification_requestPermission(Handle, NotificationPermissionCallback);
extern (C) NotificationDirection Notification_dir_Get(Handle);
extern (C) void NotificationOptions_dir_Set(Handle, NotificationDirection);
extern (C) NotificationDirection NotificationOptions_dir_Get(Handle);