module libwasm.bindings.SVGPathSeg;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct SVGPathSeg {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort PATHSEG_UNKNOWN = 0;
  enum ushort PATHSEG_CLOSEPATH = 1;
  enum ushort PATHSEG_MOVETO_ABS = 2;
  enum ushort PATHSEG_MOVETO_REL = 3;
  enum ushort PATHSEG_LINETO_ABS = 4;
  enum ushort PATHSEG_LINETO_REL = 5;
  enum ushort PATHSEG_CURVETO_CUBIC_ABS = 6;
  enum ushort PATHSEG_CURVETO_CUBIC_REL = 7;
  enum ushort PATHSEG_CURVETO_QUADRATIC_ABS = 8;
  enum ushort PATHSEG_CURVETO_QUADRATIC_REL = 9;
  enum ushort PATHSEG_ARC_ABS = 10;
  enum ushort PATHSEG_ARC_REL = 11;
  enum ushort PATHSEG_LINETO_HORIZONTAL_ABS = 12;
  enum ushort PATHSEG_LINETO_HORIZONTAL_REL = 13;
  enum ushort PATHSEG_LINETO_VERTICAL_ABS = 14;
  enum ushort PATHSEG_LINETO_VERTICAL_REL = 15;
  enum ushort PATHSEG_CURVETO_CUBIC_SMOOTH_ABS = 16;
  enum ushort PATHSEG_CURVETO_CUBIC_SMOOTH_REL = 17;
  enum ushort PATHSEG_CURVETO_QUADRATIC_SMOOTH_ABS = 18;
  enum ushort PATHSEG_CURVETO_QUADRATIC_SMOOTH_REL = 19;
  ushort pathSegType()() {
    return Object_Getter__ushort(this.handle, "pathSegType");
  }
  string pathSegTypeAsLetter()() {
    return Object_Getter__string(this.handle, "pathSegTypeAsLetter");
  }
}
struct SVGPathSegArcAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void r1()(float r1) {
    Object_Call_float__void(this._parent, "r1", r1);
  }
  float r1()() {
    return Object_Getter__float(this._parent, "r1");
  }
  void r2()(float r2) {
    Object_Call_float__void(this._parent, "r2", r2);
  }
  float r2()() {
    return Object_Getter__float(this._parent, "r2");
  }
  void angle()(float angle) {
    Object_Call_float__void(this._parent, "angle", angle);
  }
  float angle()() {
    return Object_Getter__float(this._parent, "angle");
  }
  void largeArcFlag()(bool largeArcFlag) {
    Object_Call_bool__void(this._parent, "largeArcFlag", largeArcFlag);
  }
  bool largeArcFlag()() {
    return Object_Getter__bool(this._parent, "largeArcFlag");
  }
  void sweepFlag()(bool sweepFlag) {
    Object_Call_bool__void(this._parent, "sweepFlag", sweepFlag);
  }
  bool sweepFlag()() {
    return Object_Getter__bool(this._parent, "sweepFlag");
  }
}
struct SVGPathSegArcRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void r1()(float r1) {
    Object_Call_float__void(this._parent, "r1", r1);
  }
  float r1()() {
    return Object_Getter__float(this._parent, "r1");
  }
  void r2()(float r2) {
    Object_Call_float__void(this._parent, "r2", r2);
  }
  float r2()() {
    return Object_Getter__float(this._parent, "r2");
  }
  void angle()(float angle) {
    Object_Call_float__void(this._parent, "angle", angle);
  }
  float angle()() {
    return Object_Getter__float(this._parent, "angle");
  }
  void largeArcFlag()(bool largeArcFlag) {
    Object_Call_bool__void(this._parent, "largeArcFlag", largeArcFlag);
  }
  bool largeArcFlag()() {
    return Object_Getter__bool(this._parent, "largeArcFlag");
  }
  void sweepFlag()(bool sweepFlag) {
    Object_Call_bool__void(this._parent, "sweepFlag", sweepFlag);
  }
  bool sweepFlag()() {
    return Object_Getter__bool(this._parent, "sweepFlag");
  }
}
struct SVGPathSegClosePath {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
}
struct SVGPathSegCurvetoCubicAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x1()(float x1) {
    Object_Call_float__void(this._parent, "x1", x1);
  }
  float x1()() {
    return Object_Getter__float(this._parent, "x1");
  }
  void y1()(float y1) {
    Object_Call_float__void(this._parent, "y1", y1);
  }
  float y1()() {
    return Object_Getter__float(this._parent, "y1");
  }
  void x2()(float x2) {
    Object_Call_float__void(this._parent, "x2", x2);
  }
  float x2()() {
    return Object_Getter__float(this._parent, "x2");
  }
  void y2()(float y2) {
    Object_Call_float__void(this._parent, "y2", y2);
  }
  float y2()() {
    return Object_Getter__float(this._parent, "y2");
  }
}
struct SVGPathSegCurvetoCubicRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x1()(float x1) {
    Object_Call_float__void(this._parent, "x1", x1);
  }
  float x1()() {
    return Object_Getter__float(this._parent, "x1");
  }
  void y1()(float y1) {
    Object_Call_float__void(this._parent, "y1", y1);
  }
  float y1()() {
    return Object_Getter__float(this._parent, "y1");
  }
  void x2()(float x2) {
    Object_Call_float__void(this._parent, "x2", x2);
  }
  float x2()() {
    return Object_Getter__float(this._parent, "x2");
  }
  void y2()(float y2) {
    Object_Call_float__void(this._parent, "y2", y2);
  }
  float y2()() {
    return Object_Getter__float(this._parent, "y2");
  }
}
struct SVGPathSegCurvetoCubicSmoothAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x2()(float x2) {
    Object_Call_float__void(this._parent, "x2", x2);
  }
  float x2()() {
    return Object_Getter__float(this._parent, "x2");
  }
  void y2()(float y2) {
    Object_Call_float__void(this._parent, "y2", y2);
  }
  float y2()() {
    return Object_Getter__float(this._parent, "y2");
  }
}
struct SVGPathSegCurvetoCubicSmoothRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x2()(float x2) {
    Object_Call_float__void(this._parent, "x2", x2);
  }
  float x2()() {
    return Object_Getter__float(this._parent, "x2");
  }
  void y2()(float y2) {
    Object_Call_float__void(this._parent, "y2", y2);
  }
  float y2()() {
    return Object_Getter__float(this._parent, "y2");
  }
}
struct SVGPathSegCurvetoQuadraticAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x1()(float x1) {
    Object_Call_float__void(this._parent, "x1", x1);
  }
  float x1()() {
    return Object_Getter__float(this._parent, "x1");
  }
  void y1()(float y1) {
    Object_Call_float__void(this._parent, "y1", y1);
  }
  float y1()() {
    return Object_Getter__float(this._parent, "y1");
  }
}
struct SVGPathSegCurvetoQuadraticRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  void x1()(float x1) {
    Object_Call_float__void(this._parent, "x1", x1);
  }
  float x1()() {
    return Object_Getter__float(this._parent, "x1");
  }
  void y1()(float y1) {
    Object_Call_float__void(this._parent, "y1", y1);
  }
  float y1()() {
    return Object_Getter__float(this._parent, "y1");
  }
}
struct SVGPathSegCurvetoQuadraticSmoothAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegCurvetoQuadraticSmoothRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegLinetoAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegLinetoHorizontalAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
}
struct SVGPathSegLinetoHorizontalRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
}
struct SVGPathSegLinetoRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegLinetoVerticalAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegLinetoVerticalRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegMovetoAbs {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}
struct SVGPathSegMovetoRel {
  nothrow:
  libwasm.bindings.SVGPathSeg.SVGPathSeg _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGPathSeg(h);
  }
  void x()(float x) {
    Object_Call_float__void(this._parent, "x", x);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this._parent, "y", y);
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
}


