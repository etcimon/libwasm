module libwasm.bindings.SubtleCrypto;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct AesCbcParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesCbcParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesCtrParams(libwasm_add__object());
  }
  void counter()(scope ref BufferSource counter) {
    Object_Call_Handle__void(this._parent, "counter", counter.handle);
  }
  auto counter()() {
    return BufferSource(Object_Getter__Handle(this._parent, "counter"));
  }
  void length()(ubyte length) {
    Serialize_Object_VarArgCall!void(this._parent, "length", "ubyte", tuple(length));
  }
  ubyte length()() {
    return AesCtrParams_length_Get(this._parent);
  }
}
struct AesDerivedKeyParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesDerivedKeyParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesGcmParams(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "tagLength", "ubyte", tuple(tagLength));
  }
  ubyte tagLength()() {
    return AesGcmParams_tagLength_Get(this._parent);
  }
}
struct AesKeyGenParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return AesKeyGenParams(libwasm_add__object());
  }
  void length()(ushort length) {
    Serialize_Object_VarArgCall!void(this._parent, "length", "ushort", tuple(length));
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
    return Algorithm(libwasm_add__object());
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
    return CryptoKeyPair(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhImportKeyParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhKeyDeriveParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return DhKeyGenParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcKeyGenParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcKeyImportParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcdhKeyDeriveParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return EcdsaParams(libwasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct HkdfParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HkdfParams(libwasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
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
  libwasm.bindings.SubtleCrypto.HmacImportParams _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HmacImportParams(h);
  }
  static auto create() {
    return HmacDerivedKeyParams(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HmacImportParams(libwasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct HmacKeyGenParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return HmacKeyGenParams(libwasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
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
    return JsonWebKey(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return Pbkdf2Params(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
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
    return RsaHashedImportParams(libwasm_add__object());
  }
  void hash()(scope ref AlgorithmIdentifier hash) {
    Serialize_Object_VarArgCall!void(this.handle, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
  }
  auto hash()() {
    return Object_Getter__Handle(this.handle, "hash");
  }
}
struct RsaHashedKeyGenParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaHashedKeyGenParams(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "hash", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => 0),((string v) => 1))(hash),tuple(libwasm.sumtype.match!(((ref hash.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(hash),libwasm.sumtype.match!(((ref hash.Types[0] v) => string.init),((string v) => v))(hash))));
  }
  auto hash()() {
    return Object_Getter__Handle(this._parent, "hash");
  }
}
struct RsaOaepParams {
  nothrow:
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaOaepParams(libwasm_add__object());
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
    return RsaOtherPrimesInfo(libwasm_add__object());
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
  libwasm.bindings.SubtleCrypto.Algorithm _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Algorithm(h);
  }
  static auto create() {
    return RsaPssParams(libwasm_add__object());
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
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "encrypt", "SumType!(Handle,string);Handle;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)key.handle, cast(Handle)data.handle)));
  }
  auto decrypt()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource data) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "decrypt", "SumType!(Handle,string);Handle;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)key.handle, cast(Handle)data.handle)));
  }
  auto sign()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource data) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "sign", "SumType!(Handle,string);Handle;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)key.handle, cast(Handle)data.handle)));
  }
  auto verify()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey key, scope ref BufferSource signature, scope ref BufferSource data) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "verify", "SumType!(Handle,string);Handle;Handle;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)key.handle, cast(Handle)signature.handle, cast(Handle)data.handle)));
  }
  auto digest()(scope ref AlgorithmIdentifier algorithm, scope ref BufferSource data) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "digest", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)data.handle)));
  }
  auto generateKey()(scope ref AlgorithmIdentifier algorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "generateKey", "SumType!(Handle,string);bool;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), extractable, cast(Handle)keyUsages.handle)));
  }
  auto deriveKey()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey baseKey, scope ref AlgorithmIdentifier derivedKeyType, bool extractable, scope ref Sequence!(string) keyUsages) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "deriveKey", "SumType!(Handle,string);Handle;SumType!(Handle,string);bool;Handle", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)baseKey.handle, libwasm.sumtype.match!(((ref derivedKeyType.Types[0] v) => 0),((string v) => 1))(derivedKeyType),tuple(libwasm.sumtype.match!(((ref derivedKeyType.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(derivedKeyType),libwasm.sumtype.match!(((ref derivedKeyType.Types[0] v) => string.init),((string v) => v))(derivedKeyType)), extractable, cast(Handle)keyUsages.handle)));
  }
  auto deriveBits()(scope ref AlgorithmIdentifier algorithm, scope ref CryptoKey baseKey, uint length) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "deriveBits", "SumType!(Handle,string);Handle;uint", tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), cast(Handle)baseKey.handle, length)));
  }
  auto importKey()(string format, scope ref JsObject keyData, scope ref AlgorithmIdentifier algorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "importKey", "string;Handle;SumType!(Handle,string);bool;Handle", tuple(format, cast(Handle)keyData.handle, libwasm.sumtype.match!(((ref algorithm.Types[0] v) => 0),((string v) => 1))(algorithm),tuple(libwasm.sumtype.match!(((ref algorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(algorithm),libwasm.sumtype.match!(((ref algorithm.Types[0] v) => string.init),((string v) => v))(algorithm)), extractable, cast(Handle)keyUsages.handle)));
  }
  auto exportKey()(string format, scope ref CryptoKey key) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "exportKey", "string;Handle", tuple(format, cast(Handle)key.handle)));
  }
  auto wrapKey()(string format, scope ref CryptoKey key, scope ref CryptoKey wrappingKey, scope ref AlgorithmIdentifier wrapAlgorithm) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "wrapKey", "string;Handle;Handle;SumType!(Handle,string)", tuple(format, cast(Handle)key.handle, cast(Handle)wrappingKey.handle, libwasm.sumtype.match!(((ref wrapAlgorithm.Types[0] v) => 0),((string v) => 1))(wrapAlgorithm),tuple(libwasm.sumtype.match!(((ref wrapAlgorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(wrapAlgorithm),libwasm.sumtype.match!(((ref wrapAlgorithm.Types[0] v) => string.init),((string v) => v))(wrapAlgorithm)))));
  }
  auto unwrapKey()(string format, scope ref BufferSource wrappedKey, scope ref CryptoKey unwrappingKey, scope ref AlgorithmIdentifier unwrapAlgorithm, scope ref AlgorithmIdentifier unwrappedKeyAlgorithm, bool extractable, scope ref Sequence!(string) keyUsages) {
    return JsPromise!(Any)(Serialize_Object_VarArgCall!Handle(this.handle, "unwrapKey", "string;Handle;Handle;SumType!(Handle,string);SumType!(Handle,string);bool;Handle", tuple(format, cast(Handle)wrappedKey.handle, cast(Handle)unwrappingKey.handle, libwasm.sumtype.match!(((ref unwrapAlgorithm.Types[0] v) => 0),((string v) => 1))(unwrapAlgorithm),tuple(libwasm.sumtype.match!(((ref unwrapAlgorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(unwrapAlgorithm),libwasm.sumtype.match!(((ref unwrapAlgorithm.Types[0] v) => string.init),((string v) => v))(unwrapAlgorithm)), libwasm.sumtype.match!(((ref unwrappedKeyAlgorithm.Types[0] v) => 0),((string v) => 1))(unwrappedKeyAlgorithm),tuple(libwasm.sumtype.match!(((ref unwrappedKeyAlgorithm.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(unwrappedKeyAlgorithm),libwasm.sumtype.match!(((ref unwrappedKeyAlgorithm.Types[0] v) => string.init),((string v) => v))(unwrappedKeyAlgorithm)), extractable, cast(Handle)keyUsages.handle)));
  }
}


extern (C) ubyte AesCtrParams_length_Get(Handle);
extern (C) ubyte AesGcmParams_tagLength_Get(Handle);