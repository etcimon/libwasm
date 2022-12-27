module libwasm.bindings.Console;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct ConsoleCounter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleCounter(libwasm_add__object());
  }
  void label()(string label) {
    Object_Call_string__void(this.handle, "label", label);
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  void count()(uint count) {
    Object_Call_uint__void(this.handle, "count", count);
  }
  uint count()() {
    return Object_Getter__uint(this.handle, "count");
  }
}
struct ConsoleCounterError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleCounterError(libwasm_add__object());
  }
  void label()(string label) {
    Object_Call_string__void(this.handle, "label", label);
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  void error()(string error) {
    Object_Call_string__void(this.handle, "error", error);
  }
  string error()() {
    return Object_Getter__string(this.handle, "error");
  }
}
struct ConsoleEvent {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleEvent(libwasm_add__object());
  }
  void ID()(scope ref SumType!(uint, string) iD) {
    Serialize_Object_VarArgCall!void(this.handle, "ID", "SumType!(uint,string)", tuple(libwasm.sumtype.match!(((uint v) => 0),((string v) => 1))(ID),tuple(libwasm.sumtype.match!(((uint v) => v),((string v) => uint.init))(ID),libwasm.sumtype.match!(((uint v) => string.init),((string v) => v))(ID))));
  }
  auto ID()() {
    return Object_Getter__Handle(this.handle, "ID");
  }
  void innerID()(scope ref SumType!(uint, string) innerID) {
    Serialize_Object_VarArgCall!void(this.handle, "innerID", "SumType!(uint,string)", tuple(libwasm.sumtype.match!(((uint v) => 0),((string v) => 1))(innerID),tuple(libwasm.sumtype.match!(((uint v) => v),((string v) => uint.init))(innerID),libwasm.sumtype.match!(((uint v) => string.init),((string v) => v))(innerID))));
  }
  auto innerID()() {
    return Object_Getter__Handle(this.handle, "innerID");
  }
  void consoleID()(string consoleID) {
    Object_Call_string__void(this.handle, "consoleID", consoleID);
  }
  string consoleID()() {
    return Object_Getter__string(this.handle, "consoleID");
  }
  void addonId()(string addonId) {
    Object_Call_string__void(this.handle, "addonId", addonId);
  }
  string addonId()() {
    return Object_Getter__string(this.handle, "addonId");
  }
  void level()(string level) {
    Object_Call_string__void(this.handle, "level", level);
  }
  string level()() {
    return Object_Getter__string(this.handle, "level");
  }
  void filename()(string filename) {
    Object_Call_string__void(this.handle, "filename", filename);
  }
  string filename()() {
    return Object_Getter__string(this.handle, "filename");
  }
  void sourceId()(uint sourceId) {
    Object_Call_uint__void(this.handle, "sourceId", sourceId);
  }
  uint sourceId()() {
    return Object_Getter__uint(this.handle, "sourceId");
  }
  void lineNumber()(uint lineNumber) {
    Object_Call_uint__void(this.handle, "lineNumber", lineNumber);
  }
  uint lineNumber()() {
    return Object_Getter__uint(this.handle, "lineNumber");
  }
  void columnNumber()(uint columnNumber) {
    Object_Call_uint__void(this.handle, "columnNumber", columnNumber);
  }
  uint columnNumber()() {
    return Object_Getter__uint(this.handle, "columnNumber");
  }
  void functionName()(string functionName) {
    Object_Call_string__void(this.handle, "functionName", functionName);
  }
  string functionName()() {
    return Object_Getter__string(this.handle, "functionName");
  }
  void timeStamp()(double timeStamp) {
    Object_Call_double__void(this.handle, "timeStamp", timeStamp);
  }
  double timeStamp()() {
    return Object_Getter__double(this.handle, "timeStamp");
  }
  void arguments()(scope ref Sequence!(Any) arguments) {
    Object_Call_Handle__void(this.handle, "arguments", arguments.handle);
  }
  auto arguments()() {
    return Sequence!(Any)(Object_Getter__Handle(this.handle, "arguments"));
  }
  void styles()(scope ref Sequence!(Optional!(string)) styles) {
    Object_Call_Handle__void(this.handle, "styles", styles.handle);
  }
  auto styles()() {
    return Sequence!(Optional!(string))(Object_Getter__Handle(this.handle, "styles"));
  }
  void private_()(bool private_) {
    Object_Call_bool__void(this.handle, "private", private_);
  }
  bool private_()() {
    return Object_Getter__bool(this.handle, "private");
  }
  void groupName()(string groupName) {
    Object_Call_string__void(this.handle, "groupName", groupName);
  }
  string groupName()() {
    return Object_Getter__string(this.handle, "groupName");
  }
  void timer(T0)(scope auto ref T0 timer) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "timer", cast(string) timer);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "timer", cast(long) timer);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "timer", cast(double) timer);
      return;
    }
    // Any
    Handle _handle_timer = getOrCreateHandle(timer);
    Object_Call_Handle__void(this.handle, "timer", _handle_timer);
    dropHandle!(T0)(_handle_timer);
  }
  auto timer()() {
    return Any(Object_Getter__Handle(this.handle, "timer"));
  }
  void counter(T0)(scope auto ref T0 counter) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "counter", cast(string) counter);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "counter", cast(long) counter);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "counter", cast(double) counter);
      return;
    }
    // Any
    Handle _handle_counter = getOrCreateHandle(counter);
    Object_Call_Handle__void(this.handle, "counter", _handle_counter);
    dropHandle!(T0)(_handle_counter);
  }
  auto counter()() {
    return Any(Object_Getter__Handle(this.handle, "counter"));
  }
  void prefix()(string prefix) {
    Object_Call_string__void(this.handle, "prefix", prefix);
  }
  string prefix()() {
    return Object_Getter__string(this.handle, "prefix");
  }
}
struct ConsoleInstance {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void assert_(T1)(bool condition /* = false */, scope auto ref T1 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "assert", "bool;Handle", tuple(condition, _handle_data));
    dropHandle!(T1)(_handle_data);
  }
  void clear()() {
    Object_Call__void(this.handle, "clear");
  }
  void count()(string label /* = "default" */) {
    Object_Call_string__void(this.handle, "count", label);
  }
  void count()() {
    Object_Call__void(this.handle, "count");
  }
  void countReset()(string label /* = "default" */) {
    Object_Call_string__void(this.handle, "countReset", label);
  }
  void countReset()() {
    Object_Call__void(this.handle, "countReset");
  }
  void debug_(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "debug", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "debug", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "debug", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "debug", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void error(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "error", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "error", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "error", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "error", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void info(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "info", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "info", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "info", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "info", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void log(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "log", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "log", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "log", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "log", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void table(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "table", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "table", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "table", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "table", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void trace(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "trace", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "trace", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "trace", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "trace", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void warn(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "warn", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "warn", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "warn", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "warn", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void dir(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "dir", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "dir", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "dir", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "dir", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void dirxml(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "dirxml", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "dirxml", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "dirxml", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "dirxml", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void group(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "group", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "group", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "group", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "group", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void groupCollapsed(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "groupCollapsed", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "groupCollapsed", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "groupCollapsed", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "groupCollapsed", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void groupEnd()() {
    Object_Call__void(this.handle, "groupEnd");
  }
  void time()(string label /* = "default" */) {
    Object_Call_string__void(this.handle, "time", label);
  }
  void time()() {
    Object_Call__void(this.handle, "time");
  }
  void timeLog(T1)(string label /* = "default" */, scope auto ref T1 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Serialize_Object_VarArgCall!void(this.handle, "timeLog", "string;Handle", tuple(label, _handle_data));
    dropHandle!(T1)(_handle_data);
  }
  void timeEnd()(string label /* = "default" */) {
    Object_Call_string__void(this.handle, "timeEnd", label);
  }
  void timeEnd()() {
    Object_Call__void(this.handle, "timeEnd");
  }
  void _exception(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "_exception", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "_exception", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "_exception", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "_exception", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void timeStamp(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "timeStamp", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "timeStamp", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "timeStamp", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "timeStamp", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void timeStamp()() {
    Object_Call__void(this.handle, "timeStamp");
  }
  void profile(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "profile", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "profile", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "profile", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "profile", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void profileEnd(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "profileEnd", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "profileEnd", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "profileEnd", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this.handle, "profileEnd", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void reportForServiceWorkerScope()(string scope_, string message, string filename, uint lineNumber, uint columnNumber, ConsoleLevel level) {
    Serialize_Object_VarArgCall!void(this.handle, "reportForServiceWorkerScope", "string;string;string;uint;uint;Enum", tuple(scope_, message, filename, lineNumber, columnNumber, level));
  }
}
alias ConsoleInstanceDumpCallback = void delegate(string);
struct ConsoleInstanceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleInstanceOptions(libwasm_add__object());
  }
  void dump()(ConsoleInstanceDumpCallback dump) {
    ConsoleInstanceOptions_dump_Set(this.handle, dump);
  }
  ConsoleInstanceDumpCallback dump()() {
    return ConsoleInstanceOptions_dump_Get(this.handle);
  }
  void prefix()(string prefix) {
    Object_Call_string__void(this.handle, "prefix", prefix);
  }
  string prefix()() {
    return Object_Getter__string(this.handle, "prefix");
  }
  void innerID()(string innerID) {
    Object_Call_string__void(this.handle, "innerID", innerID);
  }
  string innerID()() {
    return Object_Getter__string(this.handle, "innerID");
  }
  void consoleID()(string consoleID) {
    Object_Call_string__void(this.handle, "consoleID", consoleID);
  }
  string consoleID()() {
    return Object_Getter__string(this.handle, "consoleID");
  }
  void maxLogLevel()(ConsoleLogLevel maxLogLevel) {
    Object_Call_int__void(this.handle, "maxLogLevel", maxLogLevel);
  }
  ConsoleLogLevel maxLogLevel()() {
    return Object_Getter__int(this.handle, "maxLogLevel");
  }
  void maxLogLevelPref()(string maxLogLevelPref) {
    Object_Call_string__void(this.handle, "maxLogLevelPref", maxLogLevelPref);
  }
  string maxLogLevelPref()() {
    return Object_Getter__string(this.handle, "maxLogLevelPref");
  }
}
enum ConsoleLevel {
  log,
  warning,
  error
}
enum ConsoleLogLevel {
  All,
  Debug,
  Log,
  Info,
  Clear,
  Trace,
  TimeLog,
  TimeEnd,
  Time,
  Group,
  GroupEnd,
  Profile,
  ProfileEnd,
  Dir,
  Dirxml,
  Warn,
  Error,
  Off
}
struct ConsoleProfileEvent {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleProfileEvent(libwasm_add__object());
  }
  void action()(string action) {
    Object_Call_string__void(this.handle, "action", action);
  }
  string action()() {
    return Object_Getter__string(this.handle, "action");
  }
  void arguments()(scope ref Sequence!(Any) arguments) {
    Object_Call_Handle__void(this.handle, "arguments", arguments.handle);
  }
  auto arguments()() {
    return Sequence!(Any)(Object_Getter__Handle(this.handle, "arguments"));
  }
}
struct ConsoleStackEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleStackEntry(libwasm_add__object());
  }
  void filename()(string filename) {
    Object_Call_string__void(this.handle, "filename", filename);
  }
  string filename()() {
    return Object_Getter__string(this.handle, "filename");
  }
  void sourceId()(uint sourceId) {
    Object_Call_uint__void(this.handle, "sourceId", sourceId);
  }
  uint sourceId()() {
    return Object_Getter__uint(this.handle, "sourceId");
  }
  void lineNumber()(uint lineNumber) {
    Object_Call_uint__void(this.handle, "lineNumber", lineNumber);
  }
  uint lineNumber()() {
    return Object_Getter__uint(this.handle, "lineNumber");
  }
  void columnNumber()(uint columnNumber) {
    Object_Call_uint__void(this.handle, "columnNumber", columnNumber);
  }
  uint columnNumber()() {
    return Object_Getter__uint(this.handle, "columnNumber");
  }
  void functionName()(string functionName) {
    Object_Call_string__void(this.handle, "functionName", functionName);
  }
  string functionName()() {
    return Object_Getter__string(this.handle, "functionName");
  }
  void asyncCause(T0)(scope auto ref Optional!(T0) asyncCause) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "asyncCause", "Optional!(string)", tuple(!asyncCause.empty, asyncCause.front));
  }
  Optional!(string) asyncCause()() {
    return Object_Getter__OptionalString(this.handle, "asyncCause");
  }
}
struct ConsoleTimerError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleTimerError(libwasm_add__object());
  }
  void error()(string error) {
    Object_Call_string__void(this.handle, "error", error);
  }
  string error()() {
    return Object_Getter__string(this.handle, "error");
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}
struct ConsoleTimerLogOrEnd {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleTimerLogOrEnd(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void duration()(double duration) {
    Object_Call_double__void(this.handle, "duration", duration);
  }
  double duration()() {
    return Object_Getter__double(this.handle, "duration");
  }
}
struct ConsoleTimerStart {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConsoleTimerStart(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}
struct console {
  nothrow:
  static:
  void assert_(T1)(bool condition /* = false */, scope auto ref T1 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    console_assert(this.handle, condition, _handle_data);
    dropHandle!(T1)(_handle_data);
  }
  void clear()() {
    Static_Call__void("console", "clear");
  }
  void count()(string label /* = "default" */) {
    Static_Call_string__void("console", "count", label);
  }
  void count()() {
    Static_Call__void("console", "count");
  }
  void countReset()(string label /* = "default" */) {
    Static_Call_string__void("console", "countReset", label);
  }
  void countReset()() {
    Static_Call__void("console", "countReset");
  }
  void debug_(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "debug", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void error(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "error", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void info(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "info", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void log(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "log", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void table(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "table", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void trace(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "trace", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void warn(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "warn", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void dir(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "dir", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void dirxml(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "dirxml", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void group(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "group", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void groupCollapsed(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "groupCollapsed", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void groupEnd()() {
    Static_Call__void("console", "groupEnd");
  }
  void time()(string label /* = "default" */) {
    Static_Call_string__void("console", "time", label);
  }
  void time()() {
    Static_Call__void("console", "time");
  }
  void timeLog(T1)(string label /* = "default" */, scope auto ref T1 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    console_timeLog(this.handle, label, _handle_data);
    dropHandle!(T1)(_handle_data);
  }
  void timeEnd()(string label /* = "default" */) {
    Static_Call_string__void("console", "timeEnd", label);
  }
  void timeEnd()() {
    Static_Call__void("console", "timeEnd");
  }
  void _exception(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "_exception", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void timeStamp(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "timeStamp", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void timeStamp()() {
    Static_Call__void("console", "timeStamp");
  }
  void profile(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "profile", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  void profileEnd(T0)(scope auto ref T0 data) {
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Static_Call_Handle__void("console", "profileEnd", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  enum bool IS_NATIVE_CONSOLE = true;
  auto createInstance()(scope ref ConsoleInstanceOptions options) {
    return ConsoleInstance(Static_Call_Handle__Handle("console", "createInstance", options.handle));
  }
  auto createInstance()() {
    return ConsoleInstance(Static_Getter__Handle("console", "createInstance"));
  }
}


extern (C) void ConsoleInstanceOptions_dump_Set(Handle, ConsoleInstanceDumpCallback);
extern (C) ConsoleInstanceDumpCallback ConsoleInstanceOptions_dump_Get(Handle);
extern (C) void console_assert(bool, Handle);
extern (C) void console_timeLog(string, Handle);