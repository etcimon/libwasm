module spasm.bindings.APZTestData;

import spasm.types;
@safe:
nothrow:

struct APZBucket {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return APZBucket(spasm_add__object());
  }
  void sequenceNumber()(uint sequenceNumber) {
    Object_Call_uint__void(this.handle, "sequenceNumber", sequenceNumber);
  }
  uint sequenceNumber()() {
    return Object_Getter__uint(this.handle, "sequenceNumber");
  }
  void scrollFrames()(scope ref Sequence!(ScrollFrameData) scrollFrames) {
    Object_Call_Handle__void(this.handle, "scrollFrames", scrollFrames.handle);
  }
  auto scrollFrames()() {
    return Sequence!(ScrollFrameData)(Object_Getter__Handle(this.handle, "scrollFrames"));
  }
}
struct APZHitResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return APZHitResult(spasm_add__object());
  }
  void screenX()(float screenX) {
    Object_Call_float__void(this.handle, "screenX", screenX);
  }
  float screenX()() {
    return Object_Getter__float(this.handle, "screenX");
  }
  void screenY()(float screenY) {
    Object_Call_float__void(this.handle, "screenY", screenY);
  }
  float screenY()() {
    return Object_Getter__float(this.handle, "screenY");
  }
  void hitResult()(ushort hitResult) {
    APZHitResult_hitResult_Set(this.handle, hitResult);
  }
  ushort hitResult()() {
    return Object_Getter__ushort(this.handle, "hitResult");
  }
  void scrollId()(uint scrollId) {
    Object_Call_uint__void(this.handle, "scrollId", scrollId);
  }
  uint scrollId()() {
    return Object_Getter__uint(this.handle, "scrollId");
  }
}
struct APZTestData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return APZTestData(spasm_add__object());
  }
  void paints()(scope ref Sequence!(APZBucket) paints) {
    Object_Call_Handle__void(this.handle, "paints", paints.handle);
  }
  auto paints()() {
    return Sequence!(APZBucket)(Object_Getter__Handle(this.handle, "paints"));
  }
  void repaintRequests()(scope ref Sequence!(APZBucket) repaintRequests) {
    Object_Call_Handle__void(this.handle, "repaintRequests", repaintRequests.handle);
  }
  auto repaintRequests()() {
    return Sequence!(APZBucket)(Object_Getter__Handle(this.handle, "repaintRequests"));
  }
  void hitResults()(scope ref Sequence!(APZHitResult) hitResults) {
    Object_Call_Handle__void(this.handle, "hitResults", hitResults.handle);
  }
  auto hitResults()() {
    return Sequence!(APZHitResult)(Object_Getter__Handle(this.handle, "hitResults"));
  }
}
struct FrameUniformity {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FrameUniformity(spasm_add__object());
  }
  void layerAddress()(uint layerAddress) {
    Object_Call_uint__void(this.handle, "layerAddress", layerAddress);
  }
  uint layerAddress()() {
    return Object_Getter__uint(this.handle, "layerAddress");
  }
  void frameUniformity()(float frameUniformity) {
    Object_Call_float__void(this.handle, "frameUniformity", frameUniformity);
  }
  float frameUniformity()() {
    return Object_Getter__float(this.handle, "frameUniformity");
  }
}
struct FrameUniformityResults {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FrameUniformityResults(spasm_add__object());
  }
  void layerUniformities()(scope ref Sequence!(FrameUniformity) layerUniformities) {
    Object_Call_Handle__void(this.handle, "layerUniformities", layerUniformities.handle);
  }
  auto layerUniformities()() {
    return Sequence!(FrameUniformity)(Object_Getter__Handle(this.handle, "layerUniformities"));
  }
}
struct ScrollFrameData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ScrollFrameData(spasm_add__object());
  }
  void scrollId()(uint scrollId) {
    Object_Call_uint__void(this.handle, "scrollId", scrollId);
  }
  uint scrollId()() {
    return Object_Getter__uint(this.handle, "scrollId");
  }
  void entries()(scope ref Sequence!(ScrollFrameDataEntry) entries) {
    Object_Call_Handle__void(this.handle, "entries", entries.handle);
  }
  auto entries()() {
    return Sequence!(ScrollFrameDataEntry)(Object_Getter__Handle(this.handle, "entries"));
  }
}
struct ScrollFrameDataEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ScrollFrameDataEntry(spasm_add__object());
  }
  void key()(string key) {
    Object_Call_string__void(this.handle, "key", key);
  }
  string key()() {
    return Object_Getter__string(this.handle, "key");
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
}
struct APZHitResultFlags {
  nothrow:
  static:
  enum ushort INVISIBLE = 0;
  enum ushort VISIBLE = 0x0001;
  enum ushort DISPATCH_TO_CONTENT = 0x0002;
  enum ushort PAN_X_DISABLED = 0x0004;
  enum ushort PAN_Y_DISABLED = 0x0008;
  enum ushort PINCH_ZOOM_DISABLED = 0x0010;
  enum ushort DOUBLE_TAP_ZOOM_DISABLED = 0x0020;
  enum ushort SCROLLBAR = 0x0040;
  enum ushort SCROLLBAR_THUMB = 0x0080;
  enum ushort SCROLLBAR_VERTICAL = 0x0100;
}


extern (C) void APZHitResult_hitResult_Set(Handle, ushort);