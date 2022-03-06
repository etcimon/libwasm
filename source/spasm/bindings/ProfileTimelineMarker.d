module spasm.bindings.ProfileTimelineMarker;

import spasm.types;
import spasm.bindings.Performance;

@safe:
nothrow:

struct ProfileTimelineLayerRect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ProfileTimelineLayerRect(spasm_add__object());
  }
  void x()(int x) {
    Object_Call_int__void(this.handle, "x", x);
  }
  int x()() {
    return Object_Getter__int(this.handle, "x");
  }
  void y()(int y) {
    Object_Call_int__void(this.handle, "y", y);
  }
  int y()() {
    return Object_Getter__int(this.handle, "y");
  }
  void width()(int width) {
    Object_Call_int__void(this.handle, "width", width);
  }
  int width()() {
    return Object_Getter__int(this.handle, "width");
  }
  void height()(int height) {
    Object_Call_int__void(this.handle, "height", height);
  }
  int height()() {
    return Object_Getter__int(this.handle, "height");
  }
}
struct ProfileTimelineMarker {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ProfileTimelineMarker(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void start()(double start) {
    Object_Call_double__void(this.handle, "start", start);
  }
  double start()() {
    return Object_Getter__double(this.handle, "start");
  }
  void end()(double end) {
    Object_Call_double__void(this.handle, "end", end);
  }
  double end()() {
    return Object_Getter__double(this.handle, "end");
  }
  void stack(T0)(scope auto ref Optional!(T0) stack) if (isTOrPointer!(T0, JsObject)) {
    ProfileTimelineMarker_stack_Set(this.handle, !stack.empty, stack.front.handle);
  }
  auto stack()() {
    return Object_Getter__OptionalHandle(this.handle, "stack");
  }
  void processType()(ushort processType) {
    ProfileTimelineMarker_processType_Set(this.handle, processType);
  }
  ushort processType()() {
    return Object_Getter__ushort(this.handle, "processType");
  }
  void isOffMainThread()(bool isOffMainThread) {
    Object_Call_bool__void(this.handle, "isOffMainThread", isOffMainThread);
  }
  bool isOffMainThread()() {
    return Object_Getter__bool(this.handle, "isOffMainThread");
  }
  void causeName()(string causeName) {
    Object_Call_string__void(this.handle, "causeName", causeName);
  }
  string causeName()() {
    return Object_Getter__string(this.handle, "causeName");
  }
  void endStack(T0)(scope auto ref Optional!(T0) endStack) if (isTOrPointer!(T0, JsObject)) {
    ProfileTimelineMarker_endStack_Set(this.handle, !endStack.empty, endStack.front.handle);
  }
  auto endStack()() {
    return Object_Getter__OptionalHandle(this.handle, "endStack");
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void eventPhase()(ushort eventPhase) {
    ProfileTimelineMarker_eventPhase_Set(this.handle, eventPhase);
  }
  ushort eventPhase()() {
    return Object_Getter__ushort(this.handle, "eventPhase");
  }
  void unixTime()(uint unixTime) {
    Object_Call_uint__void(this.handle, "unixTime", unixTime);
  }
  uint unixTime()() {
    return Object_Getter__uint(this.handle, "unixTime");
  }
  void rectangles()(scope ref Sequence!(ProfileTimelineLayerRect) rectangles) {
    Object_Call_Handle__void(this.handle, "rectangles", rectangles.handle);
  }
  auto rectangles()() {
    return Sequence!(ProfileTimelineLayerRect)(Object_Getter__Handle(this.handle, "rectangles"));
  }
  void isAnimationOnly()(bool isAnimationOnly) {
    Object_Call_bool__void(this.handle, "isAnimationOnly", isAnimationOnly);
  }
  bool isAnimationOnly()() {
    return Object_Getter__bool(this.handle, "isAnimationOnly");
  }
  void messagePortOperation()(ProfileTimelineMessagePortOperationType messagePortOperation) {
    ProfileTimelineMarker_messagePortOperation_Set(this.handle, messagePortOperation);
  }
  ProfileTimelineMessagePortOperationType messagePortOperation()() {
    return ProfileTimelineMarker_messagePortOperation_Get(this.handle);
  }
  void workerOperation()(ProfileTimelineWorkerOperationType workerOperation) {
    ProfileTimelineMarker_workerOperation_Set(this.handle, workerOperation);
  }
  ProfileTimelineWorkerOperationType workerOperation()() {
    return ProfileTimelineMarker_workerOperation_Get(this.handle);
  }
}
enum ProfileTimelineMessagePortOperationType {
  serializeData,
  deserializeData
}
struct ProfileTimelineStackFrame {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ProfileTimelineStackFrame(spasm_add__object());
  }
  void line()(int line) {
    Object_Call_int__void(this.handle, "line", line);
  }
  int line()() {
    return Object_Getter__int(this.handle, "line");
  }
  void column()(int column) {
    Object_Call_int__void(this.handle, "column", column);
  }
  int column()() {
    return Object_Getter__int(this.handle, "column");
  }
  void source()(string source) {
    Object_Call_string__void(this.handle, "source", source);
  }
  string source()() {
    return Object_Getter__string(this.handle, "source");
  }
  void functionDisplayName()(string functionDisplayName) {
    Object_Call_string__void(this.handle, "functionDisplayName", functionDisplayName);
  }
  string functionDisplayName()() {
    return Object_Getter__string(this.handle, "functionDisplayName");
  }
  void parent(T0)(scope auto ref Optional!(T0) parent) if (isTOrPointer!(T0, JsObject)) {
    ProfileTimelineStackFrame_parent_Set(this.handle, !parent.empty, parent.front.handle);
  }
  auto parent()() {
    return Object_Getter__OptionalHandle(this.handle, "parent");
  }
  void asyncParent(T0)(scope auto ref Optional!(T0) asyncParent) if (isTOrPointer!(T0, JsObject)) {
    ProfileTimelineStackFrame_asyncParent_Set(this.handle, !asyncParent.empty, asyncParent.front.handle);
  }
  auto asyncParent()() {
    return Object_Getter__OptionalHandle(this.handle, "asyncParent");
  }
  void asyncCause()(string asyncCause) {
    Object_Call_string__void(this.handle, "asyncCause", asyncCause);
  }
  string asyncCause()() {
    return Object_Getter__string(this.handle, "asyncCause");
  }
}
enum ProfileTimelineWorkerOperationType {
  serializeDataOffMainThread,
  serializeDataOnMainThread,
  deserializeDataOffMainThread,
  deserializeDataOnMainThread
}


extern (C) void ProfileTimelineMarker_stack_Set(Handle, bool, Handle);
extern (C) void ProfileTimelineMarker_processType_Set(Handle, ushort);
extern (C) void ProfileTimelineMarker_endStack_Set(Handle, bool, Handle);
extern (C) void ProfileTimelineMarker_eventPhase_Set(Handle, ushort);
extern (C) void ProfileTimelineMarker_messagePortOperation_Set(Handle, ProfileTimelineMessagePortOperationType);
extern (C) ProfileTimelineMessagePortOperationType ProfileTimelineMarker_messagePortOperation_Get(Handle);
extern (C) void ProfileTimelineMarker_workerOperation_Set(Handle, ProfileTimelineWorkerOperationType);
extern (C) ProfileTimelineWorkerOperationType ProfileTimelineMarker_workerOperation_Get(Handle);
extern (C) void ProfileTimelineStackFrame_parent_Set(Handle, bool, Handle);
extern (C) void ProfileTimelineStackFrame_asyncParent_Set(Handle, bool, Handle);