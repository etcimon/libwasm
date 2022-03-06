module spasm.bindings.MutationObserver;

import spasm.types;
import spasm.bindings.Animation;
import spasm.bindings.Node;
import spasm.bindings.NodeList;

@safe:
nothrow:

alias MutationCallback = void delegate(Sequence!(MutationRecord), MutationObserver);
struct MutationObserver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void observe()(scope ref Node target, scope ref MutationObserverInit options) {
    MutationObserver_observe(this.handle, target._parent, options.handle);
  }
  void observe()(scope ref Node target) {
    Object_Call_Handle__void(this.handle, "observe", target._parent);
  }
  void disconnect()() {
    Object_Call__void(this.handle, "disconnect");
  }
  auto takeRecords()() {
    return Sequence!(MutationRecord)(Object_Getter__Handle(this.handle, "takeRecords"));
  }
  auto getObservingInfo()() {
    return Sequence!(Optional!(MutationObservingInfo))(Object_Getter__Handle(this.handle, "getObservingInfo"));
  }
  MutationCallback mutationCallback()() {
    return MutationObserver_mutationCallback_Get(this.handle);
  }
  void mergeAttributeRecords()(bool mergeAttributeRecords) {
    Object_Call_bool__void(this.handle, "mergeAttributeRecords", mergeAttributeRecords);
  }
  bool mergeAttributeRecords()() {
    return Object_Getter__bool(this.handle, "mergeAttributeRecords");
  }
}
struct MutationObserverInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MutationObserverInit(spasm_add__object());
  }
  void childList()(bool childList) {
    Object_Call_bool__void(this.handle, "childList", childList);
  }
  bool childList()() {
    return Object_Getter__bool(this.handle, "childList");
  }
  void attributes()(bool attributes) {
    Object_Call_bool__void(this.handle, "attributes", attributes);
  }
  bool attributes()() {
    return Object_Getter__bool(this.handle, "attributes");
  }
  void characterData()(bool characterData) {
    Object_Call_bool__void(this.handle, "characterData", characterData);
  }
  bool characterData()() {
    return Object_Getter__bool(this.handle, "characterData");
  }
  void subtree()(bool subtree) {
    Object_Call_bool__void(this.handle, "subtree", subtree);
  }
  bool subtree()() {
    return Object_Getter__bool(this.handle, "subtree");
  }
  void attributeOldValue()(bool attributeOldValue) {
    Object_Call_bool__void(this.handle, "attributeOldValue", attributeOldValue);
  }
  bool attributeOldValue()() {
    return Object_Getter__bool(this.handle, "attributeOldValue");
  }
  void characterDataOldValue()(bool characterDataOldValue) {
    Object_Call_bool__void(this.handle, "characterDataOldValue", characterDataOldValue);
  }
  bool characterDataOldValue()() {
    return Object_Getter__bool(this.handle, "characterDataOldValue");
  }
  void nativeAnonymousChildList()(bool nativeAnonymousChildList) {
    Object_Call_bool__void(this.handle, "nativeAnonymousChildList", nativeAnonymousChildList);
  }
  bool nativeAnonymousChildList()() {
    return Object_Getter__bool(this.handle, "nativeAnonymousChildList");
  }
  void animations()(bool animations) {
    Object_Call_bool__void(this.handle, "animations", animations);
  }
  bool animations()() {
    return Object_Getter__bool(this.handle, "animations");
  }
  void attributeFilter()(scope ref Sequence!(string) attributeFilter) {
    Object_Call_Handle__void(this.handle, "attributeFilter", attributeFilter.handle);
  }
  auto attributeFilter()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "attributeFilter"));
  }
}
struct MutationObservingInfo {
  nothrow:
  spasm.bindings.MutationObserver.MutationObserverInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MutationObserverInit(h);
  }
  static auto create() {
    return MutationObservingInfo(spasm_add__object());
  }
  void observedNode(T0)(scope auto ref Optional!(T0) observedNode) if (isTOrPointer!(T0, Node)) {
    MutationObservingInfo_observedNode_Set(this._parent, !observedNode.empty, observedNode.front._parent);
  }
  auto observedNode()() {
    return Object_Getter__OptionalHandle(this._parent, "observedNode");
  }
}
struct MutationRecord {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  auto target()() {
    return Object_Getter__OptionalHandle(this.handle, "target");
  }
  auto addedNodes()() {
    return NodeList(Object_Getter__Handle(this.handle, "addedNodes"));
  }
  auto removedNodes()() {
    return NodeList(Object_Getter__Handle(this.handle, "removedNodes"));
  }
  auto previousSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "previousSibling");
  }
  auto nextSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "nextSibling");
  }
  Optional!(string) attributeName()() {
    return Object_Getter__OptionalString(this.handle, "attributeName");
  }
  Optional!(string) attributeNamespace()() {
    return Object_Getter__OptionalString(this.handle, "attributeNamespace");
  }
  Optional!(string) oldValue()() {
    return Object_Getter__OptionalString(this.handle, "oldValue");
  }
  auto addedAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this.handle, "addedAnimations"));
  }
  auto changedAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this.handle, "changedAnimations"));
  }
  auto removedAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this.handle, "removedAnimations"));
  }
}


extern (C) void MutationObserver_observe(Handle, Handle, Handle);
extern (C) MutationCallback MutationObserver_mutationCallback_Get(Handle);
extern (C) void MutationObservingInfo_observedNode_Set(Handle, bool, Handle);