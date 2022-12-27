module libwasm.bindings.VTTCue;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DocumentFragment;
import libwasm.bindings.HTMLDivElement;
import libwasm.bindings.TextTrackCue;
import libwasm.bindings.VTTRegion;

@safe:
nothrow:

enum AlignSetting {
  start,
  center,
  end,
  left,
  right
}
enum AutoKeyword {
  auto_
}
enum DirectionSetting {
  none,
  rl,
  lr
}
enum LineAlignSetting {
  start,
  center,
  end
}
enum PositionAlignSetting {
  line_left,
  center,
  line_right,
  auto_
}
struct VTTCue {
  nothrow:
  libwasm.bindings.TextTrackCue.TextTrackCue _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .TextTrackCue(h);
  }
  void region(T0)(scope auto ref Optional!(T0) region) if (isTOrPointer!(T0, VTTRegion)) {
    Serialize_Object_VarArgCall!void(this._parent, "region", "Optional!Handle", tuple(!region.empty, cast(Handle)region.front.handle));
  }
  auto region()() {
    return recastOpt!(VTTRegion)(Object_Getter__OptionalHandle(this._parent, "region"));
  }
  void vertical()(DirectionSetting vertical) {
    Object_Call_int__void(this._parent, "vertical", vertical);
  }
  DirectionSetting vertical()() {
    return Object_Getter__int(this._parent, "vertical");
  }
  void snapToLines()(bool snapToLines) {
    Object_Call_bool__void(this._parent, "snapToLines", snapToLines);
  }
  bool snapToLines()() {
    return Object_Getter__bool(this._parent, "snapToLines");
  }
  void line()(scope ref SumType!(double, AutoKeyword) line) {
    Serialize_Object_VarArgCall!void(this._parent, "line", "SumType!(double,int)", tuple(libwasm.sumtype.match!(((double v) => 0),((AutoKeyword v) => 1))(line),tuple(libwasm.sumtype.match!(((double v) => v),((AutoKeyword v) => double.init))(line),libwasm.sumtype.match!(((double v) => AutoKeyword.init),((AutoKeyword v) => v))(line))));
  }
  auto line()() {
    return Object_Getter__Handle(this._parent, "line");
  }
  void lineAlign()(LineAlignSetting lineAlign) {
    Object_Call_int__void(this._parent, "lineAlign", lineAlign);
  }
  LineAlignSetting lineAlign()() {
    return Object_Getter__int(this._parent, "lineAlign");
  }
  void position()(scope ref SumType!(double, AutoKeyword) position) {
    Serialize_Object_VarArgCall!void(this._parent, "position", "SumType!(double,int)", tuple(libwasm.sumtype.match!(((double v) => 0),((AutoKeyword v) => 1))(position),tuple(libwasm.sumtype.match!(((double v) => v),((AutoKeyword v) => double.init))(position),libwasm.sumtype.match!(((double v) => AutoKeyword.init),((AutoKeyword v) => v))(position))));
  }
  auto position()() {
    return Object_Getter__Handle(this._parent, "position");
  }
  void positionAlign()(PositionAlignSetting positionAlign) {
    Object_Call_int__void(this._parent, "positionAlign", positionAlign);
  }
  PositionAlignSetting positionAlign()() {
    return Object_Getter__int(this._parent, "positionAlign");
  }
  void size()(double size) {
    Object_Call_double__void(this._parent, "size", size);
  }
  double size()() {
    return Object_Getter__double(this._parent, "size");
  }
  void align_()(AlignSetting align_) {
    Object_Call_int__void(this._parent, "align", align_);
  }
  AlignSetting align_()() {
    return Object_Getter__int(this._parent, "align");
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  auto getCueAsHTML()() {
    return DocumentFragment(Object_Getter__Handle(this._parent, "getCueAsHTML"));
  }
  void displayState(T0)(scope auto ref Optional!(T0) displayState) if (isTOrPointer!(T0, HTMLDivElement)) {
    Serialize_Object_VarArgCall!void(this._parent, "displayState", "Optional!Handle", tuple(!displayState.empty, cast(Handle)displayState.front.handle));
  }
  auto displayState()() {
    return recastOpt!(HTMLDivElement)(Object_Getter__OptionalHandle(this._parent, "displayState"));
  }
  bool hasBeenReset()() {
    return Object_Getter__bool(this._parent, "hasBeenReset");
  }
  double computedLine()() {
    return Object_Getter__double(this._parent, "computedLine");
  }
  double computedPosition()() {
    return Object_Getter__double(this._parent, "computedPosition");
  }
  PositionAlignSetting computedPositionAlign()() {
    return Object_Getter__int(this._parent, "computedPositionAlign");
  }
  bool getActive()() {
    return Object_Getter__bool(this._parent, "getActive");
  }
}


