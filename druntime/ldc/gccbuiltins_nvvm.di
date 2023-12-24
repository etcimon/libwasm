module ldc.gccbuiltins_nvvm; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.nvvm.add.rm.d")
    double __nvvm_add_rm_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rm.f")
    float __nvvm_add_rm_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rm.ftz.f")
    float __nvvm_add_rm_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rn.d")
    double __nvvm_add_rn_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rn.f")
    float __nvvm_add_rn_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rn.ftz.f")
    float __nvvm_add_rn_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rp.d")
    double __nvvm_add_rp_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rp.f")
    float __nvvm_add_rp_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rp.ftz.f")
    float __nvvm_add_rp_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rz.d")
    double __nvvm_add_rz_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rz.f")
    float __nvvm_add_rz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.add.rz.ftz.f")
    float __nvvm_add_rz_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.bar.sync")
    void __nvvm_bar_sync(int);

pragma(LDC_intrinsic, "llvm.nvvm.bar.warp.sync")
    void __nvvm_bar_warp_sync(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier")
    void __nvvm_bar(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier0")
    void __syncthreads();

pragma(LDC_intrinsic, "llvm.nvvm.barrier0.and")
    int __nvvm_bar0_and(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier0.or")
    int __nvvm_bar0_or(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier0.popc")
    int __nvvm_bar0_popc(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier.n")
    void __nvvm_bar_n(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier.sync")
    void __nvvm_barrier_sync(int);

pragma(LDC_intrinsic, "llvm.nvvm.barrier.sync.cnt")
    void __nvvm_barrier_sync_cnt(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.bitcast.d2ll")
    long __nvvm_bitcast_d2ll(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.bitcast.f2i")
    int __nvvm_bitcast_f2i(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.bitcast.i2f")
    float __nvvm_bitcast_i2f(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.bitcast.ll2d")
    double __nvvm_bitcast_ll2d(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ceil.d")
    double __nvvm_ceil_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ceil.f")
    float __nvvm_ceil_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ceil.ftz.f")
    float __nvvm_ceil_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.cos.approx.f")
    float __nvvm_cos_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.cos.approx.ftz.f")
    float __nvvm_cos_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.commit.group")
    void __nvvm_cp_async_commit_group();

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.mbarrier.arrive")
    void __nvvm_cp_async_mbarrier_arrive(void*);

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.mbarrier.arrive.noinc")
    void __nvvm_cp_async_mbarrier_arrive_noinc(void*);

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.mbarrier.arrive.noinc.shared")
    void __nvvm_cp_async_mbarrier_arrive_noinc_shared(void*);

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.mbarrier.arrive.shared")
    void __nvvm_cp_async_mbarrier_arrive_shared(void*);

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.wait.all")
    void __nvvm_cp_async_wait_all();

pragma(LDC_intrinsic, "llvm.nvvm.cp.async.wait.group")
    void __nvvm_cp_async_wait_group(int);

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rm")
    float __nvvm_d2f_rm(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rm.ftz")
    float __nvvm_d2f_rm_ftz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rn")
    float __nvvm_d2f_rn(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rn.ftz")
    float __nvvm_d2f_rn_ftz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rp")
    float __nvvm_d2f_rp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rp.ftz")
    float __nvvm_d2f_rp_ftz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rz")
    float __nvvm_d2f_rz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2f.rz.ftz")
    float __nvvm_d2f_rz_ftz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.hi")
    int __nvvm_d2i_hi(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.lo")
    int __nvvm_d2i_lo(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.rm")
    int __nvvm_d2i_rm(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.rn")
    int __nvvm_d2i_rn(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.rp")
    int __nvvm_d2i_rp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2i.rz")
    int __nvvm_d2i_rz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ll.rm")
    long __nvvm_d2ll_rm(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ll.rn")
    long __nvvm_d2ll_rn(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ll.rp")
    long __nvvm_d2ll_rp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ll.rz")
    long __nvvm_d2ll_rz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ui.rm")
    int __nvvm_d2ui_rm(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ui.rn")
    int __nvvm_d2ui_rn(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ui.rp")
    int __nvvm_d2ui_rp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ui.rz")
    int __nvvm_d2ui_rz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ull.rm")
    long __nvvm_d2ull_rm(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ull.rn")
    long __nvvm_d2ull_rn(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ull.rp")
    long __nvvm_d2ull_rp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.d2ull.rz")
    long __nvvm_d2ull_rz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.approx.f")
    float __nvvm_div_approx_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.approx.ftz.f")
    float __nvvm_div_approx_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rm.d")
    double __nvvm_div_rm_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rm.f")
    float __nvvm_div_rm_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rm.ftz.f")
    float __nvvm_div_rm_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rn.d")
    double __nvvm_div_rn_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rn.f")
    float __nvvm_div_rn_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rn.ftz.f")
    float __nvvm_div_rn_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rp.d")
    double __nvvm_div_rp_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rp.f")
    float __nvvm_div_rp_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rp.ftz.f")
    float __nvvm_div_rp_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rz.d")
    double __nvvm_div_rz_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rz.f")
    float __nvvm_div_rz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.div.rz.ftz.f")
    float __nvvm_div_rz_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ex2.approx.d")
    double __nvvm_ex2_approx_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ex2.approx.f")
    float __nvvm_ex2_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ex2.approx.ftz.f")
    float __nvvm_ex2_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2h.rn")
    short __nvvm_f2h_rn(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2h.rn.ftz")
    short __nvvm_f2h_rn_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rm")
    int __nvvm_f2i_rm(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rm.ftz")
    int __nvvm_f2i_rm_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rn")
    int __nvvm_f2i_rn(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rn.ftz")
    int __nvvm_f2i_rn_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rp")
    int __nvvm_f2i_rp(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rp.ftz")
    int __nvvm_f2i_rp_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rz")
    int __nvvm_f2i_rz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2i.rz.ftz")
    int __nvvm_f2i_rz_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rm")
    long __nvvm_f2ll_rm(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rm.ftz")
    long __nvvm_f2ll_rm_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rn")
    long __nvvm_f2ll_rn(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rn.ftz")
    long __nvvm_f2ll_rn_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rp")
    long __nvvm_f2ll_rp(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rp.ftz")
    long __nvvm_f2ll_rp_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rz")
    long __nvvm_f2ll_rz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ll.rz.ftz")
    long __nvvm_f2ll_rz_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2tf32.rna")
    int __nvvm_f2tf32_rna(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rm")
    int __nvvm_f2ui_rm(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rm.ftz")
    int __nvvm_f2ui_rm_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rn")
    int __nvvm_f2ui_rn(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rn.ftz")
    int __nvvm_f2ui_rn_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rp")
    int __nvvm_f2ui_rp(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rp.ftz")
    int __nvvm_f2ui_rp_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rz")
    int __nvvm_f2ui_rz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ui.rz.ftz")
    int __nvvm_f2ui_rz_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rm")
    long __nvvm_f2ull_rm(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rm.ftz")
    long __nvvm_f2ull_rm_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rn")
    long __nvvm_f2ull_rn(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rn.ftz")
    long __nvvm_f2ull_rn_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rp")
    long __nvvm_f2ull_rp(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rp.ftz")
    long __nvvm_f2ull_rp_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rz")
    long __nvvm_f2ull_rz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.f2ull.rz.ftz")
    long __nvvm_f2ull_rz_ftz(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fabs.d")
    double __nvvm_fabs_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fabs.f")
    float __nvvm_fabs_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fabs.ftz.f")
    float __nvvm_fabs_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.floor.d")
    double __nvvm_floor_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.floor.f")
    float __nvvm_floor_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.floor.ftz.f")
    float __nvvm_floor_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rm.d")
    double __nvvm_fma_rm_d(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rm.f")
    float __nvvm_fma_rm_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rm.ftz.f")
    float __nvvm_fma_rm_ftz_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rn.d")
    double __nvvm_fma_rn_d(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rn.f")
    float __nvvm_fma_rn_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rn.ftz.f")
    float __nvvm_fma_rn_ftz_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rp.d")
    double __nvvm_fma_rp_d(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rp.f")
    float __nvvm_fma_rp_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rp.ftz.f")
    float __nvvm_fma_rp_ftz_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rz.d")
    double __nvvm_fma_rz_d(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rz.f")
    float __nvvm_fma_rz_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fma.rz.ftz.f")
    float __nvvm_fma_rz_ftz_f(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.d")
    double __nvvm_fmax_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.f")
    float __nvvm_fmax_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.ftz.f")
    float __nvvm_fmax_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.ftz.nan.f")
    float __nvvm_fmax_ftz_nan_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.ftz.nan.xorsign.abs.f")
    float __nvvm_fmax_ftz_nan_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.ftz.xorsign.abs.f")
    float __nvvm_fmax_ftz_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.nan.f")
    float __nvvm_fmax_nan_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.nan.xorsign.abs.f")
    float __nvvm_fmax_nan_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmax.xorsign.abs.f")
    float __nvvm_fmax_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.d")
    double __nvvm_fmin_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.f")
    float __nvvm_fmin_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.ftz.f")
    float __nvvm_fmin_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.ftz.nan.f")
    float __nvvm_fmin_ftz_nan_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.ftz.nan.xorsign.abs.f")
    float __nvvm_fmin_ftz_nan_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.ftz.xorsign.abs.f")
    float __nvvm_fmin_ftz_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.nan.f")
    float __nvvm_fmin_nan_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.nan.xorsign.abs.f")
    float __nvvm_fmin_nan_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fmin.xorsign.abs.f")
    float __nvvm_fmin_xorsign_abs_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.fns")
    int __nvvm_fns(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2d.rm")
    double __nvvm_i2d_rm(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2d.rn")
    double __nvvm_i2d_rn(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2d.rp")
    double __nvvm_i2d_rp(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2d.rz")
    double __nvvm_i2d_rz(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2f.rm")
    float __nvvm_i2f_rm(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2f.rn")
    float __nvvm_i2f_rn(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2f.rp")
    float __nvvm_i2f_rp(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.i2f.rz")
    float __nvvm_i2f_rz(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.isspacep.const")
    bool __nvvm_isspacep_const(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.isspacep.global")
    bool __nvvm_isspacep_global(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.isspacep.local")
    bool __nvvm_isspacep_local(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.isspacep.shared")
    bool __nvvm_isspacep_shared(void*) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.istypep.sampler")
    bool __nvvm_istypep_sampler(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.istypep.surface")
    bool __nvvm_istypep_surface(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.istypep.texture")
    bool __nvvm_istypep_texture(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.lg2.approx.d")
    double __nvvm_lg2_approx_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.lg2.approx.f")
    float __nvvm_lg2_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.lg2.approx.ftz.f")
    float __nvvm_lg2_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2d.rm")
    double __nvvm_ll2d_rm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2d.rn")
    double __nvvm_ll2d_rn(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2d.rp")
    double __nvvm_ll2d_rp(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2d.rz")
    double __nvvm_ll2d_rz(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2f.rm")
    float __nvvm_ll2f_rm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2f.rn")
    float __nvvm_ll2f_rn(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2f.rp")
    float __nvvm_ll2f_rp(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ll2f.rz")
    float __nvvm_ll2f_rz(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.lohi.i2d")
    double __nvvm_lohi_i2d(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.match.any.sync.i32")
    int __nvvm_match_any_sync_i32(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.match.any.sync.i64")
    int __nvvm_match_any_sync_i64(int, long);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive")
    long __nvvm_mbarrier_arrive(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.drop")
    long __nvvm_mbarrier_arrive_drop(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.drop.noComplete")
    long __nvvm_mbarrier_arrive_drop_noComplete(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.drop.noComplete.shared")
    long __nvvm_mbarrier_arrive_drop_noComplete_shared(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.drop.shared")
    long __nvvm_mbarrier_arrive_drop_shared(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.noComplete")
    long __nvvm_mbarrier_arrive_noComplete(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.noComplete.shared")
    long __nvvm_mbarrier_arrive_noComplete_shared(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.arrive.shared")
    long __nvvm_mbarrier_arrive_shared(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.init")
    void __nvvm_mbarrier_init(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.init.shared")
    void __nvvm_mbarrier_init_shared(void*, int);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.inval")
    void __nvvm_mbarrier_inval(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.inval.shared")
    void __nvvm_mbarrier_inval_shared(void*);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.pending.count")
    int __nvvm_mbarrier_pending_count(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.test.wait")
    bool __nvvm_mbarrier_test_wait(void*, long);

pragma(LDC_intrinsic, "llvm.nvvm.mbarrier.test.wait.shared")
    bool __nvvm_mbarrier_test_wait_shared(void*, long);

pragma(LDC_intrinsic, "llvm.nvvm.membar.cta")
    void __nvvm_membar_cta();

pragma(LDC_intrinsic, "llvm.nvvm.membar.gl")
    void __nvvm_membar_gl();

pragma(LDC_intrinsic, "llvm.nvvm.membar.sys")
    void __nvvm_membar_sys();

pragma(LDC_intrinsic, "llvm.nvvm.mul24.i")
    int __nvvm_mul24_i(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul24.ui")
    int __nvvm_mul24_ui(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rm.d")
    double __nvvm_mul_rm_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rm.f")
    float __nvvm_mul_rm_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rm.ftz.f")
    float __nvvm_mul_rm_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rn.d")
    double __nvvm_mul_rn_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rn.f")
    float __nvvm_mul_rn_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rn.ftz.f")
    float __nvvm_mul_rn_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rp.d")
    double __nvvm_mul_rp_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rp.f")
    float __nvvm_mul_rp_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rp.ftz.f")
    float __nvvm_mul_rp_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rz.d")
    double __nvvm_mul_rz_d(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rz.f")
    float __nvvm_mul_rz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mul.rz.ftz.f")
    float __nvvm_mul_rz_ftz_f(float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mulhi.i")
    int __nvvm_mulhi_i(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mulhi.ll")
    long __nvvm_mulhi_ll(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mulhi.ui")
    int __nvvm_mulhi_ui(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.mulhi.ull")
    long __nvvm_mulhi_ull(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.prmt")
    int __nvvm_prmt(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.approx.ftz.d")
    double __nvvm_rcp_approx_ftz_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.approx.ftz.f")
    float __nvvm_rcp_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rm.d")
    double __nvvm_rcp_rm_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rm.f")
    float __nvvm_rcp_rm_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rm.ftz.f")
    float __nvvm_rcp_rm_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rn.d")
    double __nvvm_rcp_rn_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rn.f")
    float __nvvm_rcp_rn_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rn.ftz.f")
    float __nvvm_rcp_rn_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rp.d")
    double __nvvm_rcp_rp_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rp.f")
    float __nvvm_rcp_rp_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rp.ftz.f")
    float __nvvm_rcp_rp_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rz.d")
    double __nvvm_rcp_rz_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rz.f")
    float __nvvm_rcp_rz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rcp.rz.ftz.f")
    float __nvvm_rcp_rz_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.clock")
    int __nvvm_read_ptx_sreg_clock();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.clock64")
    long __nvvm_read_ptx_sreg_clock64();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ctaid.w")
    int __nvvm_read_ptx_sreg_ctaid_w() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ctaid.x")
    int __nvvm_read_ptx_sreg_ctaid_x() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ctaid.y")
    int __nvvm_read_ptx_sreg_ctaid_y() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ctaid.z")
    int __nvvm_read_ptx_sreg_ctaid_z() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg0")
    int __nvvm_read_ptx_sreg_envreg0() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg1")
    int __nvvm_read_ptx_sreg_envreg1() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg10")
    int __nvvm_read_ptx_sreg_envreg10() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg11")
    int __nvvm_read_ptx_sreg_envreg11() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg12")
    int __nvvm_read_ptx_sreg_envreg12() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg13")
    int __nvvm_read_ptx_sreg_envreg13() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg14")
    int __nvvm_read_ptx_sreg_envreg14() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg15")
    int __nvvm_read_ptx_sreg_envreg15() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg16")
    int __nvvm_read_ptx_sreg_envreg16() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg17")
    int __nvvm_read_ptx_sreg_envreg17() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg18")
    int __nvvm_read_ptx_sreg_envreg18() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg19")
    int __nvvm_read_ptx_sreg_envreg19() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg2")
    int __nvvm_read_ptx_sreg_envreg2() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg20")
    int __nvvm_read_ptx_sreg_envreg20() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg21")
    int __nvvm_read_ptx_sreg_envreg21() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg22")
    int __nvvm_read_ptx_sreg_envreg22() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg23")
    int __nvvm_read_ptx_sreg_envreg23() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg24")
    int __nvvm_read_ptx_sreg_envreg24() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg25")
    int __nvvm_read_ptx_sreg_envreg25() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg26")
    int __nvvm_read_ptx_sreg_envreg26() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg27")
    int __nvvm_read_ptx_sreg_envreg27() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg28")
    int __nvvm_read_ptx_sreg_envreg28() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg29")
    int __nvvm_read_ptx_sreg_envreg29() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg3")
    int __nvvm_read_ptx_sreg_envreg3() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg30")
    int __nvvm_read_ptx_sreg_envreg30() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg31")
    int __nvvm_read_ptx_sreg_envreg31() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg4")
    int __nvvm_read_ptx_sreg_envreg4() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg5")
    int __nvvm_read_ptx_sreg_envreg5() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg6")
    int __nvvm_read_ptx_sreg_envreg6() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg7")
    int __nvvm_read_ptx_sreg_envreg7() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg8")
    int __nvvm_read_ptx_sreg_envreg8() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.envreg9")
    int __nvvm_read_ptx_sreg_envreg9() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.gridid")
    int __nvvm_read_ptx_sreg_gridid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.laneid")
    int __nvvm_read_ptx_sreg_laneid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.lanemask.eq")
    int __nvvm_read_ptx_sreg_lanemask_eq() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.lanemask.ge")
    int __nvvm_read_ptx_sreg_lanemask_ge() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.lanemask.gt")
    int __nvvm_read_ptx_sreg_lanemask_gt() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.lanemask.le")
    int __nvvm_read_ptx_sreg_lanemask_le() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.lanemask.lt")
    int __nvvm_read_ptx_sreg_lanemask_lt() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nctaid.w")
    int __nvvm_read_ptx_sreg_nctaid_w() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nctaid.x")
    int __nvvm_read_ptx_sreg_nctaid_x() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nctaid.y")
    int __nvvm_read_ptx_sreg_nctaid_y() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nctaid.z")
    int __nvvm_read_ptx_sreg_nctaid_z() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nsmid")
    int __nvvm_read_ptx_sreg_nsmid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ntid.w")
    int __nvvm_read_ptx_sreg_ntid_w() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ntid.x")
    int __nvvm_read_ptx_sreg_ntid_x() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ntid.y")
    int __nvvm_read_ptx_sreg_ntid_y() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.ntid.z")
    int __nvvm_read_ptx_sreg_ntid_z() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.nwarpid")
    int __nvvm_read_ptx_sreg_nwarpid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.pm0")
    int __nvvm_read_ptx_sreg_pm0();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.pm1")
    int __nvvm_read_ptx_sreg_pm1();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.pm2")
    int __nvvm_read_ptx_sreg_pm2();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.pm3")
    int __nvvm_read_ptx_sreg_pm3();

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.smid")
    int __nvvm_read_ptx_sreg_smid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.tid.w")
    int __nvvm_read_ptx_sreg_tid_w() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.tid.x")
    int __nvvm_read_ptx_sreg_tid_x() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.tid.y")
    int __nvvm_read_ptx_sreg_tid_y() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.tid.z")
    int __nvvm_read_ptx_sreg_tid_z() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.warpid")
    int __nvvm_read_ptx_sreg_warpid() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.read.ptx.sreg.warpsize")
    int __nvvm_read_ptx_sreg_warpsize() pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.add")
    int __nvvm_redux_sync_add(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.and")
    int __nvvm_redux_sync_and(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.max")
    int __nvvm_redux_sync_max(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.min")
    int __nvvm_redux_sync_min(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.or")
    int __nvvm_redux_sync_or(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.umax")
    int __nvvm_redux_sync_umax(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.umin")
    int __nvvm_redux_sync_umin(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.redux.sync.xor")
    int __nvvm_redux_sync_xor(int, int);

pragma(LDC_intrinsic, "llvm.nvvm.rotate.b32")
    int __nvvm_rotate_b32(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rotate.b64")
    long __nvvm_rotate_b64(long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rotate.right.b64")
    long __nvvm_rotate_right_b64(long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.round.d")
    double __nvvm_round_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.round.f")
    float __nvvm_round_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.round.ftz.f")
    float __nvvm_round_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rsqrt.approx.d")
    double __nvvm_rsqrt_approx_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rsqrt.approx.f")
    float __nvvm_rsqrt_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.rsqrt.approx.ftz.f")
    float __nvvm_rsqrt_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sad.i")
    int __nvvm_sad_i(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sad.ui")
    int __nvvm_sad_ui(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.saturate.d")
    double __nvvm_saturate_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.saturate.f")
    float __nvvm_saturate_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.saturate.ftz.f")
    float __nvvm_saturate_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.shfl.bfly.f32")
    float __nvvm_shfl_bfly_f32(float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.bfly.i32")
    int __nvvm_shfl_bfly_i32(int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.down.f32")
    float __nvvm_shfl_down_f32(float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.down.i32")
    int __nvvm_shfl_down_i32(int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.idx.f32")
    float __nvvm_shfl_idx_f32(float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.idx.i32")
    int __nvvm_shfl_idx_i32(int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.bfly.f32")
    float __nvvm_shfl_sync_bfly_f32(int, float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.bfly.i32")
    int __nvvm_shfl_sync_bfly_i32(int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.down.f32")
    float __nvvm_shfl_sync_down_f32(int, float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.down.i32")
    int __nvvm_shfl_sync_down_i32(int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.idx.f32")
    float __nvvm_shfl_sync_idx_f32(int, float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.idx.i32")
    int __nvvm_shfl_sync_idx_i32(int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.up.f32")
    float __nvvm_shfl_sync_up_f32(int, float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.sync.up.i32")
    int __nvvm_shfl_sync_up_i32(int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.up.f32")
    float __nvvm_shfl_up_f32(float, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.shfl.up.i32")
    int __nvvm_shfl_up_i32(int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sin.approx.f")
    float __nvvm_sin_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sin.approx.ftz.f")
    float __nvvm_sin_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.approx.f")
    float __nvvm_sqrt_approx_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.approx.ftz.f")
    float __nvvm_sqrt_approx_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.f")
    float __nvvm_sqrt_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rm.d")
    double __nvvm_sqrt_rm_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rm.f")
    float __nvvm_sqrt_rm_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rm.ftz.f")
    float __nvvm_sqrt_rm_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rn.d")
    double __nvvm_sqrt_rn_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rn.f")
    float __nvvm_sqrt_rn_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rn.ftz.f")
    float __nvvm_sqrt_rn_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rp.d")
    double __nvvm_sqrt_rp_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rp.f")
    float __nvvm_sqrt_rp_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rp.ftz.f")
    float __nvvm_sqrt_rp_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rz.d")
    double __nvvm_sqrt_rz_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rz.f")
    float __nvvm_sqrt_rz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sqrt.rz.ftz.f")
    float __nvvm_sqrt_rz_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.array.size")
    int __nvvm_suq_array_size(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.channel.data.type")
    int __nvvm_suq_channel_data_type(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.channel.order")
    int __nvvm_suq_channel_order(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.depth")
    int __nvvm_suq_depth(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.height")
    int __nvvm_suq_height(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.suq.width")
    int __nvvm_suq_width(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i16.clamp")
    void __nvvm_sust_b_1d_array_i16_clamp(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i16.trap")
    void __nvvm_sust_b_1d_array_i16_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i16.zero")
    void __nvvm_sust_b_1d_array_i16_zero(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i32.clamp")
    void __nvvm_sust_b_1d_array_i32_clamp(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i32.trap")
    void __nvvm_sust_b_1d_array_i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i32.zero")
    void __nvvm_sust_b_1d_array_i32_zero(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i64.clamp")
    void __nvvm_sust_b_1d_array_i64_clamp(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i64.trap")
    void __nvvm_sust_b_1d_array_i64_trap(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i64.zero")
    void __nvvm_sust_b_1d_array_i64_zero(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i8.clamp")
    void __nvvm_sust_b_1d_array_i8_clamp(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i8.trap")
    void __nvvm_sust_b_1d_array_i8_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.i8.zero")
    void __nvvm_sust_b_1d_array_i8_zero(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i16.clamp")
    void __nvvm_sust_b_1d_array_v2i16_clamp(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i16.trap")
    void __nvvm_sust_b_1d_array_v2i16_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i16.zero")
    void __nvvm_sust_b_1d_array_v2i16_zero(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i32.clamp")
    void __nvvm_sust_b_1d_array_v2i32_clamp(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i32.trap")
    void __nvvm_sust_b_1d_array_v2i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i32.zero")
    void __nvvm_sust_b_1d_array_v2i32_zero(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i64.clamp")
    void __nvvm_sust_b_1d_array_v2i64_clamp(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i64.trap")
    void __nvvm_sust_b_1d_array_v2i64_trap(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i64.zero")
    void __nvvm_sust_b_1d_array_v2i64_zero(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i8.clamp")
    void __nvvm_sust_b_1d_array_v2i8_clamp(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i8.trap")
    void __nvvm_sust_b_1d_array_v2i8_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v2i8.zero")
    void __nvvm_sust_b_1d_array_v2i8_zero(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i16.clamp")
    void __nvvm_sust_b_1d_array_v4i16_clamp(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i16.trap")
    void __nvvm_sust_b_1d_array_v4i16_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i16.zero")
    void __nvvm_sust_b_1d_array_v4i16_zero(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i32.clamp")
    void __nvvm_sust_b_1d_array_v4i32_clamp(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i32.trap")
    void __nvvm_sust_b_1d_array_v4i32_trap(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i32.zero")
    void __nvvm_sust_b_1d_array_v4i32_zero(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i8.clamp")
    void __nvvm_sust_b_1d_array_v4i8_clamp(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i8.trap")
    void __nvvm_sust_b_1d_array_v4i8_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.array.v4i8.zero")
    void __nvvm_sust_b_1d_array_v4i8_zero(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i16.clamp")
    void __nvvm_sust_b_1d_i16_clamp(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i16.trap")
    void __nvvm_sust_b_1d_i16_trap(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i16.zero")
    void __nvvm_sust_b_1d_i16_zero(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i32.clamp")
    void __nvvm_sust_b_1d_i32_clamp(long, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i32.trap")
    void __nvvm_sust_b_1d_i32_trap(long, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i32.zero")
    void __nvvm_sust_b_1d_i32_zero(long, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i64.clamp")
    void __nvvm_sust_b_1d_i64_clamp(long, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i64.trap")
    void __nvvm_sust_b_1d_i64_trap(long, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i64.zero")
    void __nvvm_sust_b_1d_i64_zero(long, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i8.clamp")
    void __nvvm_sust_b_1d_i8_clamp(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i8.trap")
    void __nvvm_sust_b_1d_i8_trap(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.i8.zero")
    void __nvvm_sust_b_1d_i8_zero(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i16.clamp")
    void __nvvm_sust_b_1d_v2i16_clamp(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i16.trap")
    void __nvvm_sust_b_1d_v2i16_trap(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i16.zero")
    void __nvvm_sust_b_1d_v2i16_zero(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i32.clamp")
    void __nvvm_sust_b_1d_v2i32_clamp(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i32.trap")
    void __nvvm_sust_b_1d_v2i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i32.zero")
    void __nvvm_sust_b_1d_v2i32_zero(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i64.clamp")
    void __nvvm_sust_b_1d_v2i64_clamp(long, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i64.trap")
    void __nvvm_sust_b_1d_v2i64_trap(long, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i64.zero")
    void __nvvm_sust_b_1d_v2i64_zero(long, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i8.clamp")
    void __nvvm_sust_b_1d_v2i8_clamp(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i8.trap")
    void __nvvm_sust_b_1d_v2i8_trap(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v2i8.zero")
    void __nvvm_sust_b_1d_v2i8_zero(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i16.clamp")
    void __nvvm_sust_b_1d_v4i16_clamp(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i16.trap")
    void __nvvm_sust_b_1d_v4i16_trap(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i16.zero")
    void __nvvm_sust_b_1d_v4i16_zero(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i32.clamp")
    void __nvvm_sust_b_1d_v4i32_clamp(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i32.trap")
    void __nvvm_sust_b_1d_v4i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i32.zero")
    void __nvvm_sust_b_1d_v4i32_zero(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i8.clamp")
    void __nvvm_sust_b_1d_v4i8_clamp(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i8.trap")
    void __nvvm_sust_b_1d_v4i8_trap(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.1d.v4i8.zero")
    void __nvvm_sust_b_1d_v4i8_zero(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i16.clamp")
    void __nvvm_sust_b_2d_array_i16_clamp(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i16.trap")
    void __nvvm_sust_b_2d_array_i16_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i16.zero")
    void __nvvm_sust_b_2d_array_i16_zero(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i32.clamp")
    void __nvvm_sust_b_2d_array_i32_clamp(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i32.trap")
    void __nvvm_sust_b_2d_array_i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i32.zero")
    void __nvvm_sust_b_2d_array_i32_zero(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i64.clamp")
    void __nvvm_sust_b_2d_array_i64_clamp(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i64.trap")
    void __nvvm_sust_b_2d_array_i64_trap(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i64.zero")
    void __nvvm_sust_b_2d_array_i64_zero(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i8.clamp")
    void __nvvm_sust_b_2d_array_i8_clamp(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i8.trap")
    void __nvvm_sust_b_2d_array_i8_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.i8.zero")
    void __nvvm_sust_b_2d_array_i8_zero(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i16.clamp")
    void __nvvm_sust_b_2d_array_v2i16_clamp(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i16.trap")
    void __nvvm_sust_b_2d_array_v2i16_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i16.zero")
    void __nvvm_sust_b_2d_array_v2i16_zero(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i32.clamp")
    void __nvvm_sust_b_2d_array_v2i32_clamp(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i32.trap")
    void __nvvm_sust_b_2d_array_v2i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i32.zero")
    void __nvvm_sust_b_2d_array_v2i32_zero(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i64.clamp")
    void __nvvm_sust_b_2d_array_v2i64_clamp(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i64.trap")
    void __nvvm_sust_b_2d_array_v2i64_trap(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i64.zero")
    void __nvvm_sust_b_2d_array_v2i64_zero(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i8.clamp")
    void __nvvm_sust_b_2d_array_v2i8_clamp(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i8.trap")
    void __nvvm_sust_b_2d_array_v2i8_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v2i8.zero")
    void __nvvm_sust_b_2d_array_v2i8_zero(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i16.clamp")
    void __nvvm_sust_b_2d_array_v4i16_clamp(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i16.trap")
    void __nvvm_sust_b_2d_array_v4i16_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i16.zero")
    void __nvvm_sust_b_2d_array_v4i16_zero(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i32.clamp")
    void __nvvm_sust_b_2d_array_v4i32_clamp(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i32.trap")
    void __nvvm_sust_b_2d_array_v4i32_trap(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i32.zero")
    void __nvvm_sust_b_2d_array_v4i32_zero(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i8.clamp")
    void __nvvm_sust_b_2d_array_v4i8_clamp(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i8.trap")
    void __nvvm_sust_b_2d_array_v4i8_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.array.v4i8.zero")
    void __nvvm_sust_b_2d_array_v4i8_zero(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i16.clamp")
    void __nvvm_sust_b_2d_i16_clamp(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i16.trap")
    void __nvvm_sust_b_2d_i16_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i16.zero")
    void __nvvm_sust_b_2d_i16_zero(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i32.clamp")
    void __nvvm_sust_b_2d_i32_clamp(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i32.trap")
    void __nvvm_sust_b_2d_i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i32.zero")
    void __nvvm_sust_b_2d_i32_zero(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i64.clamp")
    void __nvvm_sust_b_2d_i64_clamp(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i64.trap")
    void __nvvm_sust_b_2d_i64_trap(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i64.zero")
    void __nvvm_sust_b_2d_i64_zero(long, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i8.clamp")
    void __nvvm_sust_b_2d_i8_clamp(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i8.trap")
    void __nvvm_sust_b_2d_i8_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.i8.zero")
    void __nvvm_sust_b_2d_i8_zero(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i16.clamp")
    void __nvvm_sust_b_2d_v2i16_clamp(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i16.trap")
    void __nvvm_sust_b_2d_v2i16_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i16.zero")
    void __nvvm_sust_b_2d_v2i16_zero(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i32.clamp")
    void __nvvm_sust_b_2d_v2i32_clamp(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i32.trap")
    void __nvvm_sust_b_2d_v2i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i32.zero")
    void __nvvm_sust_b_2d_v2i32_zero(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i64.clamp")
    void __nvvm_sust_b_2d_v2i64_clamp(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i64.trap")
    void __nvvm_sust_b_2d_v2i64_trap(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i64.zero")
    void __nvvm_sust_b_2d_v2i64_zero(long, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i8.clamp")
    void __nvvm_sust_b_2d_v2i8_clamp(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i8.trap")
    void __nvvm_sust_b_2d_v2i8_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v2i8.zero")
    void __nvvm_sust_b_2d_v2i8_zero(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i16.clamp")
    void __nvvm_sust_b_2d_v4i16_clamp(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i16.trap")
    void __nvvm_sust_b_2d_v4i16_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i16.zero")
    void __nvvm_sust_b_2d_v4i16_zero(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i32.clamp")
    void __nvvm_sust_b_2d_v4i32_clamp(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i32.trap")
    void __nvvm_sust_b_2d_v4i32_trap(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i32.zero")
    void __nvvm_sust_b_2d_v4i32_zero(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i8.clamp")
    void __nvvm_sust_b_2d_v4i8_clamp(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i8.trap")
    void __nvvm_sust_b_2d_v4i8_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.2d.v4i8.zero")
    void __nvvm_sust_b_2d_v4i8_zero(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i16.clamp")
    void __nvvm_sust_b_3d_i16_clamp(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i16.trap")
    void __nvvm_sust_b_3d_i16_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i16.zero")
    void __nvvm_sust_b_3d_i16_zero(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i32.clamp")
    void __nvvm_sust_b_3d_i32_clamp(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i32.trap")
    void __nvvm_sust_b_3d_i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i32.zero")
    void __nvvm_sust_b_3d_i32_zero(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i64.clamp")
    void __nvvm_sust_b_3d_i64_clamp(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i64.trap")
    void __nvvm_sust_b_3d_i64_trap(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i64.zero")
    void __nvvm_sust_b_3d_i64_zero(long, int, int, int, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i8.clamp")
    void __nvvm_sust_b_3d_i8_clamp(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i8.trap")
    void __nvvm_sust_b_3d_i8_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.i8.zero")
    void __nvvm_sust_b_3d_i8_zero(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i16.clamp")
    void __nvvm_sust_b_3d_v2i16_clamp(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i16.trap")
    void __nvvm_sust_b_3d_v2i16_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i16.zero")
    void __nvvm_sust_b_3d_v2i16_zero(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i32.clamp")
    void __nvvm_sust_b_3d_v2i32_clamp(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i32.trap")
    void __nvvm_sust_b_3d_v2i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i32.zero")
    void __nvvm_sust_b_3d_v2i32_zero(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i64.clamp")
    void __nvvm_sust_b_3d_v2i64_clamp(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i64.trap")
    void __nvvm_sust_b_3d_v2i64_trap(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i64.zero")
    void __nvvm_sust_b_3d_v2i64_zero(long, int, int, int, long, long);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i8.clamp")
    void __nvvm_sust_b_3d_v2i8_clamp(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i8.trap")
    void __nvvm_sust_b_3d_v2i8_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v2i8.zero")
    void __nvvm_sust_b_3d_v2i8_zero(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i16.clamp")
    void __nvvm_sust_b_3d_v4i16_clamp(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i16.trap")
    void __nvvm_sust_b_3d_v4i16_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i16.zero")
    void __nvvm_sust_b_3d_v4i16_zero(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i32.clamp")
    void __nvvm_sust_b_3d_v4i32_clamp(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i32.trap")
    void __nvvm_sust_b_3d_v4i32_trap(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i32.zero")
    void __nvvm_sust_b_3d_v4i32_zero(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i8.clamp")
    void __nvvm_sust_b_3d_v4i8_clamp(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i8.trap")
    void __nvvm_sust_b_3d_v4i8_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.b.3d.v4i8.zero")
    void __nvvm_sust_b_3d_v4i8_zero(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.i16.trap")
    void __nvvm_sust_p_1d_array_i16_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.i32.trap")
    void __nvvm_sust_p_1d_array_i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.i8.trap")
    void __nvvm_sust_p_1d_array_i8_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v2i16.trap")
    void __nvvm_sust_p_1d_array_v2i16_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v2i32.trap")
    void __nvvm_sust_p_1d_array_v2i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v2i8.trap")
    void __nvvm_sust_p_1d_array_v2i8_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v4i16.trap")
    void __nvvm_sust_p_1d_array_v4i16_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v4i32.trap")
    void __nvvm_sust_p_1d_array_v4i32_trap(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.array.v4i8.trap")
    void __nvvm_sust_p_1d_array_v4i8_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.i16.trap")
    void __nvvm_sust_p_1d_i16_trap(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.i32.trap")
    void __nvvm_sust_p_1d_i32_trap(long, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.i8.trap")
    void __nvvm_sust_p_1d_i8_trap(long, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v2i16.trap")
    void __nvvm_sust_p_1d_v2i16_trap(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v2i32.trap")
    void __nvvm_sust_p_1d_v2i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v2i8.trap")
    void __nvvm_sust_p_1d_v2i8_trap(long, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v4i16.trap")
    void __nvvm_sust_p_1d_v4i16_trap(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v4i32.trap")
    void __nvvm_sust_p_1d_v4i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.1d.v4i8.trap")
    void __nvvm_sust_p_1d_v4i8_trap(long, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.i16.trap")
    void __nvvm_sust_p_2d_array_i16_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.i32.trap")
    void __nvvm_sust_p_2d_array_i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.i8.trap")
    void __nvvm_sust_p_2d_array_i8_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v2i16.trap")
    void __nvvm_sust_p_2d_array_v2i16_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v2i32.trap")
    void __nvvm_sust_p_2d_array_v2i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v2i8.trap")
    void __nvvm_sust_p_2d_array_v2i8_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v4i16.trap")
    void __nvvm_sust_p_2d_array_v4i16_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v4i32.trap")
    void __nvvm_sust_p_2d_array_v4i32_trap(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.array.v4i8.trap")
    void __nvvm_sust_p_2d_array_v4i8_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.i16.trap")
    void __nvvm_sust_p_2d_i16_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.i32.trap")
    void __nvvm_sust_p_2d_i32_trap(long, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.i8.trap")
    void __nvvm_sust_p_2d_i8_trap(long, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v2i16.trap")
    void __nvvm_sust_p_2d_v2i16_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v2i32.trap")
    void __nvvm_sust_p_2d_v2i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v2i8.trap")
    void __nvvm_sust_p_2d_v2i8_trap(long, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v4i16.trap")
    void __nvvm_sust_p_2d_v4i16_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v4i32.trap")
    void __nvvm_sust_p_2d_v4i32_trap(long, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.2d.v4i8.trap")
    void __nvvm_sust_p_2d_v4i8_trap(long, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.i16.trap")
    void __nvvm_sust_p_3d_i16_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.i32.trap")
    void __nvvm_sust_p_3d_i32_trap(long, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.i8.trap")
    void __nvvm_sust_p_3d_i8_trap(long, int, int, int, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v2i16.trap")
    void __nvvm_sust_p_3d_v2i16_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v2i32.trap")
    void __nvvm_sust_p_3d_v2i32_trap(long, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v2i8.trap")
    void __nvvm_sust_p_3d_v2i8_trap(long, int, int, int, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v4i16.trap")
    void __nvvm_sust_p_3d_v4i16_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v4i32.trap")
    void __nvvm_sust_p_3d_v4i32_trap(long, int, int, int, int, int, int, int);

pragma(LDC_intrinsic, "llvm.nvvm.sust.p.3d.v4i8.trap")
    void __nvvm_sust_p_3d_v4i8_trap(long, int, int, int, short, short, short, short);

pragma(LDC_intrinsic, "llvm.nvvm.swap.lo.hi.b64")
    long __nvvm_swap_lo_hi_b64(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.trunc.d")
    double __nvvm_trunc_d(double) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.trunc.f")
    float __nvvm_trunc_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.trunc.ftz.f")
    float __nvvm_trunc_ftz_f(float) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.array.size")
    int __nvvm_txq_array_size(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.channel.data.type")
    int __nvvm_txq_channel_data_type(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.channel.order")
    int __nvvm_txq_channel_order(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.depth")
    int __nvvm_txq_depth(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.height")
    int __nvvm_txq_height(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.num.mipmap.levels")
    int __nvvm_txq_num_mipmap_levels(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.num.samples")
    int __nvvm_txq_num_samples(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.txq.width")
    int __nvvm_txq_width(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2d.rm")
    double __nvvm_ui2d_rm(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2d.rn")
    double __nvvm_ui2d_rn(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2d.rp")
    double __nvvm_ui2d_rp(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2d.rz")
    double __nvvm_ui2d_rz(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2f.rm")
    float __nvvm_ui2f_rm(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2f.rn")
    float __nvvm_ui2f_rn(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2f.rp")
    float __nvvm_ui2f_rp(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ui2f.rz")
    float __nvvm_ui2f_rz(int) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2d.rm")
    double __nvvm_ull2d_rm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2d.rn")
    double __nvvm_ull2d_rn(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2d.rp")
    double __nvvm_ull2d_rp(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2d.rz")
    double __nvvm_ull2d_rz(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2f.rm")
    float __nvvm_ull2f_rm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2f.rn")
    float __nvvm_ull2f_rn(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2f.rp")
    float __nvvm_ull2f_rp(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.ull2f.rz")
    float __nvvm_ull2f_rz(long) pure @safe;

pragma(LDC_intrinsic, "llvm.nvvm.vote.all")
    bool __nvvm_vote_all(bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.all.sync")
    bool __nvvm_vote_all_sync(int, bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.any")
    bool __nvvm_vote_any(bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.any.sync")
    bool __nvvm_vote_any_sync(int, bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.ballot")
    int __nvvm_vote_ballot(bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.ballot.sync")
    int __nvvm_vote_ballot_sync(int, bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.uni")
    bool __nvvm_vote_uni(bool);

pragma(LDC_intrinsic, "llvm.nvvm.vote.uni.sync")
    bool __nvvm_vote_uni_sync(int, bool);

