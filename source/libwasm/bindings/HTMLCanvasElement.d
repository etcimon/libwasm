module libwasm.bindings.HTMLCanvasElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.CanvasCaptureMediaStream;
import libwasm.bindings.File;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.OffscreenCanvas;

@safe:
nothrow:

alias BlobCallback = void delegate(Optional!(Blob));
struct HTMLCanvasElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void width()(uint width) {
    Object_Call_uint__void(this._parent, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this._parent, "width");
  }
  void height()(uint height) {
    Object_Call_uint__void(this._parent, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this._parent, "height");
  }
  auto getContext(T1)(string contextId, scope auto ref T1 contextOptions /* = null */) {
    // Any
    Handle _handle_contextOptions = getOrCreateHandle(contextOptions);
    auto result = recastOpt!(nsISupports)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getContext", "string;Handle", tuple(contextId, _handle_contextOptions)));
    dropHandle!(T1)(_handle_contextOptions);
    return result;
  }
  auto getContext()(string contextId) {
    return recastOpt!(nsISupports)(Object_Call_string__OptionalHandle(this._parent, "getContext", contextId));
  }
  string toDataURL(T1)(string type /* = "" */, scope auto ref T1 encoderOptions) {
    // Any
    Handle _handle_encoderOptions = getOrCreateHandle(encoderOptions);
    auto result = Serialize_Object_VarArgCall!string(this._parent, "toDataURL", "string;Handle", tuple(type, _handle_encoderOptions));
    dropHandle!(T1)(_handle_encoderOptions);
    return result;
  }
  string toDataURL()(string type /* = "" */) {
    return Object_Call_string__string(this._parent, "toDataURL", type);
  }
  string toDataURL()() {
    return Object_Getter__string(this._parent, "toDataURL");
  }
  void toBlob(T2)(BlobCallback _callback, string type /* = "" */, scope auto ref T2 encoderOptions) {
    // Any
    Handle _handle_encoderOptions = getOrCreateHandle(encoderOptions);
    HTMLCanvasElement_toBlob(this._parent, _callback, type, _handle_encoderOptions);
    dropHandle!(T2)(_handle_encoderOptions);
  }
  void toBlob()(BlobCallback _callback, string type /* = "" */) {
    HTMLCanvasElement_toBlob_0(this._parent, _callback, type);
  }
  void toBlob()(BlobCallback _callback) {
    HTMLCanvasElement_toBlob_1(this._parent, _callback);
  }
  void mozOpaque()(bool mozOpaque) {
    Object_Call_bool__void(this._parent, "mozOpaque", mozOpaque);
  }
  bool mozOpaque()() {
    return Object_Getter__bool(this._parent, "mozOpaque");
  }
  auto mozGetAsFile(T1)(string name, scope auto ref Optional!(T1) type /* = no!(string) */) if (isTOrPointer!(T1, string)) {
    return File(Serialize_Object_VarArgCall!Handle(this._parent, "mozGetAsFile", "string;Optional!(string)", tuple(name, !type.empty, type.front)));
  }
  auto mozGetAsFile()(string name) {
    return File(Object_Call_string__Handle(this._parent, "mozGetAsFile", name));
  }
  auto MozGetIPCContext()(string contextId) {
    return recastOpt!(nsISupports)(Object_Call_string__OptionalHandle(this._parent, "MozGetIPCContext", contextId));
  }
  void mozPrintCallback(T0)(scope auto ref Optional!(T0) mozPrintCallback) if (isTOrPointer!(T0, PrintCallback)) {
    HTMLCanvasElement_mozPrintCallback_Set(this._parent, !mozPrintCallback.empty, mozPrintCallback.front);
  }
  Optional!(PrintCallback) mozPrintCallback()() {
    return HTMLCanvasElement_mozPrintCallback_Get(this._parent);
  }
  auto captureStream()(double frameRate) {
    return CanvasCaptureMediaStream(Serialize_Object_VarArgCall!Handle(this._parent, "captureStream", "double", tuple(frameRate)));
  }
  auto captureStream()() {
    return CanvasCaptureMediaStream(Object_Getter__Handle(this._parent, "captureStream"));
  }
  auto transferControlToOffscreen()() {
    return OffscreenCanvas(Object_Getter__Handle(this._parent, "transferControlToOffscreen"));
  }
}
struct MozCanvasPrintState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto context()() {
    return nsISupports(Object_Getter__Handle(this.handle, "context"));
  }
  void done()() {
    Object_Call__void(this.handle, "done");
  }
}
alias PrintCallback = void delegate(MozCanvasPrintState);


extern (C) void HTMLCanvasElement_toBlob(Handle, BlobCallback, string, Handle);
extern (C) void HTMLCanvasElement_toBlob_0(Handle, BlobCallback, string);
extern (C) void HTMLCanvasElement_toBlob_1(Handle, BlobCallback);
extern (C) void HTMLCanvasElement_mozPrintCallback_Set(Handle, bool, PrintCallback);
extern (C) Optional!(PrintCallback) HTMLCanvasElement_mozPrintCallback_Get(Handle);