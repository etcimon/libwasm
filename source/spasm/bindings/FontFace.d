module spasm.bindings.FontFace;

import spasm.types;
@safe:
nothrow:

alias BinaryData = SumType!(ArrayBuffer, ArrayBufferView);
struct FontFace {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void family()(string family) {
    Object_Call_string__void(this.handle, "family", family);
  }
  string family()() {
    return Object_Getter__string(this.handle, "family");
  }
  void style()(string style) {
    Object_Call_string__void(this.handle, "style", style);
  }
  string style()() {
    return Object_Getter__string(this.handle, "style");
  }
  void weight()(string weight) {
    Object_Call_string__void(this.handle, "weight", weight);
  }
  string weight()() {
    return Object_Getter__string(this.handle, "weight");
  }
  void stretch()(string stretch) {
    Object_Call_string__void(this.handle, "stretch", stretch);
  }
  string stretch()() {
    return Object_Getter__string(this.handle, "stretch");
  }
  void unicodeRange()(string unicodeRange) {
    Object_Call_string__void(this.handle, "unicodeRange", unicodeRange);
  }
  string unicodeRange()() {
    return Object_Getter__string(this.handle, "unicodeRange");
  }
  void variant()(string variant) {
    Object_Call_string__void(this.handle, "variant", variant);
  }
  string variant()() {
    return Object_Getter__string(this.handle, "variant");
  }
  void featureSettings()(string featureSettings) {
    Object_Call_string__void(this.handle, "featureSettings", featureSettings);
  }
  string featureSettings()() {
    return Object_Getter__string(this.handle, "featureSettings");
  }
  void variationSettings()(string variationSettings) {
    Object_Call_string__void(this.handle, "variationSettings", variationSettings);
  }
  string variationSettings()() {
    return Object_Getter__string(this.handle, "variationSettings");
  }
  void display()(string display) {
    Object_Call_string__void(this.handle, "display", display);
  }
  string display()() {
    return Object_Getter__string(this.handle, "display");
  }
  FontFaceLoadStatus status()() {
    return FontFace_status_Get(this.handle);
  }
  auto load()() {
    return Promise!(FontFace)(Object_Getter__Handle(this.handle, "load"));
  }
  auto loaded()() {
    return Promise!(FontFace)(Object_Getter__Handle(this.handle, "loaded"));
  }
}
struct FontFaceDescriptors {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return FontFaceDescriptors(spasm_add__object());
  }
  void style()(string style) {
    Object_Call_string__void(this.handle, "style", style);
  }
  string style()() {
    return Object_Getter__string(this.handle, "style");
  }
  void weight()(string weight) {
    Object_Call_string__void(this.handle, "weight", weight);
  }
  string weight()() {
    return Object_Getter__string(this.handle, "weight");
  }
  void stretch()(string stretch) {
    Object_Call_string__void(this.handle, "stretch", stretch);
  }
  string stretch()() {
    return Object_Getter__string(this.handle, "stretch");
  }
  void unicodeRange()(string unicodeRange) {
    Object_Call_string__void(this.handle, "unicodeRange", unicodeRange);
  }
  string unicodeRange()() {
    return Object_Getter__string(this.handle, "unicodeRange");
  }
  void variant()(string variant) {
    Object_Call_string__void(this.handle, "variant", variant);
  }
  string variant()() {
    return Object_Getter__string(this.handle, "variant");
  }
  void featureSettings()(string featureSettings) {
    Object_Call_string__void(this.handle, "featureSettings", featureSettings);
  }
  string featureSettings()() {
    return Object_Getter__string(this.handle, "featureSettings");
  }
  void variationSettings()(string variationSettings) {
    Object_Call_string__void(this.handle, "variationSettings", variationSettings);
  }
  string variationSettings()() {
    return Object_Getter__string(this.handle, "variationSettings");
  }
  void display()(string display) {
    Object_Call_string__void(this.handle, "display", display);
  }
  string display()() {
    return Object_Getter__string(this.handle, "display");
  }
}
enum FontFaceLoadStatus {
  unloaded,
  loading,
  loaded,
  error
}


extern (C) FontFaceLoadStatus FontFace_status_Get(Handle);