module ldc.gccbuiltins_ppc; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.ppc.addex")
    long __builtin_ppc_addex(long, long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vcipher")
    long2 __builtin_altivec_crypto_vcipher(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vcipherlast")
    long2 __builtin_altivec_crypto_vcipherlast(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vncipher")
    long2 __builtin_altivec_crypto_vncipher(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vncipherlast")
    long2 __builtin_altivec_crypto_vncipherlast(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpermxor")
    byte16 __builtin_altivec_crypto_vpermxor(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpermxor.be")
    byte16 __builtin_altivec_crypto_vpermxor_be(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpmsumb")
    byte16 __builtin_altivec_crypto_vpmsumb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpmsumd")
    long2 __builtin_altivec_crypto_vpmsumd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpmsumh")
    short8 __builtin_altivec_crypto_vpmsumh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vpmsumw")
    int4 __builtin_altivec_crypto_vpmsumw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vsbox")
    long2 __builtin_altivec_crypto_vsbox(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vshasigmad")
    long2 __builtin_altivec_crypto_vshasigmad(long2, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.crypto.vshasigmaw")
    int4 __builtin_altivec_crypto_vshasigmaw(int4, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.dss")
    void __builtin_altivec_dss(int);

pragma(LDC_intrinsic, "llvm.ppc.altivec.dssall")
    void __builtin_altivec_dssall();

pragma(LDC_intrinsic, "llvm.ppc.altivec.dst")
    void __builtin_altivec_dst(void*, int, int);

pragma(LDC_intrinsic, "llvm.ppc.altivec.dstst")
    void __builtin_altivec_dstst(void*, int, int);

pragma(LDC_intrinsic, "llvm.ppc.altivec.dststt")
    void __builtin_altivec_dststt(void*, int, int);

pragma(LDC_intrinsic, "llvm.ppc.altivec.dstt")
    void __builtin_altivec_dstt(void*, int, int);

pragma(LDC_intrinsic, "llvm.ppc.altivec.mfvscr")
    short8 __builtin_altivec_mfvscr() pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.mtvscr")
    void __builtin_altivec_mtvscr(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.mtvsrbm")
    byte16 __builtin_altivec_mtvsrbm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.mtvsrdm")
    long2 __builtin_altivec_mtvsrdm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.mtvsrhm")
    short8 __builtin_altivec_mtvsrhm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.mtvsrwm")
    int4 __builtin_altivec_mtvsrwm(long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vabsdub")
    byte16 __builtin_altivec_vabsdub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vabsduh")
    short8 __builtin_altivec_vabsduh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vabsduw")
    int4 __builtin_altivec_vabsduw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vaddcuw")
    int4 __builtin_altivec_vaddcuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vaddsbs")
    byte16 __builtin_altivec_vaddsbs(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vaddshs")
    short8 __builtin_altivec_vaddshs(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vaddsws")
    int4 __builtin_altivec_vaddsws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vaddubs")
    byte16 __builtin_altivec_vaddubs(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vadduhs")
    short8 __builtin_altivec_vadduhs(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vadduws")
    int4 __builtin_altivec_vadduws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavgsb")
    byte16 __builtin_altivec_vavgsb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavgsh")
    short8 __builtin_altivec_vavgsh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavgsw")
    int4 __builtin_altivec_vavgsw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavgub")
    byte16 __builtin_altivec_vavgub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavguh")
    short8 __builtin_altivec_vavguh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vavguw")
    int4 __builtin_altivec_vavguw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vbpermd")
    long2 __builtin_altivec_vbpermd(long2, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vbpermq")
    long2 __builtin_altivec_vbpermq(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcfsx")
    float4 __builtin_altivec_vcfsx(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcfuged")
    long2 __builtin_altivec_vcfuged(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcfux")
    float4 __builtin_altivec_vcfux(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vclrlb")
    byte16 __builtin_altivec_vclrlb(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vclrrb")
    byte16 __builtin_altivec_vclrrb(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vclzdm")
    long2 __builtin_altivec_vclzdm(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vclzlsbb")
    int __builtin_altivec_vclzlsbb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpbfp")
    int4 __builtin_altivec_vcmpbfp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpbfp.p")
    int __builtin_altivec_vcmpbfp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpeqfp")
    int4 __builtin_altivec_vcmpeqfp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpeqfp.p")
    int __builtin_altivec_vcmpeqfp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequb")
    byte16 __builtin_altivec_vcmpequb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequb.p")
    int __builtin_altivec_vcmpequb_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequd")
    long2 __builtin_altivec_vcmpequd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequd.p")
    int __builtin_altivec_vcmpequd_p(int, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequh")
    short8 __builtin_altivec_vcmpequh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequh.p")
    int __builtin_altivec_vcmpequh_p(int, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequw")
    int4 __builtin_altivec_vcmpequw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpequw.p")
    int __builtin_altivec_vcmpequw_p(int, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgefp")
    int4 __builtin_altivec_vcmpgefp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgefp.p")
    int __builtin_altivec_vcmpgefp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtfp")
    int4 __builtin_altivec_vcmpgtfp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtfp.p")
    int __builtin_altivec_vcmpgtfp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsb")
    byte16 __builtin_altivec_vcmpgtsb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsb.p")
    int __builtin_altivec_vcmpgtsb_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsd")
    long2 __builtin_altivec_vcmpgtsd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsd.p")
    int __builtin_altivec_vcmpgtsd_p(int, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsh")
    short8 __builtin_altivec_vcmpgtsh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsh.p")
    int __builtin_altivec_vcmpgtsh_p(int, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsw")
    int4 __builtin_altivec_vcmpgtsw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtsw.p")
    int __builtin_altivec_vcmpgtsw_p(int, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtub")
    byte16 __builtin_altivec_vcmpgtub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtub.p")
    int __builtin_altivec_vcmpgtub_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtud")
    long2 __builtin_altivec_vcmpgtud(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtud.p")
    int __builtin_altivec_vcmpgtud_p(int, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtuh")
    short8 __builtin_altivec_vcmpgtuh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtuh.p")
    int __builtin_altivec_vcmpgtuh_p(int, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtuw")
    int4 __builtin_altivec_vcmpgtuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpgtuw.p")
    int __builtin_altivec_vcmpgtuw_p(int, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpneb")
    byte16 __builtin_altivec_vcmpneb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpneb.p")
    int __builtin_altivec_vcmpneb_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpneh")
    short8 __builtin_altivec_vcmpneh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpneh.p")
    int __builtin_altivec_vcmpneh_p(int, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnew")
    int4 __builtin_altivec_vcmpnew(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnew.p")
    int __builtin_altivec_vcmpnew_p(int, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezb")
    byte16 __builtin_altivec_vcmpnezb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezb.p")
    int __builtin_altivec_vcmpnezb_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezh")
    short8 __builtin_altivec_vcmpnezh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezh.p")
    int __builtin_altivec_vcmpnezh_p(int, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezw")
    int4 __builtin_altivec_vcmpnezw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcmpnezw.p")
    int __builtin_altivec_vcmpnezw_p(int, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcntmbb")
    long __builtin_altivec_vcntmbb(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcntmbd")
    long __builtin_altivec_vcntmbd(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcntmbh")
    long __builtin_altivec_vcntmbh(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vcntmbw")
    long __builtin_altivec_vcntmbw(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vctsxs")
    int4 __builtin_altivec_vctsxs(float4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vctuxs")
    int4 __builtin_altivec_vctuxs(float4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vctzdm")
    long2 __builtin_altivec_vctzdm(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vctzlsbb")
    int __builtin_altivec_vctzlsbb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vdivesd")
    long2 __builtin_altivec_vdivesd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vdivesw")
    int4 __builtin_altivec_vdivesw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vdiveud")
    long2 __builtin_altivec_vdiveud(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vdiveuw")
    int4 __builtin_altivec_vdiveuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vexpandbm")
    byte16 __builtin_altivec_vexpandbm(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vexpanddm")
    long2 __builtin_altivec_vexpanddm(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vexpandhm")
    short8 __builtin_altivec_vexpandhm(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vexpandwm")
    int4 __builtin_altivec_vexpandwm(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vexptefp")
    float4 __builtin_altivec_vexptefp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextddvlx")
    long2 __builtin_altivec_vextddvlx(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextddvrx")
    long2 __builtin_altivec_vextddvrx(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextdubvlx")
    long2 __builtin_altivec_vextdubvlx(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextdubvrx")
    long2 __builtin_altivec_vextdubvrx(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextduhvlx")
    long2 __builtin_altivec_vextduhvlx(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextduhvrx")
    long2 __builtin_altivec_vextduhvrx(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextduwvlx")
    long2 __builtin_altivec_vextduwvlx(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextduwvrx")
    long2 __builtin_altivec_vextduwvrx(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextractbm")
    int __builtin_altivec_vextractbm(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextractdm")
    int __builtin_altivec_vextractdm(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextracthm")
    int __builtin_altivec_vextracthm(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextractwm")
    int __builtin_altivec_vextractwm(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextsb2d")
    long2 __builtin_altivec_vextsb2d(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextsb2w")
    int4 __builtin_altivec_vextsb2w(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextsh2d")
    long2 __builtin_altivec_vextsh2d(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextsh2w")
    int4 __builtin_altivec_vextsh2w(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vextsw2d")
    long2 __builtin_altivec_vextsw2d(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vgbbd")
    byte16 __builtin_altivec_vgbbd(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsblx")
    byte16 __builtin_altivec_vinsblx(byte16, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsbrx")
    byte16 __builtin_altivec_vinsbrx(byte16, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsbvlx")
    byte16 __builtin_altivec_vinsbvlx(byte16, int, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsbvrx")
    byte16 __builtin_altivec_vinsbvrx(byte16, int, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsdlx")
    long2 __builtin_altivec_vinsdlx(long2, long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinsdrx")
    long2 __builtin_altivec_vinsdrx(long2, long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinshlx")
    short8 __builtin_altivec_vinshlx(short8, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinshrx")
    short8 __builtin_altivec_vinshrx(short8, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinshvlx")
    short8 __builtin_altivec_vinshvlx(short8, int, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinshvrx")
    short8 __builtin_altivec_vinshvrx(short8, int, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinswlx")
    int4 __builtin_altivec_vinswlx(int4, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinswrx")
    int4 __builtin_altivec_vinswrx(int4, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinswvlx")
    int4 __builtin_altivec_vinswvlx(int4, int, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vinswvrx")
    int4 __builtin_altivec_vinswvrx(int4, int, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vlogefp")
    float4 __builtin_altivec_vlogefp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaddfp")
    float4 __builtin_altivec_vmaddfp(float4, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxfp")
    float4 __builtin_altivec_vmaxfp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxsb")
    byte16 __builtin_altivec_vmaxsb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxsd")
    long2 __builtin_altivec_vmaxsd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxsh")
    short8 __builtin_altivec_vmaxsh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxsw")
    int4 __builtin_altivec_vmaxsw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxub")
    byte16 __builtin_altivec_vmaxub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxud")
    long2 __builtin_altivec_vmaxud(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxuh")
    short8 __builtin_altivec_vmaxuh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmaxuw")
    int4 __builtin_altivec_vmaxuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmhaddshs")
    short8 __builtin_altivec_vmhaddshs(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmhraddshs")
    short8 __builtin_altivec_vmhraddshs(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminfp")
    float4 __builtin_altivec_vminfp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminsb")
    byte16 __builtin_altivec_vminsb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminsd")
    long2 __builtin_altivec_vminsd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminsh")
    short8 __builtin_altivec_vminsh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminsw")
    int4 __builtin_altivec_vminsw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminub")
    byte16 __builtin_altivec_vminub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminud")
    long2 __builtin_altivec_vminud(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminuh")
    short8 __builtin_altivec_vminuh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vminuw")
    int4 __builtin_altivec_vminuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmladduhm")
    short8 __builtin_altivec_vmladduhm(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsummbm")
    int4 __builtin_altivec_vmsummbm(byte16, byte16, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsumshm")
    int4 __builtin_altivec_vmsumshm(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsumshs")
    int4 __builtin_altivec_vmsumshs(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsumubm")
    int4 __builtin_altivec_vmsumubm(byte16, byte16, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsumuhm")
    int4 __builtin_altivec_vmsumuhm(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmsumuhs")
    int4 __builtin_altivec_vmsumuhs(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulesb")
    short8 __builtin_altivec_vmulesb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulesh")
    int4 __builtin_altivec_vmulesh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulesw")
    long2 __builtin_altivec_vmulesw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmuleub")
    short8 __builtin_altivec_vmuleub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmuleuh")
    int4 __builtin_altivec_vmuleuh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmuleuw")
    long2 __builtin_altivec_vmuleuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulhsd")
    long2 __builtin_altivec_vmulhsd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulhsw")
    int4 __builtin_altivec_vmulhsw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulhud")
    long2 __builtin_altivec_vmulhud(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulhuw")
    int4 __builtin_altivec_vmulhuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulosb")
    short8 __builtin_altivec_vmulosb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulosh")
    int4 __builtin_altivec_vmulosh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulosw")
    long2 __builtin_altivec_vmulosw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmuloub")
    short8 __builtin_altivec_vmuloub(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulouh")
    int4 __builtin_altivec_vmulouh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vmulouw")
    long2 __builtin_altivec_vmulouw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vnmsubfp")
    float4 __builtin_altivec_vnmsubfp(float4, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpdepd")
    long2 __builtin_altivec_vpdepd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vperm")
    int4 __builtin_altivec_vperm_4si(int4, int4, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpextd")
    long2 __builtin_altivec_vpextd(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkpx")
    short8 __builtin_altivec_vpkpx(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpksdss")
    int4 __builtin_altivec_vpksdss(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpksdus")
    int4 __builtin_altivec_vpksdus(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkshss")
    byte16 __builtin_altivec_vpkshss(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkshus")
    byte16 __builtin_altivec_vpkshus(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkswss")
    short8 __builtin_altivec_vpkswss(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkswus")
    short8 __builtin_altivec_vpkswus(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkudus")
    int4 __builtin_altivec_vpkudus(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkuhus")
    byte16 __builtin_altivec_vpkuhus(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vpkuwus")
    short8 __builtin_altivec_vpkuwus(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vprtybd")
    long2 __builtin_altivec_vprtybd(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vprtybw")
    int4 __builtin_altivec_vprtybw(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrefp")
    float4 __builtin_altivec_vrefp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrfim")
    float4 __builtin_altivec_vrfim(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrfin")
    float4 __builtin_altivec_vrfin(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrfip")
    float4 __builtin_altivec_vrfip(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrfiz")
    float4 __builtin_altivec_vrfiz(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrlb")
    byte16 __builtin_altivec_vrlb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrld")
    long2 __builtin_altivec_vrld(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrldmi")
    long2 __builtin_altivec_vrldmi(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrldnm")
    long2 __builtin_altivec_vrldnm(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrlh")
    short8 __builtin_altivec_vrlh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrlw")
    int4 __builtin_altivec_vrlw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrlwmi")
    int4 __builtin_altivec_vrlwmi(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrlwnm")
    int4 __builtin_altivec_vrlwnm(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vrsqrtefp")
    float4 __builtin_altivec_vrsqrtefp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsel")
    int4 __builtin_altivec_vsel_4si(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsl")
    int4 __builtin_altivec_vsl(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vslb")
    byte16 __builtin_altivec_vslb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsldbi")
    byte16 __builtin_altivec_vsldbi(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vslh")
    short8 __builtin_altivec_vslh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vslo")
    int4 __builtin_altivec_vslo(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vslv")
    byte16 __builtin_altivec_vslv(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vslw")
    int4 __builtin_altivec_vslw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsr")
    int4 __builtin_altivec_vsr(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrab")
    byte16 __builtin_altivec_vsrab(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrah")
    short8 __builtin_altivec_vsrah(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsraw")
    int4 __builtin_altivec_vsraw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrb")
    byte16 __builtin_altivec_vsrb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrdbi")
    byte16 __builtin_altivec_vsrdbi(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrh")
    short8 __builtin_altivec_vsrh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsro")
    int4 __builtin_altivec_vsro(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrv")
    byte16 __builtin_altivec_vsrv(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsrw")
    int4 __builtin_altivec_vsrw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstribl")
    byte16 __builtin_altivec_vstribl(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstribl.p")
    int __builtin_altivec_vstribl_p(int, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstribr")
    byte16 __builtin_altivec_vstribr(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstribr.p")
    int __builtin_altivec_vstribr_p(int, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstrihl")
    short8 __builtin_altivec_vstrihl(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstrihl.p")
    int __builtin_altivec_vstrihl_p(int, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstrihr")
    short8 __builtin_altivec_vstrihr(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vstrihr.p")
    int __builtin_altivec_vstrihr_p(int, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubcuw")
    int4 __builtin_altivec_vsubcuw(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubsbs")
    byte16 __builtin_altivec_vsubsbs(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubshs")
    short8 __builtin_altivec_vsubshs(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubsws")
    int4 __builtin_altivec_vsubsws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsububs")
    byte16 __builtin_altivec_vsububs(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubuhs")
    short8 __builtin_altivec_vsubuhs(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsubuws")
    int4 __builtin_altivec_vsubuws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsum2sws")
    int4 __builtin_altivec_vsum2sws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsum4sbs")
    int4 __builtin_altivec_vsum4sbs(byte16, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsum4shs")
    int4 __builtin_altivec_vsum4shs(short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsum4ubs")
    int4 __builtin_altivec_vsum4ubs(byte16, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vsumsws")
    int4 __builtin_altivec_vsumsws(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupkhpx")
    int4 __builtin_altivec_vupkhpx(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupkhsb")
    short8 __builtin_altivec_vupkhsb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupkhsh")
    int4 __builtin_altivec_vupkhsh(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupkhsw")
    long2 __builtin_altivec_vupkhsw(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupklpx")
    int4 __builtin_altivec_vupklpx(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupklsb")
    short8 __builtin_altivec_vupklsb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupklsh")
    int4 __builtin_altivec_vupklsh(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.altivec.vupklsw")
    long2 __builtin_altivec_vupklsw(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.bcdadd")
    byte16 __builtin_ppc_bcdadd(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.bcdadd.p")
    int __builtin_ppc_bcdadd_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.bcdsub")
    byte16 __builtin_ppc_bcdsub(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.bcdsub.p")
    int __builtin_ppc_bcdsub_p(int, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.bpermd")
    long __builtin_bpermd(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.cfuged")
    long __builtin_cfuged(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.cmpeqb")
    long __builtin_ppc_cmpeqb(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.cmprb")
    int __builtin_ppc_cmprb(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.cntlzdm")
    long __builtin_cntlzdm(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.cnttzdm")
    long __builtin_cnttzdm(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.compare.exp.eq")
    int __builtin_ppc_compare_exp_eq(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.compare.exp.gt")
    int __builtin_ppc_compare_exp_gt(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.compare.exp.lt")
    int __builtin_ppc_compare_exp_lt(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.compare.exp.uo")
    int __builtin_ppc_compare_exp_uo(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.darn")
    long __builtin_darn();

pragma(LDC_intrinsic, "llvm.ppc.darn32")
    int __builtin_darn_32();

pragma(LDC_intrinsic, "llvm.ppc.darnraw")
    long __builtin_darn_raw();

pragma(LDC_intrinsic, "llvm.ppc.dcbf")
    void __builtin_dcbf(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbfl")
    void __builtin_ppc_dcbfl(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbflp")
    void __builtin_ppc_dcbflp(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbst")
    void __builtin_ppc_dcbst(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbt")
    void __builtin_ppc_dcbt(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbtst")
    void __builtin_ppc_dcbtst(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbtstt")
    void __builtin_ppc_dcbtstt(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbtt")
    void __builtin_ppc_dcbtt(void*);

pragma(LDC_intrinsic, "llvm.ppc.dcbz")
    void __builtin_ppc_dcbz(void*);

pragma(LDC_intrinsic, "llvm.ppc.divde")
    long __builtin_divde(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.divdeu")
    long __builtin_divdeu(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.divwe")
    int __builtin_divwe(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.divweu")
    int __builtin_divweu(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.eieio")
    void __builtin_ppc_eieio();

pragma(LDC_intrinsic, "llvm.ppc.extract.exp")
    int __builtin_ppc_extract_exp(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.extract.sig")
    long __builtin_ppc_extract_sig(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fcfid")
    double __builtin_ppc_fcfid(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fcfud")
    double __builtin_ppc_fcfud(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctid")
    double __builtin_ppc_fctid(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctidz")
    double __builtin_ppc_fctidz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctiw")
    double __builtin_ppc_fctiw(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctiwz")
    double __builtin_ppc_fctiwz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctudz")
    double __builtin_ppc_fctudz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fctuwz")
    double __builtin_ppc_fctuwz(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fmsub")
    double __builtin_ppc_fmsub(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fmsubs")
    float __builtin_ppc_fmsubs(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fnabs")
    double __builtin_ppc_fnabs(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fnabss")
    float __builtin_ppc_fnabss(float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fnmadd")
    double __builtin_ppc_fnmadd(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fnmadds")
    float __builtin_ppc_fnmadds(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fre")
    double __builtin_ppc_fre(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fres")
    float __builtin_ppc_fres(float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.frsqrte")
    double __builtin_ppc_frsqrte(double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.frsqrtes")
    float __builtin_ppc_frsqrtes(float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fsel")
    double __builtin_ppc_fsel(double, double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.fsels")
    float __builtin_ppc_fsels(float, float, float) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.get.texasr")
    long __builtin_get_texasr();

pragma(LDC_intrinsic, "llvm.ppc.get.texasru")
    long __builtin_get_texasru();

pragma(LDC_intrinsic, "llvm.ppc.get.tfhar")
    long __builtin_get_tfhar();

pragma(LDC_intrinsic, "llvm.ppc.get.tfiar")
    long __builtin_get_tfiar();

pragma(LDC_intrinsic, "llvm.ppc.icbt")
    void __builtin_ppc_icbt(void*);

pragma(LDC_intrinsic, "llvm.ppc.insert.exp")
    double __builtin_ppc_insert_exp(double, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.iospace.eieio")
    void __builtin_ppc_iospace_eieio();

pragma(LDC_intrinsic, "llvm.ppc.iospace.lwsync")
    void __builtin_ppc_iospace_lwsync();

pragma(LDC_intrinsic, "llvm.ppc.iospace.sync")
    void __builtin_ppc_iospace_sync();

pragma(LDC_intrinsic, "llvm.ppc.isync")
    void __builtin_ppc_isync();

pragma(LDC_intrinsic, "llvm.ppc.load4r")
    int __builtin_ppc_load4r(const void*);

pragma(LDC_intrinsic, "llvm.ppc.load8r")
    long __builtin_ppc_load8r(const void*);

pragma(LDC_intrinsic, "llvm.ppc.lwsync")
    void __builtin_ppc_lwsync();

pragma(LDC_intrinsic, "llvm.ppc.maddhd")
    long __builtin_ppc_maddhd(long, long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.maddhdu")
    long __builtin_ppc_maddhdu(long, long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.maddld")
    long __builtin_ppc_maddld(long, long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mfmsr")
    int __builtin_ppc_mfmsr() pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mftbu")
    int __builtin_ppc_mftbu() pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mtfsb0")
    void __builtin_ppc_mtfsb0(int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mtfsb1")
    void __builtin_ppc_mtfsb1(int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mtfsfi")
    void __builtin_ppc_mtfsfi(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mtmsr")
    void __builtin_ppc_mtmsr(int);

pragma(LDC_intrinsic, "llvm.ppc.mulhd")
    long __builtin_ppc_mulhd(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mulhdu")
    long __builtin_ppc_mulhdu(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mulhw")
    int __builtin_ppc_mulhw(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.mulhwu")
    int __builtin_ppc_mulhwu(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.pdepd")
    long __builtin_pdepd(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.pextd")
    long __builtin_pextd(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.readflm")
    double __builtin_readflm();

pragma(LDC_intrinsic, "llvm.ppc.set.texasr")
    void __builtin_set_texasr(long);

pragma(LDC_intrinsic, "llvm.ppc.set.texasru")
    void __builtin_set_texasru(long);

pragma(LDC_intrinsic, "llvm.ppc.set.tfhar")
    void __builtin_set_tfhar(long);

pragma(LDC_intrinsic, "llvm.ppc.set.tfiar")
    void __builtin_set_tfiar(long);

pragma(LDC_intrinsic, "llvm.ppc.setb")
    long __builtin_ppc_setb(long, long) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.setflm")
    double __builtin_setflm(double);

pragma(LDC_intrinsic, "llvm.ppc.setrnd")
    double __builtin_setrnd(int);

pragma(LDC_intrinsic, "llvm.ppc.stbcx")
    int __builtin_ppc_stbcx(void*, int);

pragma(LDC_intrinsic, "llvm.ppc.stdcx")
    int __builtin_ppc_stdcx(void*, long);

pragma(LDC_intrinsic, "llvm.ppc.stfiw")
    void __builtin_ppc_stfiw(void*, double);

pragma(LDC_intrinsic, "llvm.ppc.store2r")
    void __builtin_ppc_store2r(int, void*);

pragma(LDC_intrinsic, "llvm.ppc.store4r")
    void __builtin_ppc_store4r(int, void*);

pragma(LDC_intrinsic, "llvm.ppc.store8r")
    void __builtin_ppc_store8r(long, void*);

pragma(LDC_intrinsic, "llvm.ppc.stwcx")
    int __builtin_ppc_stwcx(void*, int);

pragma(LDC_intrinsic, "llvm.ppc.sync")
    void __builtin_ppc_sync();

pragma(LDC_intrinsic, "llvm.ppc.tabort")
    int __builtin_tabort(int);

pragma(LDC_intrinsic, "llvm.ppc.tabortdc")
    int __builtin_tabortdc(int, int, int);

pragma(LDC_intrinsic, "llvm.ppc.tabortdci")
    int __builtin_tabortdci(int, int, int);

pragma(LDC_intrinsic, "llvm.ppc.tabortwc")
    int __builtin_tabortwc(int, int, int);

pragma(LDC_intrinsic, "llvm.ppc.tabortwci")
    int __builtin_tabortwci(int, int, int);

pragma(LDC_intrinsic, "llvm.ppc.tbegin")
    int __builtin_tbegin(int);

pragma(LDC_intrinsic, "llvm.ppc.tcheck")
    int __builtin_tcheck();

pragma(LDC_intrinsic, "llvm.ppc.tdw")
    void __builtin_ppc_tdw(long, long, int);

pragma(LDC_intrinsic, "llvm.ppc.tend")
    int __builtin_tend(int);

pragma(LDC_intrinsic, "llvm.ppc.tendall")
    int __builtin_tendall();

pragma(LDC_intrinsic, "llvm.ppc.trap")
    void __builtin_ppc_trap(int);

pragma(LDC_intrinsic, "llvm.ppc.trapd")
    void __builtin_ppc_trapd(long);

pragma(LDC_intrinsic, "llvm.ppc.trechkpt")
    int __builtin_trechkpt();

pragma(LDC_intrinsic, "llvm.ppc.treclaim")
    int __builtin_treclaim(int);

pragma(LDC_intrinsic, "llvm.ppc.tresume")
    int __builtin_tresume();

pragma(LDC_intrinsic, "llvm.ppc.tsr")
    int __builtin_tsr(int);

pragma(LDC_intrinsic, "llvm.ppc.tsuspend")
    int __builtin_tsuspend();

pragma(LDC_intrinsic, "llvm.ppc.ttest")
    long __builtin_ttest();

pragma(LDC_intrinsic, "llvm.ppc.tw")
    void __builtin_ppc_tw(int, int, int);

pragma(LDC_intrinsic, "llvm.ppc.vsx.xsmaxdp")
    double __builtin_vsx_xsmaxdp(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xsmindp")
    double __builtin_vsx_xsmindp(double, double) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpeqdp")
    long2 __builtin_vsx_xvcmpeqdp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpeqdp.p")
    int __builtin_vsx_xvcmpeqdp_p(int, double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpeqsp")
    int4 __builtin_vsx_xvcmpeqsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpeqsp.p")
    int __builtin_vsx_xvcmpeqsp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgedp")
    long2 __builtin_vsx_xvcmpgedp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgedp.p")
    int __builtin_vsx_xvcmpgedp_p(int, double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgesp")
    int4 __builtin_vsx_xvcmpgesp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgesp.p")
    int __builtin_vsx_xvcmpgesp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgtdp")
    long2 __builtin_vsx_xvcmpgtdp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgtdp.p")
    int __builtin_vsx_xvcmpgtdp_p(int, double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgtsp")
    int4 __builtin_vsx_xvcmpgtsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcmpgtsp.p")
    int __builtin_vsx_xvcmpgtsp_p(int, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvbf16spn")
    byte16 __builtin_vsx_xvcvbf16spn(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvdpsp")
    float4 __builtin_vsx_xvcvdpsp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvdpsxws")
    int4 __builtin_vsx_xvcvdpsxws(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvdpuxws")
    int4 __builtin_vsx_xvcvdpuxws(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvhpsp")
    float4 __builtin_vsx_xvcvhpsp(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvspbf16")
    byte16 __builtin_vsx_xvcvspbf16(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvspdp")
    double2 __builtin_vsx_xvcvspdp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvsphp")
    float4 __builtin_vsx_xvcvsphp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvspsxds")
    long2 __builtin_vsx_xvcvspsxds(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvspuxds")
    long2 __builtin_vsx_xvcvspuxds(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvsxdsp")
    float4 __builtin_vsx_xvcvsxdsp(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvsxwdp")
    double2 __builtin_vsx_xvcvsxwdp(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvuxdsp")
    float4 __builtin_vsx_xvcvuxdsp(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvcvuxwdp")
    double2 __builtin_vsx_xvcvuxwdp(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvdivdp")
    double2 __builtin_vsx_xvdivdp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvdivsp")
    float4 __builtin_vsx_xvdivsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xviexpdp")
    double2 __builtin_vsx_xviexpdp(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xviexpsp")
    float4 __builtin_vsx_xviexpsp(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvmaxdp")
    double2 __builtin_vsx_xvmaxdp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvmaxsp")
    float4 __builtin_vsx_xvmaxsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvmindp")
    double2 __builtin_vsx_xvmindp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvminsp")
    float4 __builtin_vsx_xvminsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvredp")
    double2 __builtin_vsx_xvredp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvresp")
    float4 __builtin_vsx_xvresp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvrsqrtedp")
    double2 __builtin_vsx_xvrsqrtedp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvrsqrtesp")
    float4 __builtin_vsx_xvrsqrtesp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtdivdp")
    int __builtin_vsx_xvtdivdp(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtdivsp")
    int __builtin_vsx_xvtdivsp(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtlsbb")
    int __builtin_vsx_xvtlsbb(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtsqrtdp")
    int __builtin_vsx_xvtsqrtdp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtsqrtsp")
    int __builtin_vsx_xvtsqrtsp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtstdcdp")
    long2 __builtin_vsx_xvtstdcdp(double2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvtstdcsp")
    int4 __builtin_vsx_xvtstdcsp(float4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvxexpdp")
    long2 __builtin_vsx_xvxexpdp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvxexpsp")
    int4 __builtin_vsx_xvxexpsp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvxsigdp")
    long2 __builtin_vsx_xvxsigdp(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xvxsigsp")
    int4 __builtin_vsx_xvxsigsp(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxblendvb")
    byte16 __builtin_vsx_xxblendvb(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxblendvd")
    long2 __builtin_vsx_xxblendvd(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxblendvh")
    short8 __builtin_vsx_xxblendvh(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxblendvw")
    int4 __builtin_vsx_xxblendvw(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxeval")
    long2 __builtin_vsx_xxeval(long2, long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxextractuw")
    long2 __builtin_vsx_xxextractuw(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxgenpcvbm")
    byte16 __builtin_vsx_xxgenpcvbm(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxgenpcvdm")
    long2 __builtin_vsx_xxgenpcvdm(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxgenpcvhm")
    short8 __builtin_vsx_xxgenpcvhm(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxgenpcvwm")
    int4 __builtin_vsx_xxgenpcvwm(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxinsertw")
    int4 __builtin_vsx_xxinsertw(int4, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxleqv")
    int4 __builtin_vsx_xxleqv(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.ppc.vsx.xxpermx")
    byte16 __builtin_vsx_xxpermx(byte16, byte16, byte16, int) pure @safe;

