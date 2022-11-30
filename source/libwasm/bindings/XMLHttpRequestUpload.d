module libwasm.bindings.XMLHttpRequestUpload;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.XMLHttpRequestEventTarget;

@safe:
nothrow:

struct XMLHttpRequestUpload {
  nothrow:
  libwasm.bindings.XMLHttpRequestEventTarget.XMLHttpRequestEventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .XMLHttpRequestEventTarget(h);
  }
}


