/++
$(H1 Math Functionality)
$(BOOKTABLE $(H2 Math modules),
$(TR $(TH Module) $(TH Math kind))
$(T2M common, Common math functions)
$(T2M constant, Constants)
$(T2M ieee, Basic IEEE-754 numerical functions)
)
Macros:
SUBREF = $(REF_ALTTEXT $(TT $2), $2, mir, math, $1)$(NBSP)
T2M=$(TR $(TDNW $(MREF mir,math,$1)) $(TD $+))
T2=$(TR $(TDNW $(LREF $1)) $(TD $+))
+/
module libwasm.core.math;

public import libwasm.core.math.common;
public import libwasm.core.math.constant;
public import libwasm.core.math.ieee;
