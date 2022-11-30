module libwasm.bindings.PeriodicWave;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct PeriodicWave {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}
struct PeriodicWaveConstraints {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PeriodicWaveConstraints(libwasm_add__object());
  }
  void disableNormalization()(bool disableNormalization) {
    Object_Call_bool__void(this.handle, "disableNormalization", disableNormalization);
  }
  bool disableNormalization()() {
    return Object_Getter__bool(this.handle, "disableNormalization");
  }
}
struct PeriodicWaveOptions {
  nothrow:
  libwasm.bindings.PeriodicWave.PeriodicWaveConstraints _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PeriodicWaveConstraints(h);
  }
  static auto create() {
    return PeriodicWaveOptions(libwasm_add__object());
  }
  void real_()(scope ref Sequence!(float) real_) {
    Object_Call_Handle__void(this._parent, "real", real_.handle);
  }
  auto real_()() {
    return Sequence!(float)(Object_Getter__Handle(this._parent, "real"));
  }
  void imag()(scope ref Sequence!(float) imag) {
    Object_Call_Handle__void(this._parent, "imag", imag.handle);
  }
  auto imag()() {
    return Sequence!(float)(Object_Getter__Handle(this._parent, "imag"));
  }
}


