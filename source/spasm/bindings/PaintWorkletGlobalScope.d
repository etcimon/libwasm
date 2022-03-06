module spasm.bindings.PaintWorkletGlobalScope;

import spasm.types;
import spasm.bindings.Function;
import spasm.bindings.WorkletGlobalScope;

@safe:
nothrow:

struct PaintWorkletGlobalScope {
  nothrow:
  spasm.bindings.WorkletGlobalScope.WorkletGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkletGlobalScope(h);
  }
  void registerPaint()(string name, VoidFunction paintCtor) {
    PaintWorkletGlobalScope_registerPaint(this._parent, name, paintCtor);
  }
}


extern (C) void PaintWorkletGlobalScope_registerPaint(Handle, string, VoidFunction);