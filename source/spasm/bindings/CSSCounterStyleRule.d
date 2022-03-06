module spasm.bindings.CSSCounterStyleRule;

import spasm.types;
import spasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSCounterStyleRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void system()(string system) {
    Object_Call_string__void(this._parent, "system", system);
  }
  string system()() {
    return Object_Getter__string(this._parent, "system");
  }
  void symbols()(string symbols) {
    Object_Call_string__void(this._parent, "symbols", symbols);
  }
  string symbols()() {
    return Object_Getter__string(this._parent, "symbols");
  }
  void additiveSymbols()(string additiveSymbols) {
    Object_Call_string__void(this._parent, "additiveSymbols", additiveSymbols);
  }
  string additiveSymbols()() {
    return Object_Getter__string(this._parent, "additiveSymbols");
  }
  void negative()(string negative) {
    Object_Call_string__void(this._parent, "negative", negative);
  }
  string negative()() {
    return Object_Getter__string(this._parent, "negative");
  }
  void prefix()(string prefix) {
    Object_Call_string__void(this._parent, "prefix", prefix);
  }
  string prefix()() {
    return Object_Getter__string(this._parent, "prefix");
  }
  void suffix()(string suffix) {
    Object_Call_string__void(this._parent, "suffix", suffix);
  }
  string suffix()() {
    return Object_Getter__string(this._parent, "suffix");
  }
  void range()(string range) {
    Object_Call_string__void(this._parent, "range", range);
  }
  string range()() {
    return Object_Getter__string(this._parent, "range");
  }
  void pad()(string pad) {
    Object_Call_string__void(this._parent, "pad", pad);
  }
  string pad()() {
    return Object_Getter__string(this._parent, "pad");
  }
  void speakAs()(string speakAs) {
    Object_Call_string__void(this._parent, "speakAs", speakAs);
  }
  string speakAs()() {
    return Object_Getter__string(this._parent, "speakAs");
  }
  void fallback()(string fallback) {
    Object_Call_string__void(this._parent, "fallback", fallback);
  }
  string fallback()() {
    return Object_Getter__string(this._parent, "fallback");
  }
}


