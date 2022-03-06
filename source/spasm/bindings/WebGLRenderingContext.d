module spasm.bindings.WebGLRenderingContext;

import spasm.types;
import spasm.bindings.HTMLCanvasElement;
import spasm.bindings.HTMLImageElement;
import spasm.bindings.HTMLVideoElement;
import spasm.bindings.ImageBitmap;
import spasm.bindings.ImageData;
import spasm.bindings.OffscreenCanvas;

@safe:
nothrow:

struct ANGLE_instanced_arrays {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE = 0x88FE;
  void drawArraysInstancedANGLE()(uint mode, int first, int count, int primcount) {
    ANGLE_instanced_arrays_drawArraysInstancedANGLE(this.handle, mode, first, count, primcount);
  }
  void drawElementsInstancedANGLE()(uint mode, int count, uint type, int offset, int primcount) {
    ANGLE_instanced_arrays_drawElementsInstancedANGLE(this.handle, mode, count, type, offset, primcount);
  }
  void vertexAttribDivisorANGLE()(uint index, uint divisor) {
    ANGLE_instanced_arrays_vertexAttribDivisorANGLE(this.handle, index, divisor);
  }
}
struct EXT_blend_minmax {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint MIN_EXT = 0x8007;
  enum uint MAX_EXT = 0x8008;
}
struct EXT_color_buffer_half_float {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint RGBA16F_EXT = 0x881A;
  enum uint RGB16F_EXT = 0x881B;
  enum uint FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT = 0x8211;
  enum uint UNSIGNED_NORMALIZED_EXT = 0x8C17;
}
struct EXT_disjoint_timer_query {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint QUERY_COUNTER_BITS_EXT = 0x8864;
  enum uint CURRENT_QUERY_EXT = 0x8865;
  enum uint QUERY_RESULT_EXT = 0x8866;
  enum uint QUERY_RESULT_AVAILABLE_EXT = 0x8867;
  enum uint TIME_ELAPSED_EXT = 0x88BF;
  enum uint TIMESTAMP_EXT = 0x8E28;
  enum uint GPU_DISJOINT_EXT = 0x8FBB;
  auto createQueryEXT()() {
    return Object_Getter__OptionalHandle(this.handle, "createQueryEXT");
  }
  void deleteQueryEXT(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    EXT_disjoint_timer_query_deleteQueryEXT(this.handle, !query.empty, query.front.handle);
  }
  bool isQueryEXT(T0)(scope auto ref Optional!(T0) query) if (isTOrPointer!(T0, WebGLQuery)) {
    return EXT_disjoint_timer_query_isQueryEXT(this.handle, !query.empty, query.front.handle);
  }
  void beginQueryEXT()(uint target, scope ref WebGLQuery query) {
    EXT_disjoint_timer_query_beginQueryEXT(this.handle, target, query.handle);
  }
  void endQueryEXT()(uint target) {
    Object_Call_uint__void(this.handle, "endQueryEXT", target);
  }
  void queryCounterEXT()(scope ref WebGLQuery query, uint target) {
    EXT_disjoint_timer_query_queryCounterEXT(this.handle, query.handle, target);
  }
  auto getQueryEXT()(uint target, uint pname) {
    return Any(EXT_disjoint_timer_query_getQueryEXT(this.handle, target, pname));
  }
  auto getQueryObjectEXT()(scope ref WebGLQuery query, uint pname) {
    return Any(EXT_disjoint_timer_query_getQueryObjectEXT(this.handle, query.handle, pname));
  }
}
struct EXT_float_blend {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct EXT_frag_depth {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct EXT_sRGB {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint SRGB_EXT = 0x8C40;
  enum uint SRGB_ALPHA_EXT = 0x8C42;
  enum uint SRGB8_ALPHA8_EXT = 0x8C43;
  enum uint FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT = 0x8210;
}
struct EXT_shader_texture_lod {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct EXT_texture_compression_bptc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RGBA_BPTC_UNORM_EXT = 0x8E8C;
  enum uint COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT = 0x8E8D;
  enum uint COMPRESSED_RGB_BPTC_SIGNED_FLOAT_EXT = 0x8E8E;
  enum uint COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_EXT = 0x8E8F;
}
struct EXT_texture_compression_rgtc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RED_RGTC1_EXT = 0x8DBB;
  enum uint COMPRESSED_SIGNED_RED_RGTC1_EXT = 0x8DBC;
  enum uint COMPRESSED_RED_GREEN_RGTC2_EXT = 0x8DBD;
  enum uint COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT = 0x8DBE;
}
struct EXT_texture_filter_anisotropic {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint TEXTURE_MAX_ANISOTROPY_EXT = 0x84FE;
  enum uint MAX_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FF;
}
alias Float32List = SumType!(Float32Array, Sequence!(float));
alias GLbitfield = uint;
alias GLboolean = bool;
alias GLbyte = byte;
alias GLclampf = float;
alias GLenum = uint;
alias GLfloat = float;
alias GLint = int;
alias GLintptr = int;
alias GLshort = short;
alias GLsizei = int;
alias GLsizeiptr = int;
alias GLubyte = ubyte;
alias GLuint = uint;
alias GLuint64EXT = uint;
alias GLushort = ushort;
alias Int32List = SumType!(Int32Array, Sequence!(int));
struct MOZ_debug {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint EXTENSIONS = 0x1F03;
  enum uint WSI_INFO = 0x10000;
  enum uint UNPACK_REQUIRE_FASTPATH = 0x10001;
  enum uint DOES_INDEX_VALIDATION = 0x10002;
  auto getParameter()(uint pname) {
    return Any(Object_Call_uint__Handle(this.handle, "getParameter", pname));
  }
}
struct OES_element_index_uint {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct OES_fbo_render_mipmap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct OES_standard_derivatives {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint FRAGMENT_SHADER_DERIVATIVE_HINT_OES = 0x8B8B;
}
struct OES_texture_float {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct OES_texture_float_linear {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct OES_texture_half_float {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint HALF_FLOAT_OES = 0x8D61;
}
struct OES_texture_half_float_linear {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct OES_vertex_array_object {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint VERTEX_ARRAY_BINDING_OES = 0x85B5;
  auto createVertexArrayOES()() {
    return Object_Getter__OptionalHandle(this.handle, "createVertexArrayOES");
  }
  void deleteVertexArrayOES(T0)(scope auto ref Optional!(T0) arrayObject) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    OES_vertex_array_object_deleteVertexArrayOES(this.handle, !arrayObject.empty, arrayObject.front.handle);
  }
  bool isVertexArrayOES(T0)(scope auto ref Optional!(T0) arrayObject) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    return OES_vertex_array_object_isVertexArrayOES(this.handle, !arrayObject.empty, arrayObject.front.handle);
  }
  void bindVertexArrayOES(T0)(scope auto ref Optional!(T0) arrayObject) if (isTOrPointer!(T0, WebGLVertexArrayObject)) {
    OES_vertex_array_object_bindVertexArrayOES(this.handle, !arrayObject.empty, arrayObject.front.handle);
  }
}
struct WEBGL_color_buffer_float {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint RGBA32F_EXT = 0x8814;
  enum uint RGB32F_EXT = 0x8815;
  enum uint FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT = 0x8211;
  enum uint UNSIGNED_NORMALIZED_EXT = 0x8C17;
}
struct WEBGL_compressed_texture_astc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RGBA_ASTC_4x4_KHR = 0x93B0;
  enum uint COMPRESSED_RGBA_ASTC_5x4_KHR = 0x93B1;
  enum uint COMPRESSED_RGBA_ASTC_5x5_KHR = 0x93B2;
  enum uint COMPRESSED_RGBA_ASTC_6x5_KHR = 0x93B3;
  enum uint COMPRESSED_RGBA_ASTC_6x6_KHR = 0x93B4;
  enum uint COMPRESSED_RGBA_ASTC_8x5_KHR = 0x93B5;
  enum uint COMPRESSED_RGBA_ASTC_8x6_KHR = 0x93B6;
  enum uint COMPRESSED_RGBA_ASTC_8x8_KHR = 0x93B7;
  enum uint COMPRESSED_RGBA_ASTC_10x5_KHR = 0x93B8;
  enum uint COMPRESSED_RGBA_ASTC_10x6_KHR = 0x93B9;
  enum uint COMPRESSED_RGBA_ASTC_10x8_KHR = 0x93BA;
  enum uint COMPRESSED_RGBA_ASTC_10x10_KHR = 0x93BB;
  enum uint COMPRESSED_RGBA_ASTC_12x10_KHR = 0x93BC;
  enum uint COMPRESSED_RGBA_ASTC_12x12_KHR = 0x93BD;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR = 0x93D0;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR = 0x93D1;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR = 0x93D2;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR = 0x93D3;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR = 0x93D4;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR = 0x93D5;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR = 0x93D6;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR = 0x93D7;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR = 0x93D8;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR = 0x93D9;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR = 0x93DA;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR = 0x93DB;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR = 0x93DC;
  enum uint COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR = 0x93DD;
  auto getSupportedProfiles()() {
    return Object_Getter__OptionalHandle(this.handle, "getSupportedProfiles");
  }
}
struct WEBGL_compressed_texture_etc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_R11_EAC = 0x9270;
  enum uint COMPRESSED_SIGNED_R11_EAC = 0x9271;
  enum uint COMPRESSED_RG11_EAC = 0x9272;
  enum uint COMPRESSED_SIGNED_RG11_EAC = 0x9273;
  enum uint COMPRESSED_RGB8_ETC2 = 0x9274;
  enum uint COMPRESSED_SRGB8_ETC2 = 0x9275;
  enum uint COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276;
  enum uint COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277;
  enum uint COMPRESSED_RGBA8_ETC2_EAC = 0x9278;
  enum uint COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279;
}
struct WEBGL_compressed_texture_etc1 {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RGB_ETC1_WEBGL = 0x8D64;
}
struct WEBGL_compressed_texture_pvrtc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RGB_PVRTC_4BPPV1_IMG = 0x8C00;
  enum uint COMPRESSED_RGB_PVRTC_2BPPV1_IMG = 0x8C01;
  enum uint COMPRESSED_RGBA_PVRTC_4BPPV1_IMG = 0x8C02;
  enum uint COMPRESSED_RGBA_PVRTC_2BPPV1_IMG = 0x8C03;
}
struct WEBGL_compressed_texture_s3tc {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_RGB_S3TC_DXT1_EXT = 0x83F0;
  enum uint COMPRESSED_RGBA_S3TC_DXT1_EXT = 0x83F1;
  enum uint COMPRESSED_RGBA_S3TC_DXT3_EXT = 0x83F2;
  enum uint COMPRESSED_RGBA_S3TC_DXT5_EXT = 0x83F3;
}
struct WEBGL_compressed_texture_s3tc_srgb {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COMPRESSED_SRGB_S3TC_DXT1_EXT = 0x8C4C;
  enum uint COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = 0x8C4D;
  enum uint COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = 0x8C4E;
  enum uint COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = 0x8C4F;
}
struct WEBGL_debug_renderer_info {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint UNMASKED_VENDOR_WEBGL = 0x9245;
  enum uint UNMASKED_RENDERER_WEBGL = 0x9246;
}
struct WEBGL_debug_shaders {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string getTranslatedShaderSource()(scope ref WebGLShader shader) {
    return WEBGL_debug_shaders_getTranslatedShaderSource(this.handle, shader.handle);
  }
}
struct WEBGL_depth_texture {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint UNSIGNED_INT_24_8_WEBGL = 0x84FA;
}
struct WEBGL_draw_buffers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum uint COLOR_ATTACHMENT0_WEBGL = 0x8CE0;
  enum uint COLOR_ATTACHMENT1_WEBGL = 0x8CE1;
  enum uint COLOR_ATTACHMENT2_WEBGL = 0x8CE2;
  enum uint COLOR_ATTACHMENT3_WEBGL = 0x8CE3;
  enum uint COLOR_ATTACHMENT4_WEBGL = 0x8CE4;
  enum uint COLOR_ATTACHMENT5_WEBGL = 0x8CE5;
  enum uint COLOR_ATTACHMENT6_WEBGL = 0x8CE6;
  enum uint COLOR_ATTACHMENT7_WEBGL = 0x8CE7;
  enum uint COLOR_ATTACHMENT8_WEBGL = 0x8CE8;
  enum uint COLOR_ATTACHMENT9_WEBGL = 0x8CE9;
  enum uint COLOR_ATTACHMENT10_WEBGL = 0x8CEA;
  enum uint COLOR_ATTACHMENT11_WEBGL = 0x8CEB;
  enum uint COLOR_ATTACHMENT12_WEBGL = 0x8CEC;
  enum uint COLOR_ATTACHMENT13_WEBGL = 0x8CED;
  enum uint COLOR_ATTACHMENT14_WEBGL = 0x8CEE;
  enum uint COLOR_ATTACHMENT15_WEBGL = 0x8CEF;
  enum uint DRAW_BUFFER0_WEBGL = 0x8825;
  enum uint DRAW_BUFFER1_WEBGL = 0x8826;
  enum uint DRAW_BUFFER2_WEBGL = 0x8827;
  enum uint DRAW_BUFFER3_WEBGL = 0x8828;
  enum uint DRAW_BUFFER4_WEBGL = 0x8829;
  enum uint DRAW_BUFFER5_WEBGL = 0x882A;
  enum uint DRAW_BUFFER6_WEBGL = 0x882B;
  enum uint DRAW_BUFFER7_WEBGL = 0x882C;
  enum uint DRAW_BUFFER8_WEBGL = 0x882D;
  enum uint DRAW_BUFFER9_WEBGL = 0x882E;
  enum uint DRAW_BUFFER10_WEBGL = 0x882F;
  enum uint DRAW_BUFFER11_WEBGL = 0x8830;
  enum uint DRAW_BUFFER12_WEBGL = 0x8831;
  enum uint DRAW_BUFFER13_WEBGL = 0x8832;
  enum uint DRAW_BUFFER14_WEBGL = 0x8833;
  enum uint DRAW_BUFFER15_WEBGL = 0x8834;
  enum uint MAX_COLOR_ATTACHMENTS_WEBGL = 0x8CDF;
  enum uint MAX_DRAW_BUFFERS_WEBGL = 0x8824;
  void drawBuffersWEBGL()(scope ref Sequence!(uint) buffers) {
    Object_Call_Handle__void(this.handle, "drawBuffersWEBGL", buffers.handle);
  }
}
struct WEBGL_lose_context {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void loseContext()() {
    Object_Call__void(this.handle, "loseContext");
  }
  void restoreContext()() {
    Object_Call__void(this.handle, "restoreContext");
  }
}
struct WebGLActiveInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int size()() {
    return Object_Getter__int(this.handle, "size");
  }
  uint type()() {
    return Object_Getter__uint(this.handle, "type");
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}
struct WebGLBuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLContextAttributes {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WebGLContextAttributes(spasm_add__object());
  }
  void alpha()(bool alpha) {
    Object_Call_bool__void(this.handle, "alpha", alpha);
  }
  bool alpha()() {
    return Object_Getter__bool(this.handle, "alpha");
  }
  void depth()(bool depth) {
    Object_Call_bool__void(this.handle, "depth", depth);
  }
  bool depth()() {
    return Object_Getter__bool(this.handle, "depth");
  }
  void stencil()(bool stencil) {
    Object_Call_bool__void(this.handle, "stencil", stencil);
  }
  bool stencil()() {
    return Object_Getter__bool(this.handle, "stencil");
  }
  void antialias()(bool antialias) {
    Object_Call_bool__void(this.handle, "antialias", antialias);
  }
  bool antialias()() {
    return Object_Getter__bool(this.handle, "antialias");
  }
  void premultipliedAlpha()(bool premultipliedAlpha) {
    Object_Call_bool__void(this.handle, "premultipliedAlpha", premultipliedAlpha);
  }
  bool premultipliedAlpha()() {
    return Object_Getter__bool(this.handle, "premultipliedAlpha");
  }
  void preserveDrawingBuffer()(bool preserveDrawingBuffer) {
    Object_Call_bool__void(this.handle, "preserveDrawingBuffer", preserveDrawingBuffer);
  }
  bool preserveDrawingBuffer()() {
    return Object_Getter__bool(this.handle, "preserveDrawingBuffer");
  }
  void failIfMajorPerformanceCaveat()(bool failIfMajorPerformanceCaveat) {
    Object_Call_bool__void(this.handle, "failIfMajorPerformanceCaveat", failIfMajorPerformanceCaveat);
  }
  bool failIfMajorPerformanceCaveat()() {
    return Object_Getter__bool(this.handle, "failIfMajorPerformanceCaveat");
  }
  void powerPreference()(WebGLPowerPreference powerPreference) {
    WebGLContextAttributes_powerPreference_Set(this.handle, powerPreference);
  }
  WebGLPowerPreference powerPreference()() {
    return WebGLContextAttributes_powerPreference_Get(this.handle);
  }
}
struct WebGLFramebuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
enum WebGLPowerPreference {
  default_,
  low_power,
  high_performance
}
struct WebGLProgram {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLQuery {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLRenderbuffer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLRenderingContext {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void bufferData()(uint target, int size, uint usage) {
    WebGLRenderingContext_bufferData__uint_int_uint(this.handle, target, size, usage);
  }
  void bufferData(T1)(uint target, scope auto ref Optional!(T1) data, uint usage) if (isTOrPointer!(T1, ArrayBuffer)) {
    WebGLRenderingContext_bufferData__uint_optional_Handle_uint(this.handle, target, !data.empty, data.front.handle, usage);
  }
  void bufferData()(uint target, scope ref ArrayBufferView data, uint usage) {
    WebGLRenderingContext_bufferData__uint_Handle_uint(this.handle, target, data.handle, usage);
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBuffer data) {
    WebGLRenderingContext_bufferSubData__uint_int_Handle(this.handle, target, offset, data.handle);
  }
  void bufferSubData()(uint target, int offset, scope ref ArrayBufferView data) {
    WebGLRenderingContext_bufferSubData__uint_int_Handle(this.handle, target, offset, data.handle);
  }
  void compressedTexImage2D()(uint target, int level, uint internalformat, int width, int height, int border, scope ref ArrayBufferView data) {
    WebGLRenderingContext_compressedTexImage2D(this.handle, target, level, internalformat, width, height, border, data.handle);
  }
  void compressedTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, scope ref ArrayBufferView data) {
    WebGLRenderingContext_compressedTexSubImage2D(this.handle, target, level, xoffset, yoffset, width, height, format, data.handle);
  }
  void readPixels(T6)(int x, int y, int width, int height, uint format, uint type, scope auto ref Optional!(T6) pixels) if (isTOrPointer!(T6, ArrayBufferView)) {
    WebGLRenderingContext_readPixels(this.handle, x, y, width, height, format, type, !pixels.empty, pixels.front.handle);
  }
  void texImage2D(T8)(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    WebGLRenderingContext_texImage2D__uint_int_int_int_int_int_uint_uint_optional_Handle(this.handle, target, level, internalformat, width, height, border, format, type, !pixels.empty, pixels.front.handle);
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageBitmap pixels) {
    WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(this.handle, target, level, internalformat, format, type, pixels.handle);
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref ImageData pixels) {
    WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(this.handle, target, level, internalformat, format, type, pixels.handle);
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLImageElement image) {
    WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(this.handle, target, level, internalformat, format, type, image._parent);
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLCanvasElement canvas) {
    WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(this.handle, target, level, internalformat, format, type, canvas._parent);
  }
  void texImage2D()(uint target, int level, int internalformat, uint format, uint type, scope ref HTMLVideoElement video) {
    WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(this.handle, target, level, internalformat, format, type, video._parent);
  }
  void texSubImage2D(T8)(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, scope auto ref Optional!(T8) pixels) if (isTOrPointer!(T8, ArrayBufferView)) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_int_int_uint_uint_optional_Handle(this.handle, target, level, xoffset, yoffset, width, height, format, type, !pixels.empty, pixels.front.handle);
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageBitmap pixels) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(this.handle, target, level, xoffset, yoffset, format, type, pixels.handle);
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref ImageData pixels) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(this.handle, target, level, xoffset, yoffset, format, type, pixels.handle);
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLImageElement image) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(this.handle, target, level, xoffset, yoffset, format, type, image._parent);
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLCanvasElement canvas) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(this.handle, target, level, xoffset, yoffset, format, type, canvas._parent);
  }
  void texSubImage2D()(uint target, int level, int xoffset, int yoffset, uint format, uint type, scope ref HTMLVideoElement video) {
    WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(this.handle, target, level, xoffset, yoffset, format, type, video._parent);
  }
  void uniform1fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform1fv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform2fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform2fv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform3fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform3fv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform4fv(T0)(scope auto ref Optional!(T0) location, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform4fv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform1iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform1iv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform2iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform2iv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform3iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform3iv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniform4iv(T0)(scope auto ref Optional!(T0) location, scope ref Int32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniform4iv(this.handle, !location.empty, location.front.handle, data);
  }
  void uniformMatrix2fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniformMatrix2fv(this.handle, !location.empty, location.front.handle, transpose, data);
  }
  void uniformMatrix3fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniformMatrix3fv(this.handle, !location.empty, location.front.handle, transpose, data);
  }
  void uniformMatrix4fv(T0)(scope auto ref Optional!(T0) location, bool transpose, scope ref Float32List data) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContext_uniformMatrix4fv(this.handle, !location.empty, location.front.handle, transpose, data);
  }
  void commit()() {
    Object_Call__void(this.handle, "commit");
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
    return Object_Getter__OptionalHandle(this.handle, "getContextAttributes");
  }
  bool isContextLost()() {
    return Object_Getter__bool(this.handle, "isContextLost");
  }
  auto getSupportedExtensions()() {
    return Object_Getter__OptionalHandle(this.handle, "getSupportedExtensions");
  }
  auto getExtension()(string name) {
    return Object_Call_string__OptionalHandle(this.handle, "getExtension", name);
  }
  void activeTexture()(uint texture) {
    Object_Call_uint__void(this.handle, "activeTexture", texture);
  }
  void attachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    WebGLRenderingContextBase_attachShader(this.handle, program.handle, shader.handle);
  }
  void bindAttribLocation()(scope ref WebGLProgram program, uint index, string name) {
    WebGLRenderingContextBase_bindAttribLocation(this.handle, program.handle, index, name);
  }
  void bindBuffer(T1)(uint target, scope auto ref Optional!(T1) buffer) if (isTOrPointer!(T1, WebGLBuffer)) {
    WebGLRenderingContextBase_bindBuffer(this.handle, target, !buffer.empty, buffer.front.handle);
  }
  void bindFramebuffer(T1)(uint target, scope auto ref Optional!(T1) framebuffer) if (isTOrPointer!(T1, WebGLFramebuffer)) {
    WebGLRenderingContextBase_bindFramebuffer(this.handle, target, !framebuffer.empty, framebuffer.front.handle);
  }
  void bindRenderbuffer(T1)(uint target, scope auto ref Optional!(T1) renderbuffer) if (isTOrPointer!(T1, WebGLRenderbuffer)) {
    WebGLRenderingContextBase_bindRenderbuffer(this.handle, target, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void bindTexture(T1)(uint target, scope auto ref Optional!(T1) texture) if (isTOrPointer!(T1, WebGLTexture)) {
    WebGLRenderingContextBase_bindTexture(this.handle, target, !texture.empty, texture.front.handle);
  }
  void blendColor()(float red, float green, float blue, float alpha) {
    WebGLRenderingContextBase_blendColor(this.handle, red, green, blue, alpha);
  }
  void blendEquation()(uint mode) {
    Object_Call_uint__void(this.handle, "blendEquation", mode);
  }
  void blendEquationSeparate()(uint modeRGB, uint modeAlpha) {
    WebGLRenderingContextBase_blendEquationSeparate(this.handle, modeRGB, modeAlpha);
  }
  void blendFunc()(uint sfactor, uint dfactor) {
    WebGLRenderingContextBase_blendFunc(this.handle, sfactor, dfactor);
  }
  void blendFuncSeparate()(uint srcRGB, uint dstRGB, uint srcAlpha, uint dstAlpha) {
    WebGLRenderingContextBase_blendFuncSeparate(this.handle, srcRGB, dstRGB, srcAlpha, dstAlpha);
  }
  uint checkFramebufferStatus()(uint target) {
    return WebGLRenderingContextBase_checkFramebufferStatus(this.handle, target);
  }
  void clear()(uint mask) {
    Object_Call_uint__void(this.handle, "clear", mask);
  }
  void clearColor()(float red, float green, float blue, float alpha) {
    WebGLRenderingContextBase_clearColor(this.handle, red, green, blue, alpha);
  }
  void clearDepth()(float depth) {
    Object_Call_float__void(this.handle, "clearDepth", depth);
  }
  void clearStencil()(int s) {
    Object_Call_int__void(this.handle, "clearStencil", s);
  }
  void colorMask()(bool red, bool green, bool blue, bool alpha) {
    WebGLRenderingContextBase_colorMask(this.handle, red, green, blue, alpha);
  }
  void compileShader()(scope ref WebGLShader shader) {
    Object_Call_Handle__void(this.handle, "compileShader", shader.handle);
  }
  void copyTexImage2D()(uint target, int level, uint internalformat, int x, int y, int width, int height, int border) {
    WebGLRenderingContextBase_copyTexImage2D(this.handle, target, level, internalformat, x, y, width, height, border);
  }
  void copyTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height) {
    WebGLRenderingContextBase_copyTexSubImage2D(this.handle, target, level, xoffset, yoffset, x, y, width, height);
  }
  auto createBuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createBuffer");
  }
  auto createFramebuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createFramebuffer");
  }
  auto createProgram()() {
    return Object_Getter__OptionalHandle(this.handle, "createProgram");
  }
  auto createRenderbuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createRenderbuffer");
  }
  auto createShader()(uint type) {
    return Object_Call_uint__OptionalHandle(this.handle, "createShader", type);
  }
  auto createTexture()() {
    return Object_Getter__OptionalHandle(this.handle, "createTexture");
  }
  void cullFace()(uint mode) {
    Object_Call_uint__void(this.handle, "cullFace", mode);
  }
  void deleteBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    WebGLRenderingContextBase_deleteBuffer(this.handle, !buffer.empty, buffer.front.handle);
  }
  void deleteFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    WebGLRenderingContextBase_deleteFramebuffer(this.handle, !framebuffer.empty, framebuffer.front.handle);
  }
  void deleteProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    WebGLRenderingContextBase_deleteProgram(this.handle, !program.empty, program.front.handle);
  }
  void deleteRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    WebGLRenderingContextBase_deleteRenderbuffer(this.handle, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void deleteShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    WebGLRenderingContextBase_deleteShader(this.handle, !shader.empty, shader.front.handle);
  }
  void deleteTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    WebGLRenderingContextBase_deleteTexture(this.handle, !texture.empty, texture.front.handle);
  }
  void depthFunc()(uint func) {
    Object_Call_uint__void(this.handle, "depthFunc", func);
  }
  void depthMask()(bool flag) {
    Object_Call_bool__void(this.handle, "depthMask", flag);
  }
  void depthRange()(float zNear, float zFar) {
    WebGLRenderingContextBase_depthRange(this.handle, zNear, zFar);
  }
  void detachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    WebGLRenderingContextBase_detachShader(this.handle, program.handle, shader.handle);
  }
  void disable()(uint cap) {
    Object_Call_uint__void(this.handle, "disable", cap);
  }
  void disableVertexAttribArray()(uint index) {
    Object_Call_uint__void(this.handle, "disableVertexAttribArray", index);
  }
  void drawArrays()(uint mode, int first, int count) {
    WebGLRenderingContextBase_drawArrays(this.handle, mode, first, count);
  }
  void drawElements()(uint mode, int count, uint type, int offset) {
    WebGLRenderingContextBase_drawElements(this.handle, mode, count, type, offset);
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
    WebGLRenderingContextBase_framebufferRenderbuffer(this.handle, target, attachment, renderbuffertarget, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void framebufferTexture2D(T3)(uint target, uint attachment, uint textarget, scope auto ref Optional!(T3) texture, int level) if (isTOrPointer!(T3, WebGLTexture)) {
    WebGLRenderingContextBase_framebufferTexture2D(this.handle, target, attachment, textarget, !texture.empty, texture.front.handle, level);
  }
  void frontFace()(uint mode) {
    Object_Call_uint__void(this.handle, "frontFace", mode);
  }
  void generateMipmap()(uint target) {
    Object_Call_uint__void(this.handle, "generateMipmap", target);
  }
  auto getActiveAttrib()(scope ref WebGLProgram program, uint index) {
    return WebGLRenderingContextBase_getActiveAttrib(this.handle, program.handle, index);
  }
  auto getActiveUniform()(scope ref WebGLProgram program, uint index) {
    return WebGLRenderingContextBase_getActiveUniform(this.handle, program.handle, index);
  }
  auto getAttachedShaders()(scope ref WebGLProgram program) {
    return WebGLRenderingContextBase_getAttachedShaders(this.handle, program.handle);
  }
  int getAttribLocation()(scope ref WebGLProgram program, string name) {
    return WebGLRenderingContextBase_getAttribLocation(this.handle, program.handle, name);
  }
  auto getBufferParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getBufferParameter(this.handle, target, pname));
  }
  auto getParameter()(uint pname) {
    return Any(Object_Call_uint__Handle(this.handle, "getParameter", pname));
  }
  uint getError()() {
    return Object_Getter__uint(this.handle, "getError");
  }
  auto getFramebufferAttachmentParameter()(uint target, uint attachment, uint pname) {
    return Any(WebGLRenderingContextBase_getFramebufferAttachmentParameter(this.handle, target, attachment, pname));
  }
  auto getProgramParameter()(scope ref WebGLProgram program, uint pname) {
    return Any(WebGLRenderingContextBase_getProgramParameter(this.handle, program.handle, pname));
  }
  Optional!(string) getProgramInfoLog()(scope ref WebGLProgram program) {
    return WebGLRenderingContextBase_getProgramInfoLog(this.handle, program.handle);
  }
  auto getRenderbufferParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getRenderbufferParameter(this.handle, target, pname));
  }
  auto getShaderParameter()(scope ref WebGLShader shader, uint pname) {
    return Any(WebGLRenderingContextBase_getShaderParameter(this.handle, shader.handle, pname));
  }
  auto getShaderPrecisionFormat()(uint shadertype, uint precisiontype) {
    return WebGLRenderingContextBase_getShaderPrecisionFormat(this.handle, shadertype, precisiontype);
  }
  Optional!(string) getShaderInfoLog()(scope ref WebGLShader shader) {
    return WebGLRenderingContextBase_getShaderInfoLog(this.handle, shader.handle);
  }
  Optional!(string) getShaderSource()(scope ref WebGLShader shader) {
    return WebGLRenderingContextBase_getShaderSource(this.handle, shader.handle);
  }
  auto getTexParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getTexParameter(this.handle, target, pname));
  }
  auto getUniform()(scope ref WebGLProgram program, scope ref WebGLUniformLocation location) {
    return Any(WebGLRenderingContextBase_getUniform(this.handle, program.handle, location.handle));
  }
  auto getUniformLocation()(scope ref WebGLProgram program, string name) {
    return WebGLRenderingContextBase_getUniformLocation(this.handle, program.handle, name);
  }
  auto getVertexAttrib()(uint index, uint pname) {
    return Any(WebGLRenderingContextBase_getVertexAttrib(this.handle, index, pname));
  }
  int getVertexAttribOffset()(uint index, uint pname) {
    return WebGLRenderingContextBase_getVertexAttribOffset(this.handle, index, pname);
  }
  void hint()(uint target, uint mode) {
    WebGLRenderingContextBase_hint(this.handle, target, mode);
  }
  bool isBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    return WebGLRenderingContextBase_isBuffer(this.handle, !buffer.empty, buffer.front.handle);
  }
  bool isEnabled()(uint cap) {
    return WebGLRenderingContextBase_isEnabled(this.handle, cap);
  }
  bool isFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    return WebGLRenderingContextBase_isFramebuffer(this.handle, !framebuffer.empty, framebuffer.front.handle);
  }
  bool isProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    return WebGLRenderingContextBase_isProgram(this.handle, !program.empty, program.front.handle);
  }
  bool isRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    return WebGLRenderingContextBase_isRenderbuffer(this.handle, !renderbuffer.empty, renderbuffer.front.handle);
  }
  bool isShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    return WebGLRenderingContextBase_isShader(this.handle, !shader.empty, shader.front.handle);
  }
  bool isTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    return WebGLRenderingContextBase_isTexture(this.handle, !texture.empty, texture.front.handle);
  }
  void lineWidth()(float width) {
    Object_Call_float__void(this.handle, "lineWidth", width);
  }
  void linkProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "linkProgram", program.handle);
  }
  void pixelStorei()(uint pname, int param) {
    WebGLRenderingContextBase_pixelStorei(this.handle, pname, param);
  }
  void polygonOffset()(float factor, float units) {
    WebGLRenderingContextBase_polygonOffset(this.handle, factor, units);
  }
  void renderbufferStorage()(uint target, uint internalformat, int width, int height) {
    WebGLRenderingContextBase_renderbufferStorage(this.handle, target, internalformat, width, height);
  }
  void sampleCoverage()(float value, bool invert) {
    WebGLRenderingContextBase_sampleCoverage(this.handle, value, invert);
  }
  void scissor()(int x, int y, int width, int height) {
    WebGLRenderingContextBase_scissor(this.handle, x, y, width, height);
  }
  void shaderSource()(scope ref WebGLShader shader, string source) {
    WebGLRenderingContextBase_shaderSource(this.handle, shader.handle, source);
  }
  void stencilFunc()(uint func, int ref_, uint mask) {
    WebGLRenderingContextBase_stencilFunc(this.handle, func, ref_, mask);
  }
  void stencilFuncSeparate()(uint face, uint func, int ref_, uint mask) {
    WebGLRenderingContextBase_stencilFuncSeparate(this.handle, face, func, ref_, mask);
  }
  void stencilMask()(uint mask) {
    Object_Call_uint__void(this.handle, "stencilMask", mask);
  }
  void stencilMaskSeparate()(uint face, uint mask) {
    WebGLRenderingContextBase_stencilMaskSeparate(this.handle, face, mask);
  }
  void stencilOp()(uint fail, uint zfail, uint zpass) {
    WebGLRenderingContextBase_stencilOp(this.handle, fail, zfail, zpass);
  }
  void stencilOpSeparate()(uint face, uint fail, uint zfail, uint zpass) {
    WebGLRenderingContextBase_stencilOpSeparate(this.handle, face, fail, zfail, zpass);
  }
  void texParameterf()(uint target, uint pname, float param) {
    WebGLRenderingContextBase_texParameterf(this.handle, target, pname, param);
  }
  void texParameteri()(uint target, uint pname, int param) {
    WebGLRenderingContextBase_texParameteri(this.handle, target, pname, param);
  }
  void uniform1f(T0)(scope auto ref Optional!(T0) location, float x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform1f(this.handle, !location.empty, location.front.handle, x);
  }
  void uniform2f(T0)(scope auto ref Optional!(T0) location, float x, float y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform2f(this.handle, !location.empty, location.front.handle, x, y);
  }
  void uniform3f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform3f(this.handle, !location.empty, location.front.handle, x, y, z);
  }
  void uniform4f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z, float w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform4f(this.handle, !location.empty, location.front.handle, x, y, z, w);
  }
  void uniform1i(T0)(scope auto ref Optional!(T0) location, int x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform1i(this.handle, !location.empty, location.front.handle, x);
  }
  void uniform2i(T0)(scope auto ref Optional!(T0) location, int x, int y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform2i(this.handle, !location.empty, location.front.handle, x, y);
  }
  void uniform3i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform3i(this.handle, !location.empty, location.front.handle, x, y, z);
  }
  void uniform4i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z, int w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform4i(this.handle, !location.empty, location.front.handle, x, y, z, w);
  }
  void useProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    WebGLRenderingContextBase_useProgram(this.handle, !program.empty, program.front.handle);
  }
  void validateProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "validateProgram", program.handle);
  }
  void vertexAttrib1f()(uint indx, float x) {
    WebGLRenderingContextBase_vertexAttrib1f(this.handle, indx, x);
  }
  void vertexAttrib1fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib1fv(this.handle, indx, values);
  }
  void vertexAttrib2f()(uint indx, float x, float y) {
    WebGLRenderingContextBase_vertexAttrib2f(this.handle, indx, x, y);
  }
  void vertexAttrib2fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib2fv(this.handle, indx, values);
  }
  void vertexAttrib3f()(uint indx, float x, float y, float z) {
    WebGLRenderingContextBase_vertexAttrib3f(this.handle, indx, x, y, z);
  }
  void vertexAttrib3fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib3fv(this.handle, indx, values);
  }
  void vertexAttrib4f()(uint indx, float x, float y, float z, float w) {
    WebGLRenderingContextBase_vertexAttrib4f(this.handle, indx, x, y, z, w);
  }
  void vertexAttrib4fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib4fv(this.handle, indx, values);
  }
  void vertexAttribPointer()(uint indx, int size, uint type, bool normalized, int stride, int offset) {
    WebGLRenderingContextBase_vertexAttribPointer(this.handle, indx, size, type, normalized, stride, offset);
  }
  void viewport()(int x, int y, int width, int height) {
    WebGLRenderingContextBase_viewport(this.handle, x, y, width, height);
  }
}
struct WebGLRenderingContextBase {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
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
    return Object_Getter__OptionalHandle(this.handle, "getContextAttributes");
  }
  bool isContextLost()() {
    return Object_Getter__bool(this.handle, "isContextLost");
  }
  auto getSupportedExtensions()() {
    return Object_Getter__OptionalHandle(this.handle, "getSupportedExtensions");
  }
  auto getExtension()(string name) {
    return Object_Call_string__OptionalHandle(this.handle, "getExtension", name);
  }
  void activeTexture()(uint texture) {
    Object_Call_uint__void(this.handle, "activeTexture", texture);
  }
  void attachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    WebGLRenderingContextBase_attachShader(this.handle, program.handle, shader.handle);
  }
  void bindAttribLocation()(scope ref WebGLProgram program, uint index, string name) {
    WebGLRenderingContextBase_bindAttribLocation(this.handle, program.handle, index, name);
  }
  void bindBuffer(T1)(uint target, scope auto ref Optional!(T1) buffer) if (isTOrPointer!(T1, WebGLBuffer)) {
    WebGLRenderingContextBase_bindBuffer(this.handle, target, !buffer.empty, buffer.front.handle);
  }
  void bindFramebuffer(T1)(uint target, scope auto ref Optional!(T1) framebuffer) if (isTOrPointer!(T1, WebGLFramebuffer)) {
    WebGLRenderingContextBase_bindFramebuffer(this.handle, target, !framebuffer.empty, framebuffer.front.handle);
  }
  void bindRenderbuffer(T1)(uint target, scope auto ref Optional!(T1) renderbuffer) if (isTOrPointer!(T1, WebGLRenderbuffer)) {
    WebGLRenderingContextBase_bindRenderbuffer(this.handle, target, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void bindTexture(T1)(uint target, scope auto ref Optional!(T1) texture) if (isTOrPointer!(T1, WebGLTexture)) {
    WebGLRenderingContextBase_bindTexture(this.handle, target, !texture.empty, texture.front.handle);
  }
  void blendColor()(float red, float green, float blue, float alpha) {
    WebGLRenderingContextBase_blendColor(this.handle, red, green, blue, alpha);
  }
  void blendEquation()(uint mode) {
    Object_Call_uint__void(this.handle, "blendEquation", mode);
  }
  void blendEquationSeparate()(uint modeRGB, uint modeAlpha) {
    WebGLRenderingContextBase_blendEquationSeparate(this.handle, modeRGB, modeAlpha);
  }
  void blendFunc()(uint sfactor, uint dfactor) {
    WebGLRenderingContextBase_blendFunc(this.handle, sfactor, dfactor);
  }
  void blendFuncSeparate()(uint srcRGB, uint dstRGB, uint srcAlpha, uint dstAlpha) {
    WebGLRenderingContextBase_blendFuncSeparate(this.handle, srcRGB, dstRGB, srcAlpha, dstAlpha);
  }
  uint checkFramebufferStatus()(uint target) {
    return WebGLRenderingContextBase_checkFramebufferStatus(this.handle, target);
  }
  void clear()(uint mask) {
    Object_Call_uint__void(this.handle, "clear", mask);
  }
  void clearColor()(float red, float green, float blue, float alpha) {
    WebGLRenderingContextBase_clearColor(this.handle, red, green, blue, alpha);
  }
  void clearDepth()(float depth) {
    Object_Call_float__void(this.handle, "clearDepth", depth);
  }
  void clearStencil()(int s) {
    Object_Call_int__void(this.handle, "clearStencil", s);
  }
  void colorMask()(bool red, bool green, bool blue, bool alpha) {
    WebGLRenderingContextBase_colorMask(this.handle, red, green, blue, alpha);
  }
  void compileShader()(scope ref WebGLShader shader) {
    Object_Call_Handle__void(this.handle, "compileShader", shader.handle);
  }
  void copyTexImage2D()(uint target, int level, uint internalformat, int x, int y, int width, int height, int border) {
    WebGLRenderingContextBase_copyTexImage2D(this.handle, target, level, internalformat, x, y, width, height, border);
  }
  void copyTexSubImage2D()(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height) {
    WebGLRenderingContextBase_copyTexSubImage2D(this.handle, target, level, xoffset, yoffset, x, y, width, height);
  }
  auto createBuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createBuffer");
  }
  auto createFramebuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createFramebuffer");
  }
  auto createProgram()() {
    return Object_Getter__OptionalHandle(this.handle, "createProgram");
  }
  auto createRenderbuffer()() {
    return Object_Getter__OptionalHandle(this.handle, "createRenderbuffer");
  }
  auto createShader()(uint type) {
    return Object_Call_uint__OptionalHandle(this.handle, "createShader", type);
  }
  auto createTexture()() {
    return Object_Getter__OptionalHandle(this.handle, "createTexture");
  }
  void cullFace()(uint mode) {
    Object_Call_uint__void(this.handle, "cullFace", mode);
  }
  void deleteBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    WebGLRenderingContextBase_deleteBuffer(this.handle, !buffer.empty, buffer.front.handle);
  }
  void deleteFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    WebGLRenderingContextBase_deleteFramebuffer(this.handle, !framebuffer.empty, framebuffer.front.handle);
  }
  void deleteProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    WebGLRenderingContextBase_deleteProgram(this.handle, !program.empty, program.front.handle);
  }
  void deleteRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    WebGLRenderingContextBase_deleteRenderbuffer(this.handle, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void deleteShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    WebGLRenderingContextBase_deleteShader(this.handle, !shader.empty, shader.front.handle);
  }
  void deleteTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    WebGLRenderingContextBase_deleteTexture(this.handle, !texture.empty, texture.front.handle);
  }
  void depthFunc()(uint func) {
    Object_Call_uint__void(this.handle, "depthFunc", func);
  }
  void depthMask()(bool flag) {
    Object_Call_bool__void(this.handle, "depthMask", flag);
  }
  void depthRange()(float zNear, float zFar) {
    WebGLRenderingContextBase_depthRange(this.handle, zNear, zFar);
  }
  void detachShader()(scope ref WebGLProgram program, scope ref WebGLShader shader) {
    WebGLRenderingContextBase_detachShader(this.handle, program.handle, shader.handle);
  }
  void disable()(uint cap) {
    Object_Call_uint__void(this.handle, "disable", cap);
  }
  void disableVertexAttribArray()(uint index) {
    Object_Call_uint__void(this.handle, "disableVertexAttribArray", index);
  }
  void drawArrays()(uint mode, int first, int count) {
    WebGLRenderingContextBase_drawArrays(this.handle, mode, first, count);
  }
  void drawElements()(uint mode, int count, uint type, int offset) {
    WebGLRenderingContextBase_drawElements(this.handle, mode, count, type, offset);
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
    WebGLRenderingContextBase_framebufferRenderbuffer(this.handle, target, attachment, renderbuffertarget, !renderbuffer.empty, renderbuffer.front.handle);
  }
  void framebufferTexture2D(T3)(uint target, uint attachment, uint textarget, scope auto ref Optional!(T3) texture, int level) if (isTOrPointer!(T3, WebGLTexture)) {
    WebGLRenderingContextBase_framebufferTexture2D(this.handle, target, attachment, textarget, !texture.empty, texture.front.handle, level);
  }
  void frontFace()(uint mode) {
    Object_Call_uint__void(this.handle, "frontFace", mode);
  }
  void generateMipmap()(uint target) {
    Object_Call_uint__void(this.handle, "generateMipmap", target);
  }
  auto getActiveAttrib()(scope ref WebGLProgram program, uint index) {
    return WebGLRenderingContextBase_getActiveAttrib(this.handle, program.handle, index);
  }
  auto getActiveUniform()(scope ref WebGLProgram program, uint index) {
    return WebGLRenderingContextBase_getActiveUniform(this.handle, program.handle, index);
  }
  auto getAttachedShaders()(scope ref WebGLProgram program) {
    return WebGLRenderingContextBase_getAttachedShaders(this.handle, program.handle);
  }
  int getAttribLocation()(scope ref WebGLProgram program, string name) {
    return WebGLRenderingContextBase_getAttribLocation(this.handle, program.handle, name);
  }
  auto getBufferParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getBufferParameter(this.handle, target, pname));
  }
  auto getParameter()(uint pname) {
    return Any(Object_Call_uint__Handle(this.handle, "getParameter", pname));
  }
  uint getError()() {
    return Object_Getter__uint(this.handle, "getError");
  }
  auto getFramebufferAttachmentParameter()(uint target, uint attachment, uint pname) {
    return Any(WebGLRenderingContextBase_getFramebufferAttachmentParameter(this.handle, target, attachment, pname));
  }
  auto getProgramParameter()(scope ref WebGLProgram program, uint pname) {
    return Any(WebGLRenderingContextBase_getProgramParameter(this.handle, program.handle, pname));
  }
  Optional!(string) getProgramInfoLog()(scope ref WebGLProgram program) {
    return WebGLRenderingContextBase_getProgramInfoLog(this.handle, program.handle);
  }
  auto getRenderbufferParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getRenderbufferParameter(this.handle, target, pname));
  }
  auto getShaderParameter()(scope ref WebGLShader shader, uint pname) {
    return Any(WebGLRenderingContextBase_getShaderParameter(this.handle, shader.handle, pname));
  }
  auto getShaderPrecisionFormat()(uint shadertype, uint precisiontype) {
    return WebGLRenderingContextBase_getShaderPrecisionFormat(this.handle, shadertype, precisiontype);
  }
  Optional!(string) getShaderInfoLog()(scope ref WebGLShader shader) {
    return WebGLRenderingContextBase_getShaderInfoLog(this.handle, shader.handle);
  }
  Optional!(string) getShaderSource()(scope ref WebGLShader shader) {
    return WebGLRenderingContextBase_getShaderSource(this.handle, shader.handle);
  }
  auto getTexParameter()(uint target, uint pname) {
    return Any(WebGLRenderingContextBase_getTexParameter(this.handle, target, pname));
  }
  auto getUniform()(scope ref WebGLProgram program, scope ref WebGLUniformLocation location) {
    return Any(WebGLRenderingContextBase_getUniform(this.handle, program.handle, location.handle));
  }
  auto getUniformLocation()(scope ref WebGLProgram program, string name) {
    return WebGLRenderingContextBase_getUniformLocation(this.handle, program.handle, name);
  }
  auto getVertexAttrib()(uint index, uint pname) {
    return Any(WebGLRenderingContextBase_getVertexAttrib(this.handle, index, pname));
  }
  int getVertexAttribOffset()(uint index, uint pname) {
    return WebGLRenderingContextBase_getVertexAttribOffset(this.handle, index, pname);
  }
  void hint()(uint target, uint mode) {
    WebGLRenderingContextBase_hint(this.handle, target, mode);
  }
  bool isBuffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, WebGLBuffer)) {
    return WebGLRenderingContextBase_isBuffer(this.handle, !buffer.empty, buffer.front.handle);
  }
  bool isEnabled()(uint cap) {
    return WebGLRenderingContextBase_isEnabled(this.handle, cap);
  }
  bool isFramebuffer(T0)(scope auto ref Optional!(T0) framebuffer) if (isTOrPointer!(T0, WebGLFramebuffer)) {
    return WebGLRenderingContextBase_isFramebuffer(this.handle, !framebuffer.empty, framebuffer.front.handle);
  }
  bool isProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    return WebGLRenderingContextBase_isProgram(this.handle, !program.empty, program.front.handle);
  }
  bool isRenderbuffer(T0)(scope auto ref Optional!(T0) renderbuffer) if (isTOrPointer!(T0, WebGLRenderbuffer)) {
    return WebGLRenderingContextBase_isRenderbuffer(this.handle, !renderbuffer.empty, renderbuffer.front.handle);
  }
  bool isShader(T0)(scope auto ref Optional!(T0) shader) if (isTOrPointer!(T0, WebGLShader)) {
    return WebGLRenderingContextBase_isShader(this.handle, !shader.empty, shader.front.handle);
  }
  bool isTexture(T0)(scope auto ref Optional!(T0) texture) if (isTOrPointer!(T0, WebGLTexture)) {
    return WebGLRenderingContextBase_isTexture(this.handle, !texture.empty, texture.front.handle);
  }
  void lineWidth()(float width) {
    Object_Call_float__void(this.handle, "lineWidth", width);
  }
  void linkProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "linkProgram", program.handle);
  }
  void pixelStorei()(uint pname, int param) {
    WebGLRenderingContextBase_pixelStorei(this.handle, pname, param);
  }
  void polygonOffset()(float factor, float units) {
    WebGLRenderingContextBase_polygonOffset(this.handle, factor, units);
  }
  void renderbufferStorage()(uint target, uint internalformat, int width, int height) {
    WebGLRenderingContextBase_renderbufferStorage(this.handle, target, internalformat, width, height);
  }
  void sampleCoverage()(float value, bool invert) {
    WebGLRenderingContextBase_sampleCoverage(this.handle, value, invert);
  }
  void scissor()(int x, int y, int width, int height) {
    WebGLRenderingContextBase_scissor(this.handle, x, y, width, height);
  }
  void shaderSource()(scope ref WebGLShader shader, string source) {
    WebGLRenderingContextBase_shaderSource(this.handle, shader.handle, source);
  }
  void stencilFunc()(uint func, int ref_, uint mask) {
    WebGLRenderingContextBase_stencilFunc(this.handle, func, ref_, mask);
  }
  void stencilFuncSeparate()(uint face, uint func, int ref_, uint mask) {
    WebGLRenderingContextBase_stencilFuncSeparate(this.handle, face, func, ref_, mask);
  }
  void stencilMask()(uint mask) {
    Object_Call_uint__void(this.handle, "stencilMask", mask);
  }
  void stencilMaskSeparate()(uint face, uint mask) {
    WebGLRenderingContextBase_stencilMaskSeparate(this.handle, face, mask);
  }
  void stencilOp()(uint fail, uint zfail, uint zpass) {
    WebGLRenderingContextBase_stencilOp(this.handle, fail, zfail, zpass);
  }
  void stencilOpSeparate()(uint face, uint fail, uint zfail, uint zpass) {
    WebGLRenderingContextBase_stencilOpSeparate(this.handle, face, fail, zfail, zpass);
  }
  void texParameterf()(uint target, uint pname, float param) {
    WebGLRenderingContextBase_texParameterf(this.handle, target, pname, param);
  }
  void texParameteri()(uint target, uint pname, int param) {
    WebGLRenderingContextBase_texParameteri(this.handle, target, pname, param);
  }
  void uniform1f(T0)(scope auto ref Optional!(T0) location, float x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform1f(this.handle, !location.empty, location.front.handle, x);
  }
  void uniform2f(T0)(scope auto ref Optional!(T0) location, float x, float y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform2f(this.handle, !location.empty, location.front.handle, x, y);
  }
  void uniform3f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform3f(this.handle, !location.empty, location.front.handle, x, y, z);
  }
  void uniform4f(T0)(scope auto ref Optional!(T0) location, float x, float y, float z, float w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform4f(this.handle, !location.empty, location.front.handle, x, y, z, w);
  }
  void uniform1i(T0)(scope auto ref Optional!(T0) location, int x) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform1i(this.handle, !location.empty, location.front.handle, x);
  }
  void uniform2i(T0)(scope auto ref Optional!(T0) location, int x, int y) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform2i(this.handle, !location.empty, location.front.handle, x, y);
  }
  void uniform3i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform3i(this.handle, !location.empty, location.front.handle, x, y, z);
  }
  void uniform4i(T0)(scope auto ref Optional!(T0) location, int x, int y, int z, int w) if (isTOrPointer!(T0, WebGLUniformLocation)) {
    WebGLRenderingContextBase_uniform4i(this.handle, !location.empty, location.front.handle, x, y, z, w);
  }
  void useProgram(T0)(scope auto ref Optional!(T0) program) if (isTOrPointer!(T0, WebGLProgram)) {
    WebGLRenderingContextBase_useProgram(this.handle, !program.empty, program.front.handle);
  }
  void validateProgram()(scope ref WebGLProgram program) {
    Object_Call_Handle__void(this.handle, "validateProgram", program.handle);
  }
  void vertexAttrib1f()(uint indx, float x) {
    WebGLRenderingContextBase_vertexAttrib1f(this.handle, indx, x);
  }
  void vertexAttrib1fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib1fv(this.handle, indx, values);
  }
  void vertexAttrib2f()(uint indx, float x, float y) {
    WebGLRenderingContextBase_vertexAttrib2f(this.handle, indx, x, y);
  }
  void vertexAttrib2fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib2fv(this.handle, indx, values);
  }
  void vertexAttrib3f()(uint indx, float x, float y, float z) {
    WebGLRenderingContextBase_vertexAttrib3f(this.handle, indx, x, y, z);
  }
  void vertexAttrib3fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib3fv(this.handle, indx, values);
  }
  void vertexAttrib4f()(uint indx, float x, float y, float z, float w) {
    WebGLRenderingContextBase_vertexAttrib4f(this.handle, indx, x, y, z, w);
  }
  void vertexAttrib4fv()(uint indx, scope ref Float32List values) {
    WebGLRenderingContextBase_vertexAttrib4fv(this.handle, indx, values);
  }
  void vertexAttribPointer()(uint indx, int size, uint type, bool normalized, int stride, int offset) {
    WebGLRenderingContextBase_vertexAttribPointer(this.handle, indx, size, type, normalized, stride, offset);
  }
  void viewport()(int x, int y, int width, int height) {
    WebGLRenderingContextBase_viewport(this.handle, x, y, width, height);
  }
}
struct WebGLShader {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLShaderPrecisionFormat {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int rangeMin()() {
    return Object_Getter__int(this.handle, "rangeMin");
  }
  int rangeMax()() {
    return Object_Getter__int(this.handle, "rangeMax");
  }
  int precision()() {
    return Object_Getter__int(this.handle, "precision");
  }
}
struct WebGLTexture {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLUniformLocation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct WebGLVertexArrayObject {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}


extern (C) void ANGLE_instanced_arrays_drawArraysInstancedANGLE(Handle, uint, int, int, int);
extern (C) void ANGLE_instanced_arrays_drawElementsInstancedANGLE(Handle, uint, int, uint, int, int);
extern (C) void ANGLE_instanced_arrays_vertexAttribDivisorANGLE(Handle, uint, uint);
extern (C) void EXT_disjoint_timer_query_deleteQueryEXT(Handle, bool, Handle);
extern (C) bool EXT_disjoint_timer_query_isQueryEXT(Handle, bool, Handle);
extern (C) void EXT_disjoint_timer_query_beginQueryEXT(Handle, uint, Handle);
extern (C) void EXT_disjoint_timer_query_queryCounterEXT(Handle, Handle, uint);
extern (C) Handle EXT_disjoint_timer_query_getQueryEXT(Handle, uint, uint);
extern (C) Handle EXT_disjoint_timer_query_getQueryObjectEXT(Handle, Handle, uint);
extern (C) void OES_vertex_array_object_deleteVertexArrayOES(Handle, bool, Handle);
extern (C) bool OES_vertex_array_object_isVertexArrayOES(Handle, bool, Handle);
extern (C) void OES_vertex_array_object_bindVertexArrayOES(Handle, bool, Handle);
extern (C) string WEBGL_debug_shaders_getTranslatedShaderSource(Handle, Handle);
extern (C) void WebGLContextAttributes_powerPreference_Set(Handle, WebGLPowerPreference);
extern (C) WebGLPowerPreference WebGLContextAttributes_powerPreference_Get(Handle);
extern (C) void WebGLRenderingContext_bufferData__uint_int_uint(Handle, uint, int, uint);
extern (C) void WebGLRenderingContext_bufferData__uint_optional_Handle_uint(Handle, uint, bool, Handle, uint);
extern (C) void WebGLRenderingContext_bufferData__uint_Handle_uint(Handle, uint, Handle, uint);
extern (C) void WebGLRenderingContext_bufferSubData__uint_int_Handle(Handle, uint, int, Handle);
extern (C) void WebGLRenderingContext_compressedTexImage2D(Handle, uint, int, uint, int, int, int, Handle);
extern (C) void WebGLRenderingContext_compressedTexSubImage2D(Handle, uint, int, int, int, int, int, uint, Handle);
extern (C) void WebGLRenderingContext_readPixels(Handle, int, int, int, int, uint, uint, bool, Handle);
extern (C) void WebGLRenderingContext_texImage2D__uint_int_int_int_int_int_uint_uint_optional_Handle(Handle, uint, int, int, int, int, int, uint, uint, bool, Handle);
extern (C) void WebGLRenderingContext_texImage2D__uint_int_int_uint_uint_Handle(Handle, uint, int, int, uint, uint, Handle);
extern (C) void WebGLRenderingContext_texSubImage2D__uint_int_int_int_int_int_uint_uint_optional_Handle(Handle, uint, int, int, int, int, int, uint, uint, bool, Handle);
extern (C) void WebGLRenderingContext_texSubImage2D__uint_int_int_int_uint_uint_Handle(Handle, uint, int, int, int, uint, uint, Handle);
extern (C) void WebGLRenderingContext_uniform1fv(Handle, bool, Handle, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniform2fv(Handle, bool, Handle, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniform3fv(Handle, bool, Handle, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniform4fv(Handle, bool, Handle, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniform1iv(Handle, bool, Handle, scope ref Int32List);
extern (C) void WebGLRenderingContext_uniform2iv(Handle, bool, Handle, scope ref Int32List);
extern (C) void WebGLRenderingContext_uniform3iv(Handle, bool, Handle, scope ref Int32List);
extern (C) void WebGLRenderingContext_uniform4iv(Handle, bool, Handle, scope ref Int32List);
extern (C) void WebGLRenderingContext_uniformMatrix2fv(Handle, bool, Handle, bool, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniformMatrix3fv(Handle, bool, Handle, bool, scope ref Float32List);
extern (C) void WebGLRenderingContext_uniformMatrix4fv(Handle, bool, Handle, bool, scope ref Float32List);
extern (C) Optional!(SumType!(HTMLCanvasElement, OffscreenCanvas)) WebGLRenderingContextBase_canvas_Get(Handle);
extern (C) void WebGLRenderingContextBase_attachShader(Handle, Handle, Handle);
extern (C) void WebGLRenderingContextBase_bindAttribLocation(Handle, Handle, uint, string);
extern (C) void WebGLRenderingContextBase_bindBuffer(Handle, uint, bool, Handle);
extern (C) void WebGLRenderingContextBase_bindFramebuffer(Handle, uint, bool, Handle);
extern (C) void WebGLRenderingContextBase_bindRenderbuffer(Handle, uint, bool, Handle);
extern (C) void WebGLRenderingContextBase_bindTexture(Handle, uint, bool, Handle);
extern (C) void WebGLRenderingContextBase_blendColor(Handle, float, float, float, float);
extern (C) void WebGLRenderingContextBase_blendEquationSeparate(Handle, uint, uint);
extern (C) void WebGLRenderingContextBase_blendFunc(Handle, uint, uint);
extern (C) void WebGLRenderingContextBase_blendFuncSeparate(Handle, uint, uint, uint, uint);
extern (C) uint WebGLRenderingContextBase_checkFramebufferStatus(Handle, uint);
extern (C) void WebGLRenderingContextBase_clearColor(Handle, float, float, float, float);
extern (C) void WebGLRenderingContextBase_colorMask(Handle, bool, bool, bool, bool);
extern (C) void WebGLRenderingContextBase_copyTexImage2D(Handle, uint, int, uint, int, int, int, int, int);
extern (C) void WebGLRenderingContextBase_copyTexSubImage2D(Handle, uint, int, int, int, int, int, int, int);
extern (C) void WebGLRenderingContextBase_deleteBuffer(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_deleteFramebuffer(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_deleteProgram(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_deleteRenderbuffer(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_deleteShader(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_deleteTexture(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_depthRange(Handle, float, float);
extern (C) void WebGLRenderingContextBase_detachShader(Handle, Handle, Handle);
extern (C) void WebGLRenderingContextBase_drawArrays(Handle, uint, int, int);
extern (C) void WebGLRenderingContextBase_drawElements(Handle, uint, int, uint, int);
extern (C) void WebGLRenderingContextBase_framebufferRenderbuffer(Handle, uint, uint, uint, bool, Handle);
extern (C) void WebGLRenderingContextBase_framebufferTexture2D(Handle, uint, uint, uint, bool, Handle, int);
extern (C) Optional!(WebGLActiveInfo) WebGLRenderingContextBase_getActiveAttrib(Handle, Handle, uint);
extern (C) Optional!(WebGLActiveInfo) WebGLRenderingContextBase_getActiveUniform(Handle, Handle, uint);
extern (C) Optional!(Sequence!(WebGLShader)) WebGLRenderingContextBase_getAttachedShaders(Handle, Handle);
extern (C) int WebGLRenderingContextBase_getAttribLocation(Handle, Handle, string);
extern (C) Handle WebGLRenderingContextBase_getBufferParameter(Handle, uint, uint);
extern (C) Handle WebGLRenderingContextBase_getFramebufferAttachmentParameter(Handle, uint, uint, uint);
extern (C) Handle WebGLRenderingContextBase_getProgramParameter(Handle, Handle, uint);
extern (C) Optional!(string) WebGLRenderingContextBase_getProgramInfoLog(Handle, Handle);
extern (C) Handle WebGLRenderingContextBase_getRenderbufferParameter(Handle, uint, uint);
extern (C) Handle WebGLRenderingContextBase_getShaderParameter(Handle, Handle, uint);
extern (C) Optional!(WebGLShaderPrecisionFormat) WebGLRenderingContextBase_getShaderPrecisionFormat(Handle, uint, uint);
extern (C) Optional!(string) WebGLRenderingContextBase_getShaderInfoLog(Handle, Handle);
extern (C) Optional!(string) WebGLRenderingContextBase_getShaderSource(Handle, Handle);
extern (C) Handle WebGLRenderingContextBase_getTexParameter(Handle, uint, uint);
extern (C) Handle WebGLRenderingContextBase_getUniform(Handle, Handle, Handle);
extern (C) Optional!(WebGLUniformLocation) WebGLRenderingContextBase_getUniformLocation(Handle, Handle, string);
extern (C) Handle WebGLRenderingContextBase_getVertexAttrib(Handle, uint, uint);
extern (C) int WebGLRenderingContextBase_getVertexAttribOffset(Handle, uint, uint);
extern (C) void WebGLRenderingContextBase_hint(Handle, uint, uint);
extern (C) bool WebGLRenderingContextBase_isBuffer(Handle, bool, Handle);
extern (C) bool WebGLRenderingContextBase_isEnabled(Handle, uint);
extern (C) bool WebGLRenderingContextBase_isFramebuffer(Handle, bool, Handle);
extern (C) bool WebGLRenderingContextBase_isProgram(Handle, bool, Handle);
extern (C) bool WebGLRenderingContextBase_isRenderbuffer(Handle, bool, Handle);
extern (C) bool WebGLRenderingContextBase_isShader(Handle, bool, Handle);
extern (C) bool WebGLRenderingContextBase_isTexture(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_pixelStorei(Handle, uint, int);
extern (C) void WebGLRenderingContextBase_polygonOffset(Handle, float, float);
extern (C) void WebGLRenderingContextBase_renderbufferStorage(Handle, uint, uint, int, int);
extern (C) void WebGLRenderingContextBase_sampleCoverage(Handle, float, bool);
extern (C) void WebGLRenderingContextBase_scissor(Handle, int, int, int, int);
extern (C) void WebGLRenderingContextBase_shaderSource(Handle, Handle, string);
extern (C) void WebGLRenderingContextBase_stencilFunc(Handle, uint, int, uint);
extern (C) void WebGLRenderingContextBase_stencilFuncSeparate(Handle, uint, uint, int, uint);
extern (C) void WebGLRenderingContextBase_stencilMaskSeparate(Handle, uint, uint);
extern (C) void WebGLRenderingContextBase_stencilOp(Handle, uint, uint, uint);
extern (C) void WebGLRenderingContextBase_stencilOpSeparate(Handle, uint, uint, uint, uint);
extern (C) void WebGLRenderingContextBase_texParameterf(Handle, uint, uint, float);
extern (C) void WebGLRenderingContextBase_texParameteri(Handle, uint, uint, int);
extern (C) void WebGLRenderingContextBase_uniform1f(Handle, bool, Handle, float);
extern (C) void WebGLRenderingContextBase_uniform2f(Handle, bool, Handle, float, float);
extern (C) void WebGLRenderingContextBase_uniform3f(Handle, bool, Handle, float, float, float);
extern (C) void WebGLRenderingContextBase_uniform4f(Handle, bool, Handle, float, float, float, float);
extern (C) void WebGLRenderingContextBase_uniform1i(Handle, bool, Handle, int);
extern (C) void WebGLRenderingContextBase_uniform2i(Handle, bool, Handle, int, int);
extern (C) void WebGLRenderingContextBase_uniform3i(Handle, bool, Handle, int, int, int);
extern (C) void WebGLRenderingContextBase_uniform4i(Handle, bool, Handle, int, int, int, int);
extern (C) void WebGLRenderingContextBase_useProgram(Handle, bool, Handle);
extern (C) void WebGLRenderingContextBase_vertexAttrib1f(Handle, uint, float);
extern (C) void WebGLRenderingContextBase_vertexAttrib1fv(Handle, uint, scope ref Float32List);
extern (C) void WebGLRenderingContextBase_vertexAttrib2f(Handle, uint, float, float);
extern (C) void WebGLRenderingContextBase_vertexAttrib2fv(Handle, uint, scope ref Float32List);
extern (C) void WebGLRenderingContextBase_vertexAttrib3f(Handle, uint, float, float, float);
extern (C) void WebGLRenderingContextBase_vertexAttrib3fv(Handle, uint, scope ref Float32List);
extern (C) void WebGLRenderingContextBase_vertexAttrib4f(Handle, uint, float, float, float, float);
extern (C) void WebGLRenderingContextBase_vertexAttrib4fv(Handle, uint, scope ref Float32List);
extern (C) void WebGLRenderingContextBase_vertexAttribPointer(Handle, uint, int, uint, bool, int, int);
extern (C) void WebGLRenderingContextBase_viewport(Handle, int, int, int, int);