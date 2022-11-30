module libwasm.bindings.Function;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

alias Function = Any delegate(Any);
alias VoidFunction = void delegate();


