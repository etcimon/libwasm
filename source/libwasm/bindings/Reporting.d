module libwasm.bindings.Reporting;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct DeprecationReportBody {
  nothrow:
  libwasm.bindings.Reporting.ReportBody _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .ReportBody(h);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  auto anticipatedRemoval()() {
    return recastOpt!(Date)(Object_Getter__OptionalHandle(this._parent, "anticipatedRemoval"));
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
  Optional!(string) sourceFile()() {
    return Object_Getter__OptionalString(this._parent, "sourceFile");
  }
  Optional!(uint) lineNumber()() {
    return Object_Getter__OptionalUint(this._parent, "lineNumber");
  }
  Optional!(uint) columnNumber()() {
    return Object_Getter__OptionalUint(this._parent, "columnNumber");
  }
}
struct Report {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  auto body_()() {
    return recastOpt!(ReportBody)(Object_Getter__OptionalHandle(this.handle, "body"));
  }
}
struct ReportBody {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
alias ReportList = Sequence!(Report);
struct ReportingEndpoint {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ReportingEndpoint(libwasm_add__object());
  }
  void url(T0)(scope auto ref T0 url) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "url", cast(string) url);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "url", cast(long) url);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "url", cast(double) url);
      return;
    }
    // Any
    Handle _handle_url = getOrCreateHandle(url);
    Object_Call_Handle__void(this.handle, "url", _handle_url);
    dropHandle!(T0)(_handle_url);
  }
  auto url()() {
    return Any(Object_Getter__Handle(this.handle, "url"));
  }
  void priority(T0)(scope auto ref T0 priority) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "priority", cast(string) priority);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "priority", cast(long) priority);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "priority", cast(double) priority);
      return;
    }
    // Any
    Handle _handle_priority = getOrCreateHandle(priority);
    Object_Call_Handle__void(this.handle, "priority", _handle_priority);
    dropHandle!(T0)(_handle_priority);
  }
  auto priority()() {
    return Any(Object_Getter__Handle(this.handle, "priority"));
  }
  void weight(T0)(scope auto ref T0 weight) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "weight", cast(string) weight);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "weight", cast(long) weight);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "weight", cast(double) weight);
      return;
    }
    // Any
    Handle _handle_weight = getOrCreateHandle(weight);
    Object_Call_Handle__void(this.handle, "weight", _handle_weight);
    dropHandle!(T0)(_handle_weight);
  }
  auto weight()() {
    return Any(Object_Getter__Handle(this.handle, "weight"));
  }
}
struct ReportingHeaderValue {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ReportingHeaderValue(libwasm_add__object());
  }
  void items()(scope ref Sequence!(ReportingItem) items) {
    Object_Call_Handle__void(this.handle, "items", items.handle);
  }
  auto items()() {
    return Sequence!(ReportingItem)(Object_Getter__Handle(this.handle, "items"));
  }
}
struct ReportingItem {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ReportingItem(libwasm_add__object());
  }
  void max_age(T0)(scope auto ref T0 max_age) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "max_age", cast(string) max_age);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "max_age", cast(long) max_age);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "max_age", cast(double) max_age);
      return;
    }
    // Any
    Handle _handle_max_age = getOrCreateHandle(max_age);
    Object_Call_Handle__void(this.handle, "max_age", _handle_max_age);
    dropHandle!(T0)(_handle_max_age);
  }
  auto max_age()() {
    return Any(Object_Getter__Handle(this.handle, "max_age"));
  }
  void endpoints(T0)(scope auto ref T0 endpoints) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "endpoints", cast(string) endpoints);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "endpoints", cast(long) endpoints);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "endpoints", cast(double) endpoints);
      return;
    }
    // Any
    Handle _handle_endpoints = getOrCreateHandle(endpoints);
    Object_Call_Handle__void(this.handle, "endpoints", _handle_endpoints);
    dropHandle!(T0)(_handle_endpoints);
  }
  auto endpoints()() {
    return Any(Object_Getter__Handle(this.handle, "endpoints"));
  }
  void group(T0)(scope auto ref T0 group) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "group", cast(string) group);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "group", cast(long) group);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "group", cast(double) group);
      return;
    }
    // Any
    Handle _handle_group = getOrCreateHandle(group);
    Object_Call_Handle__void(this.handle, "group", _handle_group);
    dropHandle!(T0)(_handle_group);
  }
  auto group()() {
    return Any(Object_Getter__Handle(this.handle, "group"));
  }
  void include_subdomains()(bool include_subdomains) {
    Object_Call_bool__void(this.handle, "include_subdomains", include_subdomains);
  }
  bool include_subdomains()() {
    return Object_Getter__bool(this.handle, "include_subdomains");
  }
}
struct ReportingObserver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void observe()() {
    Object_Call__void(this.handle, "observe");
  }
  void disconnect()() {
    Object_Call__void(this.handle, "disconnect");
  }
  auto takeRecords()() {
    return ReportList(Object_Getter__Handle(this.handle, "takeRecords"));
  }
}
alias ReportingObserverCallback = void delegate(Sequence!(Report), ReportingObserver);
struct ReportingObserverOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ReportingObserverOptions(libwasm_add__object());
  }
  void types()(scope ref Sequence!(string) types) {
    Object_Call_Handle__void(this.handle, "types", types.handle);
  }
  auto types()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "types"));
  }
  void buffered()(bool buffered) {
    Object_Call_bool__void(this.handle, "buffered", buffered);
  }
  bool buffered()() {
    return Object_Getter__bool(this.handle, "buffered");
  }
}
struct TestingDeprecatedInterface {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void deprecatedMethod()() {
    Object_Call__void(this.handle, "deprecatedMethod");
  }
  bool deprecatedAttribute()() {
    return Object_Getter__bool(this.handle, "deprecatedAttribute");
  }
}


