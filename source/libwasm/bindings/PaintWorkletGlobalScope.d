module libwasm.bindings.PaintWorkletGlobalScope;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Function;
import libwasm.bindings.WorkletGlobalScope;

@safe:
nothrow:

struct PaintWorkletGlobalScope {
  nothrow:
  libwasm.bindings.WorkletGlobalScope.WorkletGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkletGlobalScope(h);
  }
  void registerPaint()(string name, VoidFunction paintCtor) {
    PaintWorkletGlobalScope_registerPaint(this._parent, name, paintCtor);
  }
}


extern (C) void PaintWorkletGlobalScope_registerPaint(Handle, string, VoidFunction);