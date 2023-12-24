module ldc.gccbuiltins_aarch64; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.aarch64.dmb")
    void __builtin_arm_dmb(int);

pragma(LDC_intrinsic, "llvm.aarch64.dsb")
    void __builtin_arm_dsb(int);

pragma(LDC_intrinsic, "llvm.aarch64.isb")
    void __builtin_arm_isb(int);

pragma(LDC_intrinsic, "llvm.aarch64.prefetch")
    void __builtin_arm_prefetch(void*, int, int, int, int);

pragma(LDC_intrinsic, "llvm.aarch64.sve.setffr")
    void __builtin_sve_svsetffr();

pragma(LDC_intrinsic, "llvm.aarch64.tcancel")
    void __builtin_arm_tcancel(long);

pragma(LDC_intrinsic, "llvm.aarch64.tcommit")
    void __builtin_arm_tcommit();

pragma(LDC_intrinsic, "llvm.aarch64.tstart")
    long __builtin_arm_tstart();

pragma(LDC_intrinsic, "llvm.aarch64.ttest")
    long __builtin_arm_ttest() pure @safe;

