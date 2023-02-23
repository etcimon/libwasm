module libwasm.bindings.AppNotificationServiceOptions;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Notification;

@safe:
nothrow:

struct AppNotificationServiceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AppNotificationServiceOptions(libwasm_add__object());
  }
  void textClickable()(bool textClickable) {
    Object_Call_bool__void(this.handle, "textClickable", textClickable);
  }
  bool textClickable()() {
    return Object_Getter__bool(this.handle, "textClickable");
  }
  void manifestURL()(string manifestURL) {
    Object_Call_string__void(this.handle, "manifestURL", manifestURL);
  }
  string manifestURL()() {
    return Object_Getter__string(this.handle, "manifestURL");
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void dbId()(string dbId) {
    Object_Call_string__void(this.handle, "dbId", dbId);
  }
  string dbId()() {
    return Object_Getter__string(this.handle, "dbId");
  }
  void dir()(string dir) {
    Object_Call_string__void(this.handle, "dir", dir);
  }
  string dir()() {
    return Object_Getter__string(this.handle, "dir");
  }
  void lang()(string lang) {
    Object_Call_string__void(this.handle, "lang", lang);
  }
  string lang()() {
    return Object_Getter__string(this.handle, "lang");
  }
  void tag()(string tag) {
    Object_Call_string__void(this.handle, "tag", tag);
  }
  string tag()() {
    return Object_Getter__string(this.handle, "tag");
  }
  void data()(string data) {
    Object_Call_string__void(this.handle, "data", data);
  }
  string data()() {
    return Object_Getter__string(this.handle, "data");
  }
  void mozbehavior()(scope ref NotificationBehavior mozbehavior) {
    Object_Call_Handle__void(this.handle, "mozbehavior", mozbehavior.handle);
  }
  auto mozbehavior()() {
    return NotificationBehavior(Object_Getter__Handle(this.handle, "mozbehavior"));
  }
}


