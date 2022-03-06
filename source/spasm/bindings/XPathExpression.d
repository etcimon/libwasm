module spasm.bindings.XPathExpression;

import spasm.types;
import spasm.bindings.Node;
import spasm.bindings.XPathResult;

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
    return XPathResult(XPathExpression_evaluate(this.handle, contextNode._parent, type, !result.empty, result.front.handle));
  }
  auto evaluate()(scope ref Node contextNode, ushort type /* = 0 */) {
    return XPathResult(XPathExpression_evaluate_0(this.handle, contextNode._parent, type));
  }
  auto evaluate()(scope ref Node contextNode) {
    return XPathResult(Object_Call_Handle__Handle(this.handle, "evaluate", contextNode._parent));
  }
  auto evaluateWithContext(T4)(scope ref Node contextNode, uint contextPosition, uint contextSize, ushort type /* = 0 */, scope auto ref Optional!(T4) result /* = no!(JsObject) */) if (isTOrPointer!(T4, JsObject)) {
    return XPathResult(XPathExpression_evaluateWithContext(this.handle, contextNode._parent, contextPosition, contextSize, type, !result.empty, result.front.handle));
  }
  auto evaluateWithContext()(scope ref Node contextNode, uint contextPosition, uint contextSize, ushort type /* = 0 */) {
    return XPathResult(XPathExpression_evaluateWithContext_0(this.handle, contextNode._parent, contextPosition, contextSize, type));
  }
  auto evaluateWithContext()(scope ref Node contextNode, uint contextPosition, uint contextSize) {
    return XPathResult(XPathExpression_evaluateWithContext_1(this.handle, contextNode._parent, contextPosition, contextSize));
  }
}


extern (C) Handle XPathExpression_evaluate(Handle, Handle, ushort, bool, Handle);
extern (C) Handle XPathExpression_evaluate_0(Handle, Handle, ushort);
extern (C) Handle XPathExpression_evaluateWithContext(Handle, Handle, uint, uint, ushort, bool, Handle);
extern (C) Handle XPathExpression_evaluateWithContext_0(Handle, Handle, uint, uint, ushort);
extern (C) Handle XPathExpression_evaluateWithContext_1(Handle, Handle, uint, uint);