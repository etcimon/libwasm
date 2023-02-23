module libwasm.bindings.Function;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

alias Function = Any delegate(Any);
alias VoidFunction = void delegate();


