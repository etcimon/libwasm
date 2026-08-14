module app;

import libwasm;

nothrow:
@safe:

mixin Spa!App;

/// Slideshow-shaped root: one node tree + construct hook.
/// `probeCatch` is the wasm-eh payload — same try/catch shape navbar uses.
struct App
{
nothrow:
    @child Banner banner;

    void construct()
    {
        banner.textContent = "wasm-eh ready";
    }

    mixin NodeDef!"div";
}

struct Banner
{
nothrow:
    @prop string textContent = "wasm-eh pending";
    mixin NodeDef!"p";
}

/// JS / wasm-opt can call this. Returns 1 if catch ran.
export extern (C) int spa_eh_probe() @trusted
{
    import libwasm.rt.memory : alloc_init;
    static bool started;
    if (!started)
    {
        alloc_init(1024 * 1024);
        started = true;
    }
    return probeCatch();
}

/// Throws and catches a D Exception. Master LDC lowers this to
/// catchswitch / catchpad / llvm.wasm.get.exception.
pragma(inline, false)
int probeCatch() @trusted
{
    try
    {
        throw new Exception("spa-wasm-eh");
    }
    catch (Exception e)
    {
        return e.msg.length ? 1 : 2;
    }
}
