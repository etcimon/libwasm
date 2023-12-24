module ldc.gccbuiltins_s390; 

import core.simd;

nothrow @nogc:

pragma(LDC_intrinsic, "llvm.s390.efpc")
    int __builtin_s390_efpc();

pragma(LDC_intrinsic, "llvm.s390.etnd")
    int __builtin_tx_nesting_depth() pure @safe;

pragma(LDC_intrinsic, "llvm.s390.lcbb")
    int __builtin_s390_lcbb(void*, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.ppa.txassist")
    void __builtin_tx_assist(int);

pragma(LDC_intrinsic, "llvm.s390.sfpc")
    void __builtin_s390_sfpc(int);

pragma(LDC_intrinsic, "llvm.s390.tend")
    int __builtin_tend();

pragma(LDC_intrinsic, "llvm.s390.vaccb")
    byte16 __builtin_s390_vaccb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vacccq")
    byte16 __builtin_s390_vacccq(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vaccf")
    int4 __builtin_s390_vaccf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vaccg")
    long2 __builtin_s390_vaccg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vacch")
    short8 __builtin_s390_vacch(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vaccq")
    byte16 __builtin_s390_vaccq(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vacq")
    byte16 __builtin_s390_vacq(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vaq")
    byte16 __builtin_s390_vaq(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavgb")
    byte16 __builtin_s390_vavgb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavgf")
    int4 __builtin_s390_vavgf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavgg")
    long2 __builtin_s390_vavgg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavgh")
    short8 __builtin_s390_vavgh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavglb")
    byte16 __builtin_s390_vavglb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavglf")
    int4 __builtin_s390_vavglf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavglg")
    long2 __builtin_s390_vavglg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vavglh")
    short8 __builtin_s390_vavglh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vbperm")
    long2 __builtin_s390_vbperm(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vcfn")
    short8 __builtin_s390_vcfn(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vcksm")
    int4 __builtin_s390_vcksm(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vclfnhs")
    float4 __builtin_s390_vclfnhs(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vclfnls")
    float4 __builtin_s390_vclfnls(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vcnf")
    short8 __builtin_s390_vcnf(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vcrnfs")
    short8 __builtin_s390_vcrnfs(float4, float4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verimb")
    byte16 __builtin_s390_verimb(byte16, byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verimf")
    int4 __builtin_s390_verimf(int4, int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verimg")
    long2 __builtin_s390_verimg(long2, long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verimh")
    short8 __builtin_s390_verimh(short8, short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllb")
    byte16 __builtin_s390_verllb(byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllf")
    int4 __builtin_s390_verllf(int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllg")
    long2 __builtin_s390_verllg(long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllh")
    short8 __builtin_s390_verllh(short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllvb")
    byte16 __builtin_s390_verllvb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllvf")
    int4 __builtin_s390_verllvf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllvg")
    long2 __builtin_s390_verllvg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.verllvh")
    short8 __builtin_s390_verllvh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaeb")
    byte16 __builtin_s390_vfaeb(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaef")
    int4 __builtin_s390_vfaef(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaeh")
    short8 __builtin_s390_vfaeh(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaezb")
    byte16 __builtin_s390_vfaezb(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaezf")
    int4 __builtin_s390_vfaezf(int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfaezh")
    short8 __builtin_s390_vfaezh(short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeeb")
    byte16 __builtin_s390_vfeeb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeef")
    int4 __builtin_s390_vfeef(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeeh")
    short8 __builtin_s390_vfeeh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeezb")
    byte16 __builtin_s390_vfeezb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeezf")
    int4 __builtin_s390_vfeezf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeezh")
    short8 __builtin_s390_vfeezh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeneb")
    byte16 __builtin_s390_vfeneb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfenef")
    int4 __builtin_s390_vfenef(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfeneh")
    short8 __builtin_s390_vfeneh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfenezb")
    byte16 __builtin_s390_vfenezb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfenezf")
    int4 __builtin_s390_vfenezf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vfenezh")
    short8 __builtin_s390_vfenezh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmab")
    short8 __builtin_s390_vgfmab(byte16, byte16, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmaf")
    long2 __builtin_s390_vgfmaf(int4, int4, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmag")
    byte16 __builtin_s390_vgfmag(long2, long2, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmah")
    int4 __builtin_s390_vgfmah(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmb")
    short8 __builtin_s390_vgfmb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmf")
    long2 __builtin_s390_vgfmf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmg")
    byte16 __builtin_s390_vgfmg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vgfmh")
    int4 __builtin_s390_vgfmh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vistrb")
    byte16 __builtin_s390_vistrb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vistrf")
    int4 __builtin_s390_vistrf(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vistrh")
    short8 __builtin_s390_vistrh(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vlbb")
    byte16 __builtin_s390_vlbb(const void*, int);

pragma(LDC_intrinsic, "llvm.s390.vll")
    byte16 __builtin_s390_vll(int, const void*);

pragma(LDC_intrinsic, "llvm.s390.vlrl")
    byte16 __builtin_s390_vlrl(int, const void*);

pragma(LDC_intrinsic, "llvm.s390.vmaeb")
    short8 __builtin_s390_vmaeb(byte16, byte16, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaef")
    long2 __builtin_s390_vmaef(int4, int4, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaeh")
    int4 __builtin_s390_vmaeh(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmahb")
    byte16 __builtin_s390_vmahb(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmahf")
    int4 __builtin_s390_vmahf(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmahh")
    short8 __builtin_s390_vmahh(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaleb")
    short8 __builtin_s390_vmaleb(byte16, byte16, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalef")
    long2 __builtin_s390_vmalef(int4, int4, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaleh")
    int4 __builtin_s390_vmaleh(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalhb")
    byte16 __builtin_s390_vmalhb(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalhf")
    int4 __builtin_s390_vmalhf(int4, int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalhh")
    short8 __builtin_s390_vmalhh(short8, short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalob")
    short8 __builtin_s390_vmalob(byte16, byte16, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmalof")
    long2 __builtin_s390_vmalof(int4, int4, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaloh")
    int4 __builtin_s390_vmaloh(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaob")
    short8 __builtin_s390_vmaob(byte16, byte16, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaof")
    long2 __builtin_s390_vmaof(int4, int4, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmaoh")
    int4 __builtin_s390_vmaoh(short8, short8, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmeb")
    short8 __builtin_s390_vmeb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmef")
    long2 __builtin_s390_vmef(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmeh")
    int4 __builtin_s390_vmeh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmhb")
    byte16 __builtin_s390_vmhb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmhf")
    int4 __builtin_s390_vmhf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmhh")
    short8 __builtin_s390_vmhh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmleb")
    short8 __builtin_s390_vmleb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlef")
    long2 __builtin_s390_vmlef(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmleh")
    int4 __builtin_s390_vmleh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlhb")
    byte16 __builtin_s390_vmlhb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlhf")
    int4 __builtin_s390_vmlhf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlhh")
    short8 __builtin_s390_vmlhh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlob")
    short8 __builtin_s390_vmlob(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmlof")
    long2 __builtin_s390_vmlof(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmloh")
    int4 __builtin_s390_vmloh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmob")
    short8 __builtin_s390_vmob(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmof")
    long2 __builtin_s390_vmof(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmoh")
    int4 __builtin_s390_vmoh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vmslg")
    byte16 __builtin_s390_vmslg(long2, long2, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpdi")
    long2 __builtin_s390_vpdi(long2, long2, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vperm")
    byte16 __builtin_s390_vperm(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpklsf")
    short8 __builtin_s390_vpklsf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpklsg")
    int4 __builtin_s390_vpklsg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpklsh")
    byte16 __builtin_s390_vpklsh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpksf")
    short8 __builtin_s390_vpksf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpksg")
    int4 __builtin_s390_vpksg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vpksh")
    byte16 __builtin_s390_vpksh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsbcbiq")
    byte16 __builtin_s390_vsbcbiq(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsbiq")
    byte16 __builtin_s390_vsbiq(byte16, byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vscbib")
    byte16 __builtin_s390_vscbib(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vscbif")
    int4 __builtin_s390_vscbif(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vscbig")
    long2 __builtin_s390_vscbig(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vscbih")
    short8 __builtin_s390_vscbih(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vscbiq")
    byte16 __builtin_s390_vscbiq(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsl")
    byte16 __builtin_s390_vsl(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vslb")
    byte16 __builtin_s390_vslb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsld")
    byte16 __builtin_s390_vsld(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsldb")
    byte16 __builtin_s390_vsldb(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsq")
    byte16 __builtin_s390_vsq(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsra")
    byte16 __builtin_s390_vsra(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsrab")
    byte16 __builtin_s390_vsrab(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsrd")
    byte16 __builtin_s390_vsrd(byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsrl")
    byte16 __builtin_s390_vsrl(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsrlb")
    byte16 __builtin_s390_vsrlb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstl")
    void __builtin_s390_vstl(byte16, int, void*);

pragma(LDC_intrinsic, "llvm.s390.vstrcb")
    byte16 __builtin_s390_vstrcb(byte16, byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrcf")
    int4 __builtin_s390_vstrcf(int4, int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrch")
    short8 __builtin_s390_vstrch(short8, short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrczb")
    byte16 __builtin_s390_vstrczb(byte16, byte16, byte16, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrczf")
    int4 __builtin_s390_vstrczf(int4, int4, int4, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrczh")
    short8 __builtin_s390_vstrczh(short8, short8, short8, int) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vstrl")
    void __builtin_s390_vstrl(byte16, int, void*);

pragma(LDC_intrinsic, "llvm.s390.vsumb")
    int4 __builtin_s390_vsumb(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsumgf")
    long2 __builtin_s390_vsumgf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsumgh")
    long2 __builtin_s390_vsumgh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsumh")
    int4 __builtin_s390_vsumh(short8, short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsumqf")
    byte16 __builtin_s390_vsumqf(int4, int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vsumqg")
    byte16 __builtin_s390_vsumqg(long2, long2) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vtm")
    int __builtin_s390_vtm(byte16, byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuphb")
    short8 __builtin_s390_vuphb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuphf")
    long2 __builtin_s390_vuphf(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuphh")
    int4 __builtin_s390_vuphh(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplb")
    short8 __builtin_s390_vuplb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplf")
    long2 __builtin_s390_vuplf(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplhb")
    short8 __builtin_s390_vuplhb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplhf")
    long2 __builtin_s390_vuplhf(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplhh")
    int4 __builtin_s390_vuplhh(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vuplhw")
    int4 __builtin_s390_vuplhw(short8) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vupllb")
    short8 __builtin_s390_vupllb(byte16) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vupllf")
    long2 __builtin_s390_vupllf(int4) pure @safe;

pragma(LDC_intrinsic, "llvm.s390.vupllh")
    int4 __builtin_s390_vupllh(short8) pure @safe;

