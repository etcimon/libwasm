/**
    Home of the `Optional` type, faaturing the `NotNull` type
*/
module optional;

///
@("Example 1")
unittest {
    // Create empty optional
    auto a = no!int;

    // Operating on an empty optional is safe and results in none
    assert(a == none);
    assert(++a == none);

    // Assigning a value and then operating yields results
    a = 9;
    assert(a == some(9));
    assert(++a == some(10));

    // It is a range
    import std.algorithm: map;
    auto b = some(10);
    auto c = no!int;
    assert(b.map!(a => a * 2).equal([20]));
    assert(c.map!(a => a * 2).empty);

    // Safely get the inner value
    assert(b.orElse(3) == 10);
    assert(c.orElse(3) == 3);

    // Unwrap to get to the raw data (returns a non-null pointer or reference if there's data)
    class C {
        int i = 3;
    }

    auto n = no!C;
    if (auto u = n.unwrap) {} else n = some!C(null);
    assert(n == none);
    if (auto u = n.unwrap) {} else n = new C();
    assert(n.unwrap !is null);
    assert(n.unwrap.i == 3);
}


import optional.internal;

public {
    import optional.optional;
    import optional.traits;
    import optional.notnull;
    import optional.dispatch;
}
