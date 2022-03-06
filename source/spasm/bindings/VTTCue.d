module spasm.bindings.VTTCue;

import spasm.types;
import spasm.bindings.DocumentFragment;
import spasm.bindings.HTMLDivElement;
import spasm.bindings.TextTrackCue;
import spasm.bindings.VTTRegion;

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
  spasm.bindings.TextTrackCue.TextTrackCue _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .TextTrackCue(h);
  }
  void region(T0)(scope auto ref Optional!(T0) region) if (isTOrPointer!(T0, VTTRegion)) {
    VTTCue_region_Set(this._parent, !region.empty, region.front.handle);
  }
  auto region()() {
    return Object_Getter__OptionalHandle(this._parent, "region");
  }
  void vertical()(DirectionSetting vertical) {
    VTTCue_vertical_Set(this._parent, vertical);
  }
  DirectionSetting vertical()() {
    return VTTCue_vertical_Get(this._parent);
  }
  void snapToLines()(bool snapToLines) {
    Object_Call_bool__void(this._parent, "snapToLines", snapToLines);
  }
  bool snapToLines()() {
    return Object_Getter__bool(this._parent, "snapToLines");
  }
  void line()(scope ref SumType!(double, AutoKeyword) line) {
    VTTCue_line_Set(this._parent, line);
  }
  auto line()() {
    return Object_Getter__Handle(this._parent, "line");
  }
  void lineAlign()(LineAlignSetting lineAlign) {
    VTTCue_lineAlign_Set(this._parent, lineAlign);
  }
  LineAlignSetting lineAlign()() {
    return VTTCue_lineAlign_Get(this._parent);
  }
  void position()(scope ref SumType!(double, AutoKeyword) position) {
    VTTCue_position_Set(this._parent, position);
  }
  auto position()() {
    return Object_Getter__Handle(this._parent, "position");
  }
  void positionAlign()(PositionAlignSetting positionAlign) {
    VTTCue_positionAlign_Set(this._parent, positionAlign);
  }
  PositionAlignSetting positionAlign()() {
    return VTTCue_positionAlign_Get(this._parent);
  }
  void size()(double size) {
    Object_Call_double__void(this._parent, "size", size);
  }
  double size()() {
    return Object_Getter__double(this._parent, "size");
  }
  void align_()(AlignSetting align_) {
    VTTCue_align_Set(this._parent, align_);
  }
  AlignSetting align_()() {
    return VTTCue_align_Get(this._parent);
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
    VTTCue_displayState_Set(this._parent, !displayState.empty, displayState.front.handle);
  }
  auto displayState()() {
    return Object_Getter__OptionalHandle(this._parent, "displayState");
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
    return VTTCue_computedPositionAlign_Get(this._parent);
  }
  bool getActive()() {
    return Object_Getter__bool(this._parent, "getActive");
  }
}


extern (C) void VTTCue_region_Set(Handle, bool, Handle);
extern (C) void VTTCue_vertical_Set(Handle, DirectionSetting);
extern (C) DirectionSetting VTTCue_vertical_Get(Handle);
extern (C) void VTTCue_line_Set(Handle, scope ref SumType!(double, AutoKeyword));
extern (C) void VTTCue_lineAlign_Set(Handle, LineAlignSetting);
extern (C) LineAlignSetting VTTCue_lineAlign_Get(Handle);
extern (C) void VTTCue_position_Set(Handle, scope ref SumType!(double, AutoKeyword));
extern (C) void VTTCue_positionAlign_Set(Handle, PositionAlignSetting);
extern (C) PositionAlignSetting VTTCue_positionAlign_Get(Handle);
extern (C) void VTTCue_align_Set(Handle, AlignSetting);
extern (C) AlignSetting VTTCue_align_Get(Handle);
extern (C) void VTTCue_displayState_Set(Handle, bool, Handle);
extern (C) PositionAlignSetting VTTCue_computedPositionAlign_Get(Handle);