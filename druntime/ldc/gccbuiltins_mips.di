module ldc.gccbuiltins_mips; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.mips.absq.s.ph")
    short2 __builtin_mips_absq_s_ph(short2);

pragma(LDC_intrinsic, "llvm.mips.absq.s.qb")
    byte4 __builtin_mips_absq_s_qb(byte4);

pragma(LDC_intrinsic, "llvm.mips.absq.s.w")
    int __builtin_mips_absq_s_w(int);

pragma(LDC_intrinsic, "llvm.mips.add.a.b")
    byte16 __builtin_msa_add_a_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.add.a.d")
    long2 __builtin_msa_add_a_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.add.a.h")
    short8 __builtin_msa_add_a_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.add.a.w")
    int4 __builtin_msa_add_a_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.addq.ph")
    short2 __builtin_mips_addq_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.addq.s.ph")
    short2 __builtin_mips_addq_s_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.addq.s.w")
    int __builtin_mips_addq_s_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.addqh.ph")
    short2 __builtin_mips_addqh_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.addqh.r.ph")
    short2 __builtin_mips_addqh_r_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.addqh.r.w")
    int __builtin_mips_addqh_r_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.addqh.w")
    int __builtin_mips_addqh_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.adds.a.b")
    byte16 __builtin_msa_adds_a_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.adds.a.d")
    long2 __builtin_msa_adds_a_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.adds.a.h")
    short8 __builtin_msa_adds_a_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.adds.a.w")
    int4 __builtin_msa_adds_a_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.adds.s.b")
    byte16 __builtin_msa_adds_s_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.adds.s.d")
    long2 __builtin_msa_adds_s_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.adds.s.h")
    short8 __builtin_msa_adds_s_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.adds.s.w")
    int4 __builtin_msa_adds_s_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.adds.u.b")
    byte16 __builtin_msa_adds_u_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.adds.u.d")
    long2 __builtin_msa_adds_u_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.adds.u.h")
    short8 __builtin_msa_adds_u_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.adds.u.w")
    int4 __builtin_msa_adds_u_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.addsc")
    int __builtin_mips_addsc(int, int);

pragma(LDC_intrinsic, "llvm.mips.addu.ph")
    short2 __builtin_mips_addu_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.addu.qb")
    byte4 __builtin_mips_addu_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.addu.s.ph")
    short2 __builtin_mips_addu_s_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.addu.s.qb")
    byte4 __builtin_mips_addu_s_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.adduh.qb")
    byte4 __builtin_mips_adduh_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.adduh.r.qb")
    byte4 __builtin_mips_adduh_r_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.addv.b")
    byte16 __builtin_msa_addv_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.addv.d")
    long2 __builtin_msa_addv_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.addv.h")
    short8 __builtin_msa_addv_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.addv.w")
    int4 __builtin_msa_addv_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.addvi.b")
    byte16 __builtin_msa_addvi_b(byte16, int);

pragma(LDC_intrinsic, "llvm.mips.addvi.d")
    long2 __builtin_msa_addvi_d(long2, int);

pragma(LDC_intrinsic, "llvm.mips.addvi.h")
    short8 __builtin_msa_addvi_h(short8, int);

pragma(LDC_intrinsic, "llvm.mips.addvi.w")
    int4 __builtin_msa_addvi_w(int4, int);

pragma(LDC_intrinsic, "llvm.mips.addwc")
    int __builtin_mips_addwc(int, int);

pragma(LDC_intrinsic, "llvm.mips.and.v")
    byte16 __builtin_msa_and_v(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.andi.b")
    byte16 __builtin_msa_andi_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.append")
    int __builtin_mips_append(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.s.b")
    byte16 __builtin_msa_asub_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.s.d")
    long2 __builtin_msa_asub_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.s.h")
    short8 __builtin_msa_asub_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.s.w")
    int4 __builtin_msa_asub_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.u.b")
    byte16 __builtin_msa_asub_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.u.d")
    long2 __builtin_msa_asub_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.u.h")
    short8 __builtin_msa_asub_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.asub.u.w")
    int4 __builtin_msa_asub_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ave.s.b")
    byte16 __builtin_msa_ave_s_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.ave.s.d")
    long2 __builtin_msa_ave_s_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.ave.s.h")
    short8 __builtin_msa_ave_s_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.ave.s.w")
    int4 __builtin_msa_ave_s_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.ave.u.b")
    byte16 __builtin_msa_ave_u_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.ave.u.d")
    long2 __builtin_msa_ave_u_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.ave.u.h")
    short8 __builtin_msa_ave_u_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.ave.u.w")
    int4 __builtin_msa_ave_u_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.aver.s.b")
    byte16 __builtin_msa_aver_s_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.aver.s.d")
    long2 __builtin_msa_aver_s_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.aver.s.h")
    short8 __builtin_msa_aver_s_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.aver.s.w")
    int4 __builtin_msa_aver_s_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.aver.u.b")
    byte16 __builtin_msa_aver_u_b(byte16, byte16);

pragma(LDC_intrinsic, "llvm.mips.aver.u.d")
    long2 __builtin_msa_aver_u_d(long2, long2);

pragma(LDC_intrinsic, "llvm.mips.aver.u.h")
    short8 __builtin_msa_aver_u_h(short8, short8);

pragma(LDC_intrinsic, "llvm.mips.aver.u.w")
    int4 __builtin_msa_aver_u_w(int4, int4);

pragma(LDC_intrinsic, "llvm.mips.balign")
    int __builtin_mips_balign(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclr.b")
    byte16 __builtin_msa_bclr_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclr.d")
    long2 __builtin_msa_bclr_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclr.h")
    short8 __builtin_msa_bclr_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclr.w")
    int4 __builtin_msa_bclr_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclri.b")
    byte16 __builtin_msa_bclri_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclri.d")
    long2 __builtin_msa_bclri_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclri.h")
    short8 __builtin_msa_bclri_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bclri.w")
    int4 __builtin_msa_bclri_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsl.b")
    byte16 __builtin_msa_binsl_b(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsl.d")
    long2 __builtin_msa_binsl_d(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsl.h")
    short8 __builtin_msa_binsl_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsl.w")
    int4 __builtin_msa_binsl_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsli.b")
    byte16 __builtin_msa_binsli_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsli.d")
    long2 __builtin_msa_binsli_d(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsli.h")
    short8 __builtin_msa_binsli_h(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsli.w")
    int4 __builtin_msa_binsli_w(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsr.b")
    byte16 __builtin_msa_binsr_b(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsr.d")
    long2 __builtin_msa_binsr_d(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsr.h")
    short8 __builtin_msa_binsr_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsr.w")
    int4 __builtin_msa_binsr_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsri.b")
    byte16 __builtin_msa_binsri_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsri.d")
    long2 __builtin_msa_binsri_d(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsri.h")
    short8 __builtin_msa_binsri_h(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.binsri.w")
    int4 __builtin_msa_binsri_w(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bitrev")
    int __builtin_mips_bitrev(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bmnz.v")
    byte16 __builtin_msa_bmnz_v(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bmnzi.b")
    byte16 __builtin_msa_bmnzi_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bmz.v")
    byte16 __builtin_msa_bmz_v(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bmzi.b")
    byte16 __builtin_msa_bmzi_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bneg.b")
    byte16 __builtin_msa_bneg_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bneg.d")
    long2 __builtin_msa_bneg_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bneg.h")
    short8 __builtin_msa_bneg_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bneg.w")
    int4 __builtin_msa_bneg_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnegi.b")
    byte16 __builtin_msa_bnegi_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnegi.d")
    long2 __builtin_msa_bnegi_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnegi.h")
    short8 __builtin_msa_bnegi_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnegi.w")
    int4 __builtin_msa_bnegi_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnz.b")
    int __builtin_msa_bnz_b(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnz.d")
    int __builtin_msa_bnz_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnz.h")
    int __builtin_msa_bnz_h(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnz.v")
    int __builtin_msa_bnz_v(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bnz.w")
    int __builtin_msa_bnz_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bposge32")
    int __builtin_mips_bposge32();

pragma(LDC_intrinsic, "llvm.mips.bsel.v")
    byte16 __builtin_msa_bsel_v(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bseli.b")
    byte16 __builtin_msa_bseli_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bset.b")
    byte16 __builtin_msa_bset_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bset.d")
    long2 __builtin_msa_bset_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bset.h")
    short8 __builtin_msa_bset_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bset.w")
    int4 __builtin_msa_bset_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bseti.b")
    byte16 __builtin_msa_bseti_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bseti.d")
    long2 __builtin_msa_bseti_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bseti.h")
    short8 __builtin_msa_bseti_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bseti.w")
    int4 __builtin_msa_bseti_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bz.b")
    int __builtin_msa_bz_b(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bz.d")
    int __builtin_msa_bz_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bz.h")
    int __builtin_msa_bz_h(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bz.v")
    int __builtin_msa_bz_v(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.bz.w")
    int __builtin_msa_bz_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceq.b")
    byte16 __builtin_msa_ceq_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceq.d")
    long2 __builtin_msa_ceq_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceq.h")
    short8 __builtin_msa_ceq_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceq.w")
    int4 __builtin_msa_ceq_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceqi.b")
    byte16 __builtin_msa_ceqi_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceqi.d")
    long2 __builtin_msa_ceqi_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceqi.h")
    short8 __builtin_msa_ceqi_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ceqi.w")
    int4 __builtin_msa_ceqi_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cfcmsa")
    int __builtin_msa_cfcmsa(int);

pragma(LDC_intrinsic, "llvm.mips.cle.s.b")
    byte16 __builtin_msa_cle_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.s.d")
    long2 __builtin_msa_cle_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.s.h")
    short8 __builtin_msa_cle_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.s.w")
    int4 __builtin_msa_cle_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.u.b")
    byte16 __builtin_msa_cle_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.u.d")
    long2 __builtin_msa_cle_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.u.h")
    short8 __builtin_msa_cle_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cle.u.w")
    int4 __builtin_msa_cle_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.s.b")
    byte16 __builtin_msa_clei_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.s.d")
    long2 __builtin_msa_clei_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.s.h")
    short8 __builtin_msa_clei_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.s.w")
    int4 __builtin_msa_clei_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.u.b")
    byte16 __builtin_msa_clei_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.u.d")
    long2 __builtin_msa_clei_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.u.h")
    short8 __builtin_msa_clei_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clei.u.w")
    int4 __builtin_msa_clei_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.s.b")
    byte16 __builtin_msa_clt_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.s.d")
    long2 __builtin_msa_clt_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.s.h")
    short8 __builtin_msa_clt_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.s.w")
    int4 __builtin_msa_clt_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.u.b")
    byte16 __builtin_msa_clt_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.u.d")
    long2 __builtin_msa_clt_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.u.h")
    short8 __builtin_msa_clt_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clt.u.w")
    int4 __builtin_msa_clt_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.s.b")
    byte16 __builtin_msa_clti_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.s.d")
    long2 __builtin_msa_clti_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.s.h")
    short8 __builtin_msa_clti_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.s.w")
    int4 __builtin_msa_clti_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.u.b")
    byte16 __builtin_msa_clti_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.u.d")
    long2 __builtin_msa_clti_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.u.h")
    short8 __builtin_msa_clti_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.clti.u.w")
    int4 __builtin_msa_clti_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.cmp.eq.ph")
    void __builtin_mips_cmp_eq_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.cmp.le.ph")
    void __builtin_mips_cmp_le_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.cmp.lt.ph")
    void __builtin_mips_cmp_lt_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.cmpgdu.eq.qb")
    int __builtin_mips_cmpgdu_eq_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpgdu.le.qb")
    int __builtin_mips_cmpgdu_le_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpgdu.lt.qb")
    int __builtin_mips_cmpgdu_lt_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpgu.eq.qb")
    int __builtin_mips_cmpgu_eq_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpgu.le.qb")
    int __builtin_mips_cmpgu_le_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpgu.lt.qb")
    int __builtin_mips_cmpgu_lt_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpu.eq.qb")
    void __builtin_mips_cmpu_eq_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpu.le.qb")
    void __builtin_mips_cmpu_le_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.cmpu.lt.qb")
    void __builtin_mips_cmpu_lt_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.copy.s.b")
    int __builtin_msa_copy_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.s.d")
    long __builtin_msa_copy_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.s.h")
    int __builtin_msa_copy_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.s.w")
    int __builtin_msa_copy_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.u.b")
    int __builtin_msa_copy_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.u.d")
    long __builtin_msa_copy_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.u.h")
    int __builtin_msa_copy_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.copy.u.w")
    int __builtin_msa_copy_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ctcmsa")
    void __builtin_msa_ctcmsa(int, int);

pragma(LDC_intrinsic, "llvm.mips.div.s.b")
    byte16 __builtin_msa_div_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.s.d")
    long2 __builtin_msa_div_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.s.h")
    short8 __builtin_msa_div_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.s.w")
    int4 __builtin_msa_div_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.u.b")
    byte16 __builtin_msa_div_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.u.d")
    long2 __builtin_msa_div_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.u.h")
    short8 __builtin_msa_div_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.div.u.w")
    int4 __builtin_msa_div_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dlsa")
    long __builtin_mips_dlsa(long, long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.s.d")
    long2 __builtin_msa_dotp_s_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.s.h")
    short8 __builtin_msa_dotp_s_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.s.w")
    int4 __builtin_msa_dotp_s_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.u.d")
    long2 __builtin_msa_dotp_u_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.u.h")
    short8 __builtin_msa_dotp_u_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dotp.u.w")
    int4 __builtin_msa_dotp_u_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpa.w.ph")
    long __builtin_mips_dpa_w_ph(long, short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.s.d")
    long2 __builtin_msa_dpadd_s_d(long2, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.s.h")
    short8 __builtin_msa_dpadd_s_h(short8, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.s.w")
    int4 __builtin_msa_dpadd_s_w(int4, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.u.d")
    long2 __builtin_msa_dpadd_u_d(long2, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.u.h")
    short8 __builtin_msa_dpadd_u_h(short8, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpadd.u.w")
    int4 __builtin_msa_dpadd_u_w(int4, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpaq.s.w.ph")
    long __builtin_mips_dpaq_s_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpaq.sa.l.w")
    long __builtin_mips_dpaq_sa_l_w(long, int, int);

pragma(LDC_intrinsic, "llvm.mips.dpaqx.s.w.ph")
    long __builtin_mips_dpaqx_s_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpaqx.sa.w.ph")
    long __builtin_mips_dpaqx_sa_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpau.h.qbl")
    long __builtin_mips_dpau_h_qbl(long, byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpau.h.qbr")
    long __builtin_mips_dpau_h_qbr(long, byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpax.w.ph")
    long __builtin_mips_dpax_w_ph(long, short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dps.w.ph")
    long __builtin_mips_dps_w_ph(long, short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsq.s.w.ph")
    long __builtin_mips_dpsq_s_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpsq.sa.l.w")
    long __builtin_mips_dpsq_sa_l_w(long, int, int);

pragma(LDC_intrinsic, "llvm.mips.dpsqx.s.w.ph")
    long __builtin_mips_dpsqx_s_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpsqx.sa.w.ph")
    long __builtin_mips_dpsqx_sa_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.dpsu.h.qbl")
    long __builtin_mips_dpsu_h_qbl(long, byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsu.h.qbr")
    long __builtin_mips_dpsu_h_qbr(long, byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.s.d")
    long2 __builtin_msa_dpsub_s_d(long2, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.s.h")
    short8 __builtin_msa_dpsub_s_h(short8, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.s.w")
    int4 __builtin_msa_dpsub_s_w(int4, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.u.d")
    long2 __builtin_msa_dpsub_u_d(long2, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.u.h")
    short8 __builtin_msa_dpsub_u_h(short8, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsub.u.w")
    int4 __builtin_msa_dpsub_u_w(int4, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.dpsx.w.ph")
    long __builtin_mips_dpsx_w_ph(long, short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.extp")
    int __builtin_mips_extp(long, int);

pragma(LDC_intrinsic, "llvm.mips.extpdp")
    int __builtin_mips_extpdp(long, int);

pragma(LDC_intrinsic, "llvm.mips.extr.r.w")
    int __builtin_mips_extr_r_w(long, int);

pragma(LDC_intrinsic, "llvm.mips.extr.rs.w")
    int __builtin_mips_extr_rs_w(long, int);

pragma(LDC_intrinsic, "llvm.mips.extr.s.h")
    int __builtin_mips_extr_s_h(long, int);

pragma(LDC_intrinsic, "llvm.mips.extr.w")
    int __builtin_mips_extr_w(long, int);

pragma(LDC_intrinsic, "llvm.mips.fadd.d")
    double2 __builtin_msa_fadd_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fadd.w")
    float4 __builtin_msa_fadd_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcaf.d")
    long2 __builtin_msa_fcaf_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcaf.w")
    int4 __builtin_msa_fcaf_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fceq.d")
    long2 __builtin_msa_fceq_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fceq.w")
    int4 __builtin_msa_fceq_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fclass.d")
    long2 __builtin_msa_fclass_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fclass.w")
    int4 __builtin_msa_fclass_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcle.d")
    long2 __builtin_msa_fcle_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcle.w")
    int4 __builtin_msa_fcle_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fclt.d")
    long2 __builtin_msa_fclt_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fclt.w")
    int4 __builtin_msa_fclt_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcne.d")
    long2 __builtin_msa_fcne_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcne.w")
    int4 __builtin_msa_fcne_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcor.d")
    long2 __builtin_msa_fcor_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcor.w")
    int4 __builtin_msa_fcor_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcueq.d")
    long2 __builtin_msa_fcueq_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcueq.w")
    int4 __builtin_msa_fcueq_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcule.d")
    long2 __builtin_msa_fcule_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcule.w")
    int4 __builtin_msa_fcule_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcult.d")
    long2 __builtin_msa_fcult_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcult.w")
    int4 __builtin_msa_fcult_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcun.d")
    long2 __builtin_msa_fcun_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcun.w")
    int4 __builtin_msa_fcun_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcune.d")
    long2 __builtin_msa_fcune_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fcune.w")
    int4 __builtin_msa_fcune_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fdiv.d")
    double2 __builtin_msa_fdiv_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fdiv.w")
    float4 __builtin_msa_fdiv_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fexdo.w")
    float4 __builtin_msa_fexdo_w(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fexp2.d")
    double2 __builtin_msa_fexp2_d(double2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fexp2.w")
    float4 __builtin_msa_fexp2_w(float4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fexupl.d")
    double2 __builtin_msa_fexupl_d(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fexupr.d")
    double2 __builtin_msa_fexupr_d(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffint.s.d")
    double2 __builtin_msa_ffint_s_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffint.s.w")
    float4 __builtin_msa_ffint_s_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffint.u.d")
    double2 __builtin_msa_ffint_u_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffint.u.w")
    float4 __builtin_msa_ffint_u_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffql.d")
    double2 __builtin_msa_ffql_d(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffql.w")
    float4 __builtin_msa_ffql_w(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffqr.d")
    double2 __builtin_msa_ffqr_d(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ffqr.w")
    float4 __builtin_msa_ffqr_w(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fill.b")
    byte16 __builtin_msa_fill_b(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fill.d")
    long2 __builtin_msa_fill_d(long) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fill.h")
    short8 __builtin_msa_fill_h(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fill.w")
    int4 __builtin_msa_fill_w(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.flog2.d")
    double2 __builtin_msa_flog2_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.flog2.w")
    float4 __builtin_msa_flog2_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmadd.d")
    double2 __builtin_msa_fmadd_d(double2, double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmadd.w")
    float4 __builtin_msa_fmadd_w(float4, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmax.a.d")
    double2 __builtin_msa_fmax_a_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmax.a.w")
    float4 __builtin_msa_fmax_a_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmax.d")
    double2 __builtin_msa_fmax_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmax.w")
    float4 __builtin_msa_fmax_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmin.a.d")
    double2 __builtin_msa_fmin_a_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmin.a.w")
    float4 __builtin_msa_fmin_a_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmin.d")
    double2 __builtin_msa_fmin_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmin.w")
    float4 __builtin_msa_fmin_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmsub.d")
    double2 __builtin_msa_fmsub_d(double2, double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmsub.w")
    float4 __builtin_msa_fmsub_w(float4, float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmul.d")
    double2 __builtin_msa_fmul_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fmul.w")
    float4 __builtin_msa_fmul_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frcp.d")
    double2 __builtin_msa_frcp_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frcp.w")
    float4 __builtin_msa_frcp_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frint.d")
    double2 __builtin_msa_frint_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frint.w")
    float4 __builtin_msa_frint_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frsqrt.d")
    double2 __builtin_msa_frsqrt_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.frsqrt.w")
    float4 __builtin_msa_frsqrt_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsaf.d")
    long2 __builtin_msa_fsaf_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsaf.w")
    int4 __builtin_msa_fsaf_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fseq.d")
    long2 __builtin_msa_fseq_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fseq.w")
    int4 __builtin_msa_fseq_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsle.d")
    long2 __builtin_msa_fsle_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsle.w")
    int4 __builtin_msa_fsle_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fslt.d")
    long2 __builtin_msa_fslt_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fslt.w")
    int4 __builtin_msa_fslt_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsne.d")
    long2 __builtin_msa_fsne_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsne.w")
    int4 __builtin_msa_fsne_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsor.d")
    long2 __builtin_msa_fsor_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsor.w")
    int4 __builtin_msa_fsor_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsqrt.d")
    double2 __builtin_msa_fsqrt_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsqrt.w")
    float4 __builtin_msa_fsqrt_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsub.d")
    double2 __builtin_msa_fsub_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsub.w")
    float4 __builtin_msa_fsub_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsueq.d")
    long2 __builtin_msa_fsueq_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsueq.w")
    int4 __builtin_msa_fsueq_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsule.d")
    long2 __builtin_msa_fsule_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsule.w")
    int4 __builtin_msa_fsule_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsult.d")
    long2 __builtin_msa_fsult_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsult.w")
    int4 __builtin_msa_fsult_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsun.d")
    long2 __builtin_msa_fsun_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsun.w")
    int4 __builtin_msa_fsun_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsune.d")
    long2 __builtin_msa_fsune_d(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.fsune.w")
    int4 __builtin_msa_fsune_w(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftint.s.d")
    long2 __builtin_msa_ftint_s_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftint.s.w")
    int4 __builtin_msa_ftint_s_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftint.u.d")
    long2 __builtin_msa_ftint_u_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftint.u.w")
    int4 __builtin_msa_ftint_u_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftq.h")
    short8 __builtin_msa_ftq_h(float4, float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftq.w")
    int4 __builtin_msa_ftq_w(double2, double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftrunc.s.d")
    long2 __builtin_msa_ftrunc_s_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftrunc.s.w")
    int4 __builtin_msa_ftrunc_s_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftrunc.u.d")
    long2 __builtin_msa_ftrunc_u_d(double2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ftrunc.u.w")
    int4 __builtin_msa_ftrunc_u_w(float4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.s.d")
    long2 __builtin_msa_hadd_s_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.s.h")
    short8 __builtin_msa_hadd_s_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.s.w")
    int4 __builtin_msa_hadd_s_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.u.d")
    long2 __builtin_msa_hadd_u_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.u.h")
    short8 __builtin_msa_hadd_u_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hadd.u.w")
    int4 __builtin_msa_hadd_u_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.s.d")
    long2 __builtin_msa_hsub_s_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.s.h")
    short8 __builtin_msa_hsub_s_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.s.w")
    int4 __builtin_msa_hsub_s_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.u.d")
    long2 __builtin_msa_hsub_u_d(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.u.h")
    short8 __builtin_msa_hsub_u_h(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.hsub.u.w")
    int4 __builtin_msa_hsub_u_w(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvev.b")
    byte16 __builtin_msa_ilvev_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvev.d")
    long2 __builtin_msa_ilvev_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvev.h")
    short8 __builtin_msa_ilvev_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvev.w")
    int4 __builtin_msa_ilvev_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvl.b")
    byte16 __builtin_msa_ilvl_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvl.d")
    long2 __builtin_msa_ilvl_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvl.h")
    short8 __builtin_msa_ilvl_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvl.w")
    int4 __builtin_msa_ilvl_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvod.b")
    byte16 __builtin_msa_ilvod_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvod.d")
    long2 __builtin_msa_ilvod_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvod.h")
    short8 __builtin_msa_ilvod_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvod.w")
    int4 __builtin_msa_ilvod_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvr.b")
    byte16 __builtin_msa_ilvr_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvr.d")
    long2 __builtin_msa_ilvr_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvr.h")
    short8 __builtin_msa_ilvr_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ilvr.w")
    int4 __builtin_msa_ilvr_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insert.b")
    byte16 __builtin_msa_insert_b(byte16, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insert.d")
    long2 __builtin_msa_insert_d(long2, int, long) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insert.h")
    short8 __builtin_msa_insert_h(short8, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insert.w")
    int4 __builtin_msa_insert_w(int4, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insv")
    int __builtin_mips_insv(int, int);

pragma(LDC_intrinsic, "llvm.mips.insve.b")
    byte16 __builtin_msa_insve_b(byte16, int, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insve.d")
    long2 __builtin_msa_insve_d(long2, int, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insve.h")
    short8 __builtin_msa_insve_h(short8, int, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.insve.w")
    int4 __builtin_msa_insve_w(int4, int, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.lbux")
    int __builtin_mips_lbux(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ld.b")
    byte16 __builtin_msa_ld_b(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ld.d")
    long2 __builtin_msa_ld_d(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ld.h")
    short8 __builtin_msa_ld_h(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ld.w")
    int4 __builtin_msa_ld_w(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ldi.b")
    byte16 __builtin_msa_ldi_b(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ldi.d")
    long2 __builtin_msa_ldi_d(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ldi.h")
    short8 __builtin_msa_ldi_h(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ldi.w")
    int4 __builtin_msa_ldi_w(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ldr.d")
    long2 __builtin_msa_ldr_d(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.ldr.w")
    int4 __builtin_msa_ldr_w(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.lhx")
    int __builtin_mips_lhx(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.lsa")
    int __builtin_mips_lsa(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.lwx")
    int __builtin_mips_lwx(const void*, int);

pragma(LDC_intrinsic, "llvm.mips.madd")
    long __builtin_mips_madd(long, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.madd.q.h")
    short8 __builtin_msa_madd_q_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.madd.q.w")
    int4 __builtin_msa_madd_q_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddr.q.h")
    short8 __builtin_msa_maddr_q_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddr.q.w")
    int4 __builtin_msa_maddr_q_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddu")
    long __builtin_mips_maddu(long, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddv.b")
    byte16 __builtin_msa_maddv_b(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddv.d")
    long2 __builtin_msa_maddv_d(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddv.h")
    short8 __builtin_msa_maddv_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maddv.w")
    int4 __builtin_msa_maddv_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maq.s.w.phl")
    long __builtin_mips_maq_s_w_phl(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.maq.s.w.phr")
    long __builtin_mips_maq_s_w_phr(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.maq.sa.w.phl")
    long __builtin_mips_maq_sa_w_phl(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.maq.sa.w.phr")
    long __builtin_mips_maq_sa_w_phr(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.max.a.b")
    byte16 __builtin_msa_max_a_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.a.d")
    long2 __builtin_msa_max_a_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.a.h")
    short8 __builtin_msa_max_a_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.a.w")
    int4 __builtin_msa_max_a_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.s.b")
    byte16 __builtin_msa_max_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.s.d")
    long2 __builtin_msa_max_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.s.h")
    short8 __builtin_msa_max_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.s.w")
    int4 __builtin_msa_max_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.u.b")
    byte16 __builtin_msa_max_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.u.d")
    long2 __builtin_msa_max_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.u.h")
    short8 __builtin_msa_max_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.max.u.w")
    int4 __builtin_msa_max_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.s.b")
    byte16 __builtin_msa_maxi_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.s.d")
    long2 __builtin_msa_maxi_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.s.h")
    short8 __builtin_msa_maxi_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.s.w")
    int4 __builtin_msa_maxi_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.u.b")
    byte16 __builtin_msa_maxi_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.u.d")
    long2 __builtin_msa_maxi_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.u.h")
    short8 __builtin_msa_maxi_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.maxi.u.w")
    int4 __builtin_msa_maxi_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.a.b")
    byte16 __builtin_msa_min_a_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.a.d")
    long2 __builtin_msa_min_a_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.a.h")
    short8 __builtin_msa_min_a_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.a.w")
    int4 __builtin_msa_min_a_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.s.b")
    byte16 __builtin_msa_min_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.s.d")
    long2 __builtin_msa_min_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.s.h")
    short8 __builtin_msa_min_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.s.w")
    int4 __builtin_msa_min_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.u.b")
    byte16 __builtin_msa_min_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.u.d")
    long2 __builtin_msa_min_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.u.h")
    short8 __builtin_msa_min_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.min.u.w")
    int4 __builtin_msa_min_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.s.b")
    byte16 __builtin_msa_mini_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.s.d")
    long2 __builtin_msa_mini_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.s.h")
    short8 __builtin_msa_mini_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.s.w")
    int4 __builtin_msa_mini_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.u.b")
    byte16 __builtin_msa_mini_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.u.d")
    long2 __builtin_msa_mini_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.u.h")
    short8 __builtin_msa_mini_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mini.u.w")
    int4 __builtin_msa_mini_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.s.b")
    byte16 __builtin_msa_mod_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.s.d")
    long2 __builtin_msa_mod_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.s.h")
    short8 __builtin_msa_mod_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.s.w")
    int4 __builtin_msa_mod_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.u.b")
    byte16 __builtin_msa_mod_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.u.d")
    long2 __builtin_msa_mod_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.u.h")
    short8 __builtin_msa_mod_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mod.u.w")
    int4 __builtin_msa_mod_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.modsub")
    int __builtin_mips_modsub(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.move.v")
    byte16 __builtin_msa_move_v(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msub")
    long __builtin_mips_msub(long, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msub.q.h")
    short8 __builtin_msa_msub_q_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msub.q.w")
    int4 __builtin_msa_msub_q_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubr.q.h")
    short8 __builtin_msa_msubr_q_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubr.q.w")
    int4 __builtin_msa_msubr_q_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubu")
    long __builtin_mips_msubu(long, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubv.b")
    byte16 __builtin_msa_msubv_b(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubv.d")
    long2 __builtin_msa_msubv_d(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubv.h")
    short8 __builtin_msa_msubv_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.msubv.w")
    int4 __builtin_msa_msubv_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mthlip")
    long __builtin_mips_mthlip(long, int);

pragma(LDC_intrinsic, "llvm.mips.mul.ph")
    short2 __builtin_mips_mul_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.mul.q.h")
    short8 __builtin_msa_mul_q_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mul.q.w")
    int4 __builtin_msa_mul_q_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mul.s.ph")
    short2 __builtin_mips_mul_s_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.muleq.s.w.phl")
    int __builtin_mips_muleq_s_w_phl(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.muleq.s.w.phr")
    int __builtin_mips_muleq_s_w_phr(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.muleu.s.ph.qbl")
    short2 __builtin_mips_muleu_s_ph_qbl(byte4, short2);

pragma(LDC_intrinsic, "llvm.mips.muleu.s.ph.qbr")
    short2 __builtin_mips_muleu_s_ph_qbr(byte4, short2);

pragma(LDC_intrinsic, "llvm.mips.mulq.rs.ph")
    short2 __builtin_mips_mulq_rs_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.mulq.rs.w")
    int __builtin_mips_mulq_rs_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.mulq.s.ph")
    short2 __builtin_mips_mulq_s_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.mulq.s.w")
    int __builtin_mips_mulq_s_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.mulr.q.h")
    short8 __builtin_msa_mulr_q_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulr.q.w")
    int4 __builtin_msa_mulr_q_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulsa.w.ph")
    long __builtin_mips_mulsa_w_ph(long, short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulsaq.s.w.ph")
    long __builtin_mips_mulsaq_s_w_ph(long, short2, short2);

pragma(LDC_intrinsic, "llvm.mips.mult")
    long __builtin_mips_mult(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.multu")
    long __builtin_mips_multu(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulv.b")
    byte16 __builtin_msa_mulv_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulv.d")
    long2 __builtin_msa_mulv_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulv.h")
    short8 __builtin_msa_mulv_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.mulv.w")
    int4 __builtin_msa_mulv_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nloc.b")
    byte16 __builtin_msa_nloc_b(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nloc.d")
    long2 __builtin_msa_nloc_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nloc.h")
    short8 __builtin_msa_nloc_h(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nloc.w")
    int4 __builtin_msa_nloc_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nlzc.b")
    byte16 __builtin_msa_nlzc_b(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nlzc.d")
    long2 __builtin_msa_nlzc_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nlzc.h")
    short8 __builtin_msa_nlzc_h(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nlzc.w")
    int4 __builtin_msa_nlzc_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nor.v")
    byte16 __builtin_msa_nor_v(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.nori.b")
    byte16 __builtin_msa_nori_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.or.v")
    byte16 __builtin_msa_or_v(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.ori.b")
    byte16 __builtin_msa_ori_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.packrl.ph")
    short2 __builtin_mips_packrl_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckev.b")
    byte16 __builtin_msa_pckev_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckev.d")
    long2 __builtin_msa_pckev_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckev.h")
    short8 __builtin_msa_pckev_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckev.w")
    int4 __builtin_msa_pckev_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckod.b")
    byte16 __builtin_msa_pckod_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckod.d")
    long2 __builtin_msa_pckod_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckod.h")
    short8 __builtin_msa_pckod_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pckod.w")
    int4 __builtin_msa_pckod_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pcnt.b")
    byte16 __builtin_msa_pcnt_b(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pcnt.d")
    long2 __builtin_msa_pcnt_d(long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pcnt.h")
    short8 __builtin_msa_pcnt_h(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pcnt.w")
    int4 __builtin_msa_pcnt_w(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.pick.ph")
    short2 __builtin_mips_pick_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.pick.qb")
    byte4 __builtin_mips_pick_qb(byte4, byte4);

pragma(LDC_intrinsic, "llvm.mips.preceq.w.phl")
    int __builtin_mips_preceq_w_phl(short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.preceq.w.phr")
    int __builtin_mips_preceq_w_phr(short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precequ.ph.qbl")
    short2 __builtin_mips_precequ_ph_qbl(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precequ.ph.qbla")
    short2 __builtin_mips_precequ_ph_qbla(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precequ.ph.qbr")
    short2 __builtin_mips_precequ_ph_qbr(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precequ.ph.qbra")
    short2 __builtin_mips_precequ_ph_qbra(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.preceu.ph.qbl")
    short2 __builtin_mips_preceu_ph_qbl(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.preceu.ph.qbla")
    short2 __builtin_mips_preceu_ph_qbla(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.preceu.ph.qbr")
    short2 __builtin_mips_preceu_ph_qbr(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.preceu.ph.qbra")
    short2 __builtin_mips_preceu_ph_qbra(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precr.qb.ph")
    byte4 __builtin_mips_precr_qb_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.precr.sra.ph.w")
    short2 __builtin_mips_precr_sra_ph_w(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precr.sra.r.ph.w")
    short2 __builtin_mips_precr_sra_r_ph_w(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precrq.ph.w")
    short2 __builtin_mips_precrq_ph_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precrq.qb.ph")
    byte4 __builtin_mips_precrq_qb_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.precrq.rs.ph.w")
    short2 __builtin_mips_precrq_rs_ph_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.precrqu.s.qb.ph")
    byte4 __builtin_mips_precrqu_s_qb_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.prepend")
    int __builtin_mips_prepend(int, int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.raddu.w.qb")
    int __builtin_mips_raddu_w_qb(byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.rddsp")
    int __builtin_mips_rddsp(int);

pragma(LDC_intrinsic, "llvm.mips.repl.ph")
    short2 __builtin_mips_repl_ph(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.repl.qb")
    byte4 __builtin_mips_repl_qb(int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.s.b")
    byte16 __builtin_msa_sat_s_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.s.d")
    long2 __builtin_msa_sat_s_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.s.h")
    short8 __builtin_msa_sat_s_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.s.w")
    int4 __builtin_msa_sat_s_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.u.b")
    byte16 __builtin_msa_sat_u_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.u.d")
    long2 __builtin_msa_sat_u_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.u.h")
    short8 __builtin_msa_sat_u_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sat.u.w")
    int4 __builtin_msa_sat_u_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shf.b")
    byte16 __builtin_msa_shf_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shf.h")
    short8 __builtin_msa_shf_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shf.w")
    int4 __builtin_msa_shf_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shilo")
    long __builtin_mips_shilo(long, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shll.ph")
    short2 __builtin_mips_shll_ph(short2, int);

pragma(LDC_intrinsic, "llvm.mips.shll.qb")
    byte4 __builtin_mips_shll_qb(byte4, int);

pragma(LDC_intrinsic, "llvm.mips.shll.s.ph")
    short2 __builtin_mips_shll_s_ph(short2, int);

pragma(LDC_intrinsic, "llvm.mips.shll.s.w")
    int __builtin_mips_shll_s_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.shra.ph")
    short2 __builtin_mips_shra_ph(short2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shra.qb")
    byte4 __builtin_mips_shra_qb(byte4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shra.r.ph")
    short2 __builtin_mips_shra_r_ph(short2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shra.r.qb")
    byte4 __builtin_mips_shra_r_qb(byte4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shra.r.w")
    int __builtin_mips_shra_r_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shrl.ph")
    short2 __builtin_mips_shrl_ph(short2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.shrl.qb")
    byte4 __builtin_mips_shrl_qb(byte4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sld.b")
    byte16 __builtin_msa_sld_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sld.d")
    long2 __builtin_msa_sld_d(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sld.h")
    short8 __builtin_msa_sld_h(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sld.w")
    int4 __builtin_msa_sld_w(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sldi.b")
    byte16 __builtin_msa_sldi_b(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sldi.d")
    long2 __builtin_msa_sldi_d(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sldi.h")
    short8 __builtin_msa_sldi_h(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sldi.w")
    int4 __builtin_msa_sldi_w(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sll.b")
    byte16 __builtin_msa_sll_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sll.d")
    long2 __builtin_msa_sll_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sll.h")
    short8 __builtin_msa_sll_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sll.w")
    int4 __builtin_msa_sll_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.slli.b")
    byte16 __builtin_msa_slli_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.slli.d")
    long2 __builtin_msa_slli_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.slli.h")
    short8 __builtin_msa_slli_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.slli.w")
    int4 __builtin_msa_slli_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splat.b")
    byte16 __builtin_msa_splat_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splat.d")
    long2 __builtin_msa_splat_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splat.h")
    short8 __builtin_msa_splat_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splat.w")
    int4 __builtin_msa_splat_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splati.b")
    byte16 __builtin_msa_splati_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splati.d")
    long2 __builtin_msa_splati_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splati.h")
    short8 __builtin_msa_splati_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.splati.w")
    int4 __builtin_msa_splati_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sra.b")
    byte16 __builtin_msa_sra_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sra.d")
    long2 __builtin_msa_sra_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sra.h")
    short8 __builtin_msa_sra_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.sra.w")
    int4 __builtin_msa_sra_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srai.b")
    byte16 __builtin_msa_srai_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srai.d")
    long2 __builtin_msa_srai_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srai.h")
    short8 __builtin_msa_srai_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srai.w")
    int4 __builtin_msa_srai_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srar.b")
    byte16 __builtin_msa_srar_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srar.d")
    long2 __builtin_msa_srar_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srar.h")
    short8 __builtin_msa_srar_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srar.w")
    int4 __builtin_msa_srar_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srari.b")
    byte16 __builtin_msa_srari_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srari.d")
    long2 __builtin_msa_srari_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srari.h")
    short8 __builtin_msa_srari_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srari.w")
    int4 __builtin_msa_srari_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srl.b")
    byte16 __builtin_msa_srl_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srl.d")
    long2 __builtin_msa_srl_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srl.h")
    short8 __builtin_msa_srl_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srl.w")
    int4 __builtin_msa_srl_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srli.b")
    byte16 __builtin_msa_srli_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srli.d")
    long2 __builtin_msa_srli_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srli.h")
    short8 __builtin_msa_srli_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srli.w")
    int4 __builtin_msa_srli_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlr.b")
    byte16 __builtin_msa_srlr_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlr.d")
    long2 __builtin_msa_srlr_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlr.h")
    short8 __builtin_msa_srlr_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlr.w")
    int4 __builtin_msa_srlr_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlri.b")
    byte16 __builtin_msa_srlri_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlri.d")
    long2 __builtin_msa_srlri_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlri.h")
    short8 __builtin_msa_srlri_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.srlri.w")
    int4 __builtin_msa_srlri_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.st.b")
    void __builtin_msa_st_b(byte16, void*, int);

pragma(LDC_intrinsic, "llvm.mips.st.d")
    void __builtin_msa_st_d(long2, void*, int);

pragma(LDC_intrinsic, "llvm.mips.st.h")
    void __builtin_msa_st_h(short8, void*, int);

pragma(LDC_intrinsic, "llvm.mips.st.w")
    void __builtin_msa_st_w(int4, void*, int);

pragma(LDC_intrinsic, "llvm.mips.str.d")
    void __builtin_msa_str_d(long2, void*, int);

pragma(LDC_intrinsic, "llvm.mips.str.w")
    void __builtin_msa_str_w(int4, void*, int);

pragma(LDC_intrinsic, "llvm.mips.subq.ph")
    short2 __builtin_mips_subq_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subq.s.ph")
    short2 __builtin_mips_subq_s_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subq.s.w")
    int __builtin_mips_subq_s_w(int, int);

pragma(LDC_intrinsic, "llvm.mips.subqh.ph")
    short2 __builtin_mips_subqh_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subqh.r.ph")
    short2 __builtin_mips_subqh_r_ph(short2, short2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subqh.r.w")
    int __builtin_mips_subqh_r_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subqh.w")
    int __builtin_mips_subqh_w(int, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.s.b")
    byte16 __builtin_msa_subs_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.s.d")
    long2 __builtin_msa_subs_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.s.h")
    short8 __builtin_msa_subs_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.s.w")
    int4 __builtin_msa_subs_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.u.b")
    byte16 __builtin_msa_subs_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.u.d")
    long2 __builtin_msa_subs_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.u.h")
    short8 __builtin_msa_subs_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subs.u.w")
    int4 __builtin_msa_subs_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsus.u.b")
    byte16 __builtin_msa_subsus_u_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsus.u.d")
    long2 __builtin_msa_subsus_u_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsus.u.h")
    short8 __builtin_msa_subsus_u_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsus.u.w")
    int4 __builtin_msa_subsus_u_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsuu.s.b")
    byte16 __builtin_msa_subsuu_s_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsuu.s.d")
    long2 __builtin_msa_subsuu_s_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsuu.s.h")
    short8 __builtin_msa_subsuu_s_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subsuu.s.w")
    int4 __builtin_msa_subsuu_s_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subu.ph")
    short2 __builtin_mips_subu_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.subu.qb")
    byte4 __builtin_mips_subu_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subu.s.ph")
    short2 __builtin_mips_subu_s_ph(short2, short2);

pragma(LDC_intrinsic, "llvm.mips.subu.s.qb")
    byte4 __builtin_mips_subu_s_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subuh.qb")
    byte4 __builtin_mips_subuh_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subuh.r.qb")
    byte4 __builtin_mips_subuh_r_qb(byte4, byte4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subv.b")
    byte16 __builtin_msa_subv_b(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subv.d")
    long2 __builtin_msa_subv_d(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subv.h")
    short8 __builtin_msa_subv_h(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subv.w")
    int4 __builtin_msa_subv_w(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subvi.b")
    byte16 __builtin_msa_subvi_b(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subvi.d")
    long2 __builtin_msa_subvi_d(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subvi.h")
    short8 __builtin_msa_subvi_h(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.subvi.w")
    int4 __builtin_msa_subvi_w(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.vshf.b")
    byte16 __builtin_msa_vshf_b(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.vshf.d")
    long2 __builtin_msa_vshf_d(long2, long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.vshf.h")
    short8 __builtin_msa_vshf_h(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.vshf.w")
    int4 __builtin_msa_vshf_w(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.wrdsp")
    void __builtin_mips_wrdsp(int, int);

pragma(LDC_intrinsic, "llvm.mips.xor.v")
    byte16 __builtin_msa_xor_v(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.mips.xori.b")
    byte16 __builtin_msa_xori_b(byte16, int) pure @safe;

