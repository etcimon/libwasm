module libwasm.bindings.KeyframeAnimationOptions;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Animatable;

@safe:
nothrow:

alias UnrestrictedDoubleOrKeyframeAnimationOptions = SumType!(double, KeyframeAnimationOptions);


