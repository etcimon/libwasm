module ldc.gccbuiltins_arm; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.arm.cdp")
    void __builtin_arm_cdp(int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.cdp2")
    void __builtin_arm_cdp2(int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.cmse.tt")
    int __builtin_arm_cmse_TT(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.cmse.tta")
    int __builtin_arm_cmse_TTA(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.cmse.ttat")
    int __builtin_arm_cmse_TTAT(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.cmse.ttt")
    int __builtin_arm_cmse_TTT(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.dmb")
    void __builtin_arm_dmb(int);

pragma(LDC_intrinsic, "llvm.arm.dsb")
    void __builtin_arm_dsb(int);

pragma(LDC_intrinsic, "llvm.arm.get.fpscr")
    int __builtin_arm_get_fpscr();

pragma(LDC_intrinsic, "llvm.arm.isb")
    void __builtin_arm_isb(int);

pragma(LDC_intrinsic, "llvm.arm.ldc")
    void __builtin_arm_ldc(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.ldc2")
    void __builtin_arm_ldc2(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.ldc2l")
    void __builtin_arm_ldc2l(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.ldcl")
    void __builtin_arm_ldcl(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.mcr")
    void __builtin_arm_mcr(int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.mcr2")
    void __builtin_arm_mcr2(int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.mrc")
    int __builtin_arm_mrc(int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.mrc2")
    int __builtin_arm_mrc2(int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.arm.qadd")
    int __builtin_arm_qadd(int, int);

pragma(LDC_intrinsic, "llvm.arm.qadd16")
    int __builtin_arm_qadd16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qadd8")
    int __builtin_arm_qadd8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qasx")
    int __builtin_arm_qasx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qsax")
    int __builtin_arm_qsax(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qsub")
    int __builtin_arm_qsub(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qsub16")
    int __builtin_arm_qsub16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.qsub8")
    int __builtin_arm_qsub8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.sadd16")
    int __builtin_arm_sadd16(int, int);

pragma(LDC_intrinsic, "llvm.arm.sadd8")
    int __builtin_arm_sadd8(int, int);

pragma(LDC_intrinsic, "llvm.arm.sasx")
    int __builtin_arm_sasx(int, int);

pragma(LDC_intrinsic, "llvm.arm.sel")
    int __builtin_arm_sel(int, int);

pragma(LDC_intrinsic, "llvm.arm.set.fpscr")
    void __builtin_arm_set_fpscr(int);

pragma(LDC_intrinsic, "llvm.arm.shadd16")
    int __builtin_arm_shadd16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.shadd8")
    int __builtin_arm_shadd8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.shasx")
    int __builtin_arm_shasx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.shsax")
    int __builtin_arm_shsax(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.shsub16")
    int __builtin_arm_shsub16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.shsub8")
    int __builtin_arm_shsub8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlabb")
    int __builtin_arm_smlabb(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlabt")
    int __builtin_arm_smlabt(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlad")
    int __builtin_arm_smlad(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smladx")
    int __builtin_arm_smladx(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlald")
    long __builtin_arm_smlald(int, int, long) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlaldx")
    long __builtin_arm_smlaldx(int, int, long) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlatb")
    int __builtin_arm_smlatb(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlatt")
    int __builtin_arm_smlatt(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlawb")
    int __builtin_arm_smlawb(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlawt")
    int __builtin_arm_smlawt(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlsd")
    int __builtin_arm_smlsd(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlsdx")
    int __builtin_arm_smlsdx(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlsld")
    long __builtin_arm_smlsld(int, int, long) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smlsldx")
    long __builtin_arm_smlsldx(int, int, long) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smuad")
    int __builtin_arm_smuad(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smuadx")
    int __builtin_arm_smuadx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smulbb")
    int __builtin_arm_smulbb(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smulbt")
    int __builtin_arm_smulbt(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smultb")
    int __builtin_arm_smultb(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smultt")
    int __builtin_arm_smultt(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smulwb")
    int __builtin_arm_smulwb(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smulwt")
    int __builtin_arm_smulwt(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smusd")
    int __builtin_arm_smusd(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.smusdx")
    int __builtin_arm_smusdx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.ssat")
    int __builtin_arm_ssat(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.ssat16")
    int __builtin_arm_ssat16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.ssax")
    int __builtin_arm_ssax(int, int);

pragma(LDC_intrinsic, "llvm.arm.ssub16")
    int __builtin_arm_ssub16(int, int);

pragma(LDC_intrinsic, "llvm.arm.ssub8")
    int __builtin_arm_ssub8(int, int);

pragma(LDC_intrinsic, "llvm.arm.stc")
    void __builtin_arm_stc(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.stc2")
    void __builtin_arm_stc2(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.stc2l")
    void __builtin_arm_stc2l(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.stcl")
    void __builtin_arm_stcl(int, int, void*);

pragma(LDC_intrinsic, "llvm.arm.sxtab16")
    int __builtin_arm_sxtab16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.sxtb16")
    int __builtin_arm_sxtb16(int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uadd16")
    int __builtin_arm_uadd16(int, int);

pragma(LDC_intrinsic, "llvm.arm.uadd8")
    int __builtin_arm_uadd8(int, int);

pragma(LDC_intrinsic, "llvm.arm.uasx")
    int __builtin_arm_uasx(int, int);

pragma(LDC_intrinsic, "llvm.arm.uhadd16")
    int __builtin_arm_uhadd16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uhadd8")
    int __builtin_arm_uhadd8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uhasx")
    int __builtin_arm_uhasx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uhsax")
    int __builtin_arm_uhsax(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uhsub16")
    int __builtin_arm_uhsub16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uhsub8")
    int __builtin_arm_uhsub8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqadd16")
    int __builtin_arm_uqadd16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqadd8")
    int __builtin_arm_uqadd8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqasx")
    int __builtin_arm_uqasx(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqsax")
    int __builtin_arm_uqsax(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqsub16")
    int __builtin_arm_uqsub16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uqsub8")
    int __builtin_arm_uqsub8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.usad8")
    int __builtin_arm_usad8(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.usada8")
    int __builtin_arm_usada8(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.usat")
    int __builtin_arm_usat(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.usat16")
    int __builtin_arm_usat16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.usax")
    int __builtin_arm_usax(int, int);

pragma(LDC_intrinsic, "llvm.arm.usub16")
    int __builtin_arm_usub16(int, int);

pragma(LDC_intrinsic, "llvm.arm.usub8")
    int __builtin_arm_usub8(int, int);

pragma(LDC_intrinsic, "llvm.arm.uxtab16")
    int __builtin_arm_uxtab16(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.arm.uxtb16")
    int __builtin_arm_uxtb16(int) pure @safe;

