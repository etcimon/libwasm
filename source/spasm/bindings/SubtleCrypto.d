module spasm.bindings.SubtleCrypto;

import spasm.types;
@safe:
nothrow:

struct AesCbcParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesCbcParams(spasm_add__object());
  }
  void iv()(scope ref BufferSource iv) {
    Object_Call_Handle__void(this._parent, "iv", iv.handle);
  }
  auto iv()() {
    return BufferSource(Object_Getter__Handle(this._parent, "iv"));
  }
}
struct AesCtrParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesCtrParams(spasm_add__object());
  }
  void counter()(scope ref BufferSource counter) {
    Object_Call_Handle__void(this._parent, "counter", counter.handle);
  }
  auto counter()() {
    return BufferSource(Object_Getter__Handle(this._parent, "counter"));
  }
  void length()(ubyte length) {
    AesCtrParams_length_Set(this._parent, length);
  }
  ubyte length()() {
    return AesCtrParams_length_Get(this._parent);
  }
}
struct AesDerivedKeyParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesDerivedKeyParams(spasm_add__object());
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
}
struct AesGcmParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesGcmParams(spasm_add__object());
  }
  void iv()(scope ref BufferSource iv) {
    Object_Call_Handle__void(this._parent, "iv", iv.handle);
  }
  auto iv()() {
    return BufferSource(Object_Getter__Handle(this._parent, "iv"));
  }
  void additionalData()(scope ref BufferSource additionalData) {
    Object_Call_Handle__void(this._parent, "additionalData", additionalData.handle);
  }
  auto additionalData()() {
    return BufferSource(Object_Getter__Handle(this._parent, "additionalData"));
  }
  void tagLength()(ubyte tagLength) {
    AesGcmParams_tagLength_Set(this._parent, tagLength);
  }
  ubyte tagLength()() {
    return AesGcmParams_tagLength_Get(this._parent);
  }
}
struct AesKeyGenParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesKeyGenParams(spasm_add__object());
  }
  void length()(ushort length) {
    AesKeyGenParams_length_Set(this._parent, length);
  }
  ushort length()() {
    return Object_Getter__ushort(this._parent, "length");
  }
}
struct Algorithm {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return Algorithm(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
}
alias AlgorithmIdentifier = SumType!(JsObject, string);
alias BigInteger = Uint8Array;
struct CryptoKey {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  bool extractable()() {
    return Object_Getter__bool(this.handle, "extractable");
  }
  auto algorithm()() {
    return JsObject(Object_Getter__Handle(this.handle, "algorithm"));
  }
  auto usages()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "usages"));
  }
}
struct CryptoKeyPair {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CryptoKeyPair(spasm_add__object());
  }
  void publicKey()(scope ref CryptoKey publicKey) {
    Object_Call_Handle__void(this.handle, "publicKey", publicKey.handle);
  }
  auto publicKey()() {
    return CryptoKey(Object_Getter__Handle(this.handle, "publicKey"));
  }
  void privateKey()(scope ref CryptoKey privateKey) {
    Object_Call_Handle__void(this.handle, "privateKey", privateKey.handle);
  }
  auto privateKey()() {
    return CryptoKey(Object_Getter__Handle(this.handle, "privateKey"));
  }
}
struct DhImportKeyParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhImportKeyParams(spasm_add__object());
  }
  void prime()(scope ref BigInteger prime) {
    Object_Call_Handle__void(this._parent, "prime", prime.handle);
  }
  auto prime()() {
    return BigInteger(Object_Getter__Handle(this._parent, "prime"));
  }
  void generator()(scope ref BigInteger generator) {
    Object_Call_Handle__void(this._parent, "generator", generator.handle);
  }
  auto generator()() {
    return BigInteger(Object_Getter__Handle(this._parent, "generator"));
  }
}
struct DhKeyDeriveParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhKeyDeriveParams(spasm_add__object());
  }
  void public_()(scope ref CryptoKey public_) {
    Object_Call_Handle__void(this._parent, "public", public_.handle);
  }
  auto public_()() {
    return CryptoKey(Object_Getter__Handle(this._parent, "public"));
  }
}
struct DhKeyGenParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhKeyGenParams(spasm_add__object());
  }
  void prime()(scope ref BigInteger prime) {
    Object_Call_Handle__void(this._parent, "prime", prime.handle);
  }
  auto prime()() {
    return BigInteger(Object_Getter__Handle(this._parent, "prime"));
  }
  void generator()(scope ref BigInteger generator) {
    Object_Call_Handle__void(this._parent, "generator", generator.handle);
  }
  auto generator()() {
    return BigInteger(Object_Getter__Handle(this._parent, "generator"));
  }
}
struct EcKeyGenParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcKeyGenParams(spasm_add__object());
  }
  void namedCurve()(string namedCurve) {
    Object_Call_string__void(this._parent, "namedCurve", namedCurve);
  }
  string namedCurve()() {
    return Object_Getter__string(this._parent, "namedCurve");
  }
}
struct EcKeyImportParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcKeyImportParams(spasm_add__object());
  }
  void namedCurve()(string namedCurve) {
    Object_Call_string__void(this._parent, "namedCurve", namedCurve);
  }
  string namedCurve()() {
    return Object_Getter__string(this._parent, "namedCurve");
  }
}
struct EcdhKeyDeriveParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcdhKeyDeriveParams(spasm_add__object());
  }
  void public_()(scope ref CryptoKey public_) {
    Object_Call_Handle__void(this._parent, "public", public_.handle);
  }
  auto public_()() {
    return CryptoKey(Object_Getter__Handle(this._parent, "public"));
  }
}
struct EcdsaParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcdsaParams(spasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    EcdsaParams_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct HkdfParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HkdfParams(spasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    HkdfParams_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
  void salt()(scope ref BufferSource salt) {
    Object_Call_Handle__void(this._parent, "salt", salt.handle);
  }
  auto salt()() {
    return BufferSource(Object_Getter__Handle(this._parent, "salt"));
  }
  void info()(scope ref BufferSource info) {
    Object_Call_Handle__void(this._parent, "info", info.handle);
  }
  auto info()() {
    return BufferSource(Object_Getter__Handle(this._parent, "info"));
  }
}
struct HmacDerivedKeyParams {
  nothrow:
  spasm.bindings.SubtleCrypto.HmacImportParams _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HmacImportParams(h);
  }
  static auto create() {
    return HmacDerivedKeyParams(spasm_add__object());
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
}
struct HmacImportParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HmacImportParams(spasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    HmacImportParams_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct HmacKeyGenParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HmacKeyGenParams(spasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    HmacKeyGenParams_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
  void length()(uint length) {
    Object_Call_uint__void(this._parent, "length", length);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
}
struct JsonWebKey {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return JsonWebKey(spasm_add__object());
  }
  void kty()(string kty) {
    Object_Call_string__void(this.handle, "kty", kty);
  }
  string kty()() {
    return Object_Getter__string(this.handle, "kty");
  }
  void use()(string use) {
    Object_Call_string__void(this.handle, "use", use);
  }
  string use()() {
    return Object_Getter__string(this.handle, "use");
  }
  void key_ops()(scope ref Sequence!(string) key_ops) {
    Object_Call_Handle__void(this.handle, "key_ops", key_ops.handle);
  }
  auto key_ops()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "key_ops"));
  }
  void alg()(string alg) {
    Object_Call_string__void(this.handle, "alg", alg);
  }
  string alg()() {
    return Object_Getter__string(this.handle, "alg");
  }
  void ext()(bool ext) {
    Object_Call_bool__void(this.handle, "ext", ext);
  }
  bool ext()() {
    return Object_Getter__bool(this.handle, "ext");
  }
  void crv()(string crv) {
    Object_Call_string__void(this.handle, "crv", crv);
  }
  string crv()() {
    return Object_Getter__string(this.handle, "crv");
  }
  void x()(string x) {
    Object_Call_string__void(this.handle, "x", x);
  }
  string x()() {
    return Object_Getter__string(this.handle, "x");
  }
  void y()(string y) {
    Object_Call_string__void(this.handle, "y", y);
  }
  string y()() {
    return Object_Getter__string(this.handle, "y");
  }
  void d()(string d) {
    Object_Call_string__void(this.handle, "d", d);
  }
  string d()() {
    return Object_Getter__string(this.handle, "d");
  }
  void n()(string n) {
    Object_Call_string__void(this.handle, "n", n);
  }
  string n()() {
    return Object_Getter__string(this.handle, "n");
  }
  void e()(string e) {
    Object_Call_string__void(this.handle, "e", e);
  }
  string e()() {
    return Object_Getter__string(this.handle, "e");
  }
  void p()(string p) {
    Object_Call_string__void(this.handle, "p", p);
  }
  string p()() {
    return Object_Getter__string(this.handle, "p");
  }
  void q()(string q) {
    Object_Call_string__void(this.handle, "q", q);
  }
  string q()() {
    return Object_Getter__string(this.handle, "q");
  }
  void dp()(string dp) {
    Object_Call_string__void(this.handle, "dp", dp);
  }
  string dp()() {
    return Object_Getter__string(this.handle, "dp");
  }
  void dq()(string dq) {
    Object_Call_string__void(this.handle, "dq", dq);
  }
  string dq()() {
    return Object_Getter__string(this.handle, "dq");
  }
  void qi()(string qi) {
    Object_Call_string__void(this.handle, "qi", qi);
  }
  string qi()() {
    return Object_Getter__string(this.handle, "qi");
  }
  void oth()(scope ref Sequence!(RsaOtherPrimesInfo) oth) {
    Object_Call_Handle__void(this.handle, "oth", oth.handle);
  }
  auto oth()() {
    return Sequence!(RsaOtherPrimesInfo)(Object_Getter__Handle(this.handle, "oth"));
  }
  void k()(string k) {
    Object_Call_string__void(this.handle, "k", k);
  }
  string k()() {
    return Object_Getter__string(this.handle, "k");
  }
}
alias KeyFormat = string;
alias KeyType = string;
alias KeyUsage = string;
alias NamedCurve = string;
struct Pbkdf2Params {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return Pbkdf2Params(spasm_add__object());
  }
  void salt()(scope ref BufferSource salt) {
    Object_Call_Handle__void(this._parent, "salt", salt.handle);
  }
  auto salt()() {
    return BufferSource(Object_Getter__Handle(this._parent, "salt"));
  }
  void iterations()(uint iterations) {
    Object_Call_uint__void(this._parent, "iterations", iterations);
  }
  uint iterations()() {
    return Object_Getter__uint(this._parent, "iterations");
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Pbkdf2Params_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct RsaHashedImportParams {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RsaHashedImportParams(spasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    RsaHashedImportParams_hash_Set(this.handle, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this.handle, "hash");
  }
}
struct RsaHashedKeyGenParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaHashedKeyGenParams(spasm_add__object());
  }
  void modulusLength()(uint modulusLength) {
    Object_Call_uint__void(this._parent, "modulusLength", modulusLength);
  }
  uint modulusLength()() {
    return Object_Getter__uint(this._parent, "modulusLength");
  }
  void publicExponent()(scope ref BigInteger publicExponent) {
    Object_Call_Handle__void(this._parent, "publicExponent", publicExponent.handle);
  }
  auto publicExponent()() {
    return BigInteger(Object_Getter__Handle(this._parent, "publicExponent"));
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    RsaHashedKeyGenParams_hash_Set(this._parent, hash);
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct RsaOaepParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaOaepParams(spasm_add__object());
  }
  void label()(scope ref BufferSource label) {
    Object_Call_Handle__void(this._parent, "label", label.handle);
  }
  auto label()() {
    return BufferSource(Object_Getter__Handle(this._parent, "label"));
  }
}
struct RsaOtherPrimesInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RsaOtherPrimesInfo(spasm_add__object());
  }
  void r()(string r) {
    Object_Call_string__void(this.handle, "r", r);
  }
  string r()() {
    return Object_Getter__string(this.handle, "r");
  }
  void d()(string d) {
    Object_Call_string__void(this.handle, "d", d);
  }
  string d()() {
    return Object_Getter__string(this.handle, "d");
  }
  void t()(string t) {
    Object_Call_string__void(this.handle, "t", t);
  }
  string t()() {
    return Object_Getter__string(this.handle, "t");
  }
}
struct RsaPssParams {
  nothrow:
  spasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaPssParams(spasm_add__object());
  }
  void saltLength()(uint saltLength) {
    Object_Call_uint__void(this._parent, "saltLength", saltLength);
  }
  uint saltLength()() {
    return Object_Getter__uint(this._parent, "saltLength");
  }
}
struct SubtleCrypto {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto encrypt()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource data) {
    return Promise!(Any)(SubtleCrypto_encrypt(this.handle, algorithm, key.handle, data.handle));
  }
  auto decrypt()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource data) {
    return Promise!(Any)(SubtleCrypto_decrypt(this.handle, algorithm, key.handle, data.handle));
  }
  auto sign()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource data) {
    return Promise!(Any)(SubtleCrypto_sign(this.handle, algorithm, key.handle, data.handle));
  }
  auto verify()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource signature, scope ref BufferSource data) {
    return Promise!(Any)(SubtleCrypto_verify(this.handle, algorithm, key.handle, signature.handle, data.handle));
  }
  auto digest()(scope ref AlgorithmIdentifier algorithm, scope ref BufferSource data) {
    return Promise!(Any)(SubtleCrypto_digest(this.handle, algorithm, data.handle));
  }
  auto generateKey()(scope ref AlgorithmIdentifier algorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return Promise!(Any)(SubtleCrypto_generateKey(this.handle, algorithm, extractable, keyUsages.handle));
  }
  auto deriveKey()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey baseKey, scope ref AlgorithmIdentifier derivedKeyType, bool extractable, scope ref Sequence!(string) keyUsages) {
    return Promise!(Any)(SubtleCrypto_deriveKey(this.handle, algorithm, baseKey.handle, derivedKeyType, extractable, keyUsages.handle));
  }
  auto deriveBits()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey baseKey, uint length) {
    return Promise!(Any)(SubtleCrypto_deriveBits(this.handle, algorithm, baseKey.handle, length));
  }
  auto importKey()(string format, scope ref JsObject keyData, scope ref AlgorithmIdentifier algorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return Promise!(Any)(SubtleCrypto_importKey(this.handle, format, keyData.handle, algorithm, extractable, keyUsages.handle));
  }
  auto exportKey()(string format, scope ref CryptoKey key) {
    return Promise!(Any)(SubtleCrypto_exportKey(this.handle, format, key.handle));
  }
  auto wrapKey()(string format, scope ref CryptoKey key, scope ref CryptoKey wrappingKey, scope ref AlgorithmIdentifier wrapAlgorithm) {
    return Promise!(Any)(SubtleCrypto_wrapKey(this.handle, format, key.handle, wrappingKey.handle, wrapAlgorithm));
  }
  auto unwrapKey()(string format, scope ref BufferSource wrappedKey, scope ref CryptoKey unwrappingKey, scope ref AlgorithmIdentifier unwrapAlgorithm, scope ref AlgorithmIdentifier unwrappedKeyAlgorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return Promise!(Any)(SubtleCrypto_unwrapKey(this.handle, format, wrappedKey.handle, unwrappingKey.handle, unwrapAlgorithm, unwrappedKeyAlgorithm, extractable, keyUsages.handle));
  }
}


extern (C) void AesCtrParams_length_Set(Handle, ubyte);
extern (C) ubyte AesCtrParams_length_Get(Handle);
extern (C) void AesGcmParams_tagLength_Set(Handle, ubyte);
extern (C) ubyte AesGcmParams_tagLength_Get(Handle);
extern (C) void AesKeyGenParams_length_Set(Handle, ushort);
extern (C) void EcdsaParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void HkdfParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void HmacImportParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void HmacKeyGenParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void Pbkdf2Params_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void RsaHashedImportParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) void RsaHashedKeyGenParams_hash_Set(Handle, scope ref AlgorithmIdentifier);
extern (C) Handle SubtleCrypto_encrypt(Handle, scope ref AlgorithmIdentifier, Handle, Handle);
extern (C) Handle SubtleCrypto_decrypt(Handle, scope ref AlgorithmIdentifier, Handle, Handle);
extern (C) Handle SubtleCrypto_sign(Handle, scope ref AlgorithmIdentifier, Handle, Handle);
extern (C) Handle SubtleCrypto_verify(Handle, scope ref AlgorithmIdentifier, Handle, Handle, Handle);
extern (C) Handle SubtleCrypto_digest(Handle, scope ref AlgorithmIdentifier, Handle);
extern (C) Handle SubtleCrypto_generateKey(Handle, scope ref AlgorithmIdentifier, bool, Handle);
extern (C) Handle SubtleCrypto_deriveKey(Handle, scope ref AlgorithmIdentifier, Handle, scope ref AlgorithmIdentifier, bool, Handle);
extern (C) Handle SubtleCrypto_deriveBits(Handle, scope ref AlgorithmIdentifier, Handle, uint);
extern (C) Handle SubtleCrypto_importKey(Handle, string, Handle, scope ref AlgorithmIdentifier, bool, Handle);
extern (C) Handle SubtleCrypto_exportKey(Handle, string, Handle);
extern (C) Handle SubtleCrypto_wrapKey(Handle, string, Handle, Handle, scope ref AlgorithmIdentifier);
extern (C) Handle SubtleCrypto_unwrapKey(Handle, string, Handle, Handle, scope ref AlgorithmIdentifier, scope ref AlgorithmIdentifier, bool, Handle);