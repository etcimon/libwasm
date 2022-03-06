module spasm.bindings.WebGPU;

import spasm.types;
import spasm.bindings.WebGPUExtras;

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
    return WebGPUAdapterDescriptor(spasm_add__object());
  }
  void powerPreference()(WebGPUPowerPreference powerPreference) {
    WebGPUAdapterDescriptor_powerPreference_Set(this.handle, powerPreference);
  }
  WebGPUPowerPreference powerPreference()() {
    return WebGPUAdapterDescriptor_powerPreference_Get(this.handle);
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
    return WebGPUAttachmentStateDescriptor(spasm_add__object());
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
    return WebGPUBindGroupBinding(spasm_add__object());
  }
  void visibility()(u32 visibility) {
    WebGPUBindGroupBinding_visibility_Set(this.handle, visibility);
  }
  u32 visibility()() {
    return WebGPUBindGroupBinding_visibility_Get(this.handle);
  }
  void type()(u32 type) {
    WebGPUBindGroupBinding_type_Set(this.handle, type);
  }
  u32 type()() {
    return WebGPUBindGroupBinding_type_Get(this.handle);
  }
  void start()(u32 start) {
    WebGPUBindGroupBinding_start_Set(this.handle, start);
  }
  u32 start()() {
    return WebGPUBindGroupBinding_start_Get(this.handle);
  }
  void count()(u32 count) {
    WebGPUBindGroupBinding_count_Set(this.handle, count);
  }
  u32 count()() {
    return WebGPUBindGroupBinding_count_Get(this.handle);
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
    return WebGPUBindGroupDescriptor(spasm_add__object());
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
    return WebGPUBindGroupLayoutDescriptor(spasm_add__object());
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
    return WebGPUBinding(spasm_add__object());
  }
  void resources()(scope ref Sequence!(WebGPUBindingResource) resources) {
    Object_Call_Handle__void(this.handle, "resources", resources.handle);
  }
  auto resources()() {
    return Sequence!(WebGPUBindingResource)(Object_Getter__Handle(this.handle, "resources"));
  }
  void start()(u32 start) {
    WebGPUBinding_start_Set(this.handle, start);
  }
  u32 start()() {
    return WebGPUBinding_start_Get(this.handle);
  }
  void count()(u32 count) {
    WebGPUBinding_count_Set(this.handle, count);
  }
  u32 count()() {
    return WebGPUBinding_count_Get(this.handle);
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
    return WebGPUBlendDescriptor(spasm_add__object());
  }
  void srcFactor()(u32 srcFactor) {
    WebGPUBlendDescriptor_srcFactor_Set(this.handle, srcFactor);
  }
  u32 srcFactor()() {
    return WebGPUBlendDescriptor_srcFactor_Get(this.handle);
  }
  void dstFactor()(u32 dstFactor) {
    WebGPUBlendDescriptor_dstFactor_Set(this.handle, dstFactor);
  }
  u32 dstFactor()() {
    return WebGPUBlendDescriptor_dstFactor_Get(this.handle);
  }
  void operation()(u32 operation) {
    WebGPUBlendDescriptor_operation_Set(this.handle, operation);
  }
  u32 operation()() {
    return WebGPUBlendDescriptor_operation_Get(this.handle);
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
    return WebGPUBlendStateDescriptor(spasm_add__object());
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
    WebGPUBlendStateDescriptor_writeMask_Set(this.handle, writeMask);
  }
  u32 writeMask()() {
    return WebGPUBlendStateDescriptor_writeMask_Get(this.handle);
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
    return Object_Getter__OptionalHandle(this.handle, "mapping");
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
    return WebGPUBufferDescriptor(spasm_add__object());
  }
  void size()(u32 size) {
    WebGPUBufferDescriptor_size_Set(this.handle, size);
  }
  u32 size()() {
    return WebGPUBufferDescriptor_size_Get(this.handle);
  }
  void usage()(u32 usage) {
    WebGPUBufferDescriptor_usage_Set(this.handle, usage);
  }
  u32 usage()() {
    return WebGPUBufferDescriptor_usage_Get(this.handle);
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
    WebGPUCommandEncoder_copyBufferToBuffer(this.handle, src.handle, srcOffset, dst.handle, dstOffset, size);
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
    WebGPUCommandEncoder_transitionBuffer(this.handle, b.handle, f);
  }
  void setPushConstants()(u32 stage, u32 offset, u32 count, scope ref ArrayBuffer data) {
    WebGPUCommandEncoder_setPushConstants(this.handle, stage, offset, count, data.handle);
  }
  void setBindGroup()(u32 index, scope ref WebGPUBindGroup bindGroup) {
    WebGPUCommandEncoder_setBindGroup(this.handle, index, bindGroup.handle);
  }
  void setPipeline()(scope ref SumType!(WebGPUComputePipeline, WebGPURenderPipeline) pipeline) {
    WebGPUCommandEncoder_setPipeline(this.handle, pipeline);
  }
  void beginComputePass()() {
    Object_Call__void(this.handle, "beginComputePass");
  }
  void endComputePass()() {
    Object_Call__void(this.handle, "endComputePass");
  }
  void dispatch()(u32 x, u32 y, u32 z) {
    WebGPUCommandEncoder_dispatch(this.handle, x, y, z);
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
    WebGPUCommandEncoder_setBlendColor(this.handle, r, g, b, a);
  }
  void setIndexBuffer()(scope ref WebGPUBuffer buffer, u32 offset) {
    WebGPUCommandEncoder_setIndexBuffer(this.handle, buffer.handle, offset);
  }
  void setVertexBuffers()(u32 startSlot, scope ref Sequence!(WebGPUBuffer) buffers, scope ref Sequence!(u32) offsets) {
    WebGPUCommandEncoder_setVertexBuffers(this.handle, startSlot, buffers.handle, offsets.handle);
  }
  void draw()(u32 vertexCount, u32 instanceCount, u32 firstVertex, u32 firstInstance) {
    WebGPUCommandEncoder_draw(this.handle, vertexCount, instanceCount, firstVertex, firstInstance);
  }
  void drawIndexed()(u32 indexCount, u32 instanceCount, u32 firstIndex, u32 firstInstance, u32 firstVertex) {
    WebGPUCommandEncoder_drawIndexed(this.handle, indexCount, instanceCount, firstIndex, firstInstance, firstVertex);
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
    return WebGPUCommandEncoderDescriptor(spasm_add__object());
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
  spasm.bindings.WebGPU.WebGPUPipelineDescriptorBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WebGPUPipelineDescriptorBase(h);
  }
  static auto create() {
    return WebGPUComputePipelineDescriptor(spasm_add__object());
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
    return WebGPUDepthStencilStateDescriptor(spasm_add__object());
  }
  void depthWriteEnabled()(bool depthWriteEnabled) {
    Object_Call_bool__void(this.handle, "depthWriteEnabled", depthWriteEnabled);
  }
  bool depthWriteEnabled()() {
    return Object_Getter__bool(this.handle, "depthWriteEnabled");
  }
  void depthCompare()(u32 depthCompare) {
    WebGPUDepthStencilStateDescriptor_depthCompare_Set(this.handle, depthCompare);
  }
  u32 depthCompare()() {
    return WebGPUDepthStencilStateDescriptor_depthCompare_Get(this.handle);
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
    WebGPUDepthStencilStateDescriptor_stencilReadMask_Set(this.handle, stencilReadMask);
  }
  u32 stencilReadMask()() {
    return WebGPUDepthStencilStateDescriptor_stencilReadMask_Get(this.handle);
  }
  void stencilWriteMask()(u32 stencilWriteMask) {
    WebGPUDepthStencilStateDescriptor_stencilWriteMask_Set(this.handle, stencilWriteMask);
  }
  u32 stencilWriteMask()() {
    return WebGPUDepthStencilStateDescriptor_stencilWriteMask_Get(this.handle);
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
    return Promise!(WebGPUObjectStatus)(WebGPUDevice_getObjectStatus(this.handle, obj));
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
    return WebGPUDeviceDescriptor(spasm_add__object());
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
    return WebGPUExtensions(spasm_add__object());
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
    return WebGPUFence_wait(this.handle, milliseconds);
  }
  auto promise()() {
    return Promise!(void)(Object_Getter__Handle(this.handle, "promise"));
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
    return WebGPUInputStateDescriptor(spasm_add__object());
  }
  void indexFormat()(u32 indexFormat) {
    WebGPUInputStateDescriptor_indexFormat_Set(this.handle, indexFormat);
  }
  u32 indexFormat()() {
    return WebGPUInputStateDescriptor_indexFormat_Get(this.handle);
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
    return WebGPULimits(spasm_add__object());
  }
  void maxBindGroups()(u32 maxBindGroups) {
    WebGPULimits_maxBindGroups_Set(this.handle, maxBindGroups);
  }
  u32 maxBindGroups()() {
    return WebGPULimits_maxBindGroups_Get(this.handle);
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
    return WebGPULogEntry_type_Get(this.handle);
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
    return WebGPUPipelineDescriptorBase(spasm_add__object());
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
    return WebGPUPipelineLayoutDescriptor(spasm_add__object());
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
    return WebGPUPipelineStageDescriptor(spasm_add__object());
  }
  void shaderModule()(scope ref WebGPUShaderModule shaderModule) {
    Object_Call_Handle__void(this.handle, "shaderModule", shaderModule.handle);
  }
  auto shaderModule()() {
    return WebGPUShaderModule(Object_Getter__Handle(this.handle, "shaderModule"));
  }
  void stage()(u32 stage) {
    WebGPUPipelineStageDescriptor_stage_Set(this.handle, stage);
  }
  u32 stage()() {
    return WebGPUPipelineStageDescriptor_stage_Get(this.handle);
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
    return WebGPURenderPassAttachmentDescriptor(spasm_add__object());
  }
  void attachment()(scope ref WebGPUTextureView attachment) {
    Object_Call_Handle__void(this.handle, "attachment", attachment.handle);
  }
  auto attachment()() {
    return WebGPUTextureView(Object_Getter__Handle(this.handle, "attachment"));
  }
  void loadOp()(u32 loadOp) {
    WebGPURenderPassAttachmentDescriptor_loadOp_Set(this.handle, loadOp);
  }
  u32 loadOp()() {
    return WebGPURenderPassAttachmentDescriptor_loadOp_Get(this.handle);
  }
  void storeOp()(u32 storeOp) {
    WebGPURenderPassAttachmentDescriptor_storeOp_Set(this.handle, storeOp);
  }
  u32 storeOp()() {
    return WebGPURenderPassAttachmentDescriptor_storeOp_Get(this.handle);
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
    return WebGPURenderPassDescriptor(spasm_add__object());
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
  spasm.bindings.WebGPU.WebGPUPipelineDescriptorBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WebGPUPipelineDescriptorBase(h);
  }
  static auto create() {
    return WebGPURenderPipelineDescriptor(spasm_add__object());
  }
  void primitiveTopology()(u32 primitiveTopology) {
    WebGPURenderPipelineDescriptor_primitiveTopology_Set(this._parent, primitiveTopology);
  }
  u32 primitiveTopology()() {
    return WebGPURenderPipelineDescriptor_primitiveTopology_Get(this._parent);
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
    return WebGPUSamplerDescriptor(spasm_add__object());
  }
  void magFilter()(u32 magFilter) {
    WebGPUSamplerDescriptor_magFilter_Set(this.handle, magFilter);
  }
  u32 magFilter()() {
    return WebGPUSamplerDescriptor_magFilter_Get(this.handle);
  }
  void minFilter()(u32 minFilter) {
    WebGPUSamplerDescriptor_minFilter_Set(this.handle, minFilter);
  }
  u32 minFilter()() {
    return WebGPUSamplerDescriptor_minFilter_Get(this.handle);
  }
  void mipmapFilter()(u32 mipmapFilter) {
    WebGPUSamplerDescriptor_mipmapFilter_Set(this.handle, mipmapFilter);
  }
  u32 mipmapFilter()() {
    return WebGPUSamplerDescriptor_mipmapFilter_Get(this.handle);
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
    return WebGPUShaderModuleDescriptor(spasm_add__object());
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
    return WebGPUStencilStateFaceDescriptor(spasm_add__object());
  }
  void compare()(u32 compare) {
    WebGPUStencilStateFaceDescriptor_compare_Set(this.handle, compare);
  }
  u32 compare()() {
    return WebGPUStencilStateFaceDescriptor_compare_Get(this.handle);
  }
  void stencilFailOp()(u32 stencilFailOp) {
    WebGPUStencilStateFaceDescriptor_stencilFailOp_Set(this.handle, stencilFailOp);
  }
  u32 stencilFailOp()() {
    return WebGPUStencilStateFaceDescriptor_stencilFailOp_Get(this.handle);
  }
  void depthFailOp()(u32 depthFailOp) {
    WebGPUStencilStateFaceDescriptor_depthFailOp_Set(this.handle, depthFailOp);
  }
  u32 depthFailOp()() {
    return WebGPUStencilStateFaceDescriptor_depthFailOp_Get(this.handle);
  }
  void passOp()(u32 passOp) {
    WebGPUStencilStateFaceDescriptor_passOp_Set(this.handle, passOp);
  }
  u32 passOp()() {
    return WebGPUStencilStateFaceDescriptor_passOp_Get(this.handle);
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
    return WebGPUSwapChainDescriptor(spasm_add__object());
  }
  void usage()(u32 usage) {
    WebGPUSwapChainDescriptor_usage_Set(this.handle, usage);
  }
  u32 usage()() {
    return WebGPUSwapChainDescriptor_usage_Get(this.handle);
  }
  void format()(u32 format) {
    WebGPUSwapChainDescriptor_format_Set(this.handle, format);
  }
  u32 format()() {
    return WebGPUSwapChainDescriptor_format_Get(this.handle);
  }
  void width()(u32 width) {
    WebGPUSwapChainDescriptor_width_Set(this.handle, width);
  }
  u32 width()() {
    return WebGPUSwapChainDescriptor_width_Get(this.handle);
  }
  void height()(u32 height) {
    WebGPUSwapChainDescriptor_height_Set(this.handle, height);
  }
  u32 height()() {
    return WebGPUSwapChainDescriptor_height_Get(this.handle);
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
    return WebGPUTextureDescriptor(spasm_add__object());
  }
  void width()(u32 width) {
    WebGPUTextureDescriptor_width_Set(this.handle, width);
  }
  u32 width()() {
    return WebGPUTextureDescriptor_width_Get(this.handle);
  }
  void height()(u32 height) {
    WebGPUTextureDescriptor_height_Set(this.handle, height);
  }
  u32 height()() {
    return WebGPUTextureDescriptor_height_Get(this.handle);
  }
  void depth()(u32 depth) {
    WebGPUTextureDescriptor_depth_Set(this.handle, depth);
  }
  u32 depth()() {
    return WebGPUTextureDescriptor_depth_Get(this.handle);
  }
  void arraySize()(u32 arraySize) {
    WebGPUTextureDescriptor_arraySize_Set(this.handle, arraySize);
  }
  u32 arraySize()() {
    return WebGPUTextureDescriptor_arraySize_Get(this.handle);
  }
  void dimension()(u32 dimension) {
    WebGPUTextureDescriptor_dimension_Set(this.handle, dimension);
  }
  u32 dimension()() {
    return WebGPUTextureDescriptor_dimension_Get(this.handle);
  }
  void format()(u32 format) {
    WebGPUTextureDescriptor_format_Set(this.handle, format);
  }
  u32 format()() {
    return WebGPUTextureDescriptor_format_Get(this.handle);
  }
  void usage()(u32 usage) {
    WebGPUTextureDescriptor_usage_Set(this.handle, usage);
  }
  u32 usage()() {
    return WebGPUTextureDescriptor_usage_Get(this.handle);
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
    return WebGPUTextureViewDescriptor(spasm_add__object());
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
    return WebGPUVertexAttributeDescriptor(spasm_add__object());
  }
  void shaderLocation()(u32 shaderLocation) {
    WebGPUVertexAttributeDescriptor_shaderLocation_Set(this.handle, shaderLocation);
  }
  u32 shaderLocation()() {
    return WebGPUVertexAttributeDescriptor_shaderLocation_Get(this.handle);
  }
  void inputSlot()(u32 inputSlot) {
    WebGPUVertexAttributeDescriptor_inputSlot_Set(this.handle, inputSlot);
  }
  u32 inputSlot()() {
    return WebGPUVertexAttributeDescriptor_inputSlot_Get(this.handle);
  }
  void offset()(u32 offset) {
    WebGPUVertexAttributeDescriptor_offset_Set(this.handle, offset);
  }
  u32 offset()() {
    return WebGPUVertexAttributeDescriptor_offset_Get(this.handle);
  }
  void format()(u32 format) {
    WebGPUVertexAttributeDescriptor_format_Set(this.handle, format);
  }
  u32 format()() {
    return WebGPUVertexAttributeDescriptor_format_Get(this.handle);
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
    return WebGPUVertexInputDescriptor(spasm_add__object());
  }
  void inputSlot()(u32 inputSlot) {
    WebGPUVertexInputDescriptor_inputSlot_Set(this.handle, inputSlot);
  }
  u32 inputSlot()() {
    return WebGPUVertexInputDescriptor_inputSlot_Get(this.handle);
  }
  void stride()(u32 stride) {
    WebGPUVertexInputDescriptor_stride_Set(this.handle, stride);
  }
  u32 stride()() {
    return WebGPUVertexInputDescriptor_stride_Get(this.handle);
  }
  void stepMode()(u32 stepMode) {
    WebGPUVertexInputDescriptor_stepMode_Set(this.handle, stepMode);
  }
  u32 stepMode()() {
    return WebGPUVertexInputDescriptor_stepMode_Get(this.handle);
  }
}
alias u32 = uint;
alias u64 = uint;


extern (C) void WebGPUAdapterDescriptor_powerPreference_Set(Handle, WebGPUPowerPreference);
extern (C) WebGPUPowerPreference WebGPUAdapterDescriptor_powerPreference_Get(Handle);
extern (C) void WebGPUBindGroupBinding_visibility_Set(Handle, u32);
extern (C) u32 WebGPUBindGroupBinding_visibility_Get(Handle);
extern (C) void WebGPUBindGroupBinding_type_Set(Handle, u32);
extern (C) u32 WebGPUBindGroupBinding_type_Get(Handle);
extern (C) void WebGPUBindGroupBinding_start_Set(Handle, u32);
extern (C) u32 WebGPUBindGroupBinding_start_Get(Handle);
extern (C) void WebGPUBindGroupBinding_count_Set(Handle, u32);
extern (C) u32 WebGPUBindGroupBinding_count_Get(Handle);
extern (C) void WebGPUBinding_start_Set(Handle, u32);
extern (C) u32 WebGPUBinding_start_Get(Handle);
extern (C) void WebGPUBinding_count_Set(Handle, u32);
extern (C) u32 WebGPUBinding_count_Get(Handle);
extern (C) void WebGPUBlendDescriptor_srcFactor_Set(Handle, u32);
extern (C) u32 WebGPUBlendDescriptor_srcFactor_Get(Handle);
extern (C) void WebGPUBlendDescriptor_dstFactor_Set(Handle, u32);
extern (C) u32 WebGPUBlendDescriptor_dstFactor_Get(Handle);
extern (C) void WebGPUBlendDescriptor_operation_Set(Handle, u32);
extern (C) u32 WebGPUBlendDescriptor_operation_Get(Handle);
extern (C) void WebGPUBlendStateDescriptor_writeMask_Set(Handle, u32);
extern (C) u32 WebGPUBlendStateDescriptor_writeMask_Get(Handle);
extern (C) void WebGPUBufferDescriptor_size_Set(Handle, u32);
extern (C) u32 WebGPUBufferDescriptor_size_Get(Handle);
extern (C) void WebGPUBufferDescriptor_usage_Set(Handle, u32);
extern (C) u32 WebGPUBufferDescriptor_usage_Get(Handle);
extern (C) void WebGPUCommandEncoder_copyBufferToBuffer(Handle, Handle, u32, Handle, u32, u32);
extern (C) void WebGPUCommandEncoder_transitionBuffer(Handle, Handle, u32);
extern (C) void WebGPUCommandEncoder_setPushConstants(Handle, u32, u32, u32, Handle);
extern (C) void WebGPUCommandEncoder_setBindGroup(Handle, u32, Handle);
extern (C) void WebGPUCommandEncoder_setPipeline(Handle, scope ref SumType!(WebGPUComputePipeline, WebGPURenderPipeline));
extern (C) void WebGPUCommandEncoder_dispatch(Handle, u32, u32, u32);
extern (C) void WebGPUCommandEncoder_setBlendColor(Handle, float, float, float, float);
extern (C) void WebGPUCommandEncoder_setIndexBuffer(Handle, Handle, u32);
extern (C) void WebGPUCommandEncoder_setVertexBuffers(Handle, u32, Handle, Handle);
extern (C) void WebGPUCommandEncoder_draw(Handle, u32, u32, u32, u32);
extern (C) void WebGPUCommandEncoder_drawIndexed(Handle, u32, u32, u32, u32, u32);
extern (C) void WebGPUDepthStencilStateDescriptor_depthCompare_Set(Handle, u32);
extern (C) u32 WebGPUDepthStencilStateDescriptor_depthCompare_Get(Handle);
extern (C) void WebGPUDepthStencilStateDescriptor_stencilReadMask_Set(Handle, u32);
extern (C) u32 WebGPUDepthStencilStateDescriptor_stencilReadMask_Get(Handle);
extern (C) void WebGPUDepthStencilStateDescriptor_stencilWriteMask_Set(Handle, u32);
extern (C) u32 WebGPUDepthStencilStateDescriptor_stencilWriteMask_Get(Handle);
extern (C) void WebGPUDevice_onLog_Set(Handle, WebGPULogCallback);
extern (C) WebGPULogCallback WebGPUDevice_onLog_Get(Handle);
extern (C) Handle WebGPUDevice_getObjectStatus(Handle, scope ref WebGPUStatusable);
extern (C) bool WebGPUFence_wait(Handle, double);
extern (C) void WebGPUInputStateDescriptor_indexFormat_Set(Handle, u32);
extern (C) u32 WebGPUInputStateDescriptor_indexFormat_Get(Handle);
extern (C) void WebGPULimits_maxBindGroups_Set(Handle, u32);
extern (C) u32 WebGPULimits_maxBindGroups_Get(Handle);
extern (C) WebGPULogEntryType WebGPULogEntry_type_Get(Handle);
extern (C) void WebGPUPipelineStageDescriptor_stage_Set(Handle, u32);
extern (C) u32 WebGPUPipelineStageDescriptor_stage_Get(Handle);
extern (C) void WebGPURenderPassAttachmentDescriptor_loadOp_Set(Handle, u32);
extern (C) u32 WebGPURenderPassAttachmentDescriptor_loadOp_Get(Handle);
extern (C) void WebGPURenderPassAttachmentDescriptor_storeOp_Set(Handle, u32);
extern (C) u32 WebGPURenderPassAttachmentDescriptor_storeOp_Get(Handle);
extern (C) void WebGPURenderPipelineDescriptor_primitiveTopology_Set(Handle, u32);
extern (C) u32 WebGPURenderPipelineDescriptor_primitiveTopology_Get(Handle);
extern (C) void WebGPUSamplerDescriptor_magFilter_Set(Handle, u32);
extern (C) u32 WebGPUSamplerDescriptor_magFilter_Get(Handle);
extern (C) void WebGPUSamplerDescriptor_minFilter_Set(Handle, u32);
extern (C) u32 WebGPUSamplerDescriptor_minFilter_Get(Handle);
extern (C) void WebGPUSamplerDescriptor_mipmapFilter_Set(Handle, u32);
extern (C) u32 WebGPUSamplerDescriptor_mipmapFilter_Get(Handle);
extern (C) void WebGPUStencilStateFaceDescriptor_compare_Set(Handle, u32);
extern (C) u32 WebGPUStencilStateFaceDescriptor_compare_Get(Handle);
extern (C) void WebGPUStencilStateFaceDescriptor_stencilFailOp_Set(Handle, u32);
extern (C) u32 WebGPUStencilStateFaceDescriptor_stencilFailOp_Get(Handle);
extern (C) void WebGPUStencilStateFaceDescriptor_depthFailOp_Set(Handle, u32);
extern (C) u32 WebGPUStencilStateFaceDescriptor_depthFailOp_Get(Handle);
extern (C) void WebGPUStencilStateFaceDescriptor_passOp_Set(Handle, u32);
extern (C) u32 WebGPUStencilStateFaceDescriptor_passOp_Get(Handle);
extern (C) void WebGPUSwapChainDescriptor_usage_Set(Handle, u32);
extern (C) u32 WebGPUSwapChainDescriptor_usage_Get(Handle);
extern (C) void WebGPUSwapChainDescriptor_format_Set(Handle, u32);
extern (C) u32 WebGPUSwapChainDescriptor_format_Get(Handle);
extern (C) void WebGPUSwapChainDescriptor_width_Set(Handle, u32);
extern (C) u32 WebGPUSwapChainDescriptor_width_Get(Handle);
extern (C) void WebGPUSwapChainDescriptor_height_Set(Handle, u32);
extern (C) u32 WebGPUSwapChainDescriptor_height_Get(Handle);
extern (C) void WebGPUTextureDescriptor_width_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_width_Get(Handle);
extern (C) void WebGPUTextureDescriptor_height_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_height_Get(Handle);
extern (C) void WebGPUTextureDescriptor_depth_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_depth_Get(Handle);
extern (C) void WebGPUTextureDescriptor_arraySize_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_arraySize_Get(Handle);
extern (C) void WebGPUTextureDescriptor_dimension_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_dimension_Get(Handle);
extern (C) void WebGPUTextureDescriptor_format_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_format_Get(Handle);
extern (C) void WebGPUTextureDescriptor_usage_Set(Handle, u32);
extern (C) u32 WebGPUTextureDescriptor_usage_Get(Handle);
extern (C) void WebGPUVertexAttributeDescriptor_shaderLocation_Set(Handle, u32);
extern (C) u32 WebGPUVertexAttributeDescriptor_shaderLocation_Get(Handle);
extern (C) void WebGPUVertexAttributeDescriptor_inputSlot_Set(Handle, u32);
extern (C) u32 WebGPUVertexAttributeDescriptor_inputSlot_Get(Handle);
extern (C) void WebGPUVertexAttributeDescriptor_offset_Set(Handle, u32);
extern (C) u32 WebGPUVertexAttributeDescriptor_offset_Get(Handle);
extern (C) void WebGPUVertexAttributeDescriptor_format_Set(Handle, u32);
extern (C) u32 WebGPUVertexAttributeDescriptor_format_Get(Handle);
extern (C) void WebGPUVertexInputDescriptor_inputSlot_Set(Handle, u32);
extern (C) u32 WebGPUVertexInputDescriptor_inputSlot_Get(Handle);
extern (C) void WebGPUVertexInputDescriptor_stride_Set(Handle, u32);
extern (C) u32 WebGPUVertexInputDescriptor_stride_Get(Handle);
extern (C) void WebGPUVertexInputDescriptor_stepMode_Set(Handle, u32);
extern (C) u32 WebGPUVertexInputDescriptor_stepMode_Get(Handle);