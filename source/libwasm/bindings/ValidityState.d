module libwasm.bindings.ValidityState;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct ValidityState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool valueMissing()() {
    return Object_Getter__bool(this.handle, "valueMissing");
  }
  bool typeMismatch()() {
    return Object_Getter__bool(this.handle, "typeMismatch");
  }
  bool patternMismatch()() {
    return Object_Getter__bool(this.handle, "patternMismatch");
  }
  bool tooLong()() {
    return Object_Getter__bool(this.handle, "tooLong");
  }
  bool tooShort()() {
    return Object_Getter__bool(this.handle, "tooShort");
  }
  bool rangeUnderflow()() {
    return Object_Getter__bool(this.handle, "rangeUnderflow");
  }
  bool rangeOverflow()() {
    return Object_Getter__bool(this.handle, "rangeOverflow");
  }
  bool stepMismatch()() {
    return Object_Getter__bool(this.handle, "stepMismatch");
  }
  bool badInput()() {
    return Object_Getter__bool(this.handle, "badInput");
  }
  bool customError()() {
    return Object_Getter__bool(this.handle, "customError");
  }
  bool valid()() {
    return Object_Getter__bool(this.handle, "valid");
  }
}


