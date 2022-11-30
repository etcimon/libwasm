module libwasm.bindings.PerformanceEntryEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct PerformanceEntryEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  string entryType()() {
    return Object_Getter__string(this._parent, "entryType");
  }
  double startTime()() {
    return Object_Getter__double(this._parent, "startTime");
  }
  double duration()() {
    return Object_Getter__double(this._parent, "duration");
  }
  double epoch()() {
    return Object_Getter__double(this._parent, "epoch");
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
}
struct PerformanceEntryEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PerformanceEntryEventInit(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void entryType()(string entryType) {
    Object_Call_string__void(this._parent, "entryType", entryType);
  }
  string entryType()() {
    return Object_Getter__string(this._parent, "entryType");
  }
  void startTime()(double startTime) {
    Object_Call_double__void(this._parent, "startTime", startTime);
  }
  double startTime()() {
    return Object_Getter__double(this._parent, "startTime");
  }
  void duration()(double duration) {
    Object_Call_double__void(this._parent, "duration", duration);
  }
  double duration()() {
    return Object_Getter__double(this._parent, "duration");
  }
  void epoch()(double epoch) {
    Object_Call_double__void(this._parent, "epoch", epoch);
  }
  double epoch()() {
    return Object_Getter__double(this._parent, "epoch");
  }
  void origin()(string origin) {
    Object_Call_string__void(this._parent, "origin", origin);
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
}


