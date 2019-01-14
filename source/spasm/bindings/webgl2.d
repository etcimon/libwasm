module spasm.bindings.webgl2;

import spasm.types;
import spasm.bindings.common;
import spasm.bindings.webgl;

alias Float32List = SumType!(Float32Array, Sequence!(float));
alias GLint64 = long;
alias GLuint64 = ulong;
alias Int32List = SumType!(Int32Array, Sequence!(int));
alias Uint32List = SumType!(Uint32Array, Sequence!(uint));
struct WebGL2RenderingContext {
  JsHandle handle;
  alias handle this;
}
struct WebGL2RenderingContextBase {
  JsHandle handle;
  alias handle this;
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
  enum uint DEPTH_STENCIL_ATTACHMENT = 0x821A;
  enum uint DEPTH_STENCIL = 0x84F9;
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
  enum long TIMEOUT_IGNORED = -1;
  enum uint MAX_CLIENT_WAIT_TIMEOUT_WEBGL = 0x9247;
  auto bufferData(uint target, long size, uint usage) {
    WebGL2RenderingContextBase_bufferData__uint_long_uint(this.handle, target, size, usage);
  }
  auto bufferData(uint target, Optional!(ArrayBuffer) srcData, uint usage) {
    WebGL2RenderingContextBase_bufferData__uint_optional_Handle_uint(this.handle, target, !srcData.empty, srcData.front.handle, usage);
  }
  auto bufferData(uint target, ArrayBufferView srcData, uint usage) {
    WebGL2RenderingContextBase_bufferData__uint_ArrayBufferView_uint(this.handle, target, srcData, usage);
  }
  auto bufferSubData(uint target, long dstByteOffset, BufferDataSource srcData) {
    WebGL2RenderingContextBase_bufferSubData__uint_long_BufferDataSource(this.handle, target, dstByteOffset, srcData);
  }
  auto bufferData(uint target, ArrayBufferView srcData, uint usage, uint srcOffset, uint length /* = 0 */) {
    WebGL2RenderingContextBase_bufferData__uint_ArrayBufferView_uint_uint_uint(this.handle, target, srcData, usage, srcOffset, length);
  }
  auto bufferSubData(uint target, long dstByteOffset, ArrayBufferView srcData, uint srcOffset, uint length /* = 0 */) {
    WebGL2RenderingContextBase_bufferSubData__uint_long_ArrayBufferView_uint_uint(this.handle, target, dstByteOffset, srcData, srcOffset, length);
  }
  auto copyBufferSubData(uint readTarget, uint writeTarget, long readOffset, long writeOffset, long size) {
    WebGL2RenderingContextBase_copyBufferSubData(this.handle, readTarget, writeTarget, readOffset, writeOffset, size);
  }
  auto getBufferSubData(uint target, long srcByteOffset, ArrayBufferView dstData, uint dstOffset /* = 0 */, uint length /* = 0 */) {
    WebGL2RenderingContextBase_getBufferSubData(this.handle, target, srcByteOffset, dstData, dstOffset, length);
  }
  auto blitFramebuffer(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, uint mask, uint filter) {
    WebGL2RenderingContextBase_blitFramebuffer(this.handle, srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
  }
  auto framebufferTextureLayer(uint target, uint attachment, Optional!(WebGLTexture) texture, int level, int layer) {
    WebGL2RenderingContextBase_framebufferTextureLayer(this.handle, target, attachment, !texture.empty, texture.front.handle, level, layer);
  }
  auto invalidateFramebuffer(uint target, Sequence!(uint) attachments) {
    WebGL2RenderingContextBase_invalidateFramebuffer(this.handle, target, attachments.handle);
  }
  auto invalidateSubFramebuffer(uint target, Sequence!(uint) attachments, int x, int y, int width, int height) {
    WebGL2RenderingContextBase_invalidateSubFramebuffer(this.handle, target, attachments.handle, x, y, width, height);
  }
  auto readBuffer(uint src) {
    WebGL2RenderingContextBase_readBuffer(this.handle, src);
  }
  auto getInternalformatParameter(uint target, uint internalformat, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getInternalformatParameter(this.handle, target, internalformat, pname)));
    return result;
  }
  auto renderbufferStorageMultisample(uint target, int samples, uint internalformat, int width, int height) {
    WebGL2RenderingContextBase_renderbufferStorageMultisample(this.handle, target, samples, internalformat, width, height);
  }
  auto texStorage2D(uint target, int levels, uint internalformat, int width, int height) {
    WebGL2RenderingContextBase_texStorage2D(this.handle, target, levels, internalformat, width, height);
  }
  auto texStorage3D(uint target, int levels, uint internalformat, int width, int height, int depth) {
    WebGL2RenderingContextBase_texStorage3D(this.handle, target, levels, internalformat, width, height, depth);
  }
  auto texImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, Optional!(ArrayBufferView) pixels) {
    WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_optional_ArrayBufferView(this.handle, target, level, internalformat, width, height, border, format, type, !pixels.empty, pixels.front);
  }
  auto texImage2D(uint target, int level, int internalformat, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texImage2D__uint_int_int_uint_uint_TexImageSource(this.handle, target, level, internalformat, format, type, source);
  }
  auto texSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, Optional!(ArrayBufferView) pixels) {
    WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_optional_ArrayBufferView(this.handle, target, level, xoffset, yoffset, width, height, format, type, !pixels.empty, pixels.front);
  }
  auto texSubImage2D(uint target, int level, int xoffset, int yoffset, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_uint_uint_TexImageSource(this.handle, target, level, xoffset, yoffset, format, type, source);
  }
  auto texImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, long pboOffset) {
    WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_long(this.handle, target, level, internalformat, width, height, border, format, type, pboOffset);
  }
  auto texImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_TexImageSource(this.handle, target, level, internalformat, width, height, border, format, type, source);
  }
  auto texImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, ArrayBufferView srcData, uint srcOffset) {
    WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_ArrayBufferView_uint(this.handle, target, level, internalformat, width, height, border, format, type, srcData, srcOffset);
  }
  auto texImage3D(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, long pboOffset) {
    WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_long(this.handle, target, level, internalformat, width, height, depth, border, format, type, pboOffset);
  }
  auto texImage3D(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_TexImageSource(this.handle, target, level, internalformat, width, height, depth, border, format, type, source);
  }
  auto texImage3D(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, Optional!(ArrayBufferView) srcData) {
    WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_optional_ArrayBufferView(this.handle, target, level, internalformat, width, height, depth, border, format, type, !srcData.empty, srcData.front);
  }
  auto texImage3D(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, ArrayBufferView srcData, uint srcOffset) {
    WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_ArrayBufferView_uint(this.handle, target, level, internalformat, width, height, depth, border, format, type, srcData, srcOffset);
  }
  auto texSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, long pboOffset) {
    WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_long(this.handle, target, level, xoffset, yoffset, width, height, format, type, pboOffset);
  }
  auto texSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_TexImageSource(this.handle, target, level, xoffset, yoffset, width, height, format, type, source);
  }
  auto texSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, ArrayBufferView srcData, uint srcOffset) {
    WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_ArrayBufferView_uint(this.handle, target, level, xoffset, yoffset, width, height, format, type, srcData, srcOffset);
  }
  auto texSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, long pboOffset) {
    WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_long(this.handle, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pboOffset);
  }
  auto texSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, TexImageSource source) {
    WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_TexImageSource(this.handle, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, source);
  }
  auto texSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, Optional!(ArrayBufferView) srcData, uint srcOffset /* = 0 */) {
    WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_optional_ArrayBufferView_uint(this.handle, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, !srcData.empty, srcData.front, srcOffset);
  }
  auto copyTexSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height) {
    WebGL2RenderingContextBase_copyTexSubImage3D(this.handle, target, level, xoffset, yoffset, zoffset, x, y, width, height);
  }
  auto compressedTexImage2D(uint target, int level, uint internalformat, int width, int height, int border, long offset) {
    WebGL2RenderingContextBase_compressedTexImage2D__uint_int_uint_int_int_int_long(this.handle, target, level, internalformat, width, height, border, offset);
  }
  auto compressedTexImage2D(uint target, int level, uint internalformat, int width, int height, int border, ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    WebGL2RenderingContextBase_compressedTexImage2D__uint_int_uint_int_int_int_ArrayBufferView_uint_uint(this.handle, target, level, internalformat, width, height, border, srcData, srcOffset, srcLengthOverride);
  }
  auto compressedTexImage3D(uint target, int level, uint internalformat, int width, int height, int depth, int border, long offset) {
    WebGL2RenderingContextBase_compressedTexImage3D__uint_int_uint_int_int_int_int_long(this.handle, target, level, internalformat, width, height, depth, border, offset);
  }
  auto compressedTexImage3D(uint target, int level, uint internalformat, int width, int height, int depth, int border, ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    WebGL2RenderingContextBase_compressedTexImage3D__uint_int_uint_int_int_int_int_ArrayBufferView_uint_uint(this.handle, target, level, internalformat, width, height, depth, border, srcData, srcOffset, srcLengthOverride);
  }
  auto compressedTexSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, long offset) {
    WebGL2RenderingContextBase_compressedTexSubImage2D__uint_int_int_int_int_int_uint_long(this.handle, target, level, xoffset, yoffset, width, height, format, offset);
  }
  auto compressedTexSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    WebGL2RenderingContextBase_compressedTexSubImage2D__uint_int_int_int_int_int_uint_ArrayBufferView_uint_uint(this.handle, target, level, xoffset, yoffset, width, height, format, srcData, srcOffset, srcLengthOverride);
  }
  auto compressedTexSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, long offset) {
    WebGL2RenderingContextBase_compressedTexSubImage3D__uint_int_int_int_int_int_int_int_uint_long(this.handle, target, level, xoffset, yoffset, zoffset, width, height, depth, format, offset);
  }
  auto compressedTexSubImage3D(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, ArrayBufferView srcData, uint srcOffset /* = 0 */, uint srcLengthOverride /* = 0 */) {
    WebGL2RenderingContextBase_compressedTexSubImage3D__uint_int_int_int_int_int_int_int_uint_ArrayBufferView_uint_uint(this.handle, target, level, xoffset, yoffset, zoffset, width, height, depth, format, srcData, srcOffset, srcLengthOverride);
  }
  auto getFragDataLocation(WebGLProgram program, string name) {
    auto result = WebGL2RenderingContextBase_getFragDataLocation(this.handle, program.handle, name);
    return result;
  }
  auto uniform1ui(Optional!(WebGLUniformLocation) location, uint v0) {
    WebGL2RenderingContextBase_uniform1ui(this.handle, !location.empty, location.front.handle, v0);
  }
  auto uniform2ui(Optional!(WebGLUniformLocation) location, uint v0, uint v1) {
    WebGL2RenderingContextBase_uniform2ui(this.handle, !location.empty, location.front.handle, v0, v1);
  }
  auto uniform3ui(Optional!(WebGLUniformLocation) location, uint v0, uint v1, uint v2) {
    WebGL2RenderingContextBase_uniform3ui(this.handle, !location.empty, location.front.handle, v0, v1, v2);
  }
  auto uniform4ui(Optional!(WebGLUniformLocation) location, uint v0, uint v1, uint v2, uint v3) {
    WebGL2RenderingContextBase_uniform4ui(this.handle, !location.empty, location.front.handle, v0, v1, v2, v3);
  }
  auto uniform1fv(Optional!(WebGLUniformLocation) location, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform1fv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform2fv(Optional!(WebGLUniformLocation) location, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform2fv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform3fv(Optional!(WebGLUniformLocation) location, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform3fv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform4fv(Optional!(WebGLUniformLocation) location, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform4fv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform1iv(Optional!(WebGLUniformLocation) location, Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform1iv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform2iv(Optional!(WebGLUniformLocation) location, Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform2iv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform3iv(Optional!(WebGLUniformLocation) location, Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform3iv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform4iv(Optional!(WebGLUniformLocation) location, Int32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform4iv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform1uiv(Optional!(WebGLUniformLocation) location, Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform1uiv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform2uiv(Optional!(WebGLUniformLocation) location, Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform2uiv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform3uiv(Optional!(WebGLUniformLocation) location, Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform3uiv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniform4uiv(Optional!(WebGLUniformLocation) location, Uint32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniform4uiv(this.handle, !location.empty, location.front.handle, data, srcOffset, srcLength);
  }
  auto uniformMatrix2fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix2fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix3x2fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix3x2fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix4x2fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix4x2fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix2x3fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix2x3fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix3fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix3fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix4x3fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix4x3fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix2x4fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix2x4fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix3x4fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix3x4fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto uniformMatrix4fv(Optional!(WebGLUniformLocation) location, bool transpose, Float32List data, uint srcOffset /* = 0 */, uint srcLength /* = 0 */) {
    WebGL2RenderingContextBase_uniformMatrix4fv(this.handle, !location.empty, location.front.handle, transpose, data, srcOffset, srcLength);
  }
  auto vertexAttribI4i(uint index, int x, int y, int z, int w) {
    WebGL2RenderingContextBase_vertexAttribI4i(this.handle, index, x, y, z, w);
  }
  auto vertexAttribI4iv(uint index, Int32List values) {
    WebGL2RenderingContextBase_vertexAttribI4iv(this.handle, index, values);
  }
  auto vertexAttribI4ui(uint index, uint x, uint y, uint z, uint w) {
    WebGL2RenderingContextBase_vertexAttribI4ui(this.handle, index, x, y, z, w);
  }
  auto vertexAttribI4uiv(uint index, Uint32List values) {
    WebGL2RenderingContextBase_vertexAttribI4uiv(this.handle, index, values);
  }
  auto vertexAttribIPointer(uint index, int size, uint type, int stride, long offset) {
    WebGL2RenderingContextBase_vertexAttribIPointer(this.handle, index, size, type, stride, offset);
  }
  auto vertexAttribDivisor(uint index, uint divisor) {
    WebGL2RenderingContextBase_vertexAttribDivisor(this.handle, index, divisor);
  }
  auto drawArraysInstanced(uint mode, int first, int count, int instanceCount) {
    WebGL2RenderingContextBase_drawArraysInstanced(this.handle, mode, first, count, instanceCount);
  }
  auto drawElementsInstanced(uint mode, int count, uint type, long offset, int instanceCount) {
    WebGL2RenderingContextBase_drawElementsInstanced(this.handle, mode, count, type, offset, instanceCount);
  }
  auto drawRangeElements(uint mode, uint start, uint end, int count, uint type, long offset) {
    WebGL2RenderingContextBase_drawRangeElements(this.handle, mode, start, end, count, type, offset);
  }
  auto readPixels(int x, int y, int width, int height, uint format, uint type, Optional!(ArrayBufferView) dstData) {
    WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_optional_ArrayBufferView(this.handle, x, y, width, height, format, type, !dstData.empty, dstData.front);
  }
  auto readPixels(int x, int y, int width, int height, uint format, uint type, long offset) {
    WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_long(this.handle, x, y, width, height, format, type, offset);
  }
  auto readPixels(int x, int y, int width, int height, uint format, uint type, ArrayBufferView dstData, uint dstOffset) {
    WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_ArrayBufferView_uint(this.handle, x, y, width, height, format, type, dstData, dstOffset);
  }
  auto drawBuffers(Sequence!(uint) buffers) {
    WebGL2RenderingContextBase_drawBuffers(this.handle, buffers.handle);
  }
  auto clearBufferfv(uint buffer, int drawbuffer, Float32List values, uint srcOffset /* = 0 */) {
    WebGL2RenderingContextBase_clearBufferfv(this.handle, buffer, drawbuffer, values, srcOffset);
  }
  auto clearBufferiv(uint buffer, int drawbuffer, Int32List values, uint srcOffset /* = 0 */) {
    WebGL2RenderingContextBase_clearBufferiv(this.handle, buffer, drawbuffer, values, srcOffset);
  }
  auto clearBufferuiv(uint buffer, int drawbuffer, Uint32List values, uint srcOffset /* = 0 */) {
    WebGL2RenderingContextBase_clearBufferuiv(this.handle, buffer, drawbuffer, values, srcOffset);
  }
  auto clearBufferfi(uint buffer, int drawbuffer, float depth, int stencil) {
    WebGL2RenderingContextBase_clearBufferfi(this.handle, buffer, drawbuffer, depth, stencil);
  }
  auto createQuery() {
    auto result = WebGL2RenderingContextBase_createQuery(this.handle);
    return result;
  }
  auto deleteQuery(Optional!(WebGLQuery) query) {
    WebGL2RenderingContextBase_deleteQuery(this.handle, !query.empty, query.front.handle);
  }
  auto isQuery(Optional!(WebGLQuery) query) {
    auto result = WebGL2RenderingContextBase_isQuery(this.handle, !query.empty, query.front.handle);
    return result;
  }
  auto beginQuery(uint target, WebGLQuery query) {
    WebGL2RenderingContextBase_beginQuery(this.handle, target, query.handle);
  }
  auto endQuery(uint target) {
    WebGL2RenderingContextBase_endQuery(this.handle, target);
  }
  auto getQuery(uint target, uint pname) {
    auto result = WebGL2RenderingContextBase_getQuery(this.handle, target, pname);
    return result;
  }
  auto getQueryParameter(WebGLQuery query, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getQueryParameter(this.handle, query.handle, pname)));
    return result;
  }
  auto createSampler() {
    auto result = WebGL2RenderingContextBase_createSampler(this.handle);
    return result;
  }
  auto deleteSampler(Optional!(WebGLSampler) sampler) {
    WebGL2RenderingContextBase_deleteSampler(this.handle, !sampler.empty, sampler.front.handle);
  }
  auto isSampler(Optional!(WebGLSampler) sampler) {
    auto result = WebGL2RenderingContextBase_isSampler(this.handle, !sampler.empty, sampler.front.handle);
    return result;
  }
  auto bindSampler(uint unit, Optional!(WebGLSampler) sampler) {
    WebGL2RenderingContextBase_bindSampler(this.handle, unit, !sampler.empty, sampler.front.handle);
  }
  auto samplerParameteri(WebGLSampler sampler, uint pname, int param) {
    WebGL2RenderingContextBase_samplerParameteri(this.handle, sampler.handle, pname, param);
  }
  auto samplerParameterf(WebGLSampler sampler, uint pname, float param) {
    WebGL2RenderingContextBase_samplerParameterf(this.handle, sampler.handle, pname, param);
  }
  auto getSamplerParameter(WebGLSampler sampler, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getSamplerParameter(this.handle, sampler.handle, pname)));
    return result;
  }
  auto fenceSync(uint condition, uint flags) {
    auto result = WebGL2RenderingContextBase_fenceSync(this.handle, condition, flags);
    return result;
  }
  auto isSync(Optional!(WebGLSync) sync) {
    auto result = WebGL2RenderingContextBase_isSync(this.handle, !sync.empty, sync.front.handle);
    return result;
  }
  auto deleteSync(Optional!(WebGLSync) sync) {
    WebGL2RenderingContextBase_deleteSync(this.handle, !sync.empty, sync.front.handle);
  }
  auto clientWaitSync(WebGLSync sync, uint flags, ulong timeout) {
    auto result = WebGL2RenderingContextBase_clientWaitSync(this.handle, sync.handle, flags, timeout);
    return result;
  }
  auto waitSync(WebGLSync sync, uint flags, long timeout) {
    WebGL2RenderingContextBase_waitSync(this.handle, sync.handle, flags, timeout);
  }
  auto getSyncParameter(WebGLSync sync, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getSyncParameter(this.handle, sync.handle, pname)));
    return result;
  }
  auto createTransformFeedback() {
    auto result = WebGL2RenderingContextBase_createTransformFeedback(this.handle);
    return result;
  }
  auto deleteTransformFeedback(Optional!(WebGLTransformFeedback) tf) {
    WebGL2RenderingContextBase_deleteTransformFeedback(this.handle, !tf.empty, tf.front.handle);
  }
  auto isTransformFeedback(Optional!(WebGLTransformFeedback) tf) {
    auto result = WebGL2RenderingContextBase_isTransformFeedback(this.handle, !tf.empty, tf.front.handle);
    return result;
  }
  auto bindTransformFeedback(uint target, Optional!(WebGLTransformFeedback) tf) {
    WebGL2RenderingContextBase_bindTransformFeedback(this.handle, target, !tf.empty, tf.front.handle);
  }
  auto beginTransformFeedback(uint primitiveMode) {
    WebGL2RenderingContextBase_beginTransformFeedback(this.handle, primitiveMode);
  }
  auto endTransformFeedback() {
    WebGL2RenderingContextBase_endTransformFeedback(this.handle);
  }
  auto transformFeedbackVaryings(WebGLProgram program, Sequence!(string) varyings, uint bufferMode) {
    WebGL2RenderingContextBase_transformFeedbackVaryings(this.handle, program.handle, varyings.handle, bufferMode);
  }
  auto getTransformFeedbackVarying(WebGLProgram program, uint index) {
    auto result = WebGL2RenderingContextBase_getTransformFeedbackVarying(this.handle, program.handle, index);
    return result;
  }
  auto pauseTransformFeedback() {
    WebGL2RenderingContextBase_pauseTransformFeedback(this.handle);
  }
  auto resumeTransformFeedback() {
    WebGL2RenderingContextBase_resumeTransformFeedback(this.handle);
  }
  auto bindBufferBase(uint target, uint index, Optional!(WebGLBuffer) buffer) {
    WebGL2RenderingContextBase_bindBufferBase(this.handle, target, index, !buffer.empty, buffer.front.handle);
  }
  auto bindBufferRange(uint target, uint index, Optional!(WebGLBuffer) buffer, long offset, long size) {
    WebGL2RenderingContextBase_bindBufferRange(this.handle, target, index, !buffer.empty, buffer.front.handle, offset, size);
  }
  auto getIndexedParameter(uint target, uint index) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getIndexedParameter(this.handle, target, index)));
    return result;
  }
  auto getUniformIndices(WebGLProgram program, Sequence!(string) uniformNames) {
    auto result = WebGL2RenderingContextBase_getUniformIndices(this.handle, program.handle, uniformNames.handle);
    return result;
  }
  auto getActiveUniforms(WebGLProgram program, Sequence!(uint) uniformIndices, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getActiveUniforms(this.handle, program.handle, uniformIndices.handle, pname)));
    return result;
  }
  auto getUniformBlockIndex(WebGLProgram program, string uniformBlockName) {
    auto result = WebGL2RenderingContextBase_getUniformBlockIndex(this.handle, program.handle, uniformBlockName);
    return result;
  }
  auto getActiveUniformBlockParameter(WebGLProgram program, uint uniformBlockIndex, uint pname) {
    auto result = Any(JsHandle(WebGL2RenderingContextBase_getActiveUniformBlockParameter(this.handle, program.handle, uniformBlockIndex, pname)));
    return result;
  }
  auto getActiveUniformBlockName(WebGLProgram program, uint uniformBlockIndex) {
    auto result = WebGL2RenderingContextBase_getActiveUniformBlockName(this.handle, program.handle, uniformBlockIndex);
    return result;
  }
  auto uniformBlockBinding(WebGLProgram program, uint uniformBlockIndex, uint uniformBlockBinding) {
    WebGL2RenderingContextBase_uniformBlockBinding(this.handle, program.handle, uniformBlockIndex, uniformBlockBinding);
  }
  auto createVertexArray() {
    auto result = WebGL2RenderingContextBase_createVertexArray(this.handle);
    return result;
  }
  auto deleteVertexArray(Optional!(WebGLVertexArrayObject) vertexArray) {
    WebGL2RenderingContextBase_deleteVertexArray(this.handle, !vertexArray.empty, vertexArray.front.handle);
  }
  auto isVertexArray(Optional!(WebGLVertexArrayObject) vertexArray) {
    auto result = WebGL2RenderingContextBase_isVertexArray(this.handle, !vertexArray.empty, vertexArray.front.handle);
    return result;
  }
  auto bindVertexArray(Optional!(WebGLVertexArrayObject) array) {
    WebGL2RenderingContextBase_bindVertexArray(this.handle, !array.empty, array.front.handle);
  }
}
struct WebGLQuery {
  WebGLObject _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = WebGLObject(h);
  }
}
struct WebGLSampler {
  WebGLObject _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = WebGLObject(h);
  }
}
struct WebGLSync {
  WebGLObject _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = WebGLObject(h);
  }
}
struct WebGLTransformFeedback {
  WebGLObject _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = WebGLObject(h);
  }
}
struct WebGLVertexArrayObject {
  WebGLObject _parent;
  alias _parent this;
  this(JsHandle h) {
    _parent = WebGLObject(h);
  }
}


extern (C) void WebGL2RenderingContextBase_bufferData__uint_long_uint(Handle, uint, long, uint);
extern (C) void WebGL2RenderingContextBase_bufferData__uint_optional_Handle_uint(Handle, uint, bool, Handle, uint);
extern (C) void WebGL2RenderingContextBase_bufferData__uint_ArrayBufferView_uint(Handle, uint, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_bufferSubData__uint_long_BufferDataSource(Handle, uint, long, BufferDataSource);
extern (C) void WebGL2RenderingContextBase_bufferData__uint_ArrayBufferView_uint_uint_uint(Handle, uint, ArrayBufferView, uint, uint, uint);
extern (C) void WebGL2RenderingContextBase_bufferSubData__uint_long_ArrayBufferView_uint_uint(Handle, uint, long, ArrayBufferView, uint, uint);
extern (C) void WebGL2RenderingContextBase_copyBufferSubData(Handle, uint, uint, long, long, long);
extern (C) void WebGL2RenderingContextBase_getBufferSubData(Handle, uint, long, ArrayBufferView, uint, uint);
extern (C) void WebGL2RenderingContextBase_blitFramebuffer(Handle, int, int, int, int, int, int, int, int, uint, uint);
extern (C) void WebGL2RenderingContextBase_framebufferTextureLayer(Handle, uint, uint, bool, Handle, int, int);
extern (C) void WebGL2RenderingContextBase_invalidateFramebuffer(Handle, uint, Handle);
extern (C) void WebGL2RenderingContextBase_invalidateSubFramebuffer(Handle, uint, Handle, int, int, int, int);
extern (C) void WebGL2RenderingContextBase_readBuffer(Handle, uint);
extern (C) Handle WebGL2RenderingContextBase_getInternalformatParameter(Handle, uint, uint, uint);
extern (C) void WebGL2RenderingContextBase_renderbufferStorageMultisample(Handle, uint, int, uint, int, int);
extern (C) void WebGL2RenderingContextBase_texStorage2D(Handle, uint, int, uint, int, int);
extern (C) void WebGL2RenderingContextBase_texStorage3D(Handle, uint, int, uint, int, int, int);
extern (C) void WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_optional_ArrayBufferView(Handle, uint, int, int, int, int, int, uint, uint, bool, ArrayBufferView);
extern (C) void WebGL2RenderingContextBase_texImage2D__uint_int_int_uint_uint_TexImageSource(Handle, uint, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_optional_ArrayBufferView(Handle, uint, int, int, int, int, int, uint, uint, bool, ArrayBufferView);
extern (C) void WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_uint_uint_TexImageSource(Handle, uint, int, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_long(Handle, uint, int, int, int, int, int, uint, uint, long);
extern (C) void WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_TexImageSource(Handle, uint, int, int, int, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texImage2D__uint_int_int_int_int_int_uint_uint_ArrayBufferView_uint(Handle, uint, int, int, int, int, int, uint, uint, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_long(Handle, uint, int, int, int, int, int, int, uint, uint, long);
extern (C) void WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_TexImageSource(Handle, uint, int, int, int, int, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_optional_ArrayBufferView(Handle, uint, int, int, int, int, int, int, uint, uint, bool, ArrayBufferView);
extern (C) void WebGL2RenderingContextBase_texImage3D__uint_int_int_int_int_int_int_uint_uint_ArrayBufferView_uint(Handle, uint, int, int, int, int, int, int, uint, uint, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_long(Handle, uint, int, int, int, int, int, uint, uint, long);
extern (C) void WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_TexImageSource(Handle, uint, int, int, int, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texSubImage2D__uint_int_int_int_int_int_uint_uint_ArrayBufferView_uint(Handle, uint, int, int, int, int, int, uint, uint, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_long(Handle, uint, int, int, int, int, int, int, int, uint, uint, long);
extern (C) void WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_TexImageSource(Handle, uint, int, int, int, int, int, int, int, uint, uint, TexImageSource);
extern (C) void WebGL2RenderingContextBase_texSubImage3D__uint_int_int_int_int_int_int_int_uint_uint_optional_ArrayBufferView_uint(Handle, uint, int, int, int, int, int, int, int, uint, uint, bool, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_copyTexSubImage3D(Handle, uint, int, int, int, int, int, int, int, int);
extern (C) void WebGL2RenderingContextBase_compressedTexImage2D__uint_int_uint_int_int_int_long(Handle, uint, int, uint, int, int, int, long);
extern (C) void WebGL2RenderingContextBase_compressedTexImage2D__uint_int_uint_int_int_int_ArrayBufferView_uint_uint(Handle, uint, int, uint, int, int, int, ArrayBufferView, uint, uint);
extern (C) void WebGL2RenderingContextBase_compressedTexImage3D__uint_int_uint_int_int_int_int_long(Handle, uint, int, uint, int, int, int, int, long);
extern (C) void WebGL2RenderingContextBase_compressedTexImage3D__uint_int_uint_int_int_int_int_ArrayBufferView_uint_uint(Handle, uint, int, uint, int, int, int, int, ArrayBufferView, uint, uint);
extern (C) void WebGL2RenderingContextBase_compressedTexSubImage2D__uint_int_int_int_int_int_uint_long(Handle, uint, int, int, int, int, int, uint, long);
extern (C) void WebGL2RenderingContextBase_compressedTexSubImage2D__uint_int_int_int_int_int_uint_ArrayBufferView_uint_uint(Handle, uint, int, int, int, int, int, uint, ArrayBufferView, uint, uint);
extern (C) void WebGL2RenderingContextBase_compressedTexSubImage3D__uint_int_int_int_int_int_int_int_uint_long(Handle, uint, int, int, int, int, int, int, int, uint, long);
extern (C) void WebGL2RenderingContextBase_compressedTexSubImage3D__uint_int_int_int_int_int_int_int_uint_ArrayBufferView_uint_uint(Handle, uint, int, int, int, int, int, int, int, uint, ArrayBufferView, uint, uint);
extern (C) int WebGL2RenderingContextBase_getFragDataLocation(Handle, Handle, string);
extern (C) void WebGL2RenderingContextBase_uniform1ui(Handle, bool, Handle, uint);
extern (C) void WebGL2RenderingContextBase_uniform2ui(Handle, bool, Handle, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform3ui(Handle, bool, Handle, uint, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform4ui(Handle, bool, Handle, uint, uint, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform1fv(Handle, bool, Handle, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform2fv(Handle, bool, Handle, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform3fv(Handle, bool, Handle, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform4fv(Handle, bool, Handle, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform1iv(Handle, bool, Handle, Int32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform2iv(Handle, bool, Handle, Int32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform3iv(Handle, bool, Handle, Int32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform4iv(Handle, bool, Handle, Int32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform1uiv(Handle, bool, Handle, Uint32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform2uiv(Handle, bool, Handle, Uint32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform3uiv(Handle, bool, Handle, Uint32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniform4uiv(Handle, bool, Handle, Uint32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix2fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix3x2fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix4x2fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix2x3fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix3fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix4x3fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix2x4fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix3x4fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_uniformMatrix4fv(Handle, bool, Handle, bool, Float32List, uint, uint);
extern (C) void WebGL2RenderingContextBase_vertexAttribI4i(Handle, uint, int, int, int, int);
extern (C) void WebGL2RenderingContextBase_vertexAttribI4iv(Handle, uint, Int32List);
extern (C) void WebGL2RenderingContextBase_vertexAttribI4ui(Handle, uint, uint, uint, uint, uint);
extern (C) void WebGL2RenderingContextBase_vertexAttribI4uiv(Handle, uint, Uint32List);
extern (C) void WebGL2RenderingContextBase_vertexAttribIPointer(Handle, uint, int, uint, int, long);
extern (C) void WebGL2RenderingContextBase_vertexAttribDivisor(Handle, uint, uint);
extern (C) void WebGL2RenderingContextBase_drawArraysInstanced(Handle, uint, int, int, int);
extern (C) void WebGL2RenderingContextBase_drawElementsInstanced(Handle, uint, int, uint, long, int);
extern (C) void WebGL2RenderingContextBase_drawRangeElements(Handle, uint, uint, uint, int, uint, long);
extern (C) void WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_optional_ArrayBufferView(Handle, int, int, int, int, uint, uint, bool, ArrayBufferView);
extern (C) void WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_long(Handle, int, int, int, int, uint, uint, long);
extern (C) void WebGL2RenderingContextBase_readPixels__int_int_int_int_uint_uint_ArrayBufferView_uint(Handle, int, int, int, int, uint, uint, ArrayBufferView, uint);
extern (C) void WebGL2RenderingContextBase_drawBuffers(Handle, Handle);
extern (C) void WebGL2RenderingContextBase_clearBufferfv(Handle, uint, int, Float32List, uint);
extern (C) void WebGL2RenderingContextBase_clearBufferiv(Handle, uint, int, Int32List, uint);
extern (C) void WebGL2RenderingContextBase_clearBufferuiv(Handle, uint, int, Uint32List, uint);
extern (C) void WebGL2RenderingContextBase_clearBufferfi(Handle, uint, int, float, int);
extern (C) Optional!(WebGLQuery) WebGL2RenderingContextBase_createQuery(Handle);
extern (C) void WebGL2RenderingContextBase_deleteQuery(Handle, bool, Handle);
extern (C) bool WebGL2RenderingContextBase_isQuery(Handle, bool, Handle);
extern (C) void WebGL2RenderingContextBase_beginQuery(Handle, uint, Handle);
extern (C) void WebGL2RenderingContextBase_endQuery(Handle, uint);
extern (C) Optional!(WebGLQuery) WebGL2RenderingContextBase_getQuery(Handle, uint, uint);
extern (C) Handle WebGL2RenderingContextBase_getQueryParameter(Handle, Handle, uint);
extern (C) Optional!(WebGLSampler) WebGL2RenderingContextBase_createSampler(Handle);
extern (C) void WebGL2RenderingContextBase_deleteSampler(Handle, bool, Handle);
extern (C) bool WebGL2RenderingContextBase_isSampler(Handle, bool, Handle);
extern (C) void WebGL2RenderingContextBase_bindSampler(Handle, uint, bool, Handle);
extern (C) void WebGL2RenderingContextBase_samplerParameteri(Handle, Handle, uint, int);
extern (C) void WebGL2RenderingContextBase_samplerParameterf(Handle, Handle, uint, float);
extern (C) Handle WebGL2RenderingContextBase_getSamplerParameter(Handle, Handle, uint);
extern (C) Optional!(WebGLSync) WebGL2RenderingContextBase_fenceSync(Handle, uint, uint);
extern (C) bool WebGL2RenderingContextBase_isSync(Handle, bool, Handle);
extern (C) void WebGL2RenderingContextBase_deleteSync(Handle, bool, Handle);
extern (C) uint WebGL2RenderingContextBase_clientWaitSync(Handle, Handle, uint, ulong);
extern (C) void WebGL2RenderingContextBase_waitSync(Handle, Handle, uint, long);
extern (C) Handle WebGL2RenderingContextBase_getSyncParameter(Handle, Handle, uint);
extern (C) Optional!(WebGLTransformFeedback) WebGL2RenderingContextBase_createTransformFeedback(Handle);
extern (C) void WebGL2RenderingContextBase_deleteTransformFeedback(Handle, bool, Handle);
extern (C) bool WebGL2RenderingContextBase_isTransformFeedback(Handle, bool, Handle);
extern (C) void WebGL2RenderingContextBase_bindTransformFeedback(Handle, uint, bool, Handle);
extern (C) void WebGL2RenderingContextBase_beginTransformFeedback(Handle, uint);
extern (C) void WebGL2RenderingContextBase_endTransformFeedback(Handle);
extern (C) void WebGL2RenderingContextBase_transformFeedbackVaryings(Handle, Handle, Handle, uint);
extern (C) Optional!(WebGLActiveInfo) WebGL2RenderingContextBase_getTransformFeedbackVarying(Handle, Handle, uint);
extern (C) void WebGL2RenderingContextBase_pauseTransformFeedback(Handle);
extern (C) void WebGL2RenderingContextBase_resumeTransformFeedback(Handle);
extern (C) void WebGL2RenderingContextBase_bindBufferBase(Handle, uint, uint, bool, Handle);
extern (C) void WebGL2RenderingContextBase_bindBufferRange(Handle, uint, uint, bool, Handle, long, long);
extern (C) Handle WebGL2RenderingContextBase_getIndexedParameter(Handle, uint, uint);
extern (C) Optional!(Sequence!(uint)) WebGL2RenderingContextBase_getUniformIndices(Handle, Handle, Handle);
extern (C) Handle WebGL2RenderingContextBase_getActiveUniforms(Handle, Handle, Handle, uint);
extern (C) uint WebGL2RenderingContextBase_getUniformBlockIndex(Handle, Handle, string);
extern (C) Handle WebGL2RenderingContextBase_getActiveUniformBlockParameter(Handle, Handle, uint, uint);
extern (C) Optional!(string) WebGL2RenderingContextBase_getActiveUniformBlockName(Handle, Handle, uint);
extern (C) void WebGL2RenderingContextBase_uniformBlockBinding(Handle, Handle, uint, uint);
extern (C) Optional!(WebGLVertexArrayObject) WebGL2RenderingContextBase_createVertexArray(Handle);
extern (C) void WebGL2RenderingContextBase_deleteVertexArray(Handle, bool, Handle);
extern (C) bool WebGL2RenderingContextBase_isVertexArray(Handle, bool, Handle);
extern (C) void WebGL2RenderingContextBase_bindVertexArray(Handle, bool, Handle);