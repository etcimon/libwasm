// Standalone (no libwasm) IR probe compiled by the LDC under test.
module probe_wasm_eh;

void thrower()
{
    throw new Exception("wasm-eh-probe");
}

extern (C) int probe_catch()
{
    try
    {
        thrower();
        return 0;
    }
    catch (Exception e)
    {
        return e.msg.length ? 1 : 2;
    }
}
