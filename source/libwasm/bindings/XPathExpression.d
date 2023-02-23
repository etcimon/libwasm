module libwasm.bindings.XPathExpression;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Node;
import libwasm.bindings.XPathResult;

@safe:
nothrow:

struct XPathExpression {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto evaluate(T2)(scope ref Node contextNode, ushort type /* = 0 */, scope auto ref Optional!(T2) result /* = no!(JsObject) */) if (isTOrPointer!(T2, JsObject)) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "Handle;ushort;Optional!Handle", tuple(cast(Handle)contextNode._parent, type, !result.empty, cast(Handle)result.front.handle)));
  }
  auto evaluate()(scope ref Node contextNode, ushort type /* = 0 */) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "Handle;ushort", tuple(cast(Handle)contextNode._parent, type)));
  }
  auto evaluate()(scope ref Node contextNode) {
    return XPathResult(Object_Call_Handle__Handle(this.handle, "evaluate", contextNode._parent));
  }
  auto evaluateWithContext(T4)(scope ref Node contextNode, uint contextPosition, uint contextSize, ushort type /* = 0 */, scope auto ref Optional!(T4) result /* = no!(JsObject) */) if (isTOrPointer!(T4, JsObject)) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluateWithContext", "Handle;uint;uint;ushort;Optional!Handle", tuple(cast(Handle)contextNode._parent, contextPosition, contextSize, type, !result.empty, cast(Handle)result.front.handle)));
  }
  auto evaluateWithContext()(scope ref Node contextNode, uint contextPosition, uint contextSize, ushort type /* = 0 */) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluateWithContext", "Handle;uint;uint;ushort", tuple(cast(Handle)contextNode._parent, contextPosition, contextSize, type)));
  }
  auto evaluateWithContext()(scope ref Node contextNode, uint contextPosition, uint contextSize) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluateWithContext", "Handle;uint;uint", tuple(cast(Handle)contextNode._parent, contextPosition, contextSize)));
  }
}


