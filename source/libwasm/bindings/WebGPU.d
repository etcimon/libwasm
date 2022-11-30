module libwasm.bindings.WebGPU;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.WebGPUExtras;

@safe:
nothrow:

struct WebGPU {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getAdapter()(scope ref WebGPUAdapterDescriptor desc) {
    return WebGPUAdapter(Object_Call_Handle__Handle(this.handle, "getAdapter", desc.handle));
  }
  auto getAdapter()() {
    return WebGPUAdapter(Object_Getter__Handle(this.handle, "getAdapter"));
  }
}
struct WebGPUAdapter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  auto extensions()() {
    return WebGPUExtensions(Object_Getter__Handle(this.handle, "extensions"));
  }
  auto createDevice()(scope ref WebGPUDeviceDescriptor descriptor) {
    return WebGPUDevice(Object_Call_Handle__Handle(this.handle, "createDevice", descriptor.handle));
  }
  auto createDevice()() {
    return WebGPUDevice(Object_Getter__Handle(this.handle, "createDevice"));
  }
}
struct WebGPUAdapterDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUAdapterDescriptor(libwasm_add__object());
  }
  void powerPreference()(WebGPUPowerPreference powerPreference) {
    Object_Call_int__void(this.handle, "powerPreference", powerPreference);
  }
  WebGPUPowerPreference powerPreference()() {
    return Object_Getter__int(this.handle, "powerPreference");
  }
}
struct WebGPUAttachmentState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUAttachmentStateDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUAttachmentStateDescriptor(libwasm_add__object());
  }
  void formats()(scope ref Sequence!(u32) formats) {
    Object_Call_Handle__void(this.handle, "formats", formats.handle);
  }
  auto formats()() {
    return Sequence!(u32)(Object_Getter__Handle(this.handle, "formats"));
  }
}
struct WebGPUBindGroup {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUBindGroupBinding {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBindGroupBinding(libwasm_add__object());
  }
  void visibility()(u32 visibility) {
    Object_Call_uint__void(this.handle, "visibility", visibility);
  }
  u32 visibility()() {
    return Object_Getter__uint(this.handle, "visibility");
  }
  void type()(u32 type) {
    Object_Call_uint__void(this.handle, "type", type);
  }
  u32 type()() {
    return Object_Getter__uint(this.handle, "type");
  }
  void start()(u32 start) {
    Object_Call_uint__void(this.handle, "start", start);
  }
  u32 start()() {
    return Object_Getter__uint(this.handle, "start");
  }
  void count()(u32 count) {
    Object_Call_uint__void(this.handle, "count", count);
  }
  u32 count()() {
    return Object_Getter__uint(this.handle, "count");
  }
}
struct WebGPUBindGroupDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBindGroupDescriptor(libwasm_add__object());
  }
  void layout()(scope ref WebGPUBindGroupLayout layout) {
    Object_Call_Handle__void(this.handle, "layout", layout.handle);
  }
  auto layout()() {
    return WebGPUBindGroupLayout(Object_Getter__Handle(this.handle, "layout"));
  }
  void bindings()(scope ref Sequence!(WebGPUBinding) bindings) {
    Object_Call_Handle__void(this.handle, "bindings", bindings.handle);
  }
  auto bindings()() {
    return Sequence!(WebGPUBinding)(Object_Getter__Handle(this.handle, "bindings"));
  }
}
struct WebGPUBindGroupLayout {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUBindGroupLayoutDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBindGroupLayoutDescriptor(libwasm_add__object());
  }
  void bindingTypes()(scope ref Sequence!(WebGPUBindGroupBinding) bindingTypes) {
    Object_Call_Handle__void(this.handle, "bindingTypes", bindingTypes.handle);
  }
  auto bindingTypes()() {
    return Sequence!(WebGPUBindGroupBinding)(Object_Getter__Handle(this.handle, "bindingTypes"));
  }
}
struct WebGPUBinding {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBinding(libwasm_add__object());
  }
  void resources()(scope ref Sequence!(WebGPUBindingResource) resources) {
    Object_Call_Handle__void(this.handle, "resources", resources.handle);
  }
  auto resources()() {
    return Sequence!(WebGPUBindingResource)(Object_Getter__Handle(this.handle, "resources"));
  }
  void start()(u32 start) {
    Object_Call_uint__void(this.handle, "start", start);
  }
  u32 start()() {
    return Object_Getter__uint(this.handle, "start");
  }
  void count()(u32 count) {
    Object_Call_uint__void(this.handle, "count", count);
  }
  u32 count()() {
    return Object_Getter__uint(this.handle, "count");
  }
}
alias WebGPUBindingResource = SumType!(WebGPUSampler, WebGPUTextureView, WebGPUBufferBinding);
struct WebGPUBindingType {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 UNIFORM_BUFFER = 0;
  enum u32 SAMPLER = 1;
  enum u32 SAMPLED_TEXTURE = 2;
  enum u32 STORAGE_BUFFER = 3;
}
alias WebGPUBindingTypeEnum = u32;
struct WebGPUBlendDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBlendDescriptor(libwasm_add__object());
  }
  void srcFactor()(u32 srcFactor) {
    Object_Call_uint__void(this.handle, "srcFactor", srcFactor);
  }
  u32 srcFactor()() {
    return Object_Getter__uint(this.handle, "srcFactor");
  }
  void dstFactor()(u32 dstFactor) {
    Object_Call_uint__void(this.handle, "dstFactor", dstFactor);
  }
  u32 dstFactor()() {
    return Object_Getter__uint(this.handle, "dstFactor");
  }
  void operation()(u32 operation) {
    Object_Call_uint__void(this.handle, "operation", operation);
  }
  u32 operation()() {
    return Object_Getter__uint(this.handle, "operation");
  }
}
struct WebGPUBlendFactor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 ZERO = 0;
  enum u32 ONE = 1;
  enum u32 SRC_COLOR = 2;
  enum u32 ONE_MINUS_SRC_COLOR = 3;
  enum u32 SRC_ALPHA = 4;
  enum u32 ONE_MINUS_SRC_ALPHA = 5;
  enum u32 DST_COLOR = 6;
  enum u32 ONE_MINUS_DST_COLOR = 7;
  enum u32 DST_ALPHA = 8;
  enum u32 ONE_MINUS_DST_ALPHA = 9;
  enum u32 SRC_ALPHA_SATURATED = 10;
  enum u32 BLEND_COLOR = 11;
  enum u32 ONE_MINUS_BLEND_COLOR = 12;
}
alias WebGPUBlendFactorEnum = u32;
struct WebGPUBlendOperation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 ADD = 0;
  enum u32 SUBTRACT = 1;
  enum u32 REVERSE_SUBTRACT = 2;
  enum u32 MIN = 3;
  enum u32 MAX = 4;
}
alias WebGPUBlendOperationEnum = u32;
struct WebGPUBlendState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUBlendStateDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBlendStateDescriptor(libwasm_add__object());
  }
  void blendEnabled()(bool blendEnabled) {
    Object_Call_bool__void(this.handle, "blendEnabled", blendEnabled);
  }
  bool blendEnabled()() {
    return Object_Getter__bool(this.handle, "blendEnabled");
  }
  void alpha()(scope ref WebGPUBlendDescriptor alpha) {
    Object_Call_Handle__void(this.handle, "alpha", alpha.handle);
  }
  auto alpha()() {
    return WebGPUBlendDescriptor(Object_Getter__Handle(this.handle, "alpha"));
  }
  void color()(scope ref WebGPUBlendDescriptor color) {
    Object_Call_Handle__void(this.handle, "color", color.handle);
  }
  auto color()() {
    return WebGPUBlendDescriptor(Object_Getter__Handle(this.handle, "color"));
  }
  void writeMask()(u32 writeMask) {
    Object_Call_uint__void(this.handle, "writeMask", writeMask);
  }
  u32 writeMask()() {
    return Object_Getter__uint(this.handle, "writeMask");
  }
}
struct WebGPUBuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto mapping()() {
    return Optional!(ArrayBuffer)(Object_Getter__OptionalHandle(this.handle, "mapping"));
  }
  void unmap()() {
    Object_Call__void(this.handle, "unmap");
  }
}
struct WebGPUBufferDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUBufferDescriptor(libwasm_add__object());
  }
  void size()(u32 size) {
    Object_Call_uint__void(this.handle, "size", size);
  }
  u32 size()() {
    return Object_Getter__uint(this.handle, "size");
  }
  void usage()(u32 usage) {
    Object_Call_uint__void(this.handle, "usage", usage);
  }
  u32 usage()() {
    return Object_Getter__uint(this.handle, "usage");
  }
}
struct WebGPUBufferUsage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NONE = 0;
  enum u32 MAP_READ = 1;
  enum u32 MAP_WRITE = 2;
  enum u32 TRANSFER_SRC = 4;
  enum u32 TRANSFER_DST = 8;
  enum u32 INDEX = 16;
  enum u32 VERTEX = 32;
  enum u32 UNIFORM = 64;
  enum u32 STORAGE = 128;
}
alias WebGPUBufferUsageFlags = u32;
struct WebGPUColorWriteBits {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NONE = 0;
  enum u32 RED = 1;
  enum u32 GREEN = 2;
  enum u32 BLUE = 4;
  enum u32 ALPHA = 8;
  enum u32 ALL = 15;
}
alias WebGPUColorWriteFlags = u32;
struct WebGPUCommandBuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUCommandEncoder {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto finishEncoding()() {
    return WebGPUCommandBuffer(Object_Getter__Handle(this.handle, "finishEncoding"));
  }
  void copyBufferToBuffer()(scope ref WebGPUBuffer src, u32 srcOffset, scope ref WebGPUBuffer dst, u32 dstOffset, u32 size) {
    Serialize_Object_VarArgCall!void(this.handle, "copyBufferToBuffer", "Handle;u32;Handle;u32;u32", tuple(cast(Handle)src.handle, srcOffset, cast(Handle)dst.handle, dstOffset, size));
  }
  void copyBufferToTexture()() {
    Object_Call__void(this.handle, "copyBufferToTexture");
  }
  void copyTextureToBuffer()() {
    Object_Call__void(this.handle, "copyTextureToBuffer");
  }
  void copyTextureToTexture()() {
    Object_Call__void(this.handle, "copyTextureToTexture");
  }
  void blit()() {
    Object_Call__void(this.handle, "blit");
  }
  void transitionBuffer()(scope ref WebGPUBuffer b, u32 f) {
    Serialize_Object_VarArgCall!void(this.handle, "transitionBuffer", "Handle;u32", tuple(cast(Handle)b.handle, f));
  }
  void setPushConstants()(u32 stage, u32 offset, u32 count, scope ref ArrayBuffer data) {
    Serialize_Object_VarArgCall!void(this.handle, "setPushConstants", "u32;u32;u32;Handle", tuple(stage, offset, count, cast(Handle)data.handle));
  }
  void setBindGroup()(u32 index, scope ref WebGPUBindGroup bindGroup) {
    Serialize_Object_VarArgCall!void(this.handle, "setBindGroup", "u32;Handle", tuple(index, cast(Handle)bindGroup.handle));
  }
  void setPipeline()(scope ref SumType!(WebGPUComputePipeline, WebGPURenderPipeline) pipeline) {
    Serialize_Object_VarArgCall!void(this.handle, "setPipeline", "SumType!(Handle,Handle)", tuple(libwasm.sumtype.match!(((ref pipeline.Types[0] v) => 0),((ref pipeline.Types[1] v) => 1))(pipeline),tuple(libwasm.sumtype.match!(((ref pipeline.Types[0] v) => cast(Handle)v.handle),((ref pipeline.Types[1] v) => Handle.init))(pipeline),libwasm.sumtype.match!(((ref pipeline.Types[0] v) => Handle.init),((ref pipeline.Types[1] v) => cast(Handle)v.handle))(pipeline))));
  }
  void beginComputePass()() {
    Object_Call__void(this.handle, "beginComputePass");
  }
  void endComputePass()() {
    Object_Call__void(this.handle, "endComputePass");
  }
  void dispatch()(u32 x, u32 y, u32 z) {
    Serialize_Object_VarArgCall!void(this.handle, "dispatch", "u32;u32;u32", tuple(x, y, z));
  }
  void beginRenderPass()(scope ref WebGPURenderPassDescriptor descriptor) {
    Object_Call_Handle__void(this.handle, "beginRenderPass", descriptor.handle);
  }
  void beginRenderPass()() {
    Object_Call__void(this.handle, "beginRenderPass");
  }
  void endRenderPass()() {
    Object_Call__void(this.handle, "endRenderPass");
  }
  void setBlendColor()(float r, float g, float b, float a) {
    Serialize_Object_VarArgCall!void(this.handle, "setBlendColor", "float;float;float;float", tuple(r, g, b, a));
  }
  void setIndexBuffer()(scope ref WebGPUBuffer buffer, u32 offset) {
    Serialize_Object_VarArgCall!void(this.handle, "setIndexBuffer", "Handle;u32", tuple(cast(Handle)buffer.handle, offset));
  }
  void setVertexBuffers()(u32 startSlot, scope ref Sequence!(WebGPUBuffer) buffers, scope ref Sequence!(u32) offsets) {
    Serialize_Object_VarArgCall!void(this.handle, "setVertexBuffers", "u32;Handle;Handle", tuple(startSlot, cast(Handle)buffers.handle, cast(Handle)offsets.handle));
  }
  void draw()(u32 vertexCount, u32 instanceCount, u32 firstVertex, u32 firstInstance) {
    Serialize_Object_VarArgCall!void(this.handle, "draw", "u32;u32;u32;u32", tuple(vertexCount, instanceCount, firstVertex, firstInstance));
  }
  void drawIndexed()(u32 indexCount, u32 instanceCount, u32 firstIndex, u32 firstInstance, u32 firstVertex) {
    Serialize_Object_VarArgCall!void(this.handle, "drawIndexed", "u32;u32;u32;u32;u32", tuple(indexCount, instanceCount, firstIndex, firstInstance, firstVertex));
  }
}
struct WebGPUCommandEncoderDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUCommandEncoderDescriptor(libwasm_add__object());
  }
}
struct WebGPUCompareFunction {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NEVER = 0;
  enum u32 LESS = 1;
  enum u32 LESS_EQUAL = 2;
  enum u32 GREATER = 3;
  enum u32 GREATER_EQUAL = 4;
  enum u32 EQUAL = 5;
  enum u32 NOT_EQUAL = 6;
  enum u32 ALWAYS = 7;
}
alias WebGPUCompareFunctionEnum = u32;
struct WebGPUComputePipeline {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUComputePipelineDescriptor {
  nothrow:
  libwasm.bindings.WebGPU.WebGPUPipelineDescriptorBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WebGPUPipelineDescriptorBase(h);
  }
  static auto create() {
    return WebGPUComputePipelineDescriptor(libwasm_add__object());
  }
}
struct WebGPUDepthStencilState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUDepthStencilStateDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUDepthStencilStateDescriptor(libwasm_add__object());
  }
  void depthWriteEnabled()(bool depthWriteEnabled) {
    Object_Call_bool__void(this.handle, "depthWriteEnabled", depthWriteEnabled);
  }
  bool depthWriteEnabled()() {
    return Object_Getter__bool(this.handle, "depthWriteEnabled");
  }
  void depthCompare()(u32 depthCompare) {
    Object_Call_uint__void(this.handle, "depthCompare", depthCompare);
  }
  u32 depthCompare()() {
    return Object_Getter__uint(this.handle, "depthCompare");
  }
  void front()(scope ref WebGPUStencilStateFaceDescriptor front) {
    Object_Call_Handle__void(this.handle, "front", front.handle);
  }
  auto front()() {
    return WebGPUStencilStateFaceDescriptor(Object_Getter__Handle(this.handle, "front"));
  }
  void back()(scope ref WebGPUStencilStateFaceDescriptor back) {
    Object_Call_Handle__void(this.handle, "back", back.handle);
  }
  auto back()() {
    return WebGPUStencilStateFaceDescriptor(Object_Getter__Handle(this.handle, "back"));
  }
  void stencilReadMask()(u32 stencilReadMask) {
    Object_Call_uint__void(this.handle, "stencilReadMask", stencilReadMask);
  }
  u32 stencilReadMask()() {
    return Object_Getter__uint(this.handle, "stencilReadMask");
  }
  void stencilWriteMask()(u32 stencilWriteMask) {
    Object_Call_uint__void(this.handle, "stencilWriteMask", stencilWriteMask);
  }
  u32 stencilWriteMask()() {
    return Object_Getter__uint(this.handle, "stencilWriteMask");
  }
}
struct WebGPUDevice {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto adapter()() {
    return WebGPUAdapter(Object_Getter__Handle(this.handle, "adapter"));
  }
  auto extensions()() {
    return WebGPUExtensions(Object_Getter__Handle(this.handle, "extensions"));
  }
  auto limits()() {
    return WebGPULimits(Object_Getter__Handle(this.handle, "limits"));
  }
  auto createBuffer()(scope ref WebGPUBufferDescriptor descriptor) {
    return WebGPUBuffer(Object_Call_Handle__Handle(this.handle, "createBuffer", descriptor.handle));
  }
  auto createBuffer()() {
    return WebGPUBuffer(Object_Getter__Handle(this.handle, "createBuffer"));
  }
  auto createTexture()(scope ref WebGPUTextureDescriptor descriptor) {
    return WebGPUTexture(Object_Call_Handle__Handle(this.handle, "createTexture", descriptor.handle));
  }
  auto createTexture()() {
    return WebGPUTexture(Object_Getter__Handle(this.handle, "createTexture"));
  }
  auto createSampler()(scope ref WebGPUSamplerDescriptor descriptor) {
    return WebGPUSampler(Object_Call_Handle__Handle(this.handle, "createSampler", descriptor.handle));
  }
  auto createSampler()() {
    return WebGPUSampler(Object_Getter__Handle(this.handle, "createSampler"));
  }
  auto createBindGroupLayout()(scope ref WebGPUBindGroupLayoutDescriptor descriptor) {
    return WebGPUBindGroupLayout(Object_Call_Handle__Handle(this.handle, "createBindGroupLayout", descriptor.handle));
  }
  auto createBindGroupLayout()() {
    return WebGPUBindGroupLayout(Object_Getter__Handle(this.handle, "createBindGroupLayout"));
  }
  auto createPipelineLayout()(scope ref WebGPUPipelineLayoutDescriptor descriptor) {
    return WebGPUPipelineLayout(Object_Call_Handle__Handle(this.handle, "createPipelineLayout", descriptor.handle));
  }
  auto createPipelineLayout()() {
    return WebGPUPipelineLayout(Object_Getter__Handle(this.handle, "createPipelineLayout"));
  }
  auto createBindGroup()(scope ref WebGPUBindGroupDescriptor descriptor) {
    return WebGPUBindGroup(Object_Call_Handle__Handle(this.handle, "createBindGroup", descriptor.handle));
  }
  auto createBindGroup()() {
    return WebGPUBindGroup(Object_Getter__Handle(this.handle, "createBindGroup"));
  }
  auto createBlendState()(scope ref WebGPUBlendStateDescriptor descriptor) {
    return WebGPUBlendState(Object_Call_Handle__Handle(this.handle, "createBlendState", descriptor.handle));
  }
  auto createBlendState()() {
    return WebGPUBlendState(Object_Getter__Handle(this.handle, "createBlendState"));
  }
  auto createDepthStencilState()(scope ref WebGPUDepthStencilStateDescriptor descriptor) {
    return WebGPUDepthStencilState(Object_Call_Handle__Handle(this.handle, "createDepthStencilState", descriptor.handle));
  }
  auto createDepthStencilState()() {
    return WebGPUDepthStencilState(Object_Getter__Handle(this.handle, "createDepthStencilState"));
  }
  auto createInputState()(scope ref WebGPUInputStateDescriptor descriptor) {
    return WebGPUInputState(Object_Call_Handle__Handle(this.handle, "createInputState", descriptor.handle));
  }
  auto createInputState()() {
    return WebGPUInputState(Object_Getter__Handle(this.handle, "createInputState"));
  }
  auto createShaderModule()(scope ref WebGPUShaderModuleDescriptor descriptor) {
    return WebGPUShaderModule(Object_Call_Handle__Handle(this.handle, "createShaderModule", descriptor.handle));
  }
  auto createAttachmentState()(scope ref WebGPUAttachmentStateDescriptor descriptor) {
    return WebGPUAttachmentState(Object_Call_Handle__Handle(this.handle, "createAttachmentState", descriptor.handle));
  }
  auto createAttachmentState()() {
    return WebGPUAttachmentState(Object_Getter__Handle(this.handle, "createAttachmentState"));
  }
  auto createComputePipeline()(scope ref WebGPUComputePipelineDescriptor descriptor) {
    return WebGPUComputePipeline(Object_Call_Handle__Handle(this.handle, "createComputePipeline", descriptor._parent));
  }
  auto createRenderPipeline()(scope ref WebGPURenderPipelineDescriptor descriptor) {
    return WebGPURenderPipeline(Object_Call_Handle__Handle(this.handle, "createRenderPipeline", descriptor._parent));
  }
  auto createCommandEncoder()(scope ref WebGPUCommandEncoderDescriptor descriptor) {
    return WebGPUCommandEncoder(Object_Call_Handle__Handle(this.handle, "createCommandEncoder", descriptor.handle));
  }
  auto createCommandEncoder()() {
    return WebGPUCommandEncoder(Object_Getter__Handle(this.handle, "createCommandEncoder"));
  }
  auto getQueue()() {
    return WebGPUQueue(Object_Getter__Handle(this.handle, "getQueue"));
  }
  void onLog()(WebGPULogCallback onLog) {
    WebGPUDevice_onLog_Set(this.handle, onLog);
  }
  WebGPULogCallback onLog()() {
    return WebGPUDevice_onLog_Get(this.handle);
  }
  auto getObjectStatus()(scope ref WebGPUStatusable obj) {
    return JsPromise!(WebGPUObjectStatus)(Serialize_Object_VarArgCall!Handle(this.handle, "getObjectStatus", "SumType!(Handle,Handle)", tuple(libwasm.sumtype.match!(((ref obj.Types[0] v) => 0),((ref obj.Types[1] v) => 1))(obj),tuple(libwasm.sumtype.match!(((ref obj.Types[0] v) => cast(Handle)v.handle),((ref obj.Types[1] v) => Handle.init))(obj),libwasm.sumtype.match!(((ref obj.Types[0] v) => Handle.init),((ref obj.Types[1] v) => cast(Handle)v.handle))(obj)))));
  }
}
struct WebGPUDeviceDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUDeviceDescriptor(libwasm_add__object());
  }
  void extensions()(scope ref WebGPUExtensions extensions) {
    Object_Call_Handle__void(this.handle, "extensions", extensions.handle);
  }
  auto extensions()() {
    return WebGPUExtensions(Object_Getter__Handle(this.handle, "extensions"));
  }
}
struct WebGPUExtensions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUExtensions(libwasm_add__object());
  }
  void anisotropicFiltering()(bool anisotropicFiltering) {
    Object_Call_bool__void(this.handle, "anisotropicFiltering", anisotropicFiltering);
  }
  bool anisotropicFiltering()() {
    return Object_Getter__bool(this.handle, "anisotropicFiltering");
  }
  void logicOp()(bool logicOp) {
    Object_Call_bool__void(this.handle, "logicOp", logicOp);
  }
  bool logicOp()() {
    return Object_Getter__bool(this.handle, "logicOp");
  }
}
struct WebGPUFence {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool wait()(double milliseconds) {
    return Serialize_Object_VarArgCall!bool(this.handle, "wait", "double", tuple(milliseconds));
  }
  auto promise()() {
    return JsPromise!(void)(Object_Getter__Handle(this.handle, "promise"));
  }
}
struct WebGPUFilterMode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NEAREST = 0;
  enum u32 LINEAR = 1;
}
alias WebGPUFilterModeEnum = u32;
struct WebGPUIndexFormat {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 UINT16 = 0;
  enum u32 UINT32 = 1;
}
alias WebGPUIndexFormatEnum = u32;
struct WebGPUInputState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUInputStateDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUInputStateDescriptor(libwasm_add__object());
  }
  void indexFormat()(u32 indexFormat) {
    Object_Call_uint__void(this.handle, "indexFormat", indexFormat);
  }
  u32 indexFormat()() {
    return Object_Getter__uint(this.handle, "indexFormat");
  }
  void attributes()(scope ref Sequence!(WebGPUVertexAttributeDescriptor) attributes) {
    Object_Call_Handle__void(this.handle, "attributes", attributes.handle);
  }
  auto attributes()() {
    return Sequence!(WebGPUVertexAttributeDescriptor)(Object_Getter__Handle(this.handle, "attributes"));
  }
  void inputs()(scope ref Sequence!(WebGPUVertexInputDescriptor) inputs) {
    Object_Call_Handle__void(this.handle, "inputs", inputs.handle);
  }
  auto inputs()() {
    return Sequence!(WebGPUVertexInputDescriptor)(Object_Getter__Handle(this.handle, "inputs"));
  }
}
struct WebGPUInputStepMode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 VERTEX = 0;
  enum u32 INSTANCE = 1;
}
alias WebGPUInputStepModeEnum = u32;
struct WebGPULimits {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPULimits(libwasm_add__object());
  }
  void maxBindGroups()(u32 maxBindGroups) {
    Object_Call_uint__void(this.handle, "maxBindGroups", maxBindGroups);
  }
  u32 maxBindGroups()() {
    return Object_Getter__uint(this.handle, "maxBindGroups");
  }
}
struct WebGPULoadOp {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 CLEAR = 0;
  enum u32 LOAD = 1;
}
alias WebGPULoadOpEnum = u32;
alias WebGPULogCallback = void delegate(WebGPULogEntry);
struct WebGPULogEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  WebGPULogEntryType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  auto obj()() {
    return Any(Object_Getter__Handle(this.handle, "obj"));
  }
  Optional!(string) reason()() {
    return Object_Getter__OptionalString(this.handle, "reason");
  }
}
enum WebGPULogEntryType {
  device_lost,
  validation_error,
  recoverable_out_of_memory
}
enum WebGPUObjectStatus {
  valid,
  out_of_memory,
  invalid
}
struct WebGPUPipelineDescriptorBase {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUPipelineDescriptorBase(libwasm_add__object());
  }
  void layout()(scope ref WebGPUPipelineLayout layout) {
    Object_Call_Handle__void(this.handle, "layout", layout.handle);
  }
  auto layout()() {
    return WebGPUPipelineLayout(Object_Getter__Handle(this.handle, "layout"));
  }
  void stages()(scope ref Sequence!(WebGPUPipelineStageDescriptor) stages) {
    Object_Call_Handle__void(this.handle, "stages", stages.handle);
  }
  auto stages()() {
    return Sequence!(WebGPUPipelineStageDescriptor)(Object_Getter__Handle(this.handle, "stages"));
  }
}
struct WebGPUPipelineLayout {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUPipelineLayoutDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUPipelineLayoutDescriptor(libwasm_add__object());
  }
  void bindGroupLayouts()(scope ref Sequence!(WebGPUBindGroupLayout) bindGroupLayouts) {
    Object_Call_Handle__void(this.handle, "bindGroupLayouts", bindGroupLayouts.handle);
  }
  auto bindGroupLayouts()() {
    return Sequence!(WebGPUBindGroupLayout)(Object_Getter__Handle(this.handle, "bindGroupLayouts"));
  }
}
struct WebGPUPipelineStageDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUPipelineStageDescriptor(libwasm_add__object());
  }
  void shaderModule()(scope ref WebGPUShaderModule shaderModule) {
    Object_Call_Handle__void(this.handle, "shaderModule", shaderModule.handle);
  }
  auto shaderModule()() {
    return WebGPUShaderModule(Object_Getter__Handle(this.handle, "shaderModule"));
  }
  void stage()(u32 stage) {
    Object_Call_uint__void(this.handle, "stage", stage);
  }
  u32 stage()() {
    return Object_Getter__uint(this.handle, "stage");
  }
  void entryPoint()(string entryPoint) {
    Object_Call_string__void(this.handle, "entryPoint", entryPoint);
  }
  string entryPoint()() {
    return Object_Getter__string(this.handle, "entryPoint");
  }
}
enum WebGPUPowerPreference {
  default_,
  low_power,
  high_performance
}
struct WebGPUPrimitiveTopology {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 POINT_LIST = 0;
  enum u32 LINE_LIST = 1;
  enum u32 LINE_STRIP = 2;
  enum u32 TRIANGLE_LIST = 3;
  enum u32 TRIANGLE_STRIP = 4;
}
alias WebGPUPrimitiveTopologyEnum = u32;
struct WebGPUProvider {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto webgpu()() {
    return WebGPU(Object_Getter__Handle(this.handle, "webgpu"));
  }
}
struct WebGPUQueue {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void submit()(scope ref Sequence!(WebGPUCommandBuffer) buffers) {
    Object_Call_Handle__void(this.handle, "submit", buffers.handle);
  }
  auto insertFence()() {
    return WebGPUFence(Object_Getter__Handle(this.handle, "insertFence"));
  }
}
struct WebGPURenderPassAttachmentDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPURenderPassAttachmentDescriptor(libwasm_add__object());
  }
  void attachment()(scope ref WebGPUTextureView attachment) {
    Object_Call_Handle__void(this.handle, "attachment", attachment.handle);
  }
  auto attachment()() {
    return WebGPUTextureView(Object_Getter__Handle(this.handle, "attachment"));
  }
  void loadOp()(u32 loadOp) {
    Object_Call_uint__void(this.handle, "loadOp", loadOp);
  }
  u32 loadOp()() {
    return Object_Getter__uint(this.handle, "loadOp");
  }
  void storeOp()(u32 storeOp) {
    Object_Call_uint__void(this.handle, "storeOp", storeOp);
  }
  u32 storeOp()() {
    return Object_Getter__uint(this.handle, "storeOp");
  }
}
struct WebGPURenderPassDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPURenderPassDescriptor(libwasm_add__object());
  }
  void colorAttachments()(scope ref Sequence!(WebGPURenderPassAttachmentDescriptor) colorAttachments) {
    Object_Call_Handle__void(this.handle, "colorAttachments", colorAttachments.handle);
  }
  auto colorAttachments()() {
    return Sequence!(WebGPURenderPassAttachmentDescriptor)(Object_Getter__Handle(this.handle, "colorAttachments"));
  }
  void depthStencilAttachment()(scope ref WebGPURenderPassAttachmentDescriptor depthStencilAttachment) {
    Object_Call_Handle__void(this.handle, "depthStencilAttachment", depthStencilAttachment.handle);
  }
  auto depthStencilAttachment()() {
    return WebGPURenderPassAttachmentDescriptor(Object_Getter__Handle(this.handle, "depthStencilAttachment"));
  }
}
struct WebGPURenderPipeline {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPURenderPipelineDescriptor {
  nothrow:
  libwasm.bindings.WebGPU.WebGPUPipelineDescriptorBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WebGPUPipelineDescriptorBase(h);
  }
  static auto create() {
    return WebGPURenderPipelineDescriptor(libwasm_add__object());
  }
  void primitiveTopology()(u32 primitiveTopology) {
    Object_Call_uint__void(this._parent, "primitiveTopology", primitiveTopology);
  }
  u32 primitiveTopology()() {
    return Object_Getter__uint(this._parent, "primitiveTopology");
  }
  void blendState()(scope ref Sequence!(WebGPUBlendState) blendState) {
    Object_Call_Handle__void(this._parent, "blendState", blendState.handle);
  }
  auto blendState()() {
    return Sequence!(WebGPUBlendState)(Object_Getter__Handle(this._parent, "blendState"));
  }
  void depthStencilState()(scope ref WebGPUDepthStencilState depthStencilState) {
    Object_Call_Handle__void(this._parent, "depthStencilState", depthStencilState.handle);
  }
  auto depthStencilState()() {
    return WebGPUDepthStencilState(Object_Getter__Handle(this._parent, "depthStencilState"));
  }
  void inputState()(scope ref WebGPUInputState inputState) {
    Object_Call_Handle__void(this._parent, "inputState", inputState.handle);
  }
  auto inputState()() {
    return WebGPUInputState(Object_Getter__Handle(this._parent, "inputState"));
  }
  void attachmentState()(scope ref WebGPUAttachmentState attachmentState) {
    Object_Call_Handle__void(this._parent, "attachmentState", attachmentState.handle);
  }
  auto attachmentState()() {
    return WebGPUAttachmentState(Object_Getter__Handle(this._parent, "attachmentState"));
  }
}
struct WebGPUSampler {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUSamplerDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUSamplerDescriptor(libwasm_add__object());
  }
  void magFilter()(u32 magFilter) {
    Object_Call_uint__void(this.handle, "magFilter", magFilter);
  }
  u32 magFilter()() {
    return Object_Getter__uint(this.handle, "magFilter");
  }
  void minFilter()(u32 minFilter) {
    Object_Call_uint__void(this.handle, "minFilter", minFilter);
  }
  u32 minFilter()() {
    return Object_Getter__uint(this.handle, "minFilter");
  }
  void mipmapFilter()(u32 mipmapFilter) {
    Object_Call_uint__void(this.handle, "mipmapFilter", mipmapFilter);
  }
  u32 mipmapFilter()() {
    return Object_Getter__uint(this.handle, "mipmapFilter");
  }
}
struct WebGPUShaderModule {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUShaderModuleDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUShaderModuleDescriptor(libwasm_add__object());
  }
  void code()(scope ref ArrayBuffer code) {
    Object_Call_Handle__void(this.handle, "code", code.handle);
  }
  auto code()() {
    return ArrayBuffer(Object_Getter__Handle(this.handle, "code"));
  }
}
struct WebGPUShaderStage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 VERTEX = 0;
  enum u32 FRAGMENT = 1;
  enum u32 COMPUTE = 2;
}
struct WebGPUShaderStageBit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NONE = 0;
  enum u32 VERTEX = 1;
  enum u32 FRAGMENT = 2;
  enum u32 COMPUTE = 4;
}
alias WebGPUShaderStageEnum = u32;
alias WebGPUShaderStageFlags = u32;
alias WebGPUStatusable = SumType!(WebGPUBuffer, WebGPUTexture);
struct WebGPUStencilOperation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 KEEP = 0;
  enum u32 ZERO = 1;
  enum u32 REPLACE = 2;
  enum u32 INVERT = 3;
  enum u32 INCREMENT_CLAMP = 4;
  enum u32 DECREMENT_CLAMP = 5;
  enum u32 INCREMENT_WRAP = 6;
  enum u32 DECREMENT_WRAP = 7;
}
alias WebGPUStencilOperationEnum = u32;
struct WebGPUStencilStateFaceDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUStencilStateFaceDescriptor(libwasm_add__object());
  }
  void compare()(u32 compare) {
    Object_Call_uint__void(this.handle, "compare", compare);
  }
  u32 compare()() {
    return Object_Getter__uint(this.handle, "compare");
  }
  void stencilFailOp()(u32 stencilFailOp) {
    Object_Call_uint__void(this.handle, "stencilFailOp", stencilFailOp);
  }
  u32 stencilFailOp()() {
    return Object_Getter__uint(this.handle, "stencilFailOp");
  }
  void depthFailOp()(u32 depthFailOp) {
    Object_Call_uint__void(this.handle, "depthFailOp", depthFailOp);
  }
  u32 depthFailOp()() {
    return Object_Getter__uint(this.handle, "depthFailOp");
  }
  void passOp()(u32 passOp) {
    Object_Call_uint__void(this.handle, "passOp", passOp);
  }
  u32 passOp()() {
    return Object_Getter__uint(this.handle, "passOp");
  }
}
struct WebGPUStoreOp {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 STORE = 0;
}
alias WebGPUStoreOpEnum = u32;
struct WebGPUSwapChain {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void configure()(scope ref WebGPUSwapChainDescriptor descriptor) {
    Object_Call_Handle__void(this.handle, "configure", descriptor.handle);
  }
  void configure()() {
    Object_Call__void(this.handle, "configure");
  }
  auto getNextTexture()() {
    return WebGPUTexture(Object_Getter__Handle(this.handle, "getNextTexture"));
  }
  void present()() {
    Object_Call__void(this.handle, "present");
  }
}
struct WebGPUSwapChainDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUSwapChainDescriptor(libwasm_add__object());
  }
  void usage()(u32 usage) {
    Object_Call_uint__void(this.handle, "usage", usage);
  }
  u32 usage()() {
    return Object_Getter__uint(this.handle, "usage");
  }
  void format()(u32 format) {
    Object_Call_uint__void(this.handle, "format", format);
  }
  u32 format()() {
    return Object_Getter__uint(this.handle, "format");
  }
  void width()(u32 width) {
    Object_Call_uint__void(this.handle, "width", width);
  }
  u32 width()() {
    return Object_Getter__uint(this.handle, "width");
  }
  void height()(u32 height) {
    Object_Call_uint__void(this.handle, "height", height);
  }
  u32 height()() {
    return Object_Getter__uint(this.handle, "height");
  }
}
struct WebGPUTexture {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto createTextureView()(scope ref WebGPUTextureViewDescriptor desc) {
    return WebGPUTextureView(Object_Call_Handle__Handle(this.handle, "createTextureView", desc.handle));
  }
  auto createTextureView()() {
    return WebGPUTextureView(Object_Getter__Handle(this.handle, "createTextureView"));
  }
}
struct WebGPUTextureDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUTextureDescriptor(libwasm_add__object());
  }
  void width()(u32 width) {
    Object_Call_uint__void(this.handle, "width", width);
  }
  u32 width()() {
    return Object_Getter__uint(this.handle, "width");
  }
  void height()(u32 height) {
    Object_Call_uint__void(this.handle, "height", height);
  }
  u32 height()() {
    return Object_Getter__uint(this.handle, "height");
  }
  void depth()(u32 depth) {
    Object_Call_uint__void(this.handle, "depth", depth);
  }
  u32 depth()() {
    return Object_Getter__uint(this.handle, "depth");
  }
  void arraySize()(u32 arraySize) {
    Object_Call_uint__void(this.handle, "arraySize", arraySize);
  }
  u32 arraySize()() {
    return Object_Getter__uint(this.handle, "arraySize");
  }
  void dimension()(u32 dimension) {
    Object_Call_uint__void(this.handle, "dimension", dimension);
  }
  u32 dimension()() {
    return Object_Getter__uint(this.handle, "dimension");
  }
  void format()(u32 format) {
    Object_Call_uint__void(this.handle, "format", format);
  }
  u32 format()() {
    return Object_Getter__uint(this.handle, "format");
  }
  void usage()(u32 usage) {
    Object_Call_uint__void(this.handle, "usage", usage);
  }
  u32 usage()() {
    return Object_Getter__uint(this.handle, "usage");
  }
}
struct WebGPUTextureDimension {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 e1D = 0;
  enum u32 e2D = 1;
  enum u32 e3D = 2;
}
alias WebGPUTextureDimensionEnum = u32;
struct WebGPUTextureFormat {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 R8_G8_B8_A8_UNORM = 0;
  enum u32 R8_G8_B8_A8_UINT = 1;
  enum u32 B8_G8_R8_A8_UNORM = 2;
  enum u32 D32_FLOAT_S8_UINT = 3;
}
alias WebGPUTextureFormatEnum = u32;
struct WebGPUTextureUsage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 NONE = 0;
  enum u32 TRANSFER_SRC = 1;
  enum u32 TRANSFER_DST = 2;
  enum u32 SAMPLED = 4;
  enum u32 STORAGE = 8;
  enum u32 OUTPUT_ATTACHMENT = 16;
  enum u32 PRESENT = 32;
}
alias WebGPUTextureUsageFlags = u32;
struct WebGPUTextureView {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGPUTextureViewDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUTextureViewDescriptor(libwasm_add__object());
  }
}
struct WebGPUVertexAttributeDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUVertexAttributeDescriptor(libwasm_add__object());
  }
  void shaderLocation()(u32 shaderLocation) {
    Object_Call_uint__void(this.handle, "shaderLocation", shaderLocation);
  }
  u32 shaderLocation()() {
    return Object_Getter__uint(this.handle, "shaderLocation");
  }
  void inputSlot()(u32 inputSlot) {
    Object_Call_uint__void(this.handle, "inputSlot", inputSlot);
  }
  u32 inputSlot()() {
    return Object_Getter__uint(this.handle, "inputSlot");
  }
  void offset()(u32 offset) {
    Object_Call_uint__void(this.handle, "offset", offset);
  }
  u32 offset()() {
    return Object_Getter__uint(this.handle, "offset");
  }
  void format()(u32 format) {
    Object_Call_uint__void(this.handle, "format", format);
  }
  u32 format()() {
    return Object_Getter__uint(this.handle, "format");
  }
}
struct WebGPUVertexFormat {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum u32 FLOAT_R32_G32_B32_A32 = 0;
  enum u32 FLOAT_R32_G32_B32 = 1;
  enum u32 FLOAT_R32_G32 = 2;
  enum u32 FLOAT_R32 = 3;
}
alias WebGPUVertexFormatEnum = u32;
struct WebGPUVertexInputDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGPUVertexInputDescriptor(libwasm_add__object());
  }
  void inputSlot()(u32 inputSlot) {
    Object_Call_uint__void(this.handle, "inputSlot", inputSlot);
  }
  u32 inputSlot()() {
    return Object_Getter__uint(this.handle, "inputSlot");
  }
  void stride()(u32 stride) {
    Object_Call_uint__void(this.handle, "stride", stride);
  }
  u32 stride()() {
    return Object_Getter__uint(this.handle, "stride");
  }
  void stepMode()(u32 stepMode) {
    Object_Call_uint__void(this.handle, "stepMode", stepMode);
  }
  u32 stepMode()() {
    return Object_Getter__uint(this.handle, "stepMode");
  }
}
alias u32 = uint;
alias u64 = uint;


extern (C) void WebGPUDevice_onLog_Set(Handle, WebGPULogCallback);
extern (C) WebGPULogCallback WebGPUDevice_onLog_Get(Handle);