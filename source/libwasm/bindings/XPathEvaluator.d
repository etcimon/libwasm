module libwasm.bindings.XPathEvaluator;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Node;
import libwasm.bindings.XPathExpression;
import libwasm.bindings.XPathNSResolver;
import libwasm.bindings.XPathResult;

@safe:
nothrow:

struct XPathEvaluator {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto createExpression(T1)(string expression, scope auto ref Optional!(T1) resolver /* = no!(XPathNSResolver) */) if (isTOrPointer!(T1, XPathNSResolver)) {
    return XPathExpression(Serialize_Object_VarArgCall!Handle(this.handle, "createExpression", "string;Optional!Handle", tuple(expression, !resolver.empty, cast(Handle)resolver.front.handle)));
  }
  auto createExpression()(string expression) {
    return XPathExpression(Object_Call_string__Handle(this.handle, "createExpression", expression));
  }
  auto createNSResolver()(scope ref Node nodeResolver) {
    return Node(Object_Call_Handle__Handle(this.handle, "createNSResolver", nodeResolver._parent));
  }
  auto evaluate(T2, T4)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */, ushort type /* = 0 */, scope auto ref Optional!(T4) result /* = no!(JsObject) */) if (isTOrPointer!(T2, XPathNSResolver) && isTOrPointer!(T4, JsObject)) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "string;Handle;Optional!Handle;ushort;Optional!Handle", tuple(expression, cast(Handle)contextNode._parent, !resolver.empty, cast(Handle)resolver.front.handle, type, !result.empty, cast(Handle)result.front.handle)));
  }
  auto evaluate(T2)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */, ushort type /* = 0 */) if (isTOrPointer!(T2, XPathNSResolver)) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "string;Handle;Optional!Handle;ushort", tuple(expression, cast(Handle)contextNode._parent, !resolver.empty, cast(Handle)resolver.front.handle, type)));
  }
  auto evaluate(T2)(string expression, scope ref Node contextNode, scope auto ref Optional!(T2) resolver /* = no!(XPathNSResolver) */) if (isTOrPointer!(T2, XPathNSResolver)) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "string;Handle;Optional!Handle", tuple(expression, cast(Handle)contextNode._parent, !resolver.empty, cast(Handle)resolver.front.handle)));
  }
  auto evaluate()(string expression, scope ref Node contextNode) {
    return XPathResult(Serialize_Object_VarArgCall!Handle(this.handle, "evaluate", "string;Handle", tuple(expression, cast(Handle)contextNode._parent)));
  }
}


