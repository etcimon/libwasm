module libwasm.bindings.XMLHttpRequestUpload;

import libwasm.types;

import memutils.ct: tuple;
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


