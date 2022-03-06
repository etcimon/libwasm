module spasm.bindings.TestFunctions;

import spasm.types;
@safe:
nothrow:

alias PromiseReturner = Promise!(Any) delegate();
struct TestFunctions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void throwUncatchableException()() {
    Object_Call__void(this.handle, "throwUncatchableException");
  }
  auto passThroughPromise()(scope ref Promise!(Any) arg) {
    return Promise!(Any)(Object_Call_Handle__Handle(this.handle, "passThroughPromise", arg.handle));
  }
  auto passThroughCallbackPromise()(PromiseReturner callback) {
    return Promise!(Any)(TestFunctions_passThroughCallbackPromise(this.handle, callback));
  }
  void setStringData()(string arg) {
    Object_Call_string__void(this.handle, "setStringData", arg);
  }
  string getStringDataAsAString()() {
    return Object_Getter__string(this.handle, "getStringDataAsAString");
  }
  string getStringDataAsAString()(uint length) {
    return Object_Call_uint__string(this.handle, "getStringDataAsAString", length);
  }
  string getStringDataAsDOMString()(uint length) {
    return Object_Call_uint__string(this.handle, "getStringDataAsDOMString", length);
  }
  string getStringDataAsDOMString()() {
    return Object_Getter__string(this.handle, "getStringDataAsDOMString");
  }
  void testThrowNsresult()() {
    Object_Call__void(this.handle, "testThrowNsresult");
  }
  void testThrowNsresultFromNative()() {
    Object_Call__void(this.handle, "testThrowNsresultFromNative");
  }
  auto throwToRejectPromise()() {
    return Promise!(Any)(Object_Getter__Handle(this.handle, "throwToRejectPromise"));
  }
  int one()() {
    return Object_Getter__int(this.handle, "one");
  }
  int two()() {
    return Object_Getter__int(this.handle, "two");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
  auto wrapperCachedNonISupportsObject()() {
    return WrapperCachedNonISupportsTestInterface(Object_Getter__Handle(this.handle, "wrapperCachedNonISupportsObject"));
  }
}
struct WrapperCachedNonISupportsTestInterface {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
}


extern (C) Handle TestFunctions_passThroughCallbackPromise(Handle, PromiseReturner);