module optional.bolts;


/**
https://github.com/aliak00/bolts

MIT License

Copyright (c) 2018 Ali Akhtarzada

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
**/

/*
    Returns true if the passed in function is an n-ary function over the next n parameter arguments

    Parameter arguments can be any compile time entity that can be typed. The first
*/

import core.internal.traits : allSat = allSatisfy;
alias allSatisfy = allSat;

template isFunctionOver(T...) {
    import std.meta: Alias;
    import std.traits: isSomeFunction, Parameters;

    alias Types = TypesOf!T;

    static if (Types.length >= 1) {
        alias DesiredParams = AliasPack!(Types[1 .. $]);
        static if (isSomeFunction!(Types[0])) {
            alias ExpectedParams = AliasPack!(Parameters!(Types[0]));
            static if (DesiredParams.length == ExpectedParams.length) {
                static if (DesiredParams.length == 0) {
                    enum isFunctionOver = true;
                } else {
                    alias Pairs = staticZip!(ExpectedParams, DesiredParams);
                    // If is(DesiredType : ExpectedType)
                    enum AreSame(alias Pair) = is(Pair.Unpack[1] : Pair.Unpack[0]);
                    enum isFunctionOver = allSatisfy!(AreSame, Pairs.Unpack);
                }
            } else {
                enum isFunctionOver = false;
            }
        } else static if (is(Types[0] == void)) {
            // We're going to assume the first arg is a function literal ala lambda
            // And try and see if calling it with the init values of the desired
            // params works
            alias F = T[0];
            alias Val(T) = Alias!(T.init);
            enum isFunctionOver = __traits(compiles, { F(staticMap!(Val, DesiredParams.Unpack)); });
        } else {
            enum isFunctionOver = false;
        }
    } else {
        enum isFunctionOver = false;
    }
}

alias AliasSeq(TList...) = TList;

/**
    Same as an AliasSeq that does not auto expand.

    You can get to the provided compile time sequence (AliasSeq) by accessing the `.Unpack` member.
    And if you want a recursive expansion there's `UnpackDeep` for that. Also a convenience
    `.equals!(otherAliasPack)` is provided.

    See_Also:
        - https://forum.dlang.org/post/mnobngrzdmqbxomulpts@forum.dlang.org
*/
template AliasPack(T...) {
    alias Unpack = T;
    enum length = Unpack.length;

    private template UnpackDeepImpl(U...) {
        static if (U.length) {
            import std.traits: isInstanceOf;
            static if (isInstanceOf!(AliasPack, U[0])) {
                alias Head = UnpackDeepImpl!(U[0].Unpack);
            } else {
                import std.meta: Alias;
                alias Head = Alias!(U[0]);
            }
            alias UnpackDeepImpl = AliasSeq!(Head, UnpackDeepImpl!(U[1 .. $]));
        } else {
            alias UnpackDeepImpl = AliasSeq!();
        }
    }

    alias UnpackDeep = UnpackDeepImpl!T;

    template equals(U...) {
        static if (T.length == U.length) {
            static if (T.length == 0) {
                enum equals = true;
            } else {
                enum equals = isSame!(T[0], U[0]) && AliasPack!(T[1 .. $]).equals!(U[1 .. $]);
            }
        } else {
            enum equals = false;
        }
    }

    static if (length > 0) {
        import std.meta: Alias;
        alias Head = Alias!(T[0]);
    } else {
        alias Head = void;
    }

    static if (length > 1) {
        alias Tail = AliasPack!(T[1 .. $]);
    } else {
        alias Tail = AliasPack!();
    }
}


/**
    Zips sequences of `AliasPack`s together into an AliasPack of AliasPacks.

    See_Also:
        - https://forum.dlang.org/post/mnobngrzdmqbxomulpts@forum.dlang.org
*/
template staticZip(Seqs...) {
    import std.traits: isInstanceOf;

    private enum isPack(alias T) = isInstanceOf!(AliasPack, T);

    static assert(
        Seqs.length >= 2 && allSatisfy!(isPack, Seqs),
        "Must have 2 or more arguments of type AliasPack"
    );

    enum len = Seqs[0].length;
    static foreach (Seq; Seqs[1 .. $]) {
        static assert(
            Seq.length == len,
            "All arguments to staticZip must have the same length"
        );
    }

    alias Head(alias P) = P.Head;
    alias Tail(alias P) = P.Tail;

    static if (len == 0) {
        alias staticZip = AliasPack!();
    } else {
        alias staticZip = AliasPack!(
            AliasPack!(staticMap!(Head, Seqs)),
            staticZip!(staticMap!(Tail, Seqs)).Unpack
        );
    }
}


/**
Evaluates to `AliasSeq!(fun!(args[0]), fun!(args[1]), ..., fun!(args[$ - 1]))`.
 */
template staticMap(alias fun, args...)
{
    version (__staticMap_simplest_but_buggy)
    {
        // @@@ BUG @@@
        // The following straightforward implementation exposes a bug.
        // See issue https://issues.dlang.org/show_bug.cgi?id=22421 and unittest below.
        alias staticMap = AliasSeq!();
        static foreach (arg; args)
             staticMap = AliasSeq!(staticMap, fun!arg);
    }
    else version (__staticMap_simple_but_slow)
    {
        // This has a performance bug. Appending to the staticMap seems to be quadratic.
        alias staticMap = AliasSeq!();
        static foreach (i; 0 .. args.length)
            staticMap = AliasSeq!(staticMap, fun!(args[i]));
    }
    else // Current best-of-breed implementation imitates quicksort
    {
        static if (args.length <= 8)
        {
            alias staticMap = AliasSeq!();
            static foreach (i; 0 .. args.length)
                staticMap = AliasSeq!(staticMap, fun!(args[i]));
        }
        else
        {
            alias staticMap = AliasSeq!(staticMap!(fun, args[0 .. $ / 2]), staticMap!(fun, args[$ / 2 .. $]));
        }
    }
}


/**
    Returns the types of all values given.

    $(OD isFunction!T then the typeof the address is taken if possible)
    $(OD If typeof(T) can be taken it is)
    $(OD Else it is appended on as is)

    Returns:
        AliasSeq of the resulting types
*/
template TypesOf(Values...) {
    import std.meta: AliasSeq;
    import std.traits: isExpressions, isFunction;
    static if (Values.length) {
        static if (isFunction!(Values[0]) && is(typeof(&Values[0]) F)) {
            alias T = F;
        } else static if (is(typeof(Values[0]))) {
            alias T = typeof(Values[0]);
        } else {
            alias T = Values[0];
        }
        alias TypesOf = AliasSeq!(T, TypesOf!(Values[1..$]));
    } else {
        alias TypesOf = AliasSeq!();
    }
}


/**
    Returns true if a and b are the same thing, or false if not. Both a and b can be types, literals, or symbols.

    $(LI If both are types: `is(a == b)`)
    $(LI If both are literals: `a == b`)
    $(LI Else: `__traits(isSame, a, b)`)
*/
template isSame(ab...) if (ab.length == 2) {

    private static template expectType(T) {}
    private static template expectBool(bool b) {}

    static if (__traits(compiles, expectType!(ab[0]), expectType!(ab[1]))) {
        enum isSame = is(ab[0] == ab[1]);
    } else static if (!__traits(compiles, expectType!(ab[0]))
        && !__traits(compiles, expectType!(ab[1]))
        &&  __traits(compiles, expectBool!(ab[0] == ab[1]))
    ) {
        static if (!__traits(compiles, &ab[0]) || !__traits(compiles, &ab[1]))
            enum isSame = (ab[0] == ab[1]);
        else
            enum isSame = __traits(isSame, ab[0], ab[1]);
    } else {
        enum isSame = __traits(isSame, ab[0], ab[1]);
    }
}
