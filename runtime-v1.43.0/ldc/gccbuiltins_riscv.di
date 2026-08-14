module ldc.gccbuiltins_riscv; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.riscv.aes32dsi")
    int __builtin_riscv_aes32dsi(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes32dsmi")
    int __builtin_riscv_aes32dsmi(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes32esi")
    int __builtin_riscv_aes32esi(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes32esmi")
    int __builtin_riscv_aes32esmi(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64ds")
    long __builtin_riscv_aes64ds(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64dsm")
    long __builtin_riscv_aes64dsm(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64es")
    long __builtin_riscv_aes64es(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64esm")
    long __builtin_riscv_aes64esm(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64im")
    long __builtin_riscv_aes64im(long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64ks1i")
    long __builtin_riscv_aes64ks1i(long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.aes64ks2")
    long __builtin_riscv_aes64ks2(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig0")
    long __builtin_riscv_sha512sig0(long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig0h")
    int __builtin_riscv_sha512sig0h(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig0l")
    int __builtin_riscv_sha512sig0l(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig1")
    long __builtin_riscv_sha512sig1(long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig1h")
    int __builtin_riscv_sha512sig1h(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sig1l")
    int __builtin_riscv_sha512sig1l(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sum0")
    long __builtin_riscv_sha512sum0(long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sum0r")
    int __builtin_riscv_sha512sum0r(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sum1")
    long __builtin_riscv_sha512sum1(long) pure @safe;

pragma(LDC_intrinsic, "llvm.riscv.sha512sum1r")
    int __builtin_riscv_sha512sum1r(int, int) pure @safe;

