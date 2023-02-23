/++
Ranges.

See_also: $(MREF mir,_primitives).

License: $(HTTP www.apache.org/licenses/LICENSE-2.0, Apache-2.0)
Copyright: 2020 Ilia Ki, Kaleidic Associates Advisory Limited, Symmetry Investments
Authors: Ilia Ki, Phobos Authors
+/
module mir.range;

/++
Data size counter.

Does not store anything.
+/
struct Counter(T)
{
    import std.range: isInputRange, ElementType;
    import std.traits: isImplicitlyConvertible, isSomeChar;
    ///
    size_t _count;

    /// Data count.
    size_t count()() @property
    {
        return _count;
    }

    private template canPutItem(U)
    {
        enum bool canPutItem =
            isImplicitlyConvertible!(U, T) ||
            isSomeChar!T && isSomeChar!U;
    }

    private template canPutRange(Range)
    {
        import mir.primitives: front;
        enum bool canPutRange =
            isInputRange!Range &&
            is(typeof(Counter.init.put(Range.init.front)));
    }

    ///
    void put(U)(auto ref U item) if (canPutItem!U)
    {
        static if (isSomeChar!T && isSomeChar!U && T.sizeof < U.sizeof)
        {
            import std.utf: codeLength;
            _count += codeLength!T(item);
        }
        else
        {
            _count++;
        }
    }

    ///
    void put(Range)(Range items) if (canPutRange!Range)
    {
        // note, we disable this branch for appending one type of char to
        // another because we can't trust the length portion.
        static if (!(isSomeChar!T && isSomeChar!(ElementType!Range) &&
                     !is(immutable Range == immutable T[])))
        {
            import mir.primitives: hasLength;
            static if (hasLength!Range)
            {
                _count += items.length;
            }
            else
            {
                for (;!items.empty; items.popFront)
                    _count++;
            }
        }
        else
        {
            import std.utf: codeLength;
            _count += codeLength!T(items);
        }
    }
}

///
version(mir_test) unittest
{
    Counter!char counter;
    counter.put("Ми");
    assert(counter.count == 4);
    counter.put('р'); // Cyrillic 
    assert(counter.count == 6);
}

///
version(mir_test) unittest
{
    Counter!wchar counter;
    counter.put("Ми");
    assert(counter.count == 2);
    counter.put('р'); // Cyrillic
    assert(counter.count == 3);
}

///
version(mir_test) unittest
{
    Counter!int counter;
    import std.algorithm: until;
    counter.put([1, 2, 3, 4, 5].until(3));
}
