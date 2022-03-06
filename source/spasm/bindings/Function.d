module spasm.bindings.Function;

import spasm.types;
@safe:
nothrow:

alias Function = Any delegate(Any);
alias VoidFunction = void delegate();


