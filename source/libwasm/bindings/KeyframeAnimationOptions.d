module libwasm.bindings.KeyframeAnimationOptions;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Animatable;

@safe:
nothrow:

alias UnrestrictedDoubleOrKeyframeAnimationOptions = SumType!(double, KeyframeAnimationOptions);


