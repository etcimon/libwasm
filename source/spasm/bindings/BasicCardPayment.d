module spasm.bindings.BasicCardPayment;

import spasm.types;
import spasm.bindings.PaymentAddress;
import spasm.bindings.PaymentRequest;

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
    return BasicCardChangeDetails(spasm_add__object());
  }
  void billingAddress(T0)(scope auto ref Optional!(T0) billingAddress) if (isTOrPointer!(T0, PaymentAddress)) {
    BasicCardChangeDetails_billingAddress_Set(this.handle, !billingAddress.empty, billingAddress.front.handle);
  }
  auto billingAddress()() {
    return Object_Getter__OptionalHandle(this.handle, "billingAddress");
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
    return BasicCardErrors(spasm_add__object());
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
    return BasicCardRequest(spasm_add__object());
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
    return BasicCardResponse(spasm_add__object());
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
    BasicCardResponse_billingAddress_Set(this.handle, !billingAddress.empty, billingAddress.front.handle);
  }
  auto billingAddress()() {
    return Object_Getter__OptionalHandle(this.handle, "billingAddress");
  }
}


extern (C) void BasicCardChangeDetails_billingAddress_Set(Handle, bool, Handle);
extern (C) void BasicCardResponse_billingAddress_Set(Handle, bool, Handle);