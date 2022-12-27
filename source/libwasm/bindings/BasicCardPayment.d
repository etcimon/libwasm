module libwasm.bindings.BasicCardPayment;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.PaymentAddress;
import libwasm.bindings.PaymentRequest;

@safe:
nothrow:

struct BasicCardChangeDetails {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BasicCardChangeDetails(libwasm_add__object());
  }
  void billingAddress(T0)(scope auto ref Optional!(T0) billingAddress) if (isTOrPointer!(T0, PaymentAddress)) {
    Serialize_Object_VarArgCall!void(this.handle, "billingAddress", "Optional!Handle", tuple(!billingAddress.empty, cast(Handle)billingAddress.front.handle));
  }
  auto billingAddress()() {
    return recastOpt!(PaymentAddress)(Object_Getter__OptionalHandle(this.handle, "billingAddress"));
  }
}
struct BasicCardErrors {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BasicCardErrors(libwasm_add__object());
  }
  void cardNumber()(string cardNumber) {
    Object_Call_string__void(this.handle, "cardNumber", cardNumber);
  }
  string cardNumber()() {
    return Object_Getter__string(this.handle, "cardNumber");
  }
  void cardholderName()(string cardholderName) {
    Object_Call_string__void(this.handle, "cardholderName", cardholderName);
  }
  string cardholderName()() {
    return Object_Getter__string(this.handle, "cardholderName");
  }
  void cardSecurityCode()(string cardSecurityCode) {
    Object_Call_string__void(this.handle, "cardSecurityCode", cardSecurityCode);
  }
  string cardSecurityCode()() {
    return Object_Getter__string(this.handle, "cardSecurityCode");
  }
  void expiryMonth()(string expiryMonth) {
    Object_Call_string__void(this.handle, "expiryMonth", expiryMonth);
  }
  string expiryMonth()() {
    return Object_Getter__string(this.handle, "expiryMonth");
  }
  void expiryYear()(string expiryYear) {
    Object_Call_string__void(this.handle, "expiryYear", expiryYear);
  }
  string expiryYear()() {
    return Object_Getter__string(this.handle, "expiryYear");
  }
  void billingAddress()(scope ref AddressErrors billingAddress) {
    Object_Call_Handle__void(this.handle, "billingAddress", billingAddress.handle);
  }
  auto billingAddress()() {
    return AddressErrors(Object_Getter__Handle(this.handle, "billingAddress"));
  }
}
struct BasicCardRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BasicCardRequest(libwasm_add__object());
  }
  void supportedNetworks()(scope ref Sequence!(string) supportedNetworks) {
    Object_Call_Handle__void(this.handle, "supportedNetworks", supportedNetworks.handle);
  }
  auto supportedNetworks()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "supportedNetworks"));
  }
}
struct BasicCardResponse {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BasicCardResponse(libwasm_add__object());
  }
  void cardholderName()(string cardholderName) {
    Object_Call_string__void(this.handle, "cardholderName", cardholderName);
  }
  string cardholderName()() {
    return Object_Getter__string(this.handle, "cardholderName");
  }
  void cardNumber()(string cardNumber) {
    Object_Call_string__void(this.handle, "cardNumber", cardNumber);
  }
  string cardNumber()() {
    return Object_Getter__string(this.handle, "cardNumber");
  }
  void expiryMonth()(string expiryMonth) {
    Object_Call_string__void(this.handle, "expiryMonth", expiryMonth);
  }
  string expiryMonth()() {
    return Object_Getter__string(this.handle, "expiryMonth");
  }
  void expiryYear()(string expiryYear) {
    Object_Call_string__void(this.handle, "expiryYear", expiryYear);
  }
  string expiryYear()() {
    return Object_Getter__string(this.handle, "expiryYear");
  }
  void cardSecurityCode()(string cardSecurityCode) {
    Object_Call_string__void(this.handle, "cardSecurityCode", cardSecurityCode);
  }
  string cardSecurityCode()() {
    return Object_Getter__string(this.handle, "cardSecurityCode");
  }
  void billingAddress(T0)(scope auto ref Optional!(T0) billingAddress) if (isTOrPointer!(T0, PaymentAddress)) {
    Serialize_Object_VarArgCall!void(this.handle, "billingAddress", "Optional!Handle", tuple(!billingAddress.empty, cast(Handle)billingAddress.front.handle));
  }
  auto billingAddress()() {
    return recastOpt!(PaymentAddress)(Object_Getter__OptionalHandle(this.handle, "billingAddress"));
  }
}


