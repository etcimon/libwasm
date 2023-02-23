module libwasm.bindings.KeyframeAnimationOptions;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Animatable;

@safe:
nothrow:

alias UnrestrictedDoubleOrKeyframeAnimationOptions = SumType!(double, KeyframeAnimationOptions);


