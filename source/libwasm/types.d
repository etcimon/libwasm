module libwasm.types;

nothrow:

public import optional;
public import libwasm.sumtype;
public import libwasm.lodash;
import memutils.vector;
import std.traits : hasMember, isCallable, isBasicType, isSomeString;
import libwasm.event : toTuple;
import libwasm.bindings.EventHandler;

version (LDC)
{
  public import ldc.attributes : assumeUsed;
}
else
{
  enum assumeUsed;
}

alias Handle = uint;
version (unittest)
{
@safe extern (C):
  Handle libwasm_add__object()
  {
    return 0;
  }

  void libwasm_removeObject(Handle)
  {
  }

  void Static_Call_Handle__void(string, string, Handle)
  {
  }

  string ldexec_Handle__string(Handle, string, bool delegate(), void delegate(Handle))
  {
    return "";
  }

  long ldexec_Handle__long(Handle, string, bool delegate(), void delegate(Handle))
  {
    return 0;
  }

  double ldexec_Handle__double(Handle, string, bool delegate(), void delegate(Handle))
  {
    return 0;
  }

  Handle ldexec_Handle__Handle(Handle, string, bool delegate(), void delegate(Handle))
  {
    return Handle.init;
  }

  string ldexec_string__string(string, string, bool delegate(), void delegate(Handle), bool)
  {
    return "";
  }

  long ldexec_string__long(string, string, bool delegate(), void delegate(Handle), bool)
  {
    return 0;
  }

  double ldexec_string__double(string, string, bool delegate(), void delegate(Handle), bool)
  {
    return 0;
  }

  Handle ldexec_string__Handle(string, string, bool delegate(), void delegate(Handle), bool)
  {
    return Handle.init;
  }

  long ldexec_long__long(long, string, bool delegate(), void delegate(Handle))
  {
    return 0;
  }

  double ldexec_long__double(long, string, bool delegate(), void delegate(Handle))
  {
    return 0;
  }

  string ldexec_long__string(long, string, bool delegate(), void delegate(Handle))
  {
    return "";
  }

  Handle ldexec_long__Handle(long, string, bool delegate(), void delegate(Handle))
  {
    return Handle.init;
  }

  Handle libwasm_add__string(scope ref string)
  {
    return Handle.init;
  }

  int setTimeout(int ctx, int ptr, int ms)
  {
    return 0;
  }

  Handle libwasm_add__bool(bool)
  {
    return Handle.init;
  }

  void Object_VarArgCall__void(Handle, string, string, string)
  {

  }

  Optional!Handle Object_Getter__OptionalHandle(Handle, string)
  {
    return Optional!Handle.init;
  }

  string Object_Getter__string(Handle, string)
  {
    return "";
  }

  Handle Object_Getter__Handle(Handle, string)
  {
    return Handle.init;
  }
}
else
{
  extern (C) @safe
  {
    Handle libwasm_add__object();
    Handle libwasm_add__string(string);
    void libwasm_removeObject(Handle);
    void Static_Call_Handle__void(string, string, Handle);

    string ldexec_Handle__string(Handle, string, bool delegate(), void delegate(Handle));
    long ldexec_Handle__long(Handle, string, bool delegate(), void delegate(Handle));
    double ldexec_Handle__double(Handle, string, bool delegate(), void delegate(Handle));
    Handle ldexec_Handle__Handle(Handle, string, bool delegate(), void delegate(Handle));

    string ldexec_string__string(string, string, bool delegate(), void delegate(Handle), bool);
    long ldexec_string__long(string, string, bool delegate(), void delegate(Handle), bool);
    double ldexec_string__double(string, string, bool delegate(), void delegate(Handle), bool);
    Handle ldexec_string__Handle(string, string, bool delegate(), void delegate(Handle), bool);

    long ldexec_long__long(long, string, bool delegate(), void delegate(Handle));
    double ldexec_long__double(long, string, bool delegate(), void delegate(Handle));
    string ldexec_long__string(long, string, bool delegate(), void delegate(Handle));
    Handle ldexec_long__Handle(long, string, bool delegate(), void delegate(Handle));
    int setTimeout(int ctx, int ptr, int ms);
    Handle libwasm_add__bool(bool);
    void Object_VarArgCall__void(Handle, string, string, string);
    Optional!Handle Object_Getter__OptionalHandle(Handle, string);
    string Object_Getter__string(Handle, string);
    Handle Object_Getter__Handle(Handle, string);

  }
}

extern (C)
{
@safe:
  void doLog(uint val);
  void libwasm_await__void(Handle);
  Handle libwasm_add__int(int);
  Handle libwasm_add__uint(uint);
  Handle libwasm_add__long(long);
  Handle libwasm_add__ulong(ulong);
  Handle libwasm_add__short(short);
  Handle libwasm_add__ushort(ushort);
  Handle libwasm_add__float(float);
  Handle libwasm_add__double(double);
  Handle libwasm_add__byte(byte);
  Handle libwasm_add__ubyte(ubyte);
  Handle libwasm_add__handles(Handle[]);
  Handle libwasm_copyObjectRef(Handle);
  Handle libasync_promise_all__promise(Handle);
  Handle libasync_promise_any__promise(Handle);
  Handle libasync_promise_allsettled__promise(Handle);
  void libwasm_set__function(string, int ctx, int ptr);
  void libwasm_unset__function(string);
  Handle libwasm_get__field(Handle, string);
  Handle libwasm_get_idx__field(Handle, uint);
  bool libwasm_get__bool(Handle);
  int libwasm_get__int(Handle);
  uint libwasm_get__uint(Handle);
  long libwasm_get__long(Handle);
  ulong libwasm_get__ulong(Handle);
  short libwasm_get__short(Handle);
  ushort libwasm_get__ushort(Handle);
  float libwasm_get__float(Handle);
  double libwasm_get__double(Handle);
  byte libwasm_get__byte(Handle);
  ubyte libwasm_get__ubyte(Handle);
  string libwasm_get__string(Handle);
  void Static_Call_string__void(string, string, string);
  void Object_Call__void(Handle, string);
  void Object_Call_string__void(Handle, string, string);
  void Object_Call_uint__void(Handle, string, uint);
  void Object_Call_int__void(Handle, string, int);
  void Object_Call_bool__void(Handle, string, bool);
  void Object_Call_EventHandler__void(Handle, string, bool, scope EventHandlerNonNull);
  void Object_Call_double__void(Handle, string, double);
  void Object_Call_float__void(Handle, string, float);
  void Object_Call_Handle__void(Handle, string, Handle);
  void Object_Call_string_string__void(Handle, string, string, string);
  void Object_Call_double_double__void(Handle, string, double, double);
  Handle Object_Call_string__Handle(Handle, string, string);
  Handle Object_Call_uint__Handle(Handle, string, uint);
  Handle Object_Call_int__Handle(Handle, string, int);
  Handle Object_Call_bool__Handle(Handle, string, bool);
  Handle Object_Call_Handle__Handle(Handle, string, Handle);
  Handle Object_Call_string_string__Handle(Handle, string, string, string);
  Optional!string Object_Getter__OptionalString(Handle, string);
  Optional!uint Object_Getter__OptionalUint(Handle, string);
  Optional!double Object_Getter__OptionalDouble(Handle, string);
  Optional!bool Object_Getter__OptionalBool(Handle, string);
  Optional!string Object_Call_string__OptionalString(Handle, string, string);
  EventHandler Object_Getter__EventHandler(Handle, string);
  Optional!Handle Object_Call_string__OptionalHandle(Handle, string, string);
  Optional!Handle Object_Call_uint__OptionalHandle(Handle, string, uint);
  Optional!Handle Object_Call_int__OptionalHandle(Handle, string, int);
  Optional!Handle Object_Call_bool__OptionalHandle(Handle, string, bool);
  int Object_Getter__int(Handle, string);
  uint Object_Getter__uint(Handle, string);
  ushort Object_Getter__ushort(Handle, string);
  bool Object_Getter__bool(Handle, string);
  float Object_Getter__float(Handle, string);
  double Object_Getter__double(Handle, string);
  bool Object_Call_string__bool(Handle, string, string);
  string Object_Call_string__string(Handle, string, string);
  string Object_Call_uint__string(Handle, string, uint);
  string Object_Call_uint_uint__string(Handle, string, uint, uint);

  bool Object_VarArgCall__bool(Handle, string, string, string);
  string Object_VarArgCall__string(Handle, string, string, string);
  int Object_VarArgCall__int(Handle, string, string, string);
  uint Object_VarArgCall__uint(Handle, string, string, string);
  short Object_VarArgCall__short(Handle, string, string, string);
  ushort Object_VarArgCall__ushort(Handle, string, string, string);
  Handle Object_VarArgCall__Handle(Handle, string, string, string);
  float Object_VarArgCall__float(Handle, string, string, string);
  double Object_VarArgCall__double(Handle, string, string, string);
  long Object_VarArgCall__long(Handle, string, string, string);
  ulong Object_VarArgCall__ulong(Handle, string, string, string);
  long getTimeStamp();

  Handle JSON_parse_string(string);
  string JSON_stringify(Handle);

  int setInterval(int ctx, int ptr, int ms);
  void clearTimeout(int id);
  void clearInterval(int id);

}

int setTimeout(Delegate)(Delegate del, int ms)
{
  return setTimeout(del.toTuple.expand, ms);
}

int setInterval(Delegate)(Delegate del, int ms)
{
  return setInterval(del.toTuple.expand, ms);
}

void exportDelegate(Delegate)(string name, Delegate del)
{
  return libwasm_set__function(name, del.toTuple.expand);
}

void unexportDelegate()(string name)
{
  return libwasm_unset__function(name);
}

extern (C)
export
@assumeUsed
void jsCallback0(uint ctx, uint fun) @trusted
{
  static struct Handler
  {
  nothrow:
    union
    {
      void delegate() handle;
      struct
      {
        void* contextPtr;
        void* funcPtr;
      }
    }
  }

  Handler c;
  c.contextPtr = cast(void*) ctx;
  c.funcPtr = cast(void*) fun;
  c.handle();
}

extern (C)
export
@assumeUsed
void jsCallback(uint ctx, uint fun, Handle arg) @trusted
{
  static struct Handler
  {
  nothrow:
    union
    {
      void delegate(Handle) handle;
      struct
      {
        void* contextPtr;
        void* funcPtr;
      }
    }
  }

  Handler c;
  c.contextPtr = cast(void*) ctx;
  c.funcPtr = cast(void*) fun;
  c.handle(arg);
}

@trusted extern (C) export @assumeUsed ubyte* allocString(uint bytes);

@trusted R Serialize_Object_VarArgCall(R, TupleArgs)(Handle hndl, string method, string argsdef, scope TupleArgs tupleArgs)
{
  import fast.json;
  import libwasm.rt.allocator;
  import libwasm.bindings.Console;

  /*
  console.log("Got args:");
  foreach (scope arg; tupleArgs) {
    import std.traits : isIterable;
    static if (isIterable!(typeof(arg))) {
    foreach (scope subarg; arg) {
        console.log(subarg);
      }
    } else {
      console.log(arg);
    }
  }*/
  char[] buf = cast(char[]) ThreadMemAllocator.allocate(serializationLength(tupleArgs));
  scope (exit)
    ThreadMemAllocator.deallocate(buf);
  auto args = cast(string) serializeJSON(buf, tupleArgs);
  static if (is(R == string))
    return Object_VarArgCall__string(hndl, method, argsdef, args);
  else static if (is(R == void))
    Object_VarArgCall__void(hndl, method, argsdef, args);
  else static if (is(R == int))
    return Object_VarArgCall__int(hndl, method, argsdef, args);
  else static if (is(R == Handle))
    return Object_VarArgCall__Handle(hndl, method, argsdef, args);
  else static if (is(R == uint))
    return Object_VarArgCall__uint(hndl, method, argsdef, args);
  else static if (is(R == long))
    return Object_VarArgCall__long(hndl, method, argsdef, args);
  else static if (is(R == ulong))
    return Object_VarArgCall__ulong(hndl, method, argsdef, args);
  else static if (is(R == double))
    return Object_VarArgCall__double(hndl, method, argsdef, args);
  else static if (is(R == float))
    return Object_VarArgCall__float(hndl, method, argsdef, args);
  else static if (is(R == ushort))
    return Object_VarArgCall__ushort(hndl, method, argsdef, args);
  else static if (is(R == short))
    return Object_VarArgCall__short(hndl, method, argsdef, args);
  else static if (is(R == bool))
    return Object_VarArgCall__bool(hndl, method, argsdef, args);
}

Vector!char format(string fmt, ARGS...)(ARGS args) @trusted
{
  import fast.format : formattedWrite, decCharsVal;
  import std.traits : isIntegral, isSomeString, isFloatingPoint;

  size_t size_estimate = fmt.length + 16;

  foreach (arg; args)
  {
    static if (isSomeString!(typeof(arg)))
    {
      size_estimate += arg.length;
    }
    else static if (isIntegral!(typeof(arg)))
    {
      size_estimate += decCharsVal(arg);
    }
    else static if (isFloatingPoint!(typeof(arg)))
    {
      size_estimate += decChars!(typeof(arg));
    }
    else
    {
      static assert(false, "Format argument not implemented: " ~ typeof(arg).stringof);
    }
  }

  Vector!char vec = Vector!char(size_estimate);
  char* buf = vec.ptr;
  char[] ret = formattedWrite!fmt(buf, args);
  vec.length = ret.length;

  return vec.move();
}

@safe:

struct Eval
{
  string eval_str;
}

// used for lodash
Eval eval(string eval_str)
{
  return Eval(eval_str);
}

struct JsHandle
{
  import libwasm.bindings.Console;

nothrow:
  public Handle handle;
  ~this()
  {
    if (handle > 2)
    {
      libwasm_removeObject(handle);
    }
  }

  void opAssign(ref Handle handle)
  {
    this.handle = handle;
    handle = 0;
  }

  auto lodash()()
  {
    return Lodash(this.handle, VarType.handle, 128);
  }

  this()(typeof(this) rhs)
  {
    console.log("Copying handle ");
    console.log(cast(int) rhs.handle);
    handle = libwasm_copyObjectRef(rhs.handle);
  }

  this(int rhs)
  {
    handle = rhs;
  }

  alias handle this;
}

auto ptr(return scope ref JsHandle handle) @system
{
  return &handle.handle;
}

enum JsHandle invalidHandle = JsHandle(0);
alias EventHandle = uint;

enum NodeType
{
  a = 0,
  abbr = 1,
  address = 2,
  area = 3,
  article = 4,
  aside = 5,
  audio = 6,
  b = 7,
  base = 8,
  bdi = 9,
  bdo = 10,
  blockquote = 11,
  body_ = 12,
  br = 13,
  button = 14,
  canvas = 15,
  caption = 16,
  cite = 17,
  code = 18,
  col = 19,
  colgroup = 20,
  data = 21,
  datalist = 22,
  dd = 23,
  del = 24,
  dfn = 25,
  div = 26,
  dl = 27,
  dt = 28,
  em = 29,
  embed = 30,
  fieldset = 31,
  figcaption = 32,
  figure = 33,
  footer = 34,
  form = 35,
  h1 = 36,
  h2 = 37,
  h3 = 38,
  h4 = 39,
  h5 = 40,
  h6 = 41,
  head = 42,
  header = 43,
  hr = 44,
  html = 45,
  i = 46,
  iframe = 47,
  img = 48,
  input = 49,
  ins = 50,
  kbd = 51,
  keygen = 52,
  label = 53,
  legend = 54,
  li = 55,
  link = 56,
  main = 57,
  map = 58,
  mark = 59,
  meta = 60,
  meter = 61,
  nav = 62,
  noscript = 63,
  object = 64,
  ol = 65,
  optgroup = 66,
  option = 67,
  output = 68,
  p = 69,
  param = 70,
  pre = 71,
  progress = 72,
  q = 73,
  rb = 74,
  rp = 75,
  rt = 76,
  rtc = 77,
  ruby = 78,
  s = 79,
  samp = 80,
  script = 81,
  section = 82,
  select = 83,
  small = 84,
  source = 85,
  span = 86,
  strong = 87,
  style = 88,
  sub = 89,
  sup = 90,
  table = 91,
  tbody = 92,
  td = 93,
  template_ = 94,
  textarea = 95,
  tfoot = 96,
  th = 97,
  thead = 98,
  time = 99,
  title = 100,
  tr = 101,
  track = 102,
  u = 103,
  ul = 104,
  var = 105,
  video = 106,
  wbr = 107,
  root = 1024 // Special element used in unittests
}

// deprecated("Use libwasm.types.Child instead") enum child;
enum child;
enum prop;
enum callback;
enum attr;
struct connect(field...)
{
};
struct visible(alias condition)
{
};
struct inject(alias parent_name)
{
};
struct entering(alias path)
{
};
struct leaving(alias path)
{
};

template isTOrPointer(T, Target)
{
  enum isTOrPointer = is(T : Target) || is(T : Target*);
}

// TODO: implement others as well
enum ListenerType
{
  click = 0,
  change = 1,
  input = 2,
  keydown = 3,
  keyup = 4,
  dblclick = 5,
  blur = 6,
  mousemove = 7,
  mouseup = 8,
  mousedown = 9,
  keypress = 10,
  focus = 11
}

enum EventType
{
  animation = 0,
  audioProcessing = 1,
  beforeUnload = 2,
  blob = 3,
  clipboard = 4,
  close = 5,
  composition = 6,
  custom = 7,
  deviceLight = 8,
  deviceMotion = 9,
  deviceOrientation = 10,
  deviceProximity = 11,
  drag = 12,
  error = 13,
  fetch = 14,
  focus = 15,
  gamepad = 16,
  hashChange = 17,
  idbVersionChange = 18,
  input = 19,
  keyboard = 20,
  mediaStream = 21,
  message = 22,
  mouse = 23,
  mutation = 24,
  offlineAudioCompletion = 25,
  pageTransition = 26,
  paymentRequestUpdate = 27,
  pointer = 28,
  popState = 29,
  progress = 30,
  rtcDataChannel = 31,
  rtcIdentityError = 32,
  rtcIdentity = 33,
  rtcPeerConnectionIce = 34,
  storage = 35,
  svg = 36,
  time = 37,
  touch = 38,
  trackTransition = 39,
  ui = 40,
  userProximity = 41,
  webGlContext = 42,
  wheel = 43,
  event = 44
}

@safe template as(Target)
{
  static if (isBasicType!Target || is(Target : string))
  {
    auto as(Source)(auto ref Source s) if (hasMember!(Source, "handle"))
    {
      mixin("return libwasm_get__" ~ Target.stringof ~ "(s.handle);");
    }
  }
  else static if (__traits(compiles, "Target.init.handle"))
  {
    @safe auto as(Source)(scope return ref Source s)
    {
      return cast(Target*)&s;
    }

    @safe auto as(Source)(Source s) if (hasMember!(Source, "handle"))
    {
      Handle h = s.handle;
      s.handle = 0;
      return Target(h);
    }
  }
}

auto toOpt(T)(return scope ref T item) @trusted
{
  return Optional!(T*)(&item);
}

auto recastOpt(T, U)(Optional!U item) @trusted
{
  if (item.empty())
  {
    return Optional!T();
  }
  else
  {
    return Optional!T.construct(item.front);
  }
}

auto frontRef(T)(return scope ref T t) @trusted
{
  static if (is(T : Optional!(Base*), Base))
    return t.front;
  else
    return &t.front();
}

Handle getOrCreateHandle(T)(scope ref T data) @trusted
{
  static if (isBasicType!T || isSomeString!T && T.stringof != "typeof(null)")
  {
    static if (isSomeString!T && !is(T : string))
      mixin("return libwasm_add__string(*cast(string*)&data);");
    else
      mixin("return libwasm_add__" ~ T.stringof ~ "(data);");
  }
  else static if (is(T : Optional!U, U))
  {
    if (data.empty)
      return 0;
    return data.front;
  }
  else
  {
    return cast(Handle) data;
  }
}

auto dropHandle(T)(Handle data)
{
  import std.traits : isBasicType;

  static if (isBasicType!T || is(T : string))
  {
    libwasm_removeObject(data);
  }
}

template libwasmMangle(T)
{
  static if (hasMember!(T, "handle") || hasMember!(T, "_parent"))
  {
    enum libwasmMangle = "handle";
  }
  else
  {
    enum libwasmMangle = T.mangleof;
  }
}

template BridgeType(T)
{
  static if (hasMember!(T, "handle") || hasMember!(T, "_parent"))
  {
    alias BridgeType = JsHandle;
  }
  else
  {
    alias BridgeType = T;
  }
}

mixin template ExternPromiseCallback(string funName, T, U)
{
nothrow:
  static if (is(T == void))
  {
    pragma(mangle, funName)
    mixin("extern(C) Handle " ~ funName ~ "(Handle, U delegate() nothrow);");
  }
  else
  {
    pragma(mangle, funName)
    mixin("extern(C) Handle " ~ funName ~ "(Handle, U delegate(" ~ T.stringof ~ ") nothrow);");
  }
}

mixin template ExternPromiseCallback(string funName, T)
{
nothrow:
  static if (is(T == void))
  {
    pragma(mangle, funName)
    mixin("extern(C) Handle " ~ funName ~ "(Handle, void delegate() nothrow);");
  }
  else
  {
    pragma(mangle, funName)
    mixin("extern(C) Handle " ~ funName ~ "(Handle, void delegate(" ~ T.stringof ~ ") nothrow);");
  }
}

struct JsPromise(T = Any)
{
  alias U = Any;
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }

  static auto all()(auto ref JsHandle[] args) {
    auto handle = JsObject(libwasm_add__handles(args));
    mixin("return JsPromise!Any(libasync_promise_all__promise(handle));");
  }
  static auto allSettled()(auto ref JsHandle[] args) {   
    auto handle = JsObject(libwasm_add__handles(args));
    mixin("return JsPromise!Any(libasync_promise_allsettled__promise(handle));");
  }
  static auto any()(auto ref JsHandle[] args) {   
    auto handle = JsObject(libwasm_add__handles(args));
    mixin("return JsPromise!Any(libasync_promise_any__promise(handle));");
  }

  alias JoinedType = BridgeType!T;
  enum ResultMangled = libwasmMangle!T;
  static if (is(T == void))
  {
    alias FulfillCallback(P = void) = P delegate() nothrow;
    alias JoinedCallback(P = void) = extern (C) P delegate() nothrow;
    alias RejectCallback = extern (C) void delegate(U) nothrow;
  }
  else
  {
    alias FulfillCallback(P) = P delegate(T) nothrow;
    alias JoinedCallback(P) = extern (C) P delegate(JoinedType) nothrow;
    alias RejectCallback = extern (C) void delegate(U) nothrow;
  }

  auto then(ResultType)(scope ResultType delegate(T) nothrow cb) @trusted
  {
    enum TMangled = libwasmMangle!T;
    enum ResultTypeMangled = libwasmMangle!ResultType;
    enum funName = "promise_then_" ~ TMangled.length.stringof ~ TMangled ~ ResultTypeMangled;
    mixin ExternPromiseCallback!(funName, JoinedType, BridgeType!ResultType);
    mixin(
      "return JsPromise!(ResultType)(" ~ funName ~ "(handle, cast(JoinedCallback!(BridgeType!ResultType))cb));");
  }

  auto error()(scope void delegate(U) nothrow cb) @trusted
  {
    enum TMangled = libwasmMangle!U;
    enum funName = "promise_error_" ~ TMangled.length.stringof ~ TMangled;
    mixin ExternPromiseCallback!(funName, U);
    mixin("return JsPromise!(void)(" ~ funName ~ "(handle, cast(RejectCallback)cb));");
  }

  // todo: .Finally(()=>
  // todo: Promise.cancel(), Promise.state()

}

/// Waits for the promise to finish
void await(T)(auto ref T promise) {
  import libwasm.bindings.Console;
  console.log("Awaiting");
  libwasm_await__void(promise.handle.handle);
  console.log("Awaited");
}

struct Sequence(T)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct TypedArray(T)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct Int8Array
{
nothrow:
  TypedArray!(byte) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(byte)(h);
  }

  static auto create()(const byte[] data)
  {
    return Int8Array(Int8Array_Create(data));
  }
}

struct Int16Array
{
nothrow:
  TypedArray!(short) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(short)(h);
  }
}

struct Int32Array
{
nothrow:
  TypedArray!(int) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(int)(h);
  }

  static auto create()(const int[] data)
  {
    return Int32Array(Int32Array_Create(data));
  }
}

struct Uint8Array
{
nothrow:
  TypedArray!(ubyte) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(ubyte)(h);
  }

  static auto create()(const ubyte[] data)
  {
    return Uint8Array(Uint8Array_Create(data));
  }
}

struct Uint16Array
{
nothrow:
  TypedArray!(ushort) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(ushort)(h);
  }
}

struct Uint32Array
{
nothrow:
  TypedArray!(uint) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(uint)(h);
  }
}

struct Float32Array
{
nothrow:
  TypedArray!(float) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(float)(h);
  }

  static auto create()(const float[] data)
  {
    return Float32Array(Float32Array_Create(data));
  }
}

struct Float64Array
{
nothrow:
  TypedArray!(double) _array;
  alias _array this;
  this(Handle h)
  {
    _array = TypedArray!(double)(h);
  }
}

struct Uint8ClampedArray
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct DataView
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }

  static auto create()(const ubyte[] data)
  {
    return DataView(DataView_Create(data));
  }
}

struct ArrayBuffer
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct InputStream
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct FrozenArray(T)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct Iterator(T)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct Record(T...)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct ArrayPair(T, U)
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct Any
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct JsObject
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }

  auto opDispatch(string name)()
  {
    return Any(libwasm_get__field(this.handle, name));
  }
  // opIndexAssign
}

struct JSON
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }

  auto opIndex()(string name)
  {
    return JSON(libwasm_get__field(this.handle, name));
  }

  auto opIndex()(uint idx)
  {
    return JSON(libwasm_get_idx__field(this.handle, idx));
  }

  auto as(Target)() @trusted
  {
    return .as!(Target)(this);
  }

  static Handle parse()(string json)
  {
    return JSON_parse_string(json);
  }

  static string stringify()(ref JSON obj)
  {
    return JSON_stringify(obj.handle);
  }
}

struct BufferSource
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct MIDIInput
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct MIDIOutput
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct nsISupports
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct nsIVariant
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct ArrayBufferView
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct ReadableStream
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

struct AudioParam
{
nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h)
  {
    this.handle = JsHandle(h);
  }
}

import libwasm.bindings.Window : Window;

alias WindowProxy = Window;

extern (C)
{
  Handle Int8Array_Create(const byte[]);
  Handle Int32Array_Create(const int[]);
  Handle Uint8Array_Create(const ubyte[]);
  Handle Float32Array_Create(const float[]);
  Handle DataView_Create(const ubyte[]);
}
