module libwasm.bindings.PaymentRequest;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.PaymentAddress;
import libwasm.bindings.PaymentResponse;

@safe:
nothrow:

struct AddressErrors {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AddressErrors(libwasm_add__object());
  }
  void addressLine()(string addressLine) {
    Object_Call_string__void(this.handle, "addressLine", addressLine);
  }
  string addressLine()() {
    return Object_Getter__string(this.handle, "addressLine");
  }
  void city()(string city) {
    Object_Call_string__void(this.handle, "city", city);
  }
  string city()() {
    return Object_Getter__string(this.handle, "city");
  }
  void country()(string country) {
    Object_Call_string__void(this.handle, "country", country);
  }
  string country()() {
    return Object_Getter__string(this.handle, "country");
  }
  void dependentLocality()(string dependentLocality) {
    Object_Call_string__void(this.handle, "dependentLocality", dependentLocality);
  }
  string dependentLocality()() {
    return Object_Getter__string(this.handle, "dependentLocality");
  }
  void organization()(string organization) {
    Object_Call_string__void(this.handle, "organization", organization);
  }
  string organization()() {
    return Object_Getter__string(this.handle, "organization");
  }
  void phone()(string phone) {
    Object_Call_string__void(this.handle, "phone", phone);
  }
  string phone()() {
    return Object_Getter__string(this.handle, "phone");
  }
  void postalCode()(string postalCode) {
    Object_Call_string__void(this.handle, "postalCode", postalCode);
  }
  string postalCode()() {
    return Object_Getter__string(this.handle, "postalCode");
  }
  void recipient()(string recipient) {
    Object_Call_string__void(this.handle, "recipient", recipient);
  }
  string recipient()() {
    return Object_Getter__string(this.handle, "recipient");
  }
  void region()(string region) {
    Object_Call_string__void(this.handle, "region", region);
  }
  string region()() {
    return Object_Getter__string(this.handle, "region");
  }
  void regionCode()(string regionCode) {
    Object_Call_string__void(this.handle, "regionCode", regionCode);
  }
  string regionCode()() {
    return Object_Getter__string(this.handle, "regionCode");
  }
  void sortingCode()(string sortingCode) {
    Object_Call_string__void(this.handle, "sortingCode", sortingCode);
  }
  string sortingCode()() {
    return Object_Getter__string(this.handle, "sortingCode");
  }
}
struct PayerErrors {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PayerErrors(libwasm_add__object());
  }
  void email()(string email) {
    Object_Call_string__void(this.handle, "email", email);
  }
  string email()() {
    return Object_Getter__string(this.handle, "email");
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void phone()(string phone) {
    Object_Call_string__void(this.handle, "phone", phone);
  }
  string phone()() {
    return Object_Getter__string(this.handle, "phone");
  }
}
struct PaymentCurrencyAmount {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentCurrencyAmount(libwasm_add__object());
  }
  void currency()(string currency) {
    Object_Call_string__void(this.handle, "currency", currency);
  }
  string currency()() {
    return Object_Getter__string(this.handle, "currency");
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
}
struct PaymentDetailsBase {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentDetailsBase(libwasm_add__object());
  }
  void displayItems()(scope ref Sequence!(PaymentItem) displayItems) {
    Object_Call_Handle__void(this.handle, "displayItems", displayItems.handle);
  }
  auto displayItems()() {
    return Sequence!(PaymentItem)(Object_Getter__Handle(this.handle, "displayItems"));
  }
  void shippingOptions()(scope ref Sequence!(PaymentShippingOption) shippingOptions) {
    Object_Call_Handle__void(this.handle, "shippingOptions", shippingOptions.handle);
  }
  auto shippingOptions()() {
    return Sequence!(PaymentShippingOption)(Object_Getter__Handle(this.handle, "shippingOptions"));
  }
  void modifiers()(scope ref Sequence!(PaymentDetailsModifier) modifiers) {
    Object_Call_Handle__void(this.handle, "modifiers", modifiers.handle);
  }
  auto modifiers()() {
    return Sequence!(PaymentDetailsModifier)(Object_Getter__Handle(this.handle, "modifiers"));
  }
}
struct PaymentDetailsInit {
  nothrow:
  libwasm.bindings.PaymentRequest.PaymentDetailsBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentDetailsBase(h);
  }
  static auto create() {
    return PaymentDetailsInit(libwasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  void total()(scope ref PaymentItem total) {
    Object_Call_Handle__void(this._parent, "total", total.handle);
  }
  auto total()() {
    return PaymentItem(Object_Getter__Handle(this._parent, "total"));
  }
}
struct PaymentDetailsModifier {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentDetailsModifier(libwasm_add__object());
  }
  void supportedMethods()(string supportedMethods) {
    Object_Call_string__void(this.handle, "supportedMethods", supportedMethods);
  }
  string supportedMethods()() {
    return Object_Getter__string(this.handle, "supportedMethods");
  }
  void total()(scope ref PaymentItem total) {
    Object_Call_Handle__void(this.handle, "total", total.handle);
  }
  auto total()() {
    return PaymentItem(Object_Getter__Handle(this.handle, "total"));
  }
  void additionalDisplayItems()(scope ref Sequence!(PaymentItem) additionalDisplayItems) {
    Object_Call_Handle__void(this.handle, "additionalDisplayItems", additionalDisplayItems.handle);
  }
  auto additionalDisplayItems()() {
    return Sequence!(PaymentItem)(Object_Getter__Handle(this.handle, "additionalDisplayItems"));
  }
  void data()(scope ref JsObject data) {
    Object_Call_Handle__void(this.handle, "data", data.handle);
  }
  auto data()() {
    return JsObject(Object_Getter__Handle(this.handle, "data"));
  }
}
struct PaymentDetailsUpdate {
  nothrow:
  libwasm.bindings.PaymentRequest.PaymentDetailsBase _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PaymentDetailsBase(h);
  }
  static auto create() {
    return PaymentDetailsUpdate(libwasm_add__object());
  }
  void error()(string error) {
    Object_Call_string__void(this._parent, "error", error);
  }
  string error()() {
    return Object_Getter__string(this._parent, "error");
  }
  void shippingAddressErrors()(scope ref AddressErrors shippingAddressErrors) {
    Object_Call_Handle__void(this._parent, "shippingAddressErrors", shippingAddressErrors.handle);
  }
  auto shippingAddressErrors()() {
    return AddressErrors(Object_Getter__Handle(this._parent, "shippingAddressErrors"));
  }
  void payerErrors()(scope ref PayerErrors payerErrors) {
    Object_Call_Handle__void(this._parent, "payerErrors", payerErrors.handle);
  }
  auto payerErrors()() {
    return PayerErrors(Object_Getter__Handle(this._parent, "payerErrors"));
  }
  void paymentMethodErrors()(scope ref JsObject paymentMethodErrors) {
    Object_Call_Handle__void(this._parent, "paymentMethodErrors", paymentMethodErrors.handle);
  }
  auto paymentMethodErrors()() {
    return JsObject(Object_Getter__Handle(this._parent, "paymentMethodErrors"));
  }
  void total()(scope ref PaymentItem total) {
    Object_Call_Handle__void(this._parent, "total", total.handle);
  }
  auto total()() {
    return PaymentItem(Object_Getter__Handle(this._parent, "total"));
  }
}
struct PaymentItem {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentItem(libwasm_add__object());
  }
  void label()(string label) {
    Object_Call_string__void(this.handle, "label", label);
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  void amount()(scope ref PaymentCurrencyAmount amount) {
    Object_Call_Handle__void(this.handle, "amount", amount.handle);
  }
  auto amount()() {
    return PaymentCurrencyAmount(Object_Getter__Handle(this.handle, "amount"));
  }
  void pending()(bool pending) {
    Object_Call_bool__void(this.handle, "pending", pending);
  }
  bool pending()() {
    return Object_Getter__bool(this.handle, "pending");
  }
}
struct PaymentMethodData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentMethodData(libwasm_add__object());
  }
  void supportedMethods()(string supportedMethods) {
    Object_Call_string__void(this.handle, "supportedMethods", supportedMethods);
  }
  string supportedMethods()() {
    return Object_Getter__string(this.handle, "supportedMethods");
  }
  void data()(scope ref JsObject data) {
    Object_Call_Handle__void(this.handle, "data", data.handle);
  }
  auto data()() {
    return JsObject(Object_Getter__Handle(this.handle, "data"));
  }
}
struct PaymentOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentOptions(libwasm_add__object());
  }
  void requestPayerName()(bool requestPayerName) {
    Object_Call_bool__void(this.handle, "requestPayerName", requestPayerName);
  }
  bool requestPayerName()() {
    return Object_Getter__bool(this.handle, "requestPayerName");
  }
  void requestPayerEmail()(bool requestPayerEmail) {
    Object_Call_bool__void(this.handle, "requestPayerEmail", requestPayerEmail);
  }
  bool requestPayerEmail()() {
    return Object_Getter__bool(this.handle, "requestPayerEmail");
  }
  void requestPayerPhone()(bool requestPayerPhone) {
    Object_Call_bool__void(this.handle, "requestPayerPhone", requestPayerPhone);
  }
  bool requestPayerPhone()() {
    return Object_Getter__bool(this.handle, "requestPayerPhone");
  }
  void requestShipping()(bool requestShipping) {
    Object_Call_bool__void(this.handle, "requestShipping", requestShipping);
  }
  bool requestShipping()() {
    return Object_Getter__bool(this.handle, "requestShipping");
  }
  void requestBillingAddress()(bool requestBillingAddress) {
    Object_Call_bool__void(this.handle, "requestBillingAddress", requestBillingAddress);
  }
  bool requestBillingAddress()() {
    return Object_Getter__bool(this.handle, "requestBillingAddress");
  }
  void shippingType()(PaymentShippingType shippingType) {
    Object_Call_int__void(this.handle, "shippingType", shippingType);
  }
  PaymentShippingType shippingType()() {
    return Object_Getter__int(this.handle, "shippingType");
  }
}
struct PaymentRequest {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto show()(scope ref JsPromise!(PaymentDetailsUpdate) detailsPromise) {
    return JsPromise!(PaymentResponse)(Object_Call_Handle__Handle(this._parent, "show", detailsPromise.handle));
  }
  auto show()() {
    return JsPromise!(PaymentResponse)(Object_Getter__Handle(this._parent, "show"));
  }
  auto abort()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "abort"));
  }
  auto canMakePayment()() {
    return JsPromise!(bool)(Object_Getter__Handle(this._parent, "canMakePayment"));
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  auto shippingAddress()() {
    return recastOpt!(PaymentAddress)(Object_Getter__OptionalHandle(this._parent, "shippingAddress"));
  }
  Optional!(string) shippingOption()() {
    return Object_Getter__OptionalString(this._parent, "shippingOption");
  }
  Optional!(PaymentShippingType) shippingType()() {
    return PaymentRequest_shippingType_Get(this._parent);
  }
  void onmerchantvalidation(T0)(scope auto ref Optional!(T0) onmerchantvalidation) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmerchantvalidation", !onmerchantvalidation.empty, onmerchantvalidation.front);
  }
  EventHandler onmerchantvalidation()() {
    return Object_Getter__EventHandler(this._parent, "onmerchantvalidation");
  }
  void onshippingaddresschange(T0)(scope auto ref Optional!(T0) onshippingaddresschange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onshippingaddresschange", !onshippingaddresschange.empty, onshippingaddresschange.front);
  }
  EventHandler onshippingaddresschange()() {
    return Object_Getter__EventHandler(this._parent, "onshippingaddresschange");
  }
  void onshippingoptionchange(T0)(scope auto ref Optional!(T0) onshippingoptionchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onshippingoptionchange", !onshippingoptionchange.empty, onshippingoptionchange.front);
  }
  EventHandler onshippingoptionchange()() {
    return Object_Getter__EventHandler(this._parent, "onshippingoptionchange");
  }
  void onpaymentmethodchange(T0)(scope auto ref Optional!(T0) onpaymentmethodchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onpaymentmethodchange", !onpaymentmethodchange.empty, onpaymentmethodchange.front);
  }
  EventHandler onpaymentmethodchange()() {
    return Object_Getter__EventHandler(this._parent, "onpaymentmethodchange");
  }
}
struct PaymentShippingOption {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentShippingOption(libwasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void label()(string label) {
    Object_Call_string__void(this.handle, "label", label);
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  void amount()(scope ref PaymentCurrencyAmount amount) {
    Object_Call_Handle__void(this.handle, "amount", amount.handle);
  }
  auto amount()() {
    return PaymentCurrencyAmount(Object_Getter__Handle(this.handle, "amount"));
  }
  void selected()(bool selected) {
    Object_Call_bool__void(this.handle, "selected", selected);
  }
  bool selected()() {
    return Object_Getter__bool(this.handle, "selected");
  }
}
enum PaymentShippingType {
  shipping,
  delivery,
  pickup
}
struct PaymentValidationErrors {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PaymentValidationErrors(libwasm_add__object());
  }
  void payer()(scope ref PayerErrors payer) {
    Object_Call_Handle__void(this.handle, "payer", payer.handle);
  }
  auto payer()() {
    return PayerErrors(Object_Getter__Handle(this.handle, "payer"));
  }
  void shippingAddress()(scope ref AddressErrors shippingAddress) {
    Object_Call_Handle__void(this.handle, "shippingAddress", shippingAddress.handle);
  }
  auto shippingAddress()() {
    return AddressErrors(Object_Getter__Handle(this.handle, "shippingAddress"));
  }
  void error()(string error) {
    Object_Call_string__void(this.handle, "error", error);
  }
  string error()() {
    return Object_Getter__string(this.handle, "error");
  }
  void paymentMethod()(scope ref JsObject paymentMethod) {
    Object_Call_Handle__void(this.handle, "paymentMethod", paymentMethod.handle);
  }
  auto paymentMethod()() {
    return JsObject(Object_Getter__Handle(this.handle, "paymentMethod"));
  }
}


extern (C) Optional!(PaymentShippingType) PaymentRequest_shippingType_Get(Handle);