// Per-file policy for carry emit. First match wins.
// Native carry: copy stock-N, overlay-splice hook files, omit kernel,
// keep libwasm-only extras. Never copy LDC-N "goal" bodies.

module principles;

import kernel;
import parseutil;
import versions;

enum EmitAction
{
    omit,
    takeStock,     /// LDC-N body (identical / rebase-from-new)
    astOverlay,    /// stock-N + adapt.d splices (reapply-adapt)
    copyLibwasm,   /// libwasm-only extra (core.sys.wasi, …)
}

struct Principle
{
    string id;
    string why;
    bool function(string rel, KernelGroup g) match;
    EmitAction action;
}

bool isHookFile(string rel)
{
    return rel == "object.d" || rel == "rt/lifetime.d" || rel == "core/lifetime.d"
        || rel == "core/memory.d" || rel == "core/exception.d"
        || rel == "core/stdc/assert_.d" || rel == "core/stdc/time.d"
        || rel == "core/internal/spinlock.d" || rel == "core/time.d";
}

/// Files whose public names 1.42 object.d re-exports, plus their
/// immediate helpers. Must be stock-N so `_d_arraysetlengthT` /
/// `_d_newarraymTX` match the frontend. Pin appending/utils stay pin
/// so rt/lifetime can keep `__arrayStart` — except utils is needed by
/// stock construction, so it is stock too; rt/lifetime is stock+splice.
bool isCompilerHookFile(string rel)
{
    return rel == "core/internal/array/capacity.d"
        || rel == "core/internal/array/construction.d"
        || rel == "core/internal/array/concatenation.d"
        || rel == "core/internal/array/arrayassign.d"
        || rel == "core/internal/array/utils.d"
        || rel == "core/internal/array/appending.d"
        || rel == "core/internal/cast_.d" || rel == "core/internal/dassert.d"
        || rel == "core/internal/destruction.d" || rel == "core/internal/moving.d"
        || rel == "core/internal/postblit.d" || rel == "core/internal/switch_.d"
        || rel == "core/internal/lifetime.d" || rel == "core/lifetime.d"
        || rel == "rt/lifetime.d" || rel == "core/demangle.d"
        || rel == "core/internal/newaa.d";
}

/// OS / GC / threads / dwarf unwind / bootstrap stay omitted on every tag.
/// phobosMath + phobosOther were omitted only because throw could not be
/// caught; 1.43+ wasm EH carries them (stdio/file/socket/conc still out).
bool kernelOmitForTag(string rel, KernelGroup g, string tag)
{
    if (isHookFile(rel))
        return false;
    if (g == KernelGroup.thread || g == KernelGroup.os
        || g == KernelGroup.eh || g == KernelGroup.gc
        || g == KernelGroup.phobosIo || g == KernelGroup.phobosConc
        || g == KernelGroup.bootstrap)
        return true;
    if (g == KernelGroup.phobosMath || g == KernelGroup.phobosOther)
        return !isEhCapableTag(tag);
    return false;
}

private bool kernelOmit(string rel, KernelGroup g)
{
    // Conservative (pre-EH) table used by selectPrinciple. emit.d
    // re-decides phobosMath / phobosOther via kernelOmitForTag + tag.
    return kernelOmitForTag(rel, g, pinTag);
}

private bool hookFile(string rel, KernelGroup)
{
    return isHookFile(rel);
}

private bool wasmNative(string rel, KernelGroup g)
{
    return g == KernelGroup.none && (rel == "rt/sections_wasm.d"
        || rel.length >= 14 && rel[0 .. 14] == "core/sys/wasi/");
}

private bool defaultTake(string, KernelGroup)
{
    return true;
}

immutable Principle[] principleTable = [
    Principle("omit.kernel",
        "No OS/GC/threads/_d_run_main on CRuntime_LIBWASM; -fno-moduleinfo. "
        ~ "1.43+ emit still omits those, but keeps exception-using Phobos.",
        &kernelOmit, EmitAction.omit),
    Principle("ast.libwasm-hooks",
        "Replay CRT gate / no-GC alloc / throw abort onto any LDC-N stock.",
        &hookFile, EmitAction.astOverlay),
    Principle("take.wasi",
        "core.sys.wasi is libwasm-only extra — not selected here (no stock path).",
        &wasmNative, EmitAction.takeStock),
    Principle("take.stock",
        "Unmatched keepers: take LDC-N body (rebase identical files).",
        &defaultTake, EmitAction.takeStock),
];

const(Principle)* selectPrinciple(string rel, KernelGroup g)
{
    foreach (ref p; principleTable)
        if (p.match(rel, g))
            return &p;
    return null;
}

EmitAction selectAction(string rel, KernelGroup g)
{
    return selectAction(rel, g, pinTag);
}

EmitAction selectAction(string rel, KernelGroup g, string tag)
{
    if (kernelOmitForTag(rel, g, tag))
        return EmitAction.omit;
    if (isHookFile(rel))
        return EmitAction.astOverlay;
    auto p = selectPrinciple(rel, g);
    auto act = p is null ? EmitAction.takeStock : p.action;
    if (act == EmitAction.omit && !kernelOmitForTag(rel, g, tag))
        return EmitAction.takeStock;
    return act;
}
