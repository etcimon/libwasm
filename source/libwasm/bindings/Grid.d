module libwasm.bindings.Grid;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct Grid {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto rows()() {
    return GridDimension(Object_Getter__Handle(this.handle, "rows"));
  }
  auto cols()() {
    return GridDimension(Object_Getter__Handle(this.handle, "cols"));
  }
  auto areas()() {
    return Sequence!(GridArea)(Object_Getter__Handle(this.handle, "areas"));
  }
}
struct GridArea {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  GridDeclaration type()() {
    return Object_Getter__int(this.handle, "type");
  }
  uint rowStart()() {
    return Object_Getter__uint(this.handle, "rowStart");
  }
  uint rowEnd()() {
    return Object_Getter__uint(this.handle, "rowEnd");
  }
  uint columnStart()() {
    return Object_Getter__uint(this.handle, "columnStart");
  }
  uint columnEnd()() {
    return Object_Getter__uint(this.handle, "columnEnd");
  }
}
enum GridDeclaration {
  explicit,
  implicit
}
struct GridDimension {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto lines()() {
    return GridLines(Object_Getter__Handle(this.handle, "lines"));
  }
  auto tracks()() {
    return GridTracks(Object_Getter__Handle(this.handle, "tracks"));
  }
}
struct GridLine {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto names()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "names"));
  }
  double start()() {
    return Object_Getter__double(this.handle, "start");
  }
  double breadth()() {
    return Object_Getter__double(this.handle, "breadth");
  }
  GridDeclaration type()() {
    return Object_Getter__int(this.handle, "type");
  }
  uint number()() {
    return Object_Getter__uint(this.handle, "number");
  }
  int negativeNumber()() {
    return Object_Getter__int(this.handle, "negativeNumber");
  }
}
struct GridLines {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return recastOpt!(GridLine)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}
struct GridTrack {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double start()() {
    return Object_Getter__double(this.handle, "start");
  }
  double breadth()() {
    return Object_Getter__double(this.handle, "breadth");
  }
  GridDeclaration type()() {
    return Object_Getter__int(this.handle, "type");
  }
  GridTrackState state()() {
    return Object_Getter__int(this.handle, "state");
  }
}
enum GridTrackState {
  static_,
  repeat,
  removed
}
struct GridTracks {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return recastOpt!(GridTrack)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}


