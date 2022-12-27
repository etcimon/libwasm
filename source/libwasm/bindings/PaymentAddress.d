module libwasm.bindings.PaymentAddress;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct PaymentAddress {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
  string country()() {
    return Object_Getter__string(this.handle, "country");
  }
  auto addressLine()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "addressLine"));
  }
  string region()() {
    return Object_Getter__string(this.handle, "region");
  }
  string regionCode()() {
    return Object_Getter__string(this.handle, "regionCode");
  }
  string city()() {
    return Object_Getter__string(this.handle, "city");
  }
  string dependentLocality()() {
    return Object_Getter__string(this.handle, "dependentLocality");
  }
  string postalCode()() {
    return Object_Getter__string(this.handle, "postalCode");
  }
  string sortingCode()() {
    return Object_Getter__string(this.handle, "sortingCode");
  }
  string organization()() {
    return Object_Getter__string(this.handle, "organization");
  }
  string recipient()() {
    return Object_Getter__string(this.handle, "recipient");
  }
  string phone()() {
    return Object_Getter__string(this.handle, "phone");
  }
}


