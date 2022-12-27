module libwasm.bindings.WebGL2RenderingContext;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLCanvasElement;
import libwasm.bindings.HTMLImageElement;
import libwasm.bindings.HTMLVideoElement;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.ImageData;
import libwasm.bindings.OffscreenCanvas;
import libwasm.bindings.WebGLRenderingContext;

@safe:
nothrow:

struct EXT_color_buffer_float {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
alias GLint64 = int;
alias GLuint64 = uint;
alias Uint32List = SumType!(Uint32Array, Sequence!(uint));
struct WebGL2RenderingContext {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint READ_BUFFER = 0x0C02;
  enum uint UNPACK_ROW_LENGTH = 0x0CF2;
  enum uint UNPACK_SKIP_ROWS = 0x0CF3;
  enum uint UNPACK_SKIP_PIXELS = 0x0CF4;
  enum uint PACK_ROW_LENGTH = 0x0D02;
  enum uint PACK_SKIP_ROWS = 0x0D03;
  enum uint PACK_SKIP_PIXELS = 0x0D04;
  enum uint COLOR = 0x1800;
  enum uint DEPTH = 0x1801;
  enum uint STENCIL = 0x1802;
  enum uint RED = 0x1903;
  enum uint RGB8 = 0x8051;
  enum uint RGBA8 = 0x8058;
  enum uint RGB10_A2 = 0x8059;
  enum uint TEXTURE_BINDING_3D = 0x806A;
  enum uint UNPACK_SKIP_IMAGES = 0x806D;
  enum uint UNPACK_IMAGE_HEIGHT = 0x806E;
  enum uint TEXTURE_3D = 0x806F;
  enum uint TEXTURE_WRAP_R = 0x8072;
  enum uint MAX_3D_TEXTURE_SIZE = 0x8073;
  enum uint UNSIGNED_INT_2_10_10_10_REV = 0x8368;
  enum uint MAX_ELEMENTS_VERTICES = 0x80E8;
  enum uint MAX_ELEMENTS_INDICES = 0x80E9;
  enum uint TEXTURE_MIN_LOD = 0x813A;
  enum uint TEXTURE_MAX_LOD = 0x813B;
  enum uint TEXTURE_BASE_LEVEL = 0x813C;
  enum uint TEXTURE_MAX_LEVEL = 0x813D;
  enum uint MIN = 0x8007;
  enum uint MAX = 0x8008;
  enum uint DEPTH_COMPONENT24 = 0x81A6;
  enum uint MAX_TEXTURE_LOD_BIAS = 0x84FD;
  enum uint TEXTURE_COMPARE_MODE = 0x884C;
  enum uint TEXTURE_COMPARE_FUNC = 0x884D;
  enum uint CURRENT_QUERY = 0x8865;
  enum uint QUERY_RESULT = 0x8866;
  enum uint QUERY_RESULT_AVAILABLE = 0x8867;
  enum uint STREAM_READ = 0x88E1;
  enum uint STREAM_COPY = 0x88E2;
  enum uint STATIC_READ = 0x88E5;
  enum uint STATIC_COPY = 0x88E6;
  enum uint DYNAMIC_READ = 0x88E9;
  enum uint DYNAMIC_COPY = 0x88EA;
  enum uint MAX_DRAW_BUFFERS = 0x8824;
  enum uint DRAW_BUFFER0 = 0x8825;
  enum uint DRAW_BUFFER1 = 0x8826;
  enum uint DRAW_BUFFER2 = 0x8827;
  enum uint DRAW_BUFFER3 = 0x8828;
  enum uint DRAW_BUFFER4 = 0x8829;
  enum uint DRAW_BUFFER5 = 0x882A;
  enum uint DRAW_BUFFER6 = 0x882B;
  enum uint DRAW_BUFFER7 = 0x882C;
  enum uint DRAW_BUFFER8 = 0x882D;
  enum uint DRAW_BUFFER9 = 0x882E;
  enum uint DRAW_BUFFER10 = 0x882F;
  enum uint DRAW_BUFFER11 = 0x8830;
  enum uint DRAW_BUFFER12 = 0x8831;
  enum uint DRAW_BUFFER13 = 0x8832;
  enum uint DRAW_BUFFER14 = 0x8833;
  enum uint DRAW_BUFFER15 = 0x8834;
  enum uint MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
  enum uint MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
  enum uint SAMPLER_3D = 0x8B5F;
  enum uint SAMPLER_2D_SHADOW = 0x8B62;
  enum uint FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
  enum uint PIXEL_PACK_BUFFER = 0x88EB;
  enum uint PIXEL_UNPACK_BUFFER = 0x88EC;
  enum uint PIXEL_PACK_BUFFER_BINDING = 0x88ED;
  enum uint PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
  enum uint FLOAT_MAT2x3 = 0x8B65;
  enum uint FLOAT_MAT2x4 = 0x8B66;
  enum uint FLOAT_MAT3x2 = 0x8B67;
  enum uint FLOAT_MAT3x4 = 0x8B68;
  enum uint FLOAT_MAT4x2 = 0x8B69;
  enum uint FLOAT_MAT4x3 = 0x8B6A;
  enum uint SRGB = 0x8C40;
  enum uint SRGB8 = 0x8C41;
  enum uint SRGB8_ALPHA8 = 0x8C43;
  enum uint COMPARE_REF_TO_TEXTURE = 0x884E;
  enum uint RGBA32F = 0x8814;
  enum uint RGB32F = 0x8815;
  enum uint RGBA16F = 0x881A;
  enum uint RGB16F = 0x881B;
  enum uint VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
  enum uint MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
  enum uint MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
  enum uint MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
  enum uint MAX_VARYING_COMPONENTS = 0x8B4B;
  enum uint TEXTURE_2D_ARRAY = 0x8C1A;
  enum uint TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
  enum uint R11F_G11F_B10F = 0x8C3A;
  enum uint UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
  enum uint RGB9_E5 = 0x8C3D;
  enum uint UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
  enum uint TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
  enum uint MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
  enum uint TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
  enum uint TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
  enum uint TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
  enum uint TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
  enum uint RASTERIZER_DISCARD = 0x8C89;
  enum uint MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
  enum uint MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
  enum uint INTERLEAVED_ATTRIBS = 0x8C8C;
  enum uint SEPARATE_ATTRIBS = 0x8C8D;
  enum uint TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
  enum uint TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
  enum uint RGBA32UI = 0x8D70;
  enum uint RGB32UI = 0x8D71;
  enum uint RGBA16UI = 0x8D76;
  enum uint RGB16UI = 0x8D77;
  enum uint RGBA8UI = 0x8D7C;
  enum uint RGB8UI = 0x8D7D;
  enum uint RGBA32I = 0x8D82;
  enum uint RGB32I = 0x8D83;
  enum uint RGBA16I = 0x8D88;
  enum uint RGB16I = 0x8D89;
  enum uint RGBA8I = 0x8D8E;
  enum uint RGB8I = 0x8D8F;
  enum uint RED_INTEGER = 0x8D94;
  enum uint RGB_INTEGER = 0x8D98;
  enum uint RGBA_INTEGER = 0x8D99;
  enum uint SAMPLER_2D_ARRAY = 0x8DC1;
  enum uint SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
  enum uint SAMPLER_CUBE_SHADOW = 0x8DC5;
  enum uint UNSIGNED_INT_VEC2 = 0x8DC6;
  enum uint UNSIGNED_INT_VEC3 = 0x8DC7;
  enum uint UNSIGNED_INT_VEC4 = 0x8DC8;
  enum uint INT_SAMPLER_2D = 0x8DCA;
  enum uint INT_SAMPLER_3D = 0x8DCB;
  enum uint INT_SAMPLER_CUBE = 0x8DCC;
  enum uint INT_SAMPLER_2D_ARRAY = 0x8DCF;
  enum uint UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
  enum uint UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
  enum uint UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
  enum uint UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
  enum uint DEPTH_COMPONENT32F = 0x8CAC;
  enum uint DEPTH32F_STENCIL8 = 0x8CAD;
  enum uint FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
  enum uint FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
  enum uint FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
  enum uint FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
  enum uint FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
  enum uint FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
  enum uint FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
  enum uint FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
  enum uint FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
  enum uint FRAMEBUFFER_DEFAULT = 0x8218;
  enum uint UNSIGNED_INT_24_8 = 0x84FA;
  enum uint DEPTH24_STENCIL8 = 0x88F0;
  enum uint UNSIGNED_NORMALIZED = 0x8C17;
  enum uint DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
  enum uint READ_FRAMEBUFFER = 0x8CA8;
  enum uint DRAW_FRAMEBUFFER = 0x8CA9;
  enum uint READ_FRAMEBUFFER_BINDING = 0x8CAA;
  enum uint RENDERBUFFER_SAMPLES = 0x8CAB;
  enum uint FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
  enum uint MAX_COLOR_ATTACHMENTS = 0x8CDF;
  enum uint COLOR_ATTACHMENT1 = 0x8CE1;
  enum uint COLOR_ATTACHMENT2 = 0x8CE2;
  enum uint COLOR_ATTACHMENT3 = 0x8CE3;
  enum uint COLOR_ATTACHMENT4 = 0x8CE4;
  enum uint COLOR_ATTACHMENT5 = 0x8CE5;
  enum uint COLOR_ATTACHMENT6 = 0x8CE6;
  enum uint COLOR_ATTACHMENT7 = 0x8CE7;
  enum uint COLOR_ATTACHMENT8 = 0x8CE8;
  enum uint COLOR_ATTACHMENT9 = 0x8CE9;
  enum uint COLOR_ATTACHMENT10 = 0x8CEA;
  enum uint COLOR_ATTACHMENT11 = 0x8CEB;
  enum uint COLOR_ATTACHMENT12 = 0x8CEC;
  enum uint COLOR_ATTACHMENT13 = 0x8CED;
  enum uint COLOR_ATTACHMENT14 = 0x8CEE;
  enum uint COLOR_ATTACHMENT15 = 0x8CEF;
  enum uint FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
  enum uint MAX_SAMPLES = 0x8D57;
  enum uint HALF_FLOAT = 0x140B;
  enum uint RG = 0x8227;
  enum uint RG_INTEGER = 0x8228;
  enum uint R8 = 0x8229;
  enum uint RG8 = 0x822B;
  enum uint R16F = 0x822D;
  enum uint R32F = 0x822E;
  enum uint RG16F = 0x822F;
  enum uint RG32F = 0x8230;
  enum uint R8I = 0x8231;
  enum uint R8UI = 0x8232;
  enum uint R16I = 0x8233;
  enum uint R16UI = 0x8234;
  enum uint R32I = 0x8235;
  enum uint R32UI = 0x8236;
  enum uint RG8I = 0x8237;
  enum uint RG8UI = 0x8238;
  enum uint RG16I = 0x8239;
  enum uint RG16UI = 0x823A;
  enum uint RG32I = 0x823B;
  enum uint RG32UI = 0x823C;
  enum uint VERTEX_ARRAY_BINDING = 0x85B5;
  enum uint R8_SNORM = 0x8F94;
  enum uint RG8_SNORM = 0x8F95;
  enum uint RGB8_SNORM = 0x8F96;
  enum uint RGBA8_SNORM = 0x8F97;
  enum uint SIGNED_NORMALIZED = 0x8F9C;
  enum uint COPY_READ_BUFFER = 0x8F36;
  enum uint COPY_WRITE_BUFFER = 0x8F37;
  enum uint COPY_READ_BUFFER_BINDING = 0x8F36;
  enum uint COPY_WRITE_BUFFER_BINDING = 0x8F37;
  enum uint UNIFORM_BUFFER = 0x8A11;
  enum uint UNIFORM_BUFFER_BINDING = 0x8A28;
  enum uint UNIFORM_BUFFER_START = 0x8A29;
  enum uint UNIFORM_BUFFER_SIZE = 0x8A2A;
  enum uint MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
  enum uint MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
  enum uint MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
  enum uint MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
  enum uint MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
  enum uint MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
  enum uint MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
  enum uint UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
  enum uint ACTIVE_UNIFORM_BLOCKS = 0x8A36;
  enum uint UNIFORM_TYPE = 0x8A37;
  enum uint UNIFORM_SIZE = 0x8A38;
  enum uint UNIFORM_BLOCK_INDEX = 0x8A3A;
  enum uint UNIFORM_OFFSET = 0x8A3B;
  enum uint UNIFORM_ARRAY_STRIDE = 0x8A3C;
  enum uint UNIFORM_MATRIX_STRIDE = 0x8A3D;
  enum uint UNIFORM_IS_ROW_MAJOR = 0x8A3E;
  enum uint UNIFORM_BLOCK_BINDING = 0x8A3F;
  enum uint UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
  enum uint UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
  enum uint UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
  enum uint UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
  enum uint UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
  enum uint INVALID_INDEX = 0xFFFFFFFF;
  enum uint MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
  enum uint MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
  enum uint MAX_SERVER_WAIT_TIMEOUT = 0x9111;
  enum uint OBJECT_TYPE = 0x9112;
  enum uint SYNC_CONDITION = 0x9113;
  enum uint SYNC_STATUS = 0x9114;
  enum uint SYNC_FLAGS = 0x9115;
  enum uint SYNC_FENCE = 0x9116;
  enum uint SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
  enum uint UNSIGNALED = 0x9118;
  enum uint SIGNALED = 0x9119;
  enum uint ALREADY_SIGNALED = 0x911A;
  enum uint TIMEOUT_EXPIRED = 0x911B;
  enum uint CONDITION_SATISFIED = 0x911C;
  enum uint WAIT_FAILED = 0x911D;
  enum uint SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
  enum uint VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
  enum uint ANY_SAMPLES_PASSED = 0x8C2F;
  enum uint ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
  enum uint SAMPLER_BINDING = 0x8919;
  enum uint RGB10_A2UI = 0x906F;
  enum uint INT_2_10_10_10_REV = 0x8D9F;
  enum uint TRANSFORM_FEEDBACK = 0x8E22;
  enum uint TRANSFORM_FEEDBACK_PAUSED = 0x8E23;
  enum uint TRANSFORM_FEEDBACK_ACTIVE = 0x8E24;
  enum uint TRANSFORM_FEEDBACK_BINDING = 0x8E25;
  enum uint TEXTURE_IMMUTABLE_FORMAT = 0x912F;
  enum uint MAX_ELEMENT_INDEX = 0x8D6B;
  enum uint TEXTURE_IMMUTABLE_LEVELS = 0x82DF;
  enum int TIMEOUT_IGNORED = -1;
  enum uint MAX_CLIENT_WAIT_TIMEOUT_WEBGL = 0x9247;
  void bufferData()(uint target, int size, uint usage) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;int;uint", tuple(target, size, usage));
  }
  void bufferData(T1)(uint target, scope auto ref Optional!(T1) srcData, uint usage) if (isTOrPointer!(T1, ArrayBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Optional!Handle;uint", tuple(target, !srcData.empty, cast(Handle)srcData.front.handle, usage));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint", tuple(target, cast(Handle)srcData.handle, usage));
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBuffer srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle", tuple(target, offset, cast(Handle)srcData.handle));
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle", tuple(target, offset, cast(Handle)srcData.handle));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage, uint srcOffset, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint;uint;uint", tuple(target, cast(Handle)srcData.handle, usage, srcOffset, length));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint;uint", tuple(target, cast(Handle)srcData.handle, usage, srcOffset));
  }
  void bufferSubData()(uint target, int dstByteOffset, scope ref ArrayBufferView srcData, uint srcOffset, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle;uint;uint", tuple(target, dstByteOffset, cast(Handle)srcData.handle, srcOffset, length));
  }
  void bufferSubData()(uint target, int dstByteOffset, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle;uint", tuple(target, dstByteOffset, cast(Handle)srcData.handle, srcOffset));
  }
  void copyBufferSubData()(uint readTarget, uint writeTarget, int readOffset, int writeOffset, int size) {
    Serialize_Object_VarArgCall!void(this.handle, "copyBufferSubData", "uint;uint;int;int;int", tuple(readTarget, writeTarget, readOffset, writeOffset, size));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData, uint dstOffset /* = 0 */, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle;uint;uint", tuple(target, srcByteOffset, cast(Handle)dstData.handle, dstOffset, length));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData, uint dstOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle;uint", tuple(target, srcByteOffset, cast(Handle)dstData.handle, dstOffset));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle", tuple(target, srcByteOffset, cast(Handle)dstData.handle));
  }
  void blitFramebuffer()(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, uint mask, uint filter) {
    Serialize_Object_VarArgCall!void(this.handle, "blitFramebuffer", "int;int;int;int;int;int;int;int;uint;uint", tuple(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter));
  }
  void framebufferTextureLayer(T2)(uint target, uint attachment, scope auto ref Optional!(T2) texture, int level, int layer) if (isTOrPointer!(T2, WebGLTexture)) {
    Serialize_Object_VarArgCall!void(this.handle, "framebufferTextureLayer", "uint;uint;Optional!Handle;int;int", tuple(target, attachment, !texture.empty, cast(Handle)texture.front.handle, level, layer));
  }
  void invalidateFramebuffer()(uint target, scope ref Sequence!(uint) attachments) {
    Serialize_Object_VarArgCall!void(this.handle, "invalidateFramebuffer", "uint;Handle", tuple(target, cast(Handle)attachments.handle));
  }
  void invalidateSubFramebuffer()(uint target, scope ref Sequence!(uint) attachments, int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "invalidateSubFramebuffer", "uint;Handle;int;int;int;int", tuple(target, cast(Handle)attachments.handle, x, y, width, height));
  }
  void readBuffer()(uint src) {
    Object_Call_uint__void(this.handle, "readBuffer", src);
  }
  auto getInternalformatParameter()(uint target, uint internalformat, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getInternalformatParameter", "uint;uint;uint", tuple(target, internalformat, pname)));
  }
  void renderbufferStorageMultisample()(uint target, int samples, uint internalformat, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "renderbufferStorageMultisample", "uint;int;uint;int;int", tuple(target, samples, internalformat, width, height));
  }
  void texStorage2D()(uint target, int levels, uint internalformat, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "texStorage2D", "uint;int;uint;int;int", tuple(target, levels, internalformat, width, height));
  }
  void texStorage3D()(uint target, int levels, uint internalformat, int width, int height, int depth) {
    Serialize_Object_VarArgCall!void(this.handle, "texStorage3D", "uint;int;uint;int;int;int", tuple(target, levels, internalformat, width, height, depth));
  }
  void texImage2D(T8)(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, internalformat, width, height, border, format, type, !pixels.empty, cast(Handle)pixels.front.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D(T8)(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, !pixels.empty, cast(Handle)pixels.front.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;int", tuple(target, level, internalformat, width, height, border, format, type, pboOffset));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;int", tuple(target, level, internalformat, width, height, depth, border, format, type, pboOffset));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source.handle));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source.handle));
  }
  void texImage3D(T9)(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope auto ref Optional!(T9) srcData) if (isTOrPointer!(T9, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, !srcData.empty, cast(Handle)srcData.front.handle));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;int", tuple(target, level, xoffset, yoffset, width, height, format, type, pboOffset));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;int", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pboOffset));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source.handle));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source.handle));
  }
  void texSubImage3D(T10)(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope auto ref Optional!(T10) srcData, uint srcOffset /* = 0 */) if (isTOrPointer!(T10, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Optional!Handle;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, !srcData.empty, cast(Handle)srcData.front.handle, srcOffset));
  }
  void texSubImage3D(T10)(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope auto ref Optional!(T10) srcData) if (isTOrPointer!(T10, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, !srcData.empty, cast(Handle)srcData.front.handle));
  }
  void copyTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "copyTexSubImage3D", "uint;int;int;int;int;int;int;int;int", tuple(target, level, xoffset, yoffset, zoffset, x, y, width, height));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;int;int", tuple(target, level, internalformat, width, height, border, imageSize, offset));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle;uint;uint", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle;uint", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;int;int", tuple(target, level, internalformat, width, height, depth, border, imageSize, offset));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle;uint;uint", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle;uint", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;int;int", tuple(target, level, xoffset, yoffset, width, height, format, imageSize, offset));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle;uint;uint", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle;uint", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;int;int", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, offset));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle;uint;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle));
  }
  int getFragDataLocation()(scope ref WebGLProgram program, string name) {
    return Serialize_Object_VarArgCall!int(this.handle, "getFragDataLocation", "Handle;string", tuple(cast(Handle)program.handle, name));
  }
  void uniform1ui(T0)(scope auto ref Optional!(T0) location, uint v0) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1ui", "Optional!Handle;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0));
  }
  void uniform2ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2ui", "Optional!Handle;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1));
  }
  void uniform3ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1, uint v2) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3ui", "Optional!Handle;uint;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1, v2));
  }
  void uniform4ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1, uint v2, uint v3) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4ui", "Optional!Handle;uint;uint;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1, v2, v3));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void vertexAttribI4i()(uint index, int x, int y, int z, int w) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4i", "uint;int;int;int;int", tuple(index, x, y, z, w));
  }
  void vertexAttribI4iv()(uint index, scope ref Int32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4iv", "uint;SumType!(Handle,Handle)", tuple(index, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttribI4ui()(uint index, uint x, uint y, uint z, uint w) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4ui", "uint;uint;uint;uint;uint", tuple(index, x, y, z, w));
  }
  void vertexAttribI4uiv()(uint index, scope ref Uint32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4uiv", "uint;SumType!(Handle,Handle)", tuple(index, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttribIPointer()(uint index, int size, uint type, int stride, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribIPointer", "uint;int;uint;int;int", tuple(index, size, type, stride, offset));
  }
  void vertexAttribDivisor()(uint index, uint divisor) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribDivisor", "uint;uint", tuple(index, divisor));
  }
  void drawArraysInstanced()(uint mode, int first, int count, int instanceCount) {
    Serialize_Object_VarArgCall!void(this.handle, "drawArraysInstanced", "uint;int;int;int", tuple(mode, first, count, instanceCount));
  }
  void drawElementsInstanced()(uint mode, int count, uint type, int offset, int instanceCount) {
    Serialize_Object_VarArgCall!void(this.handle, "drawElementsInstanced", "uint;int;uint;int;int", tuple(mode, count, type, offset, instanceCount));
  }
  void drawRangeElements()(uint mode, uint start, uint end, int count, uint type, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "drawRangeElements", "uint;uint;uint;int;uint;int", tuple(mode, start, end, count, type, offset));
  }
  void readPixels(T6)(int x, int y, int width, int height, uint format, uint type, scope auto ref Optional!(T6) dstData) if (isTOrPointer!(T6, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;Optional!Handle", tuple(x, y, width, height, format, type, !dstData.empty, cast(Handle)dstData.front.handle));
  }
  void readPixels()(int x, int y, int width, int height, uint format, uint type, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;int", tuple(x, y, width, height, format, type, offset));
  }
  void readPixels()(int x, int y, int width, int height, uint format, uint type, scope ref ArrayBufferView dstData, uint dstOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;Handle;uint", tuple(x, y, width, height, format, type, cast(Handle)dstData.handle, dstOffset));
  }
  void drawBuffers()(scope ref Sequence!(uint) buffers) {
    Object_Call_Handle__void(this.handle, "drawBuffers", buffers.handle);
  }
  void clearBufferfv()(uint buffer, int drawbuffer, scope ref Float32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferfv()(uint buffer, int drawbuffer, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferiv()(uint buffer, int drawbuffer, scope ref Int32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferiv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferiv()(uint buffer, int drawbuffer, scope ref Int32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferiv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferuiv()(uint buffer, int drawbuffer, scope ref Uint32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferuiv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferuiv()(uint buffer, int drawbuffer, scope ref Uint32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferuiv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferfi()(uint buffer, int drawbuffer, float depth, int stencil) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfi", "uint;int;float;int", tuple(buffer, drawbuffer, depth, stencil));
  }
  auto createQuery()() {
    return recastOpt!(WebGLQuery)(Object_Getter__OptionalHandle(this.handle, "createQuery"));
  }
  void deleteQuery(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteQuery", "Optional!Handle", tuple(!query.empty, cast(Handle)query.front.handle));
  }
  bool isQuery(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isQuery", "Optional!Handle", tuple(!query.empty, cast(Handle)query.front.handle));
  }
  void beginQuery()(uint target, scope ref WebGLQuery query) {
    Serialize_Object_VarArgCall!void(this.handle, "beginQuery", "uint;Handle", tuple(target, cast(Handle)query.handle));
  }
  void endQuery()(uint target) {
    Object_Call_uint__void(this.handle, "endQuery", target);
  }
  auto getQuery()(uint target, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getQuery", "uint;uint", tuple(target, pname)));
  }
  auto getQueryParameter()(scope ref WebGLQuery query, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getQueryParameter", "Handle;uint", tuple(cast(Handle)query.handle, pname)));
  }
  auto createSampler()() {
    return recastOpt!(WebGLSampler)(Object_Getter__OptionalHandle(this.handle, "createSampler"));
  }
  void deleteSampler(T0)(scope auto ref Optional!(T0) sampler) if (isTOrPointer!(T0, WebGLSampler)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteSampler", "Optional!Handle", tuple(!sampler.empty, cast(Handle)sampler.front.handle));
  }
  bool isSampler(T0)(scope auto ref Optional!(T0) sampler) if (isTOrPointer!(T0, WebGLSampler)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isSampler", "Optional!Handle", tuple(!sampler.empty, cast(Handle)sampler.front.handle));
  }
  void bindSampler(T1)(uint unit, scope auto ref Optional!(T1) sampler) if (isTOrPointer!(T1, WebGLSampler)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindSampler", "uint;Optional!Handle", tuple(unit, !sampler.empty, cast(Handle)sampler.front.handle));
  }
  void samplerParameteri()(scope ref WebGLSampler sampler, uint pname, int param) {
    Serialize_Object_VarArgCall!void(this.handle, "samplerParameteri", "Handle;uint;int", tuple(cast(Handle)sampler.handle, pname, param));
  }
  void samplerParameterf()(scope ref WebGLSampler sampler, uint pname, float param) {
    Serialize_Object_VarArgCall!void(this.handle, "samplerParameterf", "Handle;uint;float", tuple(cast(Handle)sampler.handle, pname, param));
  }
  auto getSamplerParameter()(scope ref WebGLSampler sampler, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getSamplerParameter", "Handle;uint", tuple(cast(Handle)sampler.handle, pname)));
  }
  auto fenceSync()(uint condition, uint flags) {
    return recastOpt!(WebGLSync)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "fenceSync", "uint;uint", tuple(condition, flags)));
  }
  bool isSync(T0)(scope auto ref Optional!(T0) sync) if (isTOrPointer!(T0, WebGLSync)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isSync", "Optional!Handle", tuple(!sync.empty, cast(Handle)sync.front.handle));
  }
  void deleteSync(T0)(scope auto ref Optional!(T0) sync) if (isTOrPointer!(T0, WebGLSync)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteSync", "Optional!Handle", tuple(!sync.empty, cast(Handle)sync.front.handle));
  }
  uint clientWaitSync()(scope ref WebGLSync sync, uint flags, uint timeout) {
    return Serialize_Object_VarArgCall!uint(this.handle, "clientWaitSync", "Handle;uint;uint", tuple(cast(Handle)sync.handle, flags, timeout));
  }
  void waitSync()(scope ref WebGLSync sync, uint flags, int timeout) {
    Serialize_Object_VarArgCall!void(this.handle, "waitSync", "Handle;uint;int", tuple(cast(Handle)sync.handle, flags, timeout));
  }
  auto getSyncParameter()(scope ref WebGLSync sync, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getSyncParameter", "Handle;uint", tuple(cast(Handle)sync.handle, pname)));
  }
  auto createTransformFeedback()() {
    return recastOpt!(WebGLTransformFeedback)(Object_Getter__OptionalHandle(this.handle, "createTransformFeedback"));
  }
  void deleteTransformFeedback(T0)(scope auto ref Optional!(T0) tf) if (isTOrPointer!(T0, WebGLTransformFeedback)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteTransformFeedback", "Optional!Handle", tuple(!tf.empty, cast(Handle)tf.front.handle));
  }
  bool isTransformFeedback(T0)(scope auto ref Optional!(T0) tf) if (isTOrPointer!(T0, WebGLTransformFeedback)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isTransformFeedback", "Optional!Handle", tuple(!tf.empty, cast(Handle)tf.front.handle));
  }
  void bindTransformFeedback(T1)(uint target, scope auto ref Optional!(T1) tf) if (isTOrPointer!(T1, WebGLTransformFeedback)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindTransformFeedback", "uint;Optional!Handle", tuple(target, !tf.empty, cast(Handle)tf.front.handle));
  }
  void beginTransformFeedback()(uint primitiveMode) {
    Object_Call_uint__void(this.handle, "beginTransformFeedback", primitiveMode);
  }
  void endTransformFeedback()() {
    Object_Call__void(this.handle, "endTransformFeedback");
  }
  void transformFeedbackVaryings()(scope ref WebGLProgram program, scope ref Sequence!(string) varyings, uint bufferMode) {
    Serialize_Object_VarArgCall!void(this.handle, "transformFeedbackVaryings", "Handle;Handle;uint", tuple(cast(Handle)program.handle, cast(Handle)varyings.handle, bufferMode));
  }
  auto getTransformFeedbackVarying()(scope ref WebGLProgram program, uint index) {
    return recastOpt!(WebGLActiveInfo)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getTransformFeedbackVarying", "Handle;uint", tuple(cast(Handle)program.handle, index)));
  }
  void pauseTransformFeedback()() {
    Object_Call__void(this.handle, "pauseTransformFeedback");
  }
  void resumeTransformFeedback()() {
    Object_Call__void(this.handle, "resumeTransformFeedback");
  }
  void bindBufferBase(T2)(uint target, uint index, scope auto ref Optional!(T2) buffer) if (isTOrPointer!(T2, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindBufferBase", "uint;uint;Optional!Handle", tuple(target, index, !buffer.empty, cast(Handle)buffer.front.handle));
  }
  void bindBufferRange(T2)(uint target, uint index, scope auto ref Optional!(T2) buffer, int offset, int size) if (isTOrPointer!(T2, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindBufferRange", "uint;uint;Optional!Handle;int;int", tuple(target, index, !buffer.empty, cast(Handle)buffer.front.handle, offset, size));
  }
  auto getIndexedParameter()(uint target, uint index) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getIndexedParameter", "uint;uint", tuple(target, index)));
  }
  auto getUniformIndices()(scope ref WebGLProgram program, scope ref Sequence!(string) uniformNames) {
    return recastOpt!(Sequence!(uint))(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getUniformIndices", "Handle;Handle", tuple(cast(Handle)program.handle, cast(Handle)uniformNames.handle)));
  }
  auto getActiveUniforms()(scope ref WebGLProgram program, scope ref Sequence!(uint) uniformIndices, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getActiveUniforms", "Handle;Handle;uint", tuple(cast(Handle)program.handle, cast(Handle)uniformIndices.handle, pname)));
  }
  uint getUniformBlockIndex()(scope ref WebGLProgram program, string uniformBlockName) {
    return Serialize_Object_VarArgCall!uint(this.handle, "getUniformBlockIndex", "Handle;string", tuple(cast(Handle)program.handle, uniformBlockName));
  }
  auto getActiveUniformBlockParameter()(scope ref WebGLProgram program, uint uniformBlockIndex, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getActiveUniformBlockParameter", "Handle;uint;uint", tuple(cast(Handle)program.handle, uniformBlockIndex, pname)));
  }
  Optional!(string) getActiveUniformBlockName()(scope ref WebGLProgram program, uint uniformBlockIndex) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getActiveUniformBlockName", "Handle;uint", tuple(cast(Handle)program.handle, uniformBlockIndex));
  }
  void uniformBlockBinding()(scope ref WebGLProgram program, uint uniformBlockIndex, uint uniformBlockBinding) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformBlockBinding", "Handle;uint;uint", tuple(cast(Handle)program.handle, uniformBlockIndex, uniformBlockBinding));
  }
  auto createVertexArray()() {
    return recastOpt!(WebGLVertexArrayObject)(Object_Getter__OptionalHandle(this.handle, "createVertexArray"));
  }
  void deleteVertexArray(T0)(scope auto ref Optional!(T0) vertexArray) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteVertexArray", "Optional!Handle", tuple(!vertexArray.empty, cast(Handle)vertexArray.front.handle));
  }
  bool isVertexArray(T0)(scope auto ref Optional!(T0) vertexArray) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isVertexArray", "Optional!Handle", tuple(!vertexArray.empty, cast(Handle)vertexArray.front.handle));
  }
  void bindVertexArray(T0)(scope auto ref Optional!(T0) array) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindVertexArray", "Optional!Handle", tuple(!array.empty, cast(Handle)array.front.handle));
  }
}
struct WebGL2RenderingContextBase {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint READ_BUFFER = 0x0C02;
  enum uint UNPACK_ROW_LENGTH = 0x0CF2;
  enum uint UNPACK_SKIP_ROWS = 0x0CF3;
  enum uint UNPACK_SKIP_PIXELS = 0x0CF4;
  enum uint PACK_ROW_LENGTH = 0x0D02;
  enum uint PACK_SKIP_ROWS = 0x0D03;
  enum uint PACK_SKIP_PIXELS = 0x0D04;
  enum uint COLOR = 0x1800;
  enum uint DEPTH = 0x1801;
  enum uint STENCIL = 0x1802;
  enum uint RED = 0x1903;
  enum uint RGB8 = 0x8051;
  enum uint RGBA8 = 0x8058;
  enum uint RGB10_A2 = 0x8059;
  enum uint TEXTURE_BINDING_3D = 0x806A;
  enum uint UNPACK_SKIP_IMAGES = 0x806D;
  enum uint UNPACK_IMAGE_HEIGHT = 0x806E;
  enum uint TEXTURE_3D = 0x806F;
  enum uint TEXTURE_WRAP_R = 0x8072;
  enum uint MAX_3D_TEXTURE_SIZE = 0x8073;
  enum uint UNSIGNED_INT_2_10_10_10_REV = 0x8368;
  enum uint MAX_ELEMENTS_VERTICES = 0x80E8;
  enum uint MAX_ELEMENTS_INDICES = 0x80E9;
  enum uint TEXTURE_MIN_LOD = 0x813A;
  enum uint TEXTURE_MAX_LOD = 0x813B;
  enum uint TEXTURE_BASE_LEVEL = 0x813C;
  enum uint TEXTURE_MAX_LEVEL = 0x813D;
  enum uint MIN = 0x8007;
  enum uint MAX = 0x8008;
  enum uint DEPTH_COMPONENT24 = 0x81A6;
  enum uint MAX_TEXTURE_LOD_BIAS = 0x84FD;
  enum uint TEXTURE_COMPARE_MODE = 0x884C;
  enum uint TEXTURE_COMPARE_FUNC = 0x884D;
  enum uint CURRENT_QUERY = 0x8865;
  enum uint QUERY_RESULT = 0x8866;
  enum uint QUERY_RESULT_AVAILABLE = 0x8867;
  enum uint STREAM_READ = 0x88E1;
  enum uint STREAM_COPY = 0x88E2;
  enum uint STATIC_READ = 0x88E5;
  enum uint STATIC_COPY = 0x88E6;
  enum uint DYNAMIC_READ = 0x88E9;
  enum uint DYNAMIC_COPY = 0x88EA;
  enum uint MAX_DRAW_BUFFERS = 0x8824;
  enum uint DRAW_BUFFER0 = 0x8825;
  enum uint DRAW_BUFFER1 = 0x8826;
  enum uint DRAW_BUFFER2 = 0x8827;
  enum uint DRAW_BUFFER3 = 0x8828;
  enum uint DRAW_BUFFER4 = 0x8829;
  enum uint DRAW_BUFFER5 = 0x882A;
  enum uint DRAW_BUFFER6 = 0x882B;
  enum uint DRAW_BUFFER7 = 0x882C;
  enum uint DRAW_BUFFER8 = 0x882D;
  enum uint DRAW_BUFFER9 = 0x882E;
  enum uint DRAW_BUFFER10 = 0x882F;
  enum uint DRAW_BUFFER11 = 0x8830;
  enum uint DRAW_BUFFER12 = 0x8831;
  enum uint DRAW_BUFFER13 = 0x8832;
  enum uint DRAW_BUFFER14 = 0x8833;
  enum uint DRAW_BUFFER15 = 0x8834;
  enum uint MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
  enum uint MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
  enum uint SAMPLER_3D = 0x8B5F;
  enum uint SAMPLER_2D_SHADOW = 0x8B62;
  enum uint FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
  enum uint PIXEL_PACK_BUFFER = 0x88EB;
  enum uint PIXEL_UNPACK_BUFFER = 0x88EC;
  enum uint PIXEL_PACK_BUFFER_BINDING = 0x88ED;
  enum uint PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
  enum uint FLOAT_MAT2x3 = 0x8B65;
  enum uint FLOAT_MAT2x4 = 0x8B66;
  enum uint FLOAT_MAT3x2 = 0x8B67;
  enum uint FLOAT_MAT3x4 = 0x8B68;
  enum uint FLOAT_MAT4x2 = 0x8B69;
  enum uint FLOAT_MAT4x3 = 0x8B6A;
  enum uint SRGB = 0x8C40;
  enum uint SRGB8 = 0x8C41;
  enum uint SRGB8_ALPHA8 = 0x8C43;
  enum uint COMPARE_REF_TO_TEXTURE = 0x884E;
  enum uint RGBA32F = 0x8814;
  enum uint RGB32F = 0x8815;
  enum uint RGBA16F = 0x881A;
  enum uint RGB16F = 0x881B;
  enum uint VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
  enum uint MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
  enum uint MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
  enum uint MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
  enum uint MAX_VARYING_COMPONENTS = 0x8B4B;
  enum uint TEXTURE_2D_ARRAY = 0x8C1A;
  enum uint TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
  enum uint R11F_G11F_B10F = 0x8C3A;
  enum uint UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
  enum uint RGB9_E5 = 0x8C3D;
  enum uint UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
  enum uint TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
  enum uint MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
  enum uint TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
  enum uint TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
  enum uint TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
  enum uint TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
  enum uint RASTERIZER_DISCARD = 0x8C89;
  enum uint MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
  enum uint MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
  enum uint INTERLEAVED_ATTRIBS = 0x8C8C;
  enum uint SEPARATE_ATTRIBS = 0x8C8D;
  enum uint TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
  enum uint TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
  enum uint RGBA32UI = 0x8D70;
  enum uint RGB32UI = 0x8D71;
  enum uint RGBA16UI = 0x8D76;
  enum uint RGB16UI = 0x8D77;
  enum uint RGBA8UI = 0x8D7C;
  enum uint RGB8UI = 0x8D7D;
  enum uint RGBA32I = 0x8D82;
  enum uint RGB32I = 0x8D83;
  enum uint RGBA16I = 0x8D88;
  enum uint RGB16I = 0x8D89;
  enum uint RGBA8I = 0x8D8E;
  enum uint RGB8I = 0x8D8F;
  enum uint RED_INTEGER = 0x8D94;
  enum uint RGB_INTEGER = 0x8D98;
  enum uint RGBA_INTEGER = 0x8D99;
  enum uint SAMPLER_2D_ARRAY = 0x8DC1;
  enum uint SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
  enum uint SAMPLER_CUBE_SHADOW = 0x8DC5;
  enum uint UNSIGNED_INT_VEC2 = 0x8DC6;
  enum uint UNSIGNED_INT_VEC3 = 0x8DC7;
  enum uint UNSIGNED_INT_VEC4 = 0x8DC8;
  enum uint INT_SAMPLER_2D = 0x8DCA;
  enum uint INT_SAMPLER_3D = 0x8DCB;
  enum uint INT_SAMPLER_CUBE = 0x8DCC;
  enum uint INT_SAMPLER_2D_ARRAY = 0x8DCF;
  enum uint UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
  enum uint UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
  enum uint UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
  enum uint UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
  enum uint DEPTH_COMPONENT32F = 0x8CAC;
  enum uint DEPTH32F_STENCIL8 = 0x8CAD;
  enum uint FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
  enum uint FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
  enum uint FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
  enum uint FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
  enum uint FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
  enum uint FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
  enum uint FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
  enum uint FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
  enum uint FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
  enum uint FRAMEBUFFER_DEFAULT = 0x8218;
  enum uint UNSIGNED_INT_24_8 = 0x84FA;
  enum uint DEPTH24_STENCIL8 = 0x88F0;
  enum uint UNSIGNED_NORMALIZED = 0x8C17;
  enum uint DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
  enum uint READ_FRAMEBUFFER = 0x8CA8;
  enum uint DRAW_FRAMEBUFFER = 0x8CA9;
  enum uint READ_FRAMEBUFFER_BINDING = 0x8CAA;
  enum uint RENDERBUFFER_SAMPLES = 0x8CAB;
  enum uint FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
  enum uint MAX_COLOR_ATTACHMENTS = 0x8CDF;
  enum uint COLOR_ATTACHMENT1 = 0x8CE1;
  enum uint COLOR_ATTACHMENT2 = 0x8CE2;
  enum uint COLOR_ATTACHMENT3 = 0x8CE3;
  enum uint COLOR_ATTACHMENT4 = 0x8CE4;
  enum uint COLOR_ATTACHMENT5 = 0x8CE5;
  enum uint COLOR_ATTACHMENT6 = 0x8CE6;
  enum uint COLOR_ATTACHMENT7 = 0x8CE7;
  enum uint COLOR_ATTACHMENT8 = 0x8CE8;
  enum uint COLOR_ATTACHMENT9 = 0x8CE9;
  enum uint COLOR_ATTACHMENT10 = 0x8CEA;
  enum uint COLOR_ATTACHMENT11 = 0x8CEB;
  enum uint COLOR_ATTACHMENT12 = 0x8CEC;
  enum uint COLOR_ATTACHMENT13 = 0x8CED;
  enum uint COLOR_ATTACHMENT14 = 0x8CEE;
  enum uint COLOR_ATTACHMENT15 = 0x8CEF;
  enum uint FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
  enum uint MAX_SAMPLES = 0x8D57;
  enum uint HALF_FLOAT = 0x140B;
  enum uint RG = 0x8227;
  enum uint RG_INTEGER = 0x8228;
  enum uint R8 = 0x8229;
  enum uint RG8 = 0x822B;
  enum uint R16F = 0x822D;
  enum uint R32F = 0x822E;
  enum uint RG16F = 0x822F;
  enum uint RG32F = 0x8230;
  enum uint R8I = 0x8231;
  enum uint R8UI = 0x8232;
  enum uint R16I = 0x8233;
  enum uint R16UI = 0x8234;
  enum uint R32I = 0x8235;
  enum uint R32UI = 0x8236;
  enum uint RG8I = 0x8237;
  enum uint RG8UI = 0x8238;
  enum uint RG16I = 0x8239;
  enum uint RG16UI = 0x823A;
  enum uint RG32I = 0x823B;
  enum uint RG32UI = 0x823C;
  enum uint VERTEX_ARRAY_BINDING = 0x85B5;
  enum uint R8_SNORM = 0x8F94;
  enum uint RG8_SNORM = 0x8F95;
  enum uint RGB8_SNORM = 0x8F96;
  enum uint RGBA8_SNORM = 0x8F97;
  enum uint SIGNED_NORMALIZED = 0x8F9C;
  enum uint COPY_READ_BUFFER = 0x8F36;
  enum uint COPY_WRITE_BUFFER = 0x8F37;
  enum uint COPY_READ_BUFFER_BINDING = 0x8F36;
  enum uint COPY_WRITE_BUFFER_BINDING = 0x8F37;
  enum uint UNIFORM_BUFFER = 0x8A11;
  enum uint UNIFORM_BUFFER_BINDING = 0x8A28;
  enum uint UNIFORM_BUFFER_START = 0x8A29;
  enum uint UNIFORM_BUFFER_SIZE = 0x8A2A;
  enum uint MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
  enum uint MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
  enum uint MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
  enum uint MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
  enum uint MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
  enum uint MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
  enum uint MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
  enum uint UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
  enum uint ACTIVE_UNIFORM_BLOCKS = 0x8A36;
  enum uint UNIFORM_TYPE = 0x8A37;
  enum uint UNIFORM_SIZE = 0x8A38;
  enum uint UNIFORM_BLOCK_INDEX = 0x8A3A;
  enum uint UNIFORM_OFFSET = 0x8A3B;
  enum uint UNIFORM_ARRAY_STRIDE = 0x8A3C;
  enum uint UNIFORM_MATRIX_STRIDE = 0x8A3D;
  enum uint UNIFORM_IS_ROW_MAJOR = 0x8A3E;
  enum uint UNIFORM_BLOCK_BINDING = 0x8A3F;
  enum uint UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
  enum uint UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
  enum uint UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
  enum uint UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
  enum uint UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
  enum uint INVALID_INDEX = 0xFFFFFFFF;
  enum uint MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
  enum uint MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
  enum uint MAX_SERVER_WAIT_TIMEOUT = 0x9111;
  enum uint OBJECT_TYPE = 0x9112;
  enum uint SYNC_CONDITION = 0x9113;
  enum uint SYNC_STATUS = 0x9114;
  enum uint SYNC_FLAGS = 0x9115;
  enum uint SYNC_FENCE = 0x9116;
  enum uint SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
  enum uint UNSIGNALED = 0x9118;
  enum uint SIGNALED = 0x9119;
  enum uint ALREADY_SIGNALED = 0x911A;
  enum uint TIMEOUT_EXPIRED = 0x911B;
  enum uint CONDITION_SATISFIED = 0x911C;
  enum uint WAIT_FAILED = 0x911D;
  enum uint SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
  enum uint VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
  enum uint ANY_SAMPLES_PASSED = 0x8C2F;
  enum uint ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
  enum uint SAMPLER_BINDING = 0x8919;
  enum uint RGB10_A2UI = 0x906F;
  enum uint INT_2_10_10_10_REV = 0x8D9F;
  enum uint TRANSFORM_FEEDBACK = 0x8E22;
  enum uint TRANSFORM_FEEDBACK_PAUSED = 0x8E23;
  enum uint TRANSFORM_FEEDBACK_ACTIVE = 0x8E24;
  enum uint TRANSFORM_FEEDBACK_BINDING = 0x8E25;
  enum uint TEXTURE_IMMUTABLE_FORMAT = 0x912F;
  enum uint MAX_ELEMENT_INDEX = 0x8D6B;
  enum uint TEXTURE_IMMUTABLE_LEVELS = 0x82DF;
  enum int TIMEOUT_IGNORED = -1;
  enum uint MAX_CLIENT_WAIT_TIMEOUT_WEBGL = 0x9247;
  void bufferData()(uint target, int size, uint usage) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;int;uint", tuple(target, size, usage));
  }
  void bufferData(T1)(uint target, scope auto ref Optional!(T1) srcData, uint usage) if (isTOrPointer!(T1, ArrayBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Optional!Handle;uint", tuple(target, !srcData.empty, cast(Handle)srcData.front.handle, usage));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint", tuple(target, cast(Handle)srcData.handle, usage));
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBuffer srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle", tuple(target, offset, cast(Handle)srcData.handle));
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle", tuple(target, offset, cast(Handle)srcData.handle));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage, uint srcOffset, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint;uint;uint", tuple(target, cast(Handle)srcData.handle, usage, srcOffset, length));
  }
  void bufferData()(uint target, scope ref ArrayBufferView srcData, uint usage, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferData", "uint;Handle;uint;uint", tuple(target, cast(Handle)srcData.handle, usage, srcOffset));
  }
  void bufferSubData()(uint target, int dstByteOffset, scope ref ArrayBufferView srcData, uint srcOffset, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle;uint;uint", tuple(target, dstByteOffset, cast(Handle)srcData.handle, srcOffset, length));
  }
  void bufferSubData()(uint target, int dstByteOffset, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "bufferSubData", "uint;int;Handle;uint", tuple(target, dstByteOffset, cast(Handle)srcData.handle, srcOffset));
  }
  void copyBufferSubData()(uint readTarget, uint writeTarget, int readOffset, int writeOffset, int size) {
    Serialize_Object_VarArgCall!void(this.handle, "copyBufferSubData", "uint;uint;int;int;int", tuple(readTarget, writeTarget, readOffset, writeOffset, size));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData, uint dstOffset /* = 0 */, uint length /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle;uint;uint", tuple(target, srcByteOffset, cast(Handle)dstData.handle, dstOffset, length));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData, uint dstOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle;uint", tuple(target, srcByteOffset, cast(Handle)dstData.handle, dstOffset));
  }
  void getBufferSubData()(uint target, int srcByteOffset, scope ref ArrayBufferView dstData) {
    Serialize_Object_VarArgCall!void(this.handle, "getBufferSubData", "uint;int;Handle", tuple(target, srcByteOffset, cast(Handle)dstData.handle));
  }
  void blitFramebuffer()(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, uint mask, uint filter) {
    Serialize_Object_VarArgCall!void(this.handle, "blitFramebuffer", "int;int;int;int;int;int;int;int;uint;uint", tuple(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter));
  }
  void framebufferTextureLayer(T2)(uint target, uint attachment, scope auto ref Optional!(T2) texture, int level, int layer) if (isTOrPointer!(T2, WebGLTexture)) {
    Serialize_Object_VarArgCall!void(this.handle, "framebufferTextureLayer", "uint;uint;Optional!Handle;int;int", tuple(target, attachment, !texture.empty, cast(Handle)texture.front.handle, level, layer));
  }
  void invalidateFramebuffer()(uint target, scope ref Sequence!(uint) attachments) {
    Serialize_Object_VarArgCall!void(this.handle, "invalidateFramebuffer", "uint;Handle", tuple(target, cast(Handle)attachments.handle));
  }
  void invalidateSubFramebuffer()(uint target, scope ref Sequence!(uint) attachments, int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "invalidateSubFramebuffer", "uint;Handle;int;int;int;int", tuple(target, cast(Handle)attachments.handle, x, y, width, height));
  }
  void readBuffer()(uint src) {
    Object_Call_uint__void(this.handle, "readBuffer", src);
  }
  auto getInternalformatParameter()(uint target, uint internalformat, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getInternalformatParameter", "uint;uint;uint", tuple(target, internalformat, pname)));
  }
  void renderbufferStorageMultisample()(uint target, int samples, uint internalformat, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "renderbufferStorageMultisample", "uint;int;uint;int;int", tuple(target, samples, internalformat, width, height));
  }
  void texStorage2D()(uint target, int levels, uint internalformat, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "texStorage2D", "uint;int;uint;int;int", tuple(target, levels, internalformat, width, height));
  }
  void texStorage3D()(uint target, int levels, uint internalformat, int width, int height, int depth) {
    Serialize_Object_VarArgCall!void(this.handle, "texStorage3D", "uint;int;uint;int;int;int", tuple(target, levels, internalformat, width, height, depth));
  }
  void texImage2D(T8)(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, internalformat, width, height, border, format, type, !pixels.empty, cast(Handle)pixels.front.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;uint;uint;Handle", tuple(target, level, internalformat, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D(T8)(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, !pixels.empty, cast(Handle)pixels.front.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;int", tuple(target, level, internalformat, width, height, border, format, type, pboOffset));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source._parent));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)source.handle));
  }
  void texImage2D()(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage2D", "uint;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, internalformat, width, height, border, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;int", tuple(target, level, internalformat, width, height, depth, border, format, type, pboOffset));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source._parent));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source.handle));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)source.handle));
  }
  void texImage3D(T9)(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope auto ref Optional!(T9) srcData) if (isTOrPointer!(T9, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, internalformat, width, height, depth, border, format, type, !srcData.empty, cast(Handle)srcData.front.handle));
  }
  void texImage3D()(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texImage3D", "uint;int;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, internalformat, width, height, depth, border, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;int", tuple(target, level, xoffset, yoffset, width, height, format, type, pboOffset));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source._parent));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)source.handle));
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope ref ArrayBufferView srcData, uint srcOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage2D", "uint;int;int;int;int;int;uint;uint;Handle;uint", tuple(target, level, xoffset, yoffset, width, height, format, type, cast(Handle)srcData.handle, srcOffset));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, int pboOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;int", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pboOffset));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLCanvasElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLImageElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref HTMLVideoElement source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source._parent));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref ImageBitmap source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source.handle));
  }
  void texSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope ref ImageData source) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, cast(Handle)source.handle));
  }
  void texSubImage3D(T10)(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope auto ref Optional!(T10) srcData, uint srcOffset /* = 0 */) if (isTOrPointer!(T10, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Optional!Handle;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, !srcData.empty, cast(Handle)srcData.front.handle, srcOffset));
  }
  void texSubImage3D(T10)(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, scope auto ref Optional!(T10) srcData) if (isTOrPointer!(T10, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "texSubImage3D", "uint;int;int;int;int;int;int;int;uint;uint;Optional!Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, !srcData.empty, cast(Handle)srcData.front.handle));
  }
  void copyTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "copyTexSubImage3D", "uint;int;int;int;int;int;int;int;int", tuple(target, level, xoffset, yoffset, zoffset, x, y, width, height));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;int;int", tuple(target, level, internalformat, width, height, border, imageSize, offset));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle;uint;uint", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle;uint", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage2D", "uint;int;uint;int;int;int;Handle", tuple(target, level, internalformat, width, height, border, cast(Handle)srcData.handle));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;int;int", tuple(target, level, internalformat, width, height, depth, border, imageSize, offset));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle;uint;uint", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle;uint", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexImage3D()(uint target, int level, uint internalformat, int width, int height, int depth, int border, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexImage3D", "uint;int;uint;int;int;int;int;Handle", tuple(target, level, internalformat, width, height, depth, border, cast(Handle)srcData.handle));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;int;int", tuple(target, level, xoffset, yoffset, width, height, format, imageSize, offset));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle;uint;uint", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle;uint", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage2D", "uint;int;int;int;int;int;uint;Handle", tuple(target, level, xoffset, yoffset, width, height, format, cast(Handle)srcData.handle));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, int imageSize, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;int;int", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, offset));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle;uint;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle, srcOffset, srcLengthOverride));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle;uint", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle, srcOffset));
  }
  void compressedTexSubImage3D()(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, scope ref ArrayBufferView srcData) {
    Serialize_Object_VarArgCall!void(this.handle, "compressedTexSubImage3D", "uint;int;int;int;int;int;int;int;uint;Handle", tuple(target, level, xoffset, yoffset, zoffset, width, height, depth, format, cast(Handle)srcData.handle));
  }
  int getFragDataLocation()(scope ref WebGLProgram program, string name) {
    return Serialize_Object_VarArgCall!int(this.handle, "getFragDataLocation", "Handle;string", tuple(cast(Handle)program.handle, name));
  }
  void uniform1ui(T0)(scope auto ref Optional!(T0) location, uint v0) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1ui", "Optional!Handle;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0));
  }
  void uniform2ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2ui", "Optional!Handle;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1));
  }
  void uniform3ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1, uint v2) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3ui", "Optional!Handle;uint;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1, v2));
  }
  void uniform4ui(T0)(scope auto ref Optional!(T0) location, uint v0, uint v1, uint v2, uint v3) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4ui", "Optional!Handle;uint;uint;uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, v0, v1, v2, v3));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4fv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4iv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform1uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform2uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform3uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniform4uiv(T0)(scope auto ref Optional!(T0) location, scope ref Uint32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4uiv", "Optional!Handle;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4x2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x2fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4x3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4x3fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix2x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix2x4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix3x4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix3x4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint;uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset, srcLength));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data, uint srcOffset /* = 0 */) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle);uint", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data)), srcOffset));
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformMatrix4fv", "Optional!Handle;bool;SumType!(Handle,Handle)", tuple(!location.empty, cast(Handle)location.front.handle, transpose, libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  void vertexAttribI4i()(uint index, int x, int y, int z, int w) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4i", "uint;int;int;int;int", tuple(index, x, y, z, w));
  }
  void vertexAttribI4iv()(uint index, scope ref Int32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4iv", "uint;SumType!(Handle,Handle)", tuple(index, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttribI4ui()(uint index, uint x, uint y, uint z, uint w) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4ui", "uint;uint;uint;uint;uint", tuple(index, x, y, z, w));
  }
  void vertexAttribI4uiv()(uint index, scope ref Uint32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribI4uiv", "uint;SumType!(Handle,Handle)", tuple(index, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttribIPointer()(uint index, int size, uint type, int stride, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribIPointer", "uint;int;uint;int;int", tuple(index, size, type, stride, offset));
  }
  void vertexAttribDivisor()(uint index, uint divisor) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribDivisor", "uint;uint", tuple(index, divisor));
  }
  void drawArraysInstanced()(uint mode, int first, int count, int instanceCount) {
    Serialize_Object_VarArgCall!void(this.handle, "drawArraysInstanced", "uint;int;int;int", tuple(mode, first, count, instanceCount));
  }
  void drawElementsInstanced()(uint mode, int count, uint type, int offset, int instanceCount) {
    Serialize_Object_VarArgCall!void(this.handle, "drawElementsInstanced", "uint;int;uint;int;int", tuple(mode, count, type, offset, instanceCount));
  }
  void drawRangeElements()(uint mode, uint start, uint end, int count, uint type, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "drawRangeElements", "uint;uint;uint;int;uint;int", tuple(mode, start, end, count, type, offset));
  }
  void readPixels(T6)(int x, int y, int width, int height, uint format, uint type, scope auto ref Optional!(T6) dstData) if (isTOrPointer!(T6, ArrayBufferView)) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;Optional!Handle", tuple(x, y, width, height, format, type, !dstData.empty, cast(Handle)dstData.front.handle));
  }
  void readPixels()(int x, int y, int width, int height, uint format, uint type, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;int", tuple(x, y, width, height, format, type, offset));
  }
  void readPixels()(int x, int y, int width, int height, uint format, uint type, scope ref ArrayBufferView dstData, uint dstOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "readPixels", "int;int;int;int;uint;uint;Handle;uint", tuple(x, y, width, height, format, type, cast(Handle)dstData.handle, dstOffset));
  }
  void drawBuffers()(scope ref Sequence!(uint) buffers) {
    Object_Call_Handle__void(this.handle, "drawBuffers", buffers.handle);
  }
  void clearBufferfv()(uint buffer, int drawbuffer, scope ref Float32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferfv()(uint buffer, int drawbuffer, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferiv()(uint buffer, int drawbuffer, scope ref Int32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferiv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferiv()(uint buffer, int drawbuffer, scope ref Int32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferiv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferuiv()(uint buffer, int drawbuffer, scope ref Uint32List values, uint srcOffset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferuiv", "uint;int;SumType!(Handle,Handle);uint", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values)), srcOffset));
  }
  void clearBufferuiv()(uint buffer, int drawbuffer, scope ref Uint32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferuiv", "uint;int;SumType!(Handle,Handle)", tuple(buffer, drawbuffer, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void clearBufferfi()(uint buffer, int drawbuffer, float depth, int stencil) {
    Serialize_Object_VarArgCall!void(this.handle, "clearBufferfi", "uint;int;float;int", tuple(buffer, drawbuffer, depth, stencil));
  }
  auto createQuery()() {
    return recastOpt!(WebGLQuery)(Object_Getter__OptionalHandle(this.handle, "createQuery"));
  }
  void deleteQuery(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteQuery", "Optional!Handle", tuple(!query.empty, cast(Handle)query.front.handle));
  }
  bool isQuery(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isQuery", "Optional!Handle", tuple(!query.empty, cast(Handle)query.front.handle));
  }
  void beginQuery()(uint target, scope ref WebGLQuery query) {
    Serialize_Object_VarArgCall!void(this.handle, "beginQuery", "uint;Handle", tuple(target, cast(Handle)query.handle));
  }
  void endQuery()(uint target) {
    Object_Call_uint__void(this.handle, "endQuery", target);
  }
  auto getQuery()(uint target, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getQuery", "uint;uint", tuple(target, pname)));
  }
  auto getQueryParameter()(scope ref WebGLQuery query, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getQueryParameter", "Handle;uint", tuple(cast(Handle)query.handle, pname)));
  }
  auto createSampler()() {
    return recastOpt!(WebGLSampler)(Object_Getter__OptionalHandle(this.handle, "createSampler"));
  }
  void deleteSampler(T0)(scope auto ref Optional!(T0) sampler) if (isTOrPointer!(T0, WebGLSampler)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteSampler", "Optional!Handle", tuple(!sampler.empty, cast(Handle)sampler.front.handle));
  }
  bool isSampler(T0)(scope auto ref Optional!(T0) sampler) if (isTOrPointer!(T0, WebGLSampler)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isSampler", "Optional!Handle", tuple(!sampler.empty, cast(Handle)sampler.front.handle));
  }
  void bindSampler(T1)(uint unit, scope auto ref Optional!(T1) sampler) if (isTOrPointer!(T1, WebGLSampler)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindSampler", "uint;Optional!Handle", tuple(unit, !sampler.empty, cast(Handle)sampler.front.handle));
  }
  void samplerParameteri()(scope ref WebGLSampler sampler, uint pname, int param) {
    Serialize_Object_VarArgCall!void(this.handle, "samplerParameteri", "Handle;uint;int", tuple(cast(Handle)sampler.handle, pname, param));
  }
  void samplerParameterf()(scope ref WebGLSampler sampler, uint pname, float param) {
    Serialize_Object_VarArgCall!void(this.handle, "samplerParameterf", "Handle;uint;float", tuple(cast(Handle)sampler.handle, pname, param));
  }
  auto getSamplerParameter()(scope ref WebGLSampler sampler, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getSamplerParameter", "Handle;uint", tuple(cast(Handle)sampler.handle, pname)));
  }
  auto fenceSync()(uint condition, uint flags) {
    return recastOpt!(WebGLSync)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "fenceSync", "uint;uint", tuple(condition, flags)));
  }
  bool isSync(T0)(scope auto ref Optional!(T0) sync) if (isTOrPointer!(T0, WebGLSync)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isSync", "Optional!Handle", tuple(!sync.empty, cast(Handle)sync.front.handle));
  }
  void deleteSync(T0)(scope auto ref Optional!(T0) sync) if (isTOrPointer!(T0, WebGLSync)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteSync", "Optional!Handle", tuple(!sync.empty, cast(Handle)sync.front.handle));
  }
  uint clientWaitSync()(scope ref WebGLSync sync, uint flags, uint timeout) {
    return Serialize_Object_VarArgCall!uint(this.handle, "clientWaitSync", "Handle;uint;uint", tuple(cast(Handle)sync.handle, flags, timeout));
  }
  void waitSync()(scope ref WebGLSync sync, uint flags, int timeout) {
    Serialize_Object_VarArgCall!void(this.handle, "waitSync", "Handle;uint;int", tuple(cast(Handle)sync.handle, flags, timeout));
  }
  auto getSyncParameter()(scope ref WebGLSync sync, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getSyncParameter", "Handle;uint", tuple(cast(Handle)sync.handle, pname)));
  }
  auto createTransformFeedback()() {
    return recastOpt!(WebGLTransformFeedback)(Object_Getter__OptionalHandle(this.handle, "createTransformFeedback"));
  }
  void deleteTransformFeedback(T0)(scope auto ref Optional!(T0) tf) if (isTOrPointer!(T0, WebGLTransformFeedback)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteTransformFeedback", "Optional!Handle", tuple(!tf.empty, cast(Handle)tf.front.handle));
  }
  bool isTransformFeedback(T0)(scope auto ref Optional!(T0) tf) if (isTOrPointer!(T0, WebGLTransformFeedback)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isTransformFeedback", "Optional!Handle", tuple(!tf.empty, cast(Handle)tf.front.handle));
  }
  void bindTransformFeedback(T1)(uint target, scope auto ref Optional!(T1) tf) if (isTOrPointer!(T1, WebGLTransformFeedback)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindTransformFeedback", "uint;Optional!Handle", tuple(target, !tf.empty, cast(Handle)tf.front.handle));
  }
  void beginTransformFeedback()(uint primitiveMode) {
    Object_Call_uint__void(this.handle, "beginTransformFeedback", primitiveMode);
  }
  void endTransformFeedback()() {
    Object_Call__void(this.handle, "endTransformFeedback");
  }
  void transformFeedbackVaryings()(scope ref WebGLProgram program, scope ref Sequence!(string) varyings, uint bufferMode) {
    Serialize_Object_VarArgCall!void(this.handle, "transformFeedbackVaryings", "Handle;Handle;uint", tuple(cast(Handle)program.handle, cast(Handle)varyings.handle, bufferMode));
  }
  auto getTransformFeedbackVarying()(scope ref WebGLProgram program, uint index) {
    return recastOpt!(WebGLActiveInfo)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getTransformFeedbackVarying", "Handle;uint", tuple(cast(Handle)program.handle, index)));
  }
  void pauseTransformFeedback()() {
    Object_Call__void(this.handle, "pauseTransformFeedback");
  }
  void resumeTransformFeedback()() {
    Object_Call__void(this.handle, "resumeTransformFeedback");
  }
  void bindBufferBase(T2)(uint target, uint index, scope auto ref Optional!(T2) buffer) if (isTOrPointer!(T2, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindBufferBase", "uint;uint;Optional!Handle", tuple(target, index, !buffer.empty, cast(Handle)buffer.front.handle));
  }
  void bindBufferRange(T2)(uint target, uint index, scope auto ref Optional!(T2) buffer, int offset, int size) if (isTOrPointer!(T2, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindBufferRange", "uint;uint;Optional!Handle;int;int", tuple(target, index, !buffer.empty, cast(Handle)buffer.front.handle, offset, size));
  }
  auto getIndexedParameter()(uint target, uint index) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getIndexedParameter", "uint;uint", tuple(target, index)));
  }
  auto getUniformIndices()(scope ref WebGLProgram program, scope ref Sequence!(string) uniformNames) {
    return recastOpt!(Sequence!(uint))(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getUniformIndices", "Handle;Handle", tuple(cast(Handle)program.handle, cast(Handle)uniformNames.handle)));
  }
  auto getActiveUniforms()(scope ref WebGLProgram program, scope ref Sequence!(uint) uniformIndices, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getActiveUniforms", "Handle;Handle;uint", tuple(cast(Handle)program.handle, cast(Handle)uniformIndices.handle, pname)));
  }
  uint getUniformBlockIndex()(scope ref WebGLProgram program, string uniformBlockName) {
    return Serialize_Object_VarArgCall!uint(this.handle, "getUniformBlockIndex", "Handle;string", tuple(cast(Handle)program.handle, uniformBlockName));
  }
  auto getActiveUniformBlockParameter()(scope ref WebGLProgram program, uint uniformBlockIndex, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getActiveUniformBlockParameter", "Handle;uint;uint", tuple(cast(Handle)program.handle, uniformBlockIndex, pname)));
  }
  Optional!(string) getActiveUniformBlockName()(scope ref WebGLProgram program, uint uniformBlockIndex) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getActiveUniformBlockName", "Handle;uint", tuple(cast(Handle)program.handle, uniformBlockIndex));
  }
  void uniformBlockBinding()(scope ref WebGLProgram program, uint uniformBlockIndex, uint uniformBlockBinding) {
    Serialize_Object_VarArgCall!void(this.handle, "uniformBlockBinding", "Handle;uint;uint", tuple(cast(Handle)program.handle, uniformBlockIndex, uniformBlockBinding));
  }
  auto createVertexArray()() {
    return recastOpt!(WebGLVertexArrayObject)(Object_Getter__OptionalHandle(this.handle, "createVertexArray"));
  }
  void deleteVertexArray(T0)(scope auto ref Optional!(T0) vertexArray) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteVertexArray", "Optional!Handle", tuple(!vertexArray.empty, cast(Handle)vertexArray.front.handle));
  }
  bool isVertexArray(T0)(scope auto ref Optional!(T0) vertexArray) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isVertexArray", "Optional!Handle", tuple(!vertexArray.empty, cast(Handle)vertexArray.front.handle));
  }
  void bindVertexArray(T0)(scope auto ref Optional!(T0) array) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindVertexArray", "Optional!Handle", tuple(!array.empty, cast(Handle)array.front.handle));
  }
  enum uint DEPTH_BUFFER_BIT = 0x00000100;
  enum uint STENCIL_BUFFER_BIT = 0x00000400;
  enum uint COLOR_BUFFER_BIT = 0x00004000;
  enum uint POINTS = 0x0000;
  enum uint LINES = 0x0001;
  enum uint LINE_LOOP = 0x0002;
  enum uint LINE_STRIP = 0x0003;
  enum uint TRIANGLES = 0x0004;
  enum uint TRIANGLE_STRIP = 0x0005;
  enum uint TRIANGLE_FAN = 0x0006;
  enum uint ZERO = 0;
  enum uint ONE = 1;
  enum uint SRC_COLOR = 0x0300;
  enum uint ONE_MINUS_SRC_COLOR = 0x0301;
  enum uint SRC_ALPHA = 0x0302;
  enum uint ONE_MINUS_SRC_ALPHA = 0x0303;
  enum uint DST_ALPHA = 0x0304;
  enum uint ONE_MINUS_DST_ALPHA = 0x0305;
  enum uint DST_COLOR = 0x0306;
  enum uint ONE_MINUS_DST_COLOR = 0x0307;
  enum uint SRC_ALPHA_SATURATE = 0x0308;
  enum uint FUNC_ADD = 0x8006;
  enum uint BLEND_EQUATION = 0x8009;
  enum uint BLEND_EQUATION_RGB = 0x8009;
  enum uint BLEND_EQUATION_ALPHA = 0x883D;
  enum uint FUNC_SUBTRACT = 0x800A;
  enum uint FUNC_REVERSE_SUBTRACT = 0x800B;
  enum uint BLEND_DST_RGB = 0x80C8;
  enum uint BLEND_SRC_RGB = 0x80C9;
  enum uint BLEND_DST_ALPHA = 0x80CA;
  enum uint BLEND_SRC_ALPHA = 0x80CB;
  enum uint CONSTANT_COLOR = 0x8001;
  enum uint ONE_MINUS_CONSTANT_COLOR = 0x8002;
  enum uint CONSTANT_ALPHA = 0x8003;
  enum uint ONE_MINUS_CONSTANT_ALPHA = 0x8004;
  enum uint BLEND_COLOR = 0x8005;
  enum uint ARRAY_BUFFER = 0x8892;
  enum uint ELEMENT_ARRAY_BUFFER = 0x8893;
  enum uint ARRAY_BUFFER_BINDING = 0x8894;
  enum uint ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
  enum uint STREAM_DRAW = 0x88E0;
  enum uint STATIC_DRAW = 0x88E4;
  enum uint DYNAMIC_DRAW = 0x88E8;
  enum uint BUFFER_SIZE = 0x8764;
  enum uint BUFFER_USAGE = 0x8765;
  enum uint CURRENT_VERTEX_ATTRIB = 0x8626;
  enum uint FRONT = 0x0404;
  enum uint BACK = 0x0405;
  enum uint FRONT_AND_BACK = 0x0408;
  enum uint CULL_FACE = 0x0B44;
  enum uint BLEND = 0x0BE2;
  enum uint DITHER = 0x0BD0;
  enum uint STENCIL_TEST = 0x0B90;
  enum uint DEPTH_TEST = 0x0B71;
  enum uint SCISSOR_TEST = 0x0C11;
  enum uint POLYGON_OFFSET_FILL = 0x8037;
  enum uint SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
  enum uint SAMPLE_COVERAGE = 0x80A0;
  enum uint NO_ERROR = 0;
  enum uint INVALID_ENUM = 0x0500;
  enum uint INVALID_VALUE = 0x0501;
  enum uint INVALID_OPERATION = 0x0502;
  enum uint OUT_OF_MEMORY = 0x0505;
  enum uint CW = 0x0900;
  enum uint CCW = 0x0901;
  enum uint LINE_WIDTH = 0x0B21;
  enum uint ALIASED_POINT_SIZE_RANGE = 0x846D;
  enum uint ALIASED_LINE_WIDTH_RANGE = 0x846E;
  enum uint CULL_FACE_MODE = 0x0B45;
  enum uint FRONT_FACE = 0x0B46;
  enum uint DEPTH_RANGE = 0x0B70;
  enum uint DEPTH_WRITEMASK = 0x0B72;
  enum uint DEPTH_CLEAR_VALUE = 0x0B73;
  enum uint DEPTH_FUNC = 0x0B74;
  enum uint STENCIL_CLEAR_VALUE = 0x0B91;
  enum uint STENCIL_FUNC = 0x0B92;
  enum uint STENCIL_FAIL = 0x0B94;
  enum uint STENCIL_PASS_DEPTH_FAIL = 0x0B95;
  enum uint STENCIL_PASS_DEPTH_PASS = 0x0B96;
  enum uint STENCIL_REF = 0x0B97;
  enum uint STENCIL_VALUE_MASK = 0x0B93;
  enum uint STENCIL_WRITEMASK = 0x0B98;
  enum uint STENCIL_BACK_FUNC = 0x8800;
  enum uint STENCIL_BACK_FAIL = 0x8801;
  enum uint STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
  enum uint STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
  enum uint STENCIL_BACK_REF = 0x8CA3;
  enum uint STENCIL_BACK_VALUE_MASK = 0x8CA4;
  enum uint STENCIL_BACK_WRITEMASK = 0x8CA5;
  enum uint VIEWPORT = 0x0BA2;
  enum uint SCISSOR_BOX = 0x0C10;
  enum uint COLOR_CLEAR_VALUE = 0x0C22;
  enum uint COLOR_WRITEMASK = 0x0C23;
  enum uint UNPACK_ALIGNMENT = 0x0CF5;
  enum uint PACK_ALIGNMENT = 0x0D05;
  enum uint MAX_TEXTURE_SIZE = 0x0D33;
  enum uint MAX_VIEWPORT_DIMS = 0x0D3A;
  enum uint SUBPIXEL_BITS = 0x0D50;
  enum uint RED_BITS = 0x0D52;
  enum uint GREEN_BITS = 0x0D53;
  enum uint BLUE_BITS = 0x0D54;
  enum uint ALPHA_BITS = 0x0D55;
  enum uint DEPTH_BITS = 0x0D56;
  enum uint STENCIL_BITS = 0x0D57;
  enum uint POLYGON_OFFSET_UNITS = 0x2A00;
  enum uint POLYGON_OFFSET_FACTOR = 0x8038;
  enum uint TEXTURE_BINDING_2D = 0x8069;
  enum uint SAMPLE_BUFFERS = 0x80A8;
  enum uint SAMPLES = 0x80A9;
  enum uint SAMPLE_COVERAGE_VALUE = 0x80AA;
  enum uint SAMPLE_COVERAGE_INVERT = 0x80AB;
  enum uint COMPRESSED_TEXTURE_FORMATS = 0x86A3;
  enum uint DONT_CARE = 0x1100;
  enum uint FASTEST = 0x1101;
  enum uint NICEST = 0x1102;
  enum uint GENERATE_MIPMAP_HINT = 0x8192;
  enum uint BYTE = 0x1400;
  enum uint UNSIGNED_BYTE = 0x1401;
  enum uint SHORT = 0x1402;
  enum uint UNSIGNED_SHORT = 0x1403;
  enum uint INT = 0x1404;
  enum uint UNSIGNED_INT = 0x1405;
  enum uint FLOAT = 0x1406;
  enum uint DEPTH_COMPONENT = 0x1902;
  enum uint ALPHA = 0x1906;
  enum uint RGB = 0x1907;
  enum uint RGBA = 0x1908;
  enum uint LUMINANCE = 0x1909;
  enum uint LUMINANCE_ALPHA = 0x190A;
  enum uint UNSIGNED_SHORT_4_4_4_4 = 0x8033;
  enum uint UNSIGNED_SHORT_5_5_5_1 = 0x8034;
  enum uint UNSIGNED_SHORT_5_6_5 = 0x8363;
  enum uint FRAGMENT_SHADER = 0x8B30;
  enum uint VERTEX_SHADER = 0x8B31;
  enum uint MAX_VERTEX_ATTRIBS = 0x8869;
  enum uint MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
  enum uint MAX_VARYING_VECTORS = 0x8DFC;
  enum uint MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
  enum uint MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
  enum uint MAX_TEXTURE_IMAGE_UNITS = 0x8872;
  enum uint MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
  enum uint SHADER_TYPE = 0x8B4F;
  enum uint DELETE_STATUS = 0x8B80;
  enum uint LINK_STATUS = 0x8B82;
  enum uint VALIDATE_STATUS = 0x8B83;
  enum uint ATTACHED_SHADERS = 0x8B85;
  enum uint ACTIVE_UNIFORMS = 0x8B86;
  enum uint ACTIVE_ATTRIBUTES = 0x8B89;
  enum uint SHADING_LANGUAGE_VERSION = 0x8B8C;
  enum uint CURRENT_PROGRAM = 0x8B8D;
  enum uint NEVER = 0x0200;
  enum uint LESS = 0x0201;
  enum uint EQUAL = 0x0202;
  enum uint LEQUAL = 0x0203;
  enum uint GREATER = 0x0204;
  enum uint NOTEQUAL = 0x0205;
  enum uint GEQUAL = 0x0206;
  enum uint ALWAYS = 0x0207;
  enum uint KEEP = 0x1E00;
  enum uint REPLACE = 0x1E01;
  enum uint INCR = 0x1E02;
  enum uint DECR = 0x1E03;
  enum uint INVERT = 0x150A;
  enum uint INCR_WRAP = 0x8507;
  enum uint DECR_WRAP = 0x8508;
  enum uint VENDOR = 0x1F00;
  enum uint RENDERER = 0x1F01;
  enum uint VERSION = 0x1F02;
  enum uint NEAREST = 0x2600;
  enum uint LINEAR = 0x2601;
  enum uint NEAREST_MIPMAP_NEAREST = 0x2700;
  enum uint LINEAR_MIPMAP_NEAREST = 0x2701;
  enum uint NEAREST_MIPMAP_LINEAR = 0x2702;
  enum uint LINEAR_MIPMAP_LINEAR = 0x2703;
  enum uint TEXTURE_MAG_FILTER = 0x2800;
  enum uint TEXTURE_MIN_FILTER = 0x2801;
  enum uint TEXTURE_WRAP_S = 0x2802;
  enum uint TEXTURE_WRAP_T = 0x2803;
  enum uint TEXTURE_2D = 0x0DE1;
  enum uint TEXTURE = 0x1702;
  enum uint TEXTURE_CUBE_MAP = 0x8513;
  enum uint TEXTURE_BINDING_CUBE_MAP = 0x8514;
  enum uint TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
  enum uint TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
  enum uint TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
  enum uint TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
  enum uint TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
  enum uint TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
  enum uint MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
  enum uint TEXTURE0 = 0x84C0;
  enum uint TEXTURE1 = 0x84C1;
  enum uint TEXTURE2 = 0x84C2;
  enum uint TEXTURE3 = 0x84C3;
  enum uint TEXTURE4 = 0x84C4;
  enum uint TEXTURE5 = 0x84C5;
  enum uint TEXTURE6 = 0x84C6;
  enum uint TEXTURE7 = 0x84C7;
  enum uint TEXTURE8 = 0x84C8;
  enum uint TEXTURE9 = 0x84C9;
  enum uint TEXTURE10 = 0x84CA;
  enum uint TEXTURE11 = 0x84CB;
  enum uint TEXTURE12 = 0x84CC;
  enum uint TEXTURE13 = 0x84CD;
  enum uint TEXTURE14 = 0x84CE;
  enum uint TEXTURE15 = 0x84CF;
  enum uint TEXTURE16 = 0x84D0;
  enum uint TEXTURE17 = 0x84D1;
  enum uint TEXTURE18 = 0x84D2;
  enum uint TEXTURE19 = 0x84D3;
  enum uint TEXTURE20 = 0x84D4;
  enum uint TEXTURE21 = 0x84D5;
  enum uint TEXTURE22 = 0x84D6;
  enum uint TEXTURE23 = 0x84D7;
  enum uint TEXTURE24 = 0x84D8;
  enum uint TEXTURE25 = 0x84D9;
  enum uint TEXTURE26 = 0x84DA;
  enum uint TEXTURE27 = 0x84DB;
  enum uint TEXTURE28 = 0x84DC;
  enum uint TEXTURE29 = 0x84DD;
  enum uint TEXTURE30 = 0x84DE;
  enum uint TEXTURE31 = 0x84DF;
  enum uint ACTIVE_TEXTURE = 0x84E0;
  enum uint REPEAT = 0x2901;
  enum uint CLAMP_TO_EDGE = 0x812F;
  enum uint MIRRORED_REPEAT = 0x8370;
  enum uint FLOAT_VEC2 = 0x8B50;
  enum uint FLOAT_VEC3 = 0x8B51;
  enum uint FLOAT_VEC4 = 0x8B52;
  enum uint INT_VEC2 = 0x8B53;
  enum uint INT_VEC3 = 0x8B54;
  enum uint INT_VEC4 = 0x8B55;
  enum uint BOOL = 0x8B56;
  enum uint BOOL_VEC2 = 0x8B57;
  enum uint BOOL_VEC3 = 0x8B58;
  enum uint BOOL_VEC4 = 0x8B59;
  enum uint FLOAT_MAT2 = 0x8B5A;
  enum uint FLOAT_MAT3 = 0x8B5B;
  enum uint FLOAT_MAT4 = 0x8B5C;
  enum uint SAMPLER_2D = 0x8B5E;
  enum uint SAMPLER_CUBE = 0x8B60;
  enum uint VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
  enum uint VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
  enum uint VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
  enum uint VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
  enum uint VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
  enum uint VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
  enum uint VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
  enum uint IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
  enum uint IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
  enum uint COMPILE_STATUS = 0x8B81;
  enum uint LOW_FLOAT = 0x8DF0;
  enum uint MEDIUM_FLOAT = 0x8DF1;
  enum uint HIGH_FLOAT = 0x8DF2;
  enum uint LOW_INT = 0x8DF3;
  enum uint MEDIUM_INT = 0x8DF4;
  enum uint HIGH_INT = 0x8DF5;
  enum uint FRAMEBUFFER = 0x8D40;
  enum uint RENDERBUFFER = 0x8D41;
  enum uint RGBA4 = 0x8056;
  enum uint RGB5_A1 = 0x8057;
  enum uint RGB565 = 0x8D62;
  enum uint DEPTH_COMPONENT16 = 0x81A5;
  enum uint STENCIL_INDEX8 = 0x8D48;
  enum uint DEPTH_STENCIL = 0x84F9;
  enum uint RENDERBUFFER_WIDTH = 0x8D42;
  enum uint RENDERBUFFER_HEIGHT = 0x8D43;
  enum uint RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
  enum uint RENDERBUFFER_RED_SIZE = 0x8D50;
  enum uint RENDERBUFFER_GREEN_SIZE = 0x8D51;
  enum uint RENDERBUFFER_BLUE_SIZE = 0x8D52;
  enum uint RENDERBUFFER_ALPHA_SIZE = 0x8D53;
  enum uint RENDERBUFFER_DEPTH_SIZE = 0x8D54;
  enum uint RENDERBUFFER_STENCIL_SIZE = 0x8D55;
  enum uint FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
  enum uint FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
  enum uint FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
  enum uint FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
  enum uint COLOR_ATTACHMENT0 = 0x8CE0;
  enum uint DEPTH_ATTACHMENT = 0x8D00;
  enum uint STENCIL_ATTACHMENT = 0x8D20;
  enum uint DEPTH_STENCIL_ATTACHMENT = 0x821A;
  enum uint NONE = 0;
  enum uint FRAMEBUFFER_COMPLETE = 0x8CD5;
  enum uint FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
  enum uint FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
  enum uint FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
  enum uint FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
  enum uint FRAMEBUFFER_BINDING = 0x8CA6;
  enum uint RENDERBUFFER_BINDING = 0x8CA7;
  enum uint MAX_RENDERBUFFER_SIZE = 0x84E8;
  enum uint INVALID_FRAMEBUFFER_OPERATION = 0x0506;
  enum uint UNPACK_FLIP_Y_WEBGL = 0x9240;
  enum uint UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
  enum uint CONTEXT_LOST_WEBGL = 0x9242;
  enum uint UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
  enum uint BROWSER_DEFAULT_WEBGL = 0x9244;
  auto canvas()() {
    return WebGLRenderingContextBase_canvas_Get(this.handle);
  }
  int drawingBufferWidth()() {
    return Object_Getter__int(this.handle, "drawingBufferWidth");
  }
  int drawingBufferHeight()() {
    return Object_Getter__int(this.handle, "drawingBufferHeight");
  }
  auto getContextAttributes()() {
    return recastOpt!(WebGLContextAttributes)(Object_Getter__OptionalHandle(this.handle, "getContextAttributes"));
  }
  bool isContextLost()() {
    return Object_Getter__bool(this.handle, "isContextLost");
  }
  auto getSupportedExtensions()() {
    return recastOpt!(Sequence!(string))(Object_Getter__OptionalHandle(this.handle, "getSupportedExtensions"));
  }
  auto getExtension()(string name) {
    return recastOpt!(JsObject)(Object_Call_string__OptionalHandle(this.handle, "getExtension", name));
  }
  void activeTexture()(uint texture) {
    Object_Call_uint__void(this.handle, "activeTexture", texture);
  }
  void attachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    Serialize_Object_VarArgCall!void(this.handle, "attachShader", "Handle;Handle", tuple(cast(Handle)program.handle, cast(Handle)shader.handle));
  }
  void bindAttribLocation()(scope ref WebGLProgram program, uint index, string name) {
    Serialize_Object_VarArgCall!void(this.handle, "bindAttribLocation", "Handle;uint;string", tuple(cast(Handle)program.handle, index, name));
  }
  void bindBuffer(T1)(uint target, scope auto ref Optional!(T1) buffer) if (isTOrPointer!(T1, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindBuffer", "uint;Optional!Handle", tuple(target, !buffer.empty, cast(Handle)buffer.front.handle));
  }
  void bindFramebuffer(T1)(uint target, scope auto ref Optional!(T1) framebuffer) if (isTOrPointer!(T1, WebGLFramebuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindFramebuffer", "uint;Optional!Handle", tuple(target, !framebuffer.empty, cast(Handle)framebuffer.front.handle));
  }
  void bindRenderbuffer(T1)(uint target, scope auto ref Optional!(T1) renderbuffer) if (isTOrPointer!(T1, WebGLRenderbuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindRenderbuffer", "uint;Optional!Handle", tuple(target, !renderbuffer.empty, cast(Handle)renderbuffer.front.handle));
  }
  void bindTexture(T1)(uint target, scope auto ref Optional!(T1) texture) if (isTOrPointer!(T1, WebGLTexture)) {
    Serialize_Object_VarArgCall!void(this.handle, "bindTexture", "uint;Optional!Handle", tuple(target, !texture.empty, cast(Handle)texture.front.handle));
  }
  void blendColor()(float red, float green, float blue, float alpha) {
    Serialize_Object_VarArgCall!void(this.handle, "blendColor", "float;float;float;float", tuple(red, green, blue, alpha));
  }
  void blendEquation()(uint mode) {
    Object_Call_uint__void(this.handle, "blendEquation", mode);
  }
  void blendEquationSeparate()(uint modeRGB, uint modeAlpha) {
    Serialize_Object_VarArgCall!void(this.handle, "blendEquationSeparate", "uint;uint", tuple(modeRGB, modeAlpha));
  }
  void blendFunc()(uint sfactor, uint dfactor) {
    Serialize_Object_VarArgCall!void(this.handle, "blendFunc", "uint;uint", tuple(sfactor, dfactor));
  }
  void blendFuncSeparate()(uint srcRGB, uint dstRGB, uint srcAlpha, uint dstAlpha) {
    Serialize_Object_VarArgCall!void(this.handle, "blendFuncSeparate", "uint;uint;uint;uint", tuple(srcRGB, dstRGB, srcAlpha, dstAlpha));
  }
  uint checkFramebufferStatus()(uint target) {
    return Serialize_Object_VarArgCall!uint(this.handle, "checkFramebufferStatus", "uint", tuple(target));
  }
  void clear()(uint mask) {
    Object_Call_uint__void(this.handle, "clear", mask);
  }
  void clearColor()(float red, float green, float blue, float alpha) {
    Serialize_Object_VarArgCall!void(this.handle, "clearColor", "float;float;float;float", tuple(red, green, blue, alpha));
  }
  void clearDepth()(float depth) {
    Object_Call_float__void(this.handle, "clearDepth", depth);
  }
  void clearStencil()(int s) {
    Object_Call_int__void(this.handle, "clearStencil", s);
  }
  void colorMask()(bool red, bool green, bool blue, bool alpha) {
    Serialize_Object_VarArgCall!void(this.handle, "colorMask", "bool;bool;bool;bool", tuple(red, green, blue, alpha));
  }
  void compileShader()(scope ref WebGLShader shader) {
    Object_Call_Handle__void(this.handle, "compileShader", shader.handle);
  }
  void copyTexImage2D()(uint target, int level, uint internalformat, int x, int y, int width, int height, int border) {
    Serialize_Object_VarArgCall!void(this.handle, "copyTexImage2D", "uint;int;uint;int;int;int;int;int", tuple(target, level, internalformat, x, y, width, height, border));
  }
  void copyTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "copyTexSubImage2D", "uint;int;int;int;int;int;int;int", tuple(target, level, xoffset, yoffset, x, y, width, height));
  }
  auto createBuffer()() {
    return recastOpt!(WebGLBuffer)(Object_Getter__OptionalHandle(this.handle, "createBuffer"));
  }
  auto createFramebuffer()() {
    return recastOpt!(WebGLFramebuffer)(Object_Getter__OptionalHandle(this.handle, "createFramebuffer"));
  }
  auto createProgram()() {
    return recastOpt!(WebGLProgram)(Object_Getter__OptionalHandle(this.handle, "createProgram"));
  }
  auto createRenderbuffer()() {
    return recastOpt!(WebGLRenderbuffer)(Object_Getter__OptionalHandle(this.handle, "createRenderbuffer"));
  }
  auto createShader()(uint type) {
    return recastOpt!(WebGLShader)(Object_Call_uint__OptionalHandle(this.handle, "createShader", type));
  }
  auto createTexture()() {
    return recastOpt!(WebGLTexture)(Object_Getter__OptionalHandle(this.handle, "createTexture"));
  }
  void cullFace()(uint mode) {
    Object_Call_uint__void(this.handle, "cullFace", mode);
  }
  void deleteBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteBuffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  void deleteFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteFramebuffer", "Optional!Handle", tuple(!framebuffer.empty, cast(Handle)framebuffer.front.handle));
  }
  void deleteProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteProgram", "Optional!Handle", tuple(!program.empty, cast(Handle)program.front.handle));
  }
  void deleteRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteRenderbuffer", "Optional!Handle", tuple(!renderbuffer.empty, cast(Handle)renderbuffer.front.handle));
  }
  void deleteShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteShader", "Optional!Handle", tuple(!shader.empty, cast(Handle)shader.front.handle));
  }
  void deleteTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    Serialize_Object_VarArgCall!void(this.handle, "deleteTexture", "Optional!Handle", tuple(!texture.empty, cast(Handle)texture.front.handle));
  }
  void depthFunc()(uint func) {
    Object_Call_uint__void(this.handle, "depthFunc", func);
  }
  void depthMask()(bool flag) {
    Object_Call_bool__void(this.handle, "depthMask", flag);
  }
  void depthRange()(float zNear, float zFar) {
    Serialize_Object_VarArgCall!void(this.handle, "depthRange", "float;float", tuple(zNear, zFar));
  }
  void detachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    Serialize_Object_VarArgCall!void(this.handle, "detachShader", "Handle;Handle", tuple(cast(Handle)program.handle, cast(Handle)shader.handle));
  }
  void disable()(uint cap) {
    Object_Call_uint__void(this.handle, "disable", cap);
  }
  void disableVertexAttribArray()(uint index) {
    Object_Call_uint__void(this.handle, "disableVertexAttribArray", index);
  }
  void drawArrays()(uint mode, int first, int count) {
    Serialize_Object_VarArgCall!void(this.handle, "drawArrays", "uint;int;int", tuple(mode, first, count));
  }
  void drawElements()(uint mode, int count, uint type, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "drawElements", "uint;int;uint;int", tuple(mode, count, type, offset));
  }
  void enable()(uint cap) {
    Object_Call_uint__void(this.handle, "enable", cap);
  }
  void enableVertexAttribArray()(uint index) {
    Object_Call_uint__void(this.handle, "enableVertexAttribArray", index);
  }
  void finish()() {
    Object_Call__void(this.handle, "finish");
  }
  void flush()() {
    Object_Call__void(this.handle, "flush");
  }
  void framebufferRenderbuffer(T3)(uint target, uint attachment, uint renderbuffertarget, scope auto ref Optional!(T3) renderbuffer) if (isTOrPointer!(T3, WebGLRenderbuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "framebufferRenderbuffer", "uint;uint;uint;Optional!Handle", tuple(target, attachment, renderbuffertarget, !renderbuffer.empty, cast(Handle)renderbuffer.front.handle));
  }
  void framebufferTexture2D(T3)(uint target, uint attachment, uint textarget, scope auto ref Optional!(T3) texture, int level) if (isTOrPointer!(T3, WebGLTexture)) {
    Serialize_Object_VarArgCall!void(this.handle, "framebufferTexture2D", "uint;uint;uint;Optional!Handle;int", tuple(target, attachment, textarget, !texture.empty, cast(Handle)texture.front.handle, level));
  }
  void frontFace()(uint mode) {
    Object_Call_uint__void(this.handle, "frontFace", mode);
  }
  void generateMipmap()(uint target) {
    Object_Call_uint__void(this.handle, "generateMipmap", target);
  }
  auto getActiveAttrib()(scope ref WebGLProgram program, uint index) {
    return recastOpt!(WebGLActiveInfo)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getActiveAttrib", "Handle;uint", tuple(cast(Handle)program.handle, index)));
  }
  auto getActiveUniform()(scope ref WebGLProgram program, uint index) {
    return recastOpt!(WebGLActiveInfo)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getActiveUniform", "Handle;uint", tuple(cast(Handle)program.handle, index)));
  }
  auto getAttachedShaders()(scope ref WebGLProgram program) {
    return recastOpt!(Sequence!(WebGLShader))(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getAttachedShaders", "Handle", tuple(cast(Handle)program.handle)));
  }
  int getAttribLocation()(scope ref WebGLProgram program, string name) {
    return Serialize_Object_VarArgCall!int(this.handle, "getAttribLocation", "Handle;string", tuple(cast(Handle)program.handle, name));
  }
  auto getBufferParameter()(uint target, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getBufferParameter", "uint;uint", tuple(target, pname)));
  }
  auto getParameter()(uint pname) {
    return Any(Object_Call_uint__Handle(this.handle, "getParameter", pname));
  }
  uint getError()() {
    return Object_Getter__uint(this.handle, "getError");
  }
  auto getFramebufferAttachmentParameter()(uint target, uint attachment, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getFramebufferAttachmentParameter", "uint;uint;uint", tuple(target, attachment, pname)));
  }
  auto getProgramParameter()(scope ref WebGLProgram program, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getProgramParameter", "Handle;uint", tuple(cast(Handle)program.handle, pname)));
  }
  Optional!(string) getProgramInfoLog()(scope ref WebGLProgram program) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getProgramInfoLog", "Handle", tuple(cast(Handle)program.handle));
  }
  auto getRenderbufferParameter()(uint target, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getRenderbufferParameter", "uint;uint", tuple(target, pname)));
  }
  auto getShaderParameter()(scope ref WebGLShader shader, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getShaderParameter", "Handle;uint", tuple(cast(Handle)shader.handle, pname)));
  }
  auto getShaderPrecisionFormat()(uint shadertype, uint precisiontype) {
    return recastOpt!(WebGLShaderPrecisionFormat)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getShaderPrecisionFormat", "uint;uint", tuple(shadertype, precisiontype)));
  }
  Optional!(string) getShaderInfoLog()(scope ref WebGLShader shader) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getShaderInfoLog", "Handle", tuple(cast(Handle)shader.handle));
  }
  Optional!(string) getShaderSource()(scope ref WebGLShader shader) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "getShaderSource", "Handle", tuple(cast(Handle)shader.handle));
  }
  auto getTexParameter()(uint target, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getTexParameter", "uint;uint", tuple(target, pname)));
  }
  auto getUniform()(scope ref WebGLProgram program, scope ref WebGLUniformLocation location) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getUniform", "Handle;Handle", tuple(cast(Handle)program.handle, cast(Handle)location.handle)));
  }
  auto getUniformLocation()(scope ref WebGLProgram program, string name) {
    return recastOpt!(WebGLUniformLocation)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getUniformLocation", "Handle;string", tuple(cast(Handle)program.handle, name)));
  }
  auto getVertexAttrib()(uint index, uint pname) {
    return Any(Serialize_Object_VarArgCall!Handle(this.handle, "getVertexAttrib", "uint;uint", tuple(index, pname)));
  }
  int getVertexAttribOffset()(uint index, uint pname) {
    return Serialize_Object_VarArgCall!int(this.handle, "getVertexAttribOffset", "uint;uint", tuple(index, pname));
  }
  void hint()(uint target, uint mode) {
    Serialize_Object_VarArgCall!void(this.handle, "hint", "uint;uint", tuple(target, mode));
  }
  bool isBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isBuffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  bool isEnabled()(uint cap) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isEnabled", "uint", tuple(cap));
  }
  bool isFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isFramebuffer", "Optional!Handle", tuple(!framebuffer.empty, cast(Handle)framebuffer.front.handle));
  }
  bool isProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isProgram", "Optional!Handle", tuple(!program.empty, cast(Handle)program.front.handle));
  }
  bool isRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isRenderbuffer", "Optional!Handle", tuple(!renderbuffer.empty, cast(Handle)renderbuffer.front.handle));
  }
  bool isShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isShader", "Optional!Handle", tuple(!shader.empty, cast(Handle)shader.front.handle));
  }
  bool isTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isTexture", "Optional!Handle", tuple(!texture.empty, cast(Handle)texture.front.handle));
  }
  void lineWidth()(float width) {
    Object_Call_float__void(this.handle, "lineWidth", width);
  }
  void linkProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "linkProgram", program.handle);
  }
  void pixelStorei()(uint pname, int param) {
    Serialize_Object_VarArgCall!void(this.handle, "pixelStorei", "uint;int", tuple(pname, param));
  }
  void polygonOffset()(float factor, float units) {
    Serialize_Object_VarArgCall!void(this.handle, "polygonOffset", "float;float", tuple(factor, units));
  }
  void renderbufferStorage()(uint target, uint internalformat, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "renderbufferStorage", "uint;uint;int;int", tuple(target, internalformat, width, height));
  }
  void sampleCoverage()(float value, bool invert) {
    Serialize_Object_VarArgCall!void(this.handle, "sampleCoverage", "float;bool", tuple(value, invert));
  }
  void scissor()(int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "scissor", "int;int;int;int", tuple(x, y, width, height));
  }
  void shaderSource()(scope ref WebGLShader shader, string source) {
    Serialize_Object_VarArgCall!void(this.handle, "shaderSource", "Handle;string", tuple(cast(Handle)shader.handle, source));
  }
  void stencilFunc()(uint func, int ref_, uint mask) {
    Serialize_Object_VarArgCall!void(this.handle, "stencilFunc", "uint;int;uint", tuple(func, ref_, mask));
  }
  void stencilFuncSeparate()(uint face, uint func, int ref_, uint mask) {
    Serialize_Object_VarArgCall!void(this.handle, "stencilFuncSeparate", "uint;uint;int;uint", tuple(face, func, ref_, mask));
  }
  void stencilMask()(uint mask) {
    Object_Call_uint__void(this.handle, "stencilMask", mask);
  }
  void stencilMaskSeparate()(uint face, uint mask) {
    Serialize_Object_VarArgCall!void(this.handle, "stencilMaskSeparate", "uint;uint", tuple(face, mask));
  }
  void stencilOp()(uint fail, uint zfail, uint zpass) {
    Serialize_Object_VarArgCall!void(this.handle, "stencilOp", "uint;uint;uint", tuple(fail, zfail, zpass));
  }
  void stencilOpSeparate()(uint face, uint fail, uint zfail, uint zpass) {
    Serialize_Object_VarArgCall!void(this.handle, "stencilOpSeparate", "uint;uint;uint;uint", tuple(face, fail, zfail, zpass));
  }
  void texParameterf()(uint target, uint pname, float param) {
    Serialize_Object_VarArgCall!void(this.handle, "texParameterf", "uint;uint;float", tuple(target, pname, param));
  }
  void texParameteri()(uint target, uint pname, int param) {
    Serialize_Object_VarArgCall!void(this.handle, "texParameteri", "uint;uint;int", tuple(target, pname, param));
  }
  void uniform1f(T0)(scope auto ref Optional!(T0) location, float x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1f", "Optional!Handle;float", tuple(!location.empty, cast(Handle)location.front.handle, x));
  }
  void uniform2f(T0)(scope auto ref Optional!(T0) location, float x, float y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2f", "Optional!Handle;float;float", tuple(!location.empty, cast(Handle)location.front.handle, x, y));
  }
  void uniform3f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3f", "Optional!Handle;float;float;float", tuple(!location.empty, cast(Handle)location.front.handle, x, y, z));
  }
  void uniform4f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z, float w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4f", "Optional!Handle;float;float;float;float", tuple(!location.empty, cast(Handle)location.front.handle, x, y, z, w));
  }
  void uniform1i(T0)(scope auto ref Optional!(T0) location, int x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform1i", "Optional!Handle;int", tuple(!location.empty, cast(Handle)location.front.handle, x));
  }
  void uniform2i(T0)(scope auto ref Optional!(T0) location, int x, int y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform2i", "Optional!Handle;int;int", tuple(!location.empty, cast(Handle)location.front.handle, x, y));
  }
  void uniform3i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform3i", "Optional!Handle;int;int;int", tuple(!location.empty, cast(Handle)location.front.handle, x, y, z));
  }
  void uniform4i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z, int w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    Serialize_Object_VarArgCall!void(this.handle, "uniform4i", "Optional!Handle;int;int;int;int", tuple(!location.empty, cast(Handle)location.front.handle, x, y, z, w));
  }
  void useProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    Serialize_Object_VarArgCall!void(this.handle, "useProgram", "Optional!Handle", tuple(!program.empty, cast(Handle)program.front.handle));
  }
  void validateProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "validateProgram", program.handle);
  }
  void vertexAttrib1f()(uint indx, float x) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib1f", "uint;float", tuple(indx, x));
  }
  void vertexAttrib1fv()(uint indx, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib1fv", "uint;SumType!(Handle,Handle)", tuple(indx, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttrib2f()(uint indx, float x, float y) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib2f", "uint;float;float", tuple(indx, x, y));
  }
  void vertexAttrib2fv()(uint indx, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib2fv", "uint;SumType!(Handle,Handle)", tuple(indx, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttrib3f()(uint indx, float x, float y, float z) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib3f", "uint;float;float;float", tuple(indx, x, y, z));
  }
  void vertexAttrib3fv()(uint indx, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib3fv", "uint;SumType!(Handle,Handle)", tuple(indx, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttrib4f()(uint indx, float x, float y, float z, float w) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib4f", "uint;float;float;float;float", tuple(indx, x, y, z, w));
  }
  void vertexAttrib4fv()(uint indx, scope ref Float32List values) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttrib4fv", "uint;SumType!(Handle,Handle)", tuple(indx, libwasm.sumtype.match!(((ref values.Types[0] v) => 0),((ref values.Types[1] v) => 1))(values),tuple(libwasm.sumtype.match!(((ref values.Types[0] v) => cast(Handle)v.handle),((ref values.Types[1] v) => Handle.init))(values),libwasm.sumtype.match!(((ref values.Types[0] v) => Handle.init),((ref values.Types[1] v) => cast(Handle)v.handle))(values))));
  }
  void vertexAttribPointer()(uint indx, int size, uint type, bool normalized, int stride, int offset) {
    Serialize_Object_VarArgCall!void(this.handle, "vertexAttribPointer", "uint;int;uint;bool;int;int", tuple(indx, size, type, normalized, stride, offset));
  }
  void viewport()(int x, int y, int width, int height) {
    Serialize_Object_VarArgCall!void(this.handle, "viewport", "int;int;int;int", tuple(x, y, width, height));
  }
}
struct WebGLSampler {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLSync {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLTransformFeedback {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}


