module app;

import libwasm;

nothrow:
@safe:

mixin Spa!App;

/// Slideshow-shaped root. Phobos work lives in `probe.d` so this
/// mixin tree can stay nothrow.
struct App
{
nothrow:
    @child Banner banner;

    void construct()
    {
        banner.textContent = "phobos+wasm-eh ready";
    }

    mixin NodeDef!"div";
}

struct Banner
{
nothrow:
    @prop string textContent = "phobos pending";
    mixin NodeDef!"p";
}
