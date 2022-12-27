module libwasm.bindings.Crypto;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SubtleCrypto;

@safe:
nothrow:

struct Crypto {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto subtle()() {
    return SubtleCrypto(Object_Getter__Handle(this.handle, "subtle"));
  }
  auto getRandomValues()(scope ref ArrayBufferView array) {
    return ArrayBufferView(Object_Call_Handle__Handle(this.handle, "getRandomValues", array.handle));
  }
}
struct GlobalCrypto {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto crypto()() {
    return Crypto(Object_Getter__Handle(this.handle, "crypto"));
  }
}


