module libwasm.bindings.Function;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

alias Function = Any delegate(Any);
alias VoidFunction = void delegate();


