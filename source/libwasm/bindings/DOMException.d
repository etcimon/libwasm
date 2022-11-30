module libwasm.bindings.DOMException;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct DOMException {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
  ushort code()() {
    return Object_Getter__ushort(this.handle, "code");
  }
  enum ushort INDEX_SIZE_ERR = 1;
  enum ushort DOMSTRING_SIZE_ERR = 2;
  enum ushort HIERARCHY_REQUEST_ERR = 3;
  enum ushort WRONG_DOCUMENT_ERR = 4;
  enum ushort INVALID_CHARACTER_ERR = 5;
  enum ushort NO_DATA_ALLOWED_ERR = 6;
  enum ushort NO_MODIFICATION_ALLOWED_ERR = 7;
  enum ushort NOT_FOUND_ERR = 8;
  enum ushort NOT_SUPPORTED_ERR = 9;
  enum ushort INUSE_ATTRIBUTE_ERR = 10;
  enum ushort INVALID_STATE_ERR = 11;
  enum ushort SYNTAX_ERR = 12;
  enum ushort INVALID_MODIFICATION_ERR = 13;
  enum ushort NAMESPACE_ERR = 14;
  enum ushort INVALID_ACCESS_ERR = 15;
  enum ushort VALIDATION_ERR = 16;
  enum ushort TYPE_MISMATCH_ERR = 17;
  enum ushort SECURITY_ERR = 18;
  enum ushort NETWORK_ERR = 19;
  enum ushort ABORT_ERR = 20;
  enum ushort URL_MISMATCH_ERR = 21;
  enum ushort QUOTA_EXCEEDED_ERR = 22;
  enum ushort TIMEOUT_ERR = 23;
  enum ushort INVALID_NODE_TYPE_ERR = 24;
  enum ushort DATA_CLONE_ERR = 25;
  uint result()() {
    return Object_Getter__uint(this.handle, "result");
  }
  string filename()() {
    return Object_Getter__string(this.handle, "filename");
  }
  uint lineNumber()() {
    return Object_Getter__uint(this.handle, "lineNumber");
  }
  uint columnNumber()() {
    return Object_Getter__uint(this.handle, "columnNumber");
  }
  auto location()() {
    return Optional!(StackFrame)(Object_Getter__OptionalHandle(this.handle, "location"));
  }
  auto data()() {
    return Optional!(nsISupports)(Object_Getter__OptionalHandle(this.handle, "data"));
  }
  string stack()() {
    return Object_Getter__string(this.handle, "stack");
  }
}
struct Exception {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
  uint result()() {
    return Object_Getter__uint(this.handle, "result");
  }
  string filename()() {
    return Object_Getter__string(this.handle, "filename");
  }
  uint lineNumber()() {
    return Object_Getter__uint(this.handle, "lineNumber");
  }
  uint columnNumber()() {
    return Object_Getter__uint(this.handle, "columnNumber");
  }
  auto location()() {
    return Optional!(StackFrame)(Object_Getter__OptionalHandle(this.handle, "location"));
  }
  auto data()() {
    return Optional!(nsISupports)(Object_Getter__OptionalHandle(this.handle, "data"));
  }
  string stack()() {
    return Object_Getter__string(this.handle, "stack");
  }
}
struct ExceptionMembers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint result()() {
    return Object_Getter__uint(this.handle, "result");
  }
  string filename()() {
    return Object_Getter__string(this.handle, "filename");
  }
  uint lineNumber()() {
    return Object_Getter__uint(this.handle, "lineNumber");
  }
  uint columnNumber()() {
    return Object_Getter__uint(this.handle, "columnNumber");
  }
  auto location()() {
    return Optional!(StackFrame)(Object_Getter__OptionalHandle(this.handle, "location"));
  }
  auto data()() {
    return Optional!(nsISupports)(Object_Getter__OptionalHandle(this.handle, "data"));
  }
  string stack()() {
    return Object_Getter__string(this.handle, "stack");
  }
}


