module spasm.bindings.PluginCrashedEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct PluginCrashedEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint pluginID()() {
    return Object_Getter__uint(this._parent, "pluginID");
  }
  string pluginDumpID()() {
    return Object_Getter__string(this._parent, "pluginDumpID");
  }
  string pluginName()() {
    return Object_Getter__string(this._parent, "pluginName");
  }
  Optional!(string) browserDumpID()() {
    return Object_Getter__OptionalString(this._parent, "browserDumpID");
  }
  Optional!(string) pluginFilename()() {
    return Object_Getter__OptionalString(this._parent, "pluginFilename");
  }
  bool submittedCrashReport()() {
    return Object_Getter__bool(this._parent, "submittedCrashReport");
  }
  bool gmpPlugin()() {
    return Object_Getter__bool(this._parent, "gmpPlugin");
  }
}
struct PluginCrashedEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PluginCrashedEventInit(spasm_add__object());
  }
  void pluginID()(uint pluginID) {
    Object_Call_uint__void(this._parent, "pluginID", pluginID);
  }
  uint pluginID()() {
    return Object_Getter__uint(this._parent, "pluginID");
  }
  void pluginDumpID()(string pluginDumpID) {
    Object_Call_string__void(this._parent, "pluginDumpID", pluginDumpID);
  }
  string pluginDumpID()() {
    return Object_Getter__string(this._parent, "pluginDumpID");
  }
  void pluginName()(string pluginName) {
    Object_Call_string__void(this._parent, "pluginName", pluginName);
  }
  string pluginName()() {
    return Object_Getter__string(this._parent, "pluginName");
  }
  void browserDumpID(T0)(scope auto ref Optional!(T0) browserDumpID) if (isTOrPointer!(T0, string)) {
    PluginCrashedEventInit_browserDumpID_Set(this._parent, !browserDumpID.empty, browserDumpID.front);
  }
  Optional!(string) browserDumpID()() {
    return Object_Getter__OptionalString(this._parent, "browserDumpID");
  }
  void pluginFilename(T0)(scope auto ref Optional!(T0) pluginFilename) if (isTOrPointer!(T0, string)) {
    PluginCrashedEventInit_pluginFilename_Set(this._parent, !pluginFilename.empty, pluginFilename.front);
  }
  Optional!(string) pluginFilename()() {
    return Object_Getter__OptionalString(this._parent, "pluginFilename");
  }
  void submittedCrashReport()(bool submittedCrashReport) {
    Object_Call_bool__void(this._parent, "submittedCrashReport", submittedCrashReport);
  }
  bool submittedCrashReport()() {
    return Object_Getter__bool(this._parent, "submittedCrashReport");
  }
  void gmpPlugin()(bool gmpPlugin) {
    Object_Call_bool__void(this._parent, "gmpPlugin", gmpPlugin);
  }
  bool gmpPlugin()() {
    return Object_Getter__bool(this._parent, "gmpPlugin");
  }
}


extern (C) void PluginCrashedEventInit_browserDumpID_Set(Handle, bool, string);
extern (C) void PluginCrashedEventInit_pluginFilename_Set(Handle, bool, string);