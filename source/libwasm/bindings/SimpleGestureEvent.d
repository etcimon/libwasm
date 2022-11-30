module libwasm.bindings.SimpleGestureEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MouseEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct SimpleGestureEvent {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  enum uint DIRECTION_UP = 1;
  enum uint DIRECTION_DOWN = 2;
  enum uint DIRECTION_LEFT = 4;
  enum uint DIRECTION_RIGHT = 8;
  enum uint ROTATION_COUNTERCLOCKWISE = 1;
  enum uint ROTATION_CLOCKWISE = 2;
  void allowedDirections()(uint allowedDirections) {
    Object_Call_uint__void(this._parent, "allowedDirections", allowedDirections);
  }
  uint allowedDirections()() {
    return Object_Getter__uint(this._parent, "allowedDirections");
  }
  uint direction()() {
    return Object_Getter__uint(this._parent, "direction");
  }
  double delta()() {
    return Object_Getter__double(this._parent, "delta");
  }
  uint clickCount()() {
    return Object_Getter__uint(this._parent, "clickCount");
  }
  void initSimpleGestureEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, uint allowedDirectionsArg /* = 0 */, uint directionArg /* = 0 */, double deltaArg /* = 0 */, uint clickCount /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;uint;uint;double;uint", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, allowedDirectionsArg, directionArg, deltaArg, clickCount));
  }
  void initSimpleGestureEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, uint allowedDirectionsArg /* = 0 */, uint directionArg /* = 0 */, double deltaArg /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;uint;uint;double", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, allowedDirectionsArg, directionArg, deltaArg));
  }
  void initSimpleGestureEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, uint allowedDirectionsArg /* = 0 */, uint directionArg /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;uint;uint", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, allowedDirectionsArg, directionArg));
  }
  void initSimpleGestureEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, uint allowedDirectionsArg /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;uint", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, allowedDirectionsArg));
  }
  void initSimpleGestureEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg));
  }
  void initSimpleGestureEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent));
  }
  void initSimpleGestureEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg));
  }
  void initSimpleGestureEvent()(string typeArg, bool canBubbleArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initSimpleGestureEvent", "string;bool", tuple(typeArg, canBubbleArg));
  }
  void initSimpleGestureEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initSimpleGestureEvent", typeArg);
  }
}


