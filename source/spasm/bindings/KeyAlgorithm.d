module spasm.bindings.KeyAlgorithm;

import spasm.types;
@safe:
nothrow:

struct AesKeyAlgorithm {
  nothrow:
  spasm.bindings.KeyAlgorithm.KeyAlgorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyAlgorithm(h);
  }
  static auto create() {
    return AesKeyAlgorithm(spasm_add__object());
  }
  void length()(ushort length) {
    AesKeyAlgorithm_length_Set(this._parent, length);
  }
  ushort length()() {
    return Object_Getter__ushort(this._parent, "length");
  }
}
struct DhKeyAlgorithm {
  nothrow:
  spasm.bindings.KeyAlgorithm.KeyAlgorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyAlgorithm(h);
  }
  static auto create() {
    return DhKeyAlgorithm(spasm_add__object());
  }
  void prime()(scope ref Uint8Array prime) {
    Object_Call_Handle__void(this._parent, "prime", prime.handle);
  }
  auto prime()() {
    return Uint8Array(Object_Getter__Handle(this._parent, "prime"));
  }
  void generator()(scope ref Uint8Array generator) {
    Object_Call_Handle__void(this._parent, "generator", generator.handle);
  }
  auto generator()() {
    return Uint8Array(Object_Getter__Handle(this._parent, "generator"));
  }
}
struct EcKeyAlgorithm {
  nothrow:
  spasm.bindings.KeyAlgorithm.KeyAlgorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyAlgorithm(h);
  }
  static auto create() {
    return EcKeyAlgorithm(spasm_add__object());
  }
  void namedCurve()(string namedCurve) {
    Object_Call_string__void(this._parent, "namedCurve", namedCurve);
  }
  string namedCurve()() {
    return Object_Getter__string(this._parent, "namedCurve");
  }
}
struct HmacKeyAlgorithm {
  nothrow:
  spasm.bindings.KeyAlgorithm.KeyAlgorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyAlgorithm(h);
  }
  static auto create() {
    return HmacKeyAlgorithm(spasm_add__object());
  }
  void hash()(scope ref KeyAlgorithm hash) {
    Object_Call_Handle__void(this._parent, "hash", hash.handle);
  }
  auto hash()() {
    return KeyAlgorithm(Object_Getter__Handle(this._parent, "hash"));
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
}
struct KeyAlgorithm {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return KeyAlgorithm(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}
struct RsaHashedKeyAlgorithm {
  nothrow:
  spasm.bindings.KeyAlgorithm.KeyAlgorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyAlgorithm(h);
  }
  static auto create() {
    return RsaHashedKeyAlgorithm(spasm_add__object());
  }
  void modulusLength()(ushort modulusLength) {
    RsaHashedKeyAlgorithm_modulusLength_Set(this._parent, modulusLength);
  }
  ushort modulusLength()() {
    return Object_Getter__ushort(this._parent, "modulusLength");
  }
  void publicExponent()(scope ref Uint8Array publicExponent) {
    Object_Call_Handle__void(this._parent, "publicExponent", publicExponent.handle);
  }
  auto publicExponent()() {
    return Uint8Array(Object_Getter__Handle(this._parent, "publicExponent"));
  }
  void hash()(scope ref KeyAlgorithm hash) {
    Object_Call_Handle__void(this._parent, "hash", hash.handle);
  }
  auto hash()() {
    return KeyAlgorithm(Object_Getter__Handle(this._parent, "hash"));
  }
}


extern (C) void AesKeyAlgorithm_length_Set(Handle, ushort);
extern (C) void RsaHashedKeyAlgorithm_modulusLength_Set(Handle, ushort);