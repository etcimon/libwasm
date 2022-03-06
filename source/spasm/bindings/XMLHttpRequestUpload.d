module spasm.bindings.XMLHttpRequestUpload;

import spasm.types;
import spasm.bindings.XMLHttpRequestEventTarget;

@safe:
nothrow:

struct XMLHttpRequestUpload {
  nothrow:
  spasm.bindings.XMLHttpRequestEventTarget.XMLHttpRequestEventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .XMLHttpRequestEventTarget(h);
  }
}


