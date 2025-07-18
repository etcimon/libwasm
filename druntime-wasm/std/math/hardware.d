// Written in the D programming language.

/**
This is a submodule of $(MREF std, math).

It contains hardware support for floating point numbers.

Copyright: Copyright The D Language Foundation 2000 - 2011.
License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   $(HTTP digitalmars.com, Walter Bright), Don Clugston,
           Conversion of CEPHES math library to D by Iain Buclaw and David Nadlinger
Source: $(PHOBOSSRC std/math/hardware.d)
 */

module std.math.hardware;

static import core.stdc.fenv;

version (LDC) import ldc.attributes;

version (X86)       version = X86_Any;
version (X86_64)    version = X86_Any;
version (PPC)       version = PPC_Any;
version (PPC64)     version = PPC_Any;
version (MIPS32)    version = MIPS_Any;
version (MIPS64)    version = MIPS_Any;
version (AArch64)   version = ARM_Any;
version (ARM)       version = ARM_Any;
version (S390)      version = IBMZ_Any;
version (SPARC)     version = SPARC_Any;
version (SPARC64)   version = SPARC_Any;
version (SystemZ)   version = IBMZ_Any;
version (RISCV32)   version = RISCV_Any;
version (RISCV64)   version = RISCV_Any;

version (D_InlineAsm_X86)    version = InlineAsm_X86_Any;
version (D_InlineAsm_X86_64) version = InlineAsm_X86_Any;

version (X86_64) version = StaticallyHaveSSE;
version (X86) version (OSX) version = StaticallyHaveSSE;

version (StaticallyHaveSSE)
{
    private enum bool haveSSE = true;
}
else version (X86)
{
    static import core.cpuid;
    private alias haveSSE = core.cpuid.sse;
}

version (D_SoftFloat)
{
    // Some soft float implementations may support IEEE floating flags.
    // The implementation here supports hardware flags only and is so currently
    // only available for supported targets.
}
else version (X86_Any)   version = IeeeFlagsSupport;
else version (PPC_Any)   version = IeeeFlagsSupport;
else version (RISCV_Any) version = IeeeFlagsSupport;
else version (MIPS_Any)  version = IeeeFlagsSupport;
else version (ARM_Any)   version = IeeeFlagsSupport;

// Struct FloatingPointControl is only available if hardware FP units are available.
version (D_HardFloat)
{
    // FloatingPointControl.clearExceptions() depends on version IeeeFlagsSupport
    version (IeeeFlagsSupport) version = FloatingPointControlSupport;
}

version (IeeeFlagsSupport)
{

/** IEEE exception status flags ('sticky bits')

 These flags indicate that an exceptional floating-point condition has occurred.
 They indicate that a NaN or an infinity has been generated, that a result
 is inexact, or that a signalling NaN has been encountered. If floating-point
 exceptions are enabled (unmasked), a hardware exception will be generated
 instead of setting these flags.
 */
struct IeeeFlags
{
nothrow @nogc:

private:
    // The x87 FPU status register is 16 bits.
    // The Pentium SSE2 status register is 32 bits.
    // The ARM and PowerPC FPSCR is a 32-bit register.
    // The SPARC FSR is a 32bit register (64 bits for SPARC 7 & 8, but high bits are uninteresting).
    // The RISC-V (32 & 64 bit) fcsr is 32-bit register.
    uint flags;

    version (CRuntime_Microsoft)
    {
        // Microsoft uses hardware-incompatible custom constants in fenv.h (core.stdc.fenv).
        // Applies to both x87 status word (16 bits) and SSE2 status word(32 bits).
        enum : int
        {
            INEXACT_MASK   = 0x20,
            UNDERFLOW_MASK = 0x10,
            OVERFLOW_MASK  = 0x08,
            DIVBYZERO_MASK = 0x04,
            INVALID_MASK   = 0x01,

            EXCEPTIONS_MASK = 0b11_1111
        }
        // Don't bother about subnormals, they are not supported on most CPUs.
        //  SUBNORMAL_MASK = 0x02;
    }
    else
    {
        enum : int
        {
            INEXACT_MASK    = core.stdc.fenv.FE_INEXACT,
            UNDERFLOW_MASK  = core.stdc.fenv.FE_UNDERFLOW,
            OVERFLOW_MASK   = core.stdc.fenv.FE_OVERFLOW,
            DIVBYZERO_MASK  = core.stdc.fenv.FE_DIVBYZERO,
            INVALID_MASK    = core.stdc.fenv.FE_INVALID,
            EXCEPTIONS_MASK = core.stdc.fenv.FE_ALL_EXCEPT,
        }
    }

    static uint getIeeeFlags() @trusted pure
    {
        version (InlineAsm_X86_Any)
        {
            ushort sw;
          version (LDC)
          {
            asm pure nothrow @nogc { "fstsw %0" : "=m" (sw); }
          }
          else
          {
            asm pure nothrow @nogc { fstsw sw; }
          }

            // OR the result with the SSE2 status register (MXCSR).
            if (haveSSE)
            {
                uint mxcsr;
              version (LDC)
              {
                asm pure nothrow @nogc { "stmxcsr %0" : "=m" (mxcsr); }
              }
              else
              {
                asm pure nothrow @nogc { stmxcsr mxcsr; }
              }
                return (sw | mxcsr) & EXCEPTIONS_MASK;
            }
            else return sw & EXCEPTIONS_MASK;
        }
        else version (LDC)
        {
            version (PPC_Any)
            {
                return FloatingPointControl.getControlState();
            }
            else version (MIPS_Any)
            {
                return FloatingPointControl.getControlState();
            }
            else version (AArch64)
            {
                uint fpsr;
                asm pure nothrow @nogc { "mrs %0, FPSR" : "=r" (fpsr); }
                return fpsr & 0x1F;
            }
            else version (ARM)
            {
                const fpscr = FloatingPointControl.getControlState();
                return fpscr & 0x1F;
            }
            else version (RISCV_Any)
            {
                uint result;
                asm pure nothrow @nogc { "frflags %0" : "=r" (result); }
                return result;
            }
            else
                assert(0, "Not yet supported");
        }
        else version (SPARC)
        {
            /*
               int retval;
               asm pure nothrow @nogc { st %fsr, retval; }
               return retval;
            */
            assert(0, "Not yet supported");
        }
        else version (ARM)
        {
            assert(false, "Not yet supported.");
        }
        else version (RISCV_Any)
        {
            mixin(`
            uint result = void;
            asm pure nothrow @nogc
            {
                "frflags %0" : "=r" (result);
            }
            return result;
            `);
        }
        else
            assert(0, "Not yet supported");
    }

    static void resetIeeeFlags() @trusted
    {
        version (InlineAsm_X86_Any)
        {
          version (LDC)
          {
            asm nothrow @nogc { "fnclex" : : : "fpsw"; }
          }
          else
          {
            asm nothrow @nogc
            {
                fnclex;
            }
          }

            // Also clear exception flags in MXCSR, SSE's control register.
            if (haveSSE)
            {
                uint mxcsr;
              version (LDC)
              {
                asm nothrow @nogc { "stmxcsr %0" : "=m" (mxcsr); }
                mxcsr &= ~EXCEPTIONS_MASK;
                asm nothrow @nogc { "ldmxcsr %0" : : "m" (mxcsr) : "flags"; }
              }
              else
              {
                asm nothrow @nogc { stmxcsr mxcsr; }
                mxcsr &= ~EXCEPTIONS_MASK;
                asm nothrow @nogc { ldmxcsr mxcsr; }
              }
            }
        }
        else version (RISCV_Any)
        {
            mixin(`
            uint newValues = 0x0;
            asm pure nothrow @nogc
            {
                "fsflags %0" : : "r" (newValues);
            }
            `);
        }
        else version (LDC)
        {
            version (PPC_Any)
            {
                asm pure nothrow @nogc
                {
                    `mtfsb0 3
                     mtfsb0 4
                     mtfsb0 5
                     mtfsb0 6
                     mtfsb0 7
                     mtfsb0 8
                     mtfsb0 9
                     mtfsb0 10
                     mtfsb0 11
                     mtfsb0 12`;
                }
            }
            else version (MIPS_Any)
            {
                version (D_LP64) enum mask = 0xFFFFFF80u;
                else             enum mask = 0xFF80u;

                const newState = FloatingPointControl.getControlState() & mask;
                FloatingPointControl.setControlState(newState);
            }
            else version (AArch64)
            {
                uint fpsr;
                asm pure nothrow @nogc { "mrs %0, FPSR" : "=r" (fpsr); }
                fpsr &= ~0x1F;
                asm pure nothrow @nogc { "msr FPSR, %0" : : "r" (fpsr); }
            }
            else version (ARM)
            {
                const fpscr = FloatingPointControl.getControlState();
                FloatingPointControl.setControlState(fpscr & ~0x1F);
            }
            else
                assert(0, "Not yet supported");
        }
        else
        {
            /* SPARC:
              int tmpval;
              asm pure nothrow @nogc { st %fsr, tmpval; }
              tmpval &=0xFFFF_FC00;
              asm pure nothrow @nogc { ld tmpval, %fsr; }
            */
           assert(0, "Not yet supported");
        }
    }

public:
    /**
     * The result cannot be represented exactly, so rounding occurred.
     * Example: `x = sin(0.1);`
     */
    @property bool inexact() @safe const { return (flags & INEXACT_MASK) != 0; }

    /**
     * A zero was generated by underflow
     * Example: `x = real.min*real.epsilon/2;`
     */
    @property bool underflow() @safe const { return (flags & UNDERFLOW_MASK) != 0; }

    /**
     * An infinity was generated by overflow
     * Example: `x = real.max*2;`
     */
    @property bool overflow() @safe const { return (flags & OVERFLOW_MASK) != 0; }

    /**
     * An infinity was generated by division by zero
     * Example: `x = 3/0.0;`
     */
    @property bool divByZero() @safe const { return (flags & DIVBYZERO_MASK) != 0; }

    /**
     * A machine NaN was generated.
     * Example: `x = real.infinity * 0.0;`
     */
    @property bool invalid() @safe const { return (flags & INVALID_MASK) != 0; }
}

///
version (StdDdoc)
@safe unittest
{
    import std.math.traits : isNaN;

    static void func() {
        int a = 10 * 10;
    }
    real a = 3.5;
    // Set all the flags to zero
    resetIeeeFlags();
    assert(!ieeeFlags.divByZero);
    // Perform a division by zero.
    a /= 0.0L;
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);
    // Create a NaN
    a *= 0.0L;
    assert(ieeeFlags.invalid);
    assert(isNaN(a));

    // Check that calling func() has no effect on the
    // status flags.
    IeeeFlags f = ieeeFlags;
    func();
    assert(ieeeFlags == f);
}

@optStrategy("none") // LDC
@safe unittest
{
    import std.math.traits : isNaN;

    static void func() {
        int a = 10 * 10;
    }
    real a = 3.5;
    // Set all the flags to zero
    resetIeeeFlags();
    assert(!ieeeFlags.divByZero);
    // Perform a division by zero.
    a = forceDivOp(a, 0.0L);
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);
    // Create a NaN
    a = forceMulOp(a, 0.0L);
    assert(ieeeFlags.invalid);
    assert(isNaN(a));

    // Check that calling func() has no effect on the
    // status flags.
    IeeeFlags f = ieeeFlags;
    func();
    assert(ieeeFlags == f);
}

version (LDC)
{
    unittest
    {
        pragma(msg, "ieeeFlags test disabled, see LDC Issue #888");
    }
}
else
@safe unittest
{
    import std.meta : AliasSeq;

    static struct Test
    {
        void delegate() @trusted action;
        bool function() @trusted ieeeCheck;
    }

    static foreach (T; AliasSeq!(float, double, real))
    {{
        T x; // Needs to be here to avoid `call without side effects` warning.
        auto tests = [
            Test(
                () { x = forceAddOp!T(1, 0.1L); },
                () => ieeeFlags.inexact
            ),
            Test(
                () { x = forceDivOp!T(T.min_normal, T.max); },
                () => ieeeFlags.underflow
            ),
            Test(
                () { x = forceAddOp!T(T.max, T.max); },
                () => ieeeFlags.overflow
            ),
            Test(
                () { x = forceDivOp!T(1, 0); },
                () => ieeeFlags.divByZero
            ),
            Test(
                () { x = forceDivOp!T(0, 0); },
                () => ieeeFlags.invalid
            )
        ];
        foreach (test; tests)
        {
            resetIeeeFlags();
            assert(!test.ieeeCheck());
            test.action();
            assert(test.ieeeCheck());
        }
    }}
}

/// Set all of the floating-point status flags to false.
void resetIeeeFlags() @trusted nothrow @nogc
{
    IeeeFlags.resetIeeeFlags();
}

///
version (StdDdoc)
@safe unittest
{
    resetIeeeFlags();
    real a = 3.5;
    a /= 0.0L;
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);

    resetIeeeFlags();
    assert(!ieeeFlags.divByZero);
}

@optStrategy("none") // LDC, required for the IEEE flags check
@safe unittest
{
    resetIeeeFlags();
    real a = 3.5;
    a = forceDivOp(a, 0.0L);
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);

    resetIeeeFlags();
    assert(!ieeeFlags.divByZero);
}

/// Returns: snapshot of the current state of the floating-point status flags
@property IeeeFlags ieeeFlags() @trusted pure nothrow @nogc
{
   return IeeeFlags(IeeeFlags.getIeeeFlags());
}

///
version (StdDdoc)
@safe nothrow unittest
{
    import std.math.traits : isNaN;

    resetIeeeFlags();
    real a = 3.5;

    a /= 0.0L;
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);

    a *= 0.0L;
    assert(isNaN(a));
    assert(ieeeFlags.invalid);
}

@optStrategy("none") // LDC, required for the IEEE flags check
@safe nothrow unittest
{
    import std.math.traits : isNaN;

    resetIeeeFlags();
    real a = 3.5;

    a = forceDivOp(a, 0.0L);
    assert(a == real.infinity);
    assert(ieeeFlags.divByZero);

    a = forceMulOp(a, 0.0L);
    assert(isNaN(a));
    assert(ieeeFlags.invalid);
}

} // IeeeFlagsSupport


version (FloatingPointControlSupport)
{

/** Control the Floating point hardware

  Change the IEEE754 floating-point rounding mode and the floating-point
  hardware exceptions.

  By default, the rounding mode is roundToNearest and all hardware exceptions
  are disabled. For most applications, debugging is easier if the $(I division
  by zero), $(I overflow), and $(I invalid operation) exceptions are enabled.
  These three are combined into a $(I severeExceptions) value for convenience.
  Note in particular that if $(I invalidException) is enabled, a hardware trap
  will be generated whenever an uninitialized floating-point variable is used.

  All changes are temporary. The previous state is restored at the
  end of the scope.


Example:
----
{
    FloatingPointControl fpctrl;

    // Enable hardware exceptions for division by zero, overflow to infinity,
    // invalid operations, and uninitialized floating-point variables.
    fpctrl.enableExceptions(FloatingPointControl.severeExceptions);

    // This will generate a hardware exception, if x is a
    // default-initialized floating point variable:
    real x; // Add `= 0` or even `= real.nan` to not throw the exception.
    real y = x * 3.0;

    // The exception is only thrown for default-uninitialized NaN-s.
    // NaN-s with other payload are valid:
    real z = y * real.nan; // ok

    // The set hardware exceptions and rounding modes will be disabled when
    // leaving this scope.
}
----

 */
struct FloatingPointControl
{
nothrow @nogc:

    alias RoundingMode = uint; ///

    version (StdDdoc)
    {
        enum : RoundingMode
        {
            /** IEEE rounding modes.
             * The default mode is roundToNearest.
             *
             *  roundingMask = A mask of all rounding modes.
             */
            roundToNearest,
            roundDown, /// ditto
            roundUp, /// ditto
            roundToZero, /// ditto
            roundingMask, /// ditto
        }
    }
    else version (CRuntime_Microsoft)
    {
        // Microsoft uses hardware-incompatible custom constants in fenv.h (core.stdc.fenv).
        enum : RoundingMode
        {
            roundToNearest = 0x0000,
            roundDown      = 0x0400,
            roundUp        = 0x0800,
            roundToZero    = 0x0C00,
            roundingMask   = roundToNearest | roundDown
                             | roundUp | roundToZero,
        }
    }
    else
    {
        enum : RoundingMode
        {
            roundToNearest = core.stdc.fenv.FE_TONEAREST,
            roundDown      = core.stdc.fenv.FE_DOWNWARD,
            roundUp        = core.stdc.fenv.FE_UPWARD,
            roundToZero    = core.stdc.fenv.FE_TOWARDZERO,
            roundingMask   = roundToNearest | roundDown
                             | roundUp | roundToZero,
        }
    }

    /***
     * Change the floating-point hardware rounding mode
     *
     * Changing the rounding mode in the middle of a function can interfere
     * with optimizations of floating point expressions, as the optimizer assumes
     * that the rounding mode does not change.
     * It is best to change the rounding mode only at the
     * beginning of the function, and keep it until the function returns.
     * It is also best to add the line:
     * ---
     * pragma(inline, false);
     * ---
     * as the first line of the function so it will not get inlined.
     * Params:
     *    newMode = the new rounding mode
     */
    @property void rounding(RoundingMode newMode) @trusted
    {
        initialize();
        setControlState((getControlState() & (-1 - roundingMask)) | (newMode & roundingMask));
    }

    /// Returns: the currently active rounding mode
    @property static RoundingMode rounding() @trusted pure
    {
        return cast(RoundingMode)(getControlState() & roundingMask);
    }

    alias ExceptionMask = uint; ///

    version (StdDdoc)
    {
        enum : ExceptionMask
        {
            /** IEEE hardware exceptions.
             *  By default, all exceptions are masked (disabled).
             *
             *  severeExceptions = The overflow, division by zero, and invalid
             *  exceptions.
             */
            subnormalException,
            inexactException, /// ditto
            underflowException, /// ditto
            overflowException, /// ditto
            divByZeroException, /// ditto
            invalidException, /// ditto
            severeExceptions, /// ditto
            allExceptions, /// ditto
        }
    }
    else version (ARM_Any)
    {
        enum : ExceptionMask
        {
            subnormalException    = 0x8000,
            inexactException      = 0x1000,
            underflowException    = 0x0800,
            overflowException     = 0x0400,
            divByZeroException    = 0x0200,
            invalidException      = 0x0100,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException | subnormalException,
        }
    }
    else version (PPC_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x0008,
            divByZeroException    = 0x0010,
            underflowException    = 0x0020,
            overflowException     = 0x0040,
            invalidException      = 0x0080,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (RISCV_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x01,
            divByZeroException    = 0x08,
            underflowException    = 0x02,
            overflowException     = 0x04,
            invalidException      = 0x10,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (HPPA)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x01,
            underflowException    = 0x02,
            overflowException     = 0x04,
            divByZeroException    = 0x08,
            invalidException      = 0x10,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (MIPS_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x0080,
            divByZeroException    = 0x0400,
            overflowException     = 0x0200,
            underflowException    = 0x0100,
            invalidException      = 0x0800,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (SPARC_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x0800000,
            divByZeroException    = 0x1000000,
            overflowException     = 0x4000000,
            underflowException    = 0x2000000,
            invalidException      = 0x8000000,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (IBMZ_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x08000000,
            divByZeroException    = 0x40000000,
            overflowException     = 0x20000000,
            underflowException    = 0x10000000,
            invalidException      = 0x80000000,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException,
        }
    }
    else version (X86_Any)
    {
        enum : ExceptionMask
        {
            inexactException      = 0x20,
            underflowException    = 0x10,
            overflowException     = 0x08,
            divByZeroException    = 0x04,
            subnormalException    = 0x02,
            invalidException      = 0x01,
            severeExceptions   = overflowException | divByZeroException
                                 | invalidException,
            allExceptions      = severeExceptions | underflowException
                                 | inexactException | subnormalException,
        }
    }
    else
        static assert(false, "Not implemented for this architecture");

    version (ARM_Any)
    {
        static bool hasExceptionTraps_impl() @safe
        {
            auto oldState = getControlState();
            // If exceptions are not supported, we set the bit but read it back as zero
            // https://sourceware.org/ml/libc-ports/2012-06/msg00091.html
            setControlState(oldState | divByZeroException);
            immutable result = (getControlState() & allExceptions) != 0;
            setControlState(oldState);
            return result;
        }
    }

    /// Returns: true if the current FPU supports exception trapping
    @property static bool hasExceptionTraps() @safe pure
    {
        version (X86_Any)
            return true;
        else version (PPC_Any)
            return true;
        else version (MIPS_Any)
            return true;
        else version (ARM_Any)
        {
            // The hasExceptionTraps_impl function is basically pure,
            // as it restores all global state
            auto fptr = ( () @trusted => cast(bool function() @safe
                pure nothrow @nogc)&hasExceptionTraps_impl)();
            return fptr();
        }
        else
            assert(0, "Not yet supported");
    }

    /// Enable (unmask) specific hardware exceptions. Multiple exceptions may be ORed together.
    void enableExceptions(ExceptionMask exceptions) @trusted
    {
        assert(hasExceptionTraps);
        initialize();
        version (X86_Any)
            setControlState(getControlState() & ~(exceptions & allExceptions));
        else
            setControlState(getControlState() | (exceptions & allExceptions));
    }

    /// Disable (mask) specific hardware exceptions. Multiple exceptions may be ORed together.
    void disableExceptions(ExceptionMask exceptions) @trusted
    {
        assert(hasExceptionTraps);
        initialize();
        version (X86_Any)
            setControlState(getControlState() | (exceptions & allExceptions));
        else
            setControlState(getControlState() & ~(exceptions & allExceptions));
    }

    /// Returns: the exceptions which are currently enabled (unmasked)
    @property static ExceptionMask enabledExceptions() @trusted pure
    {
        assert(hasExceptionTraps);
        version (X86_Any)
            return (getControlState() & allExceptions) ^ allExceptions;
        else
            return (getControlState() & allExceptions);
    }

    ///  Clear all pending exceptions, then restore the original exception state and rounding mode.
    ~this() @trusted
    {
        clearExceptions();
        if (initialized)
            setControlState(savedState);
    }

private:
    ControlState savedState;

    bool initialized = false;

    version (ARM_Any)
    {
        alias ControlState = uint;
    }
    else version (HPPA)
    {
        alias ControlState = uint;
    }
    else version (PPC_Any)
    {
        alias ControlState = uint;
    }
    else version (RISCV_Any)
    {
        alias ControlState = uint;
    }
    else version (MIPS_Any)
    {
        alias ControlState = uint;
    }
    else version (SPARC_Any)
    {
        alias ControlState = ulong;
    }
    else version (IBMZ_Any)
    {
        alias ControlState = uint;
    }
    else version (X86_Any)
    {
        alias ControlState = ushort;
    }
    else
        static assert(false, "Not implemented for this architecture");

    void initialize() @safe
    {
        // BUG: This works around the absence of this() constructors.
        if (initialized) return;
        clearExceptions();
        savedState = getControlState();
        initialized = true;
    }

    // Clear all pending exceptions
    static void clearExceptions() @safe
    {
        version (LDC)
        {
            version (X86_Any)
            {
                resetIeeeFlags();
            }
            else version (PPC_Any)
            {
                asm pure nothrow @nogc @trusted
                {
                    `mtfsb0 24
                     mtfsb0 25
                     mtfsb0 26
                     mtfsb0 27
                     mtfsb0 28`;
                }
            }
            else version (MIPS_Any)
            {
                version (D_LP64) enum mask = 0xFFFFF07Fu;
                else             enum mask = 0xF07Fu;

                const cs = getControlState();
                setControlState(cs & mask);
            }
            else version (ARM_Any)
            {
                resetIeeeFlags();
            }
            else
                static assert(false, "Not implemented for this architecture");
        }
        else version (IeeeFlagsSupport)
            resetIeeeFlags();
        else
            static assert(false, "Not implemented for this architecture");
    }

    // Read from the control register
    package(std.math) static ControlState getControlState() @trusted pure
    {
        version (LDC)
        {
            ControlState cont;

            version (X86)
            {
                asm pure nothrow @nogc
                {
                    `xor %%eax, %%eax
                     fstcw %0`
                    : "=m" (cont)
                    :
                    : "eax";
                }
            }
            else version (X86_64)
            {
                asm pure nothrow @nogc
                {
                    `xor %%rax, %%rax
                     fstcw %0`
                    : "=m" (cont)
                    :
                    : "rax";
                }
            }
            else version (PPC_Any)
            {
                double fspr;
                asm pure nothrow @nogc { "mffs %0" : "=f" (fspr); }
                cont = cast(ControlState) *cast(ulong*) &fspr;
            }
            else version (MIPS_Any)
            {
                asm pure nothrow @nogc
                {
                    `.set noat
                     cfc1 %0, $31
                     .set at`
                    : "=r" (cont);
                }
            }
            else version (AArch64)
            {
                asm pure nothrow @nogc { "mrs %0, FPCR" : "=r" (cont); }
            }
            else version (ARM)
            {
                asm pure nothrow @nogc { "vmrs %0, FPSCR" : "=r" (cont); }
            }
            else version (RISCV_Any)
            {
                asm pure nothrow @nogc { "frcsr %0" : "=r" (cont); }
            }
            else
                assert(0, "Not yet supported");

            return cont;
        }
        else version (D_InlineAsm_X86)
        {
            short cont;
            asm pure nothrow @nogc
            {
                xor EAX, EAX;
                fstcw cont;
            }
            return cont;
        }
        else version (D_InlineAsm_X86_64)
        {
            short cont;
            asm pure nothrow @nogc
            {
                xor RAX, RAX;
                fstcw cont;
            }
            return cont;
        }
        else version (RISCV_Any)
        {
            mixin(`
            ControlState cont;
            asm pure nothrow @nogc
            {
                "frcsr %0" : "=r" (cont);
            }
            return cont;
            `);
        }
        else
            assert(0, "Not yet supported");
    }

    // Set the control register
    package(std.math) static void setControlState(ControlState newState) @trusted
    {
        version (InlineAsm_X86_Any)
        {
          version (LDC)
          {
            asm nothrow @nogc
            {
                `fclex
                 fldcw %0`
                :
                : "m" (newState)
                : "fpsw";
            }
          }
          else
          {
            asm nothrow @nogc
            {
                fclex;
                fldcw newState;
            }
          }

            // Also update MXCSR, SSE's control register.
            if (haveSSE)
            {
                uint mxcsr;
              version (LDC)
              {
                asm nothrow @nogc { "stmxcsr %0" : "=m" (mxcsr); }
              }
              else
              {
                asm nothrow @nogc { stmxcsr mxcsr; }
              }

                /* In the FPU control register, rounding mode is in bits 10 and
                11. In MXCSR it's in bits 13 and 14. */
                mxcsr &= ~(roundingMask << 3);             // delete old rounding mode
                mxcsr |= (newState & roundingMask) << 3;   // write new rounding mode

                /* In the FPU control register, masks are bits 0 through 5.
                In MXCSR they're 7 through 12. */
                mxcsr &= ~(allExceptions << 7);            // delete old masks
                mxcsr |= (newState & allExceptions) << 7;  // write new exception masks

              version (LDC)
              {
                asm nothrow @nogc { "ldmxcsr %0" : : "m" (mxcsr) : "flags"; }
              }
              else
              {
                asm nothrow @nogc { ldmxcsr mxcsr; }
              }
            }
        }
        else version (RISCV_Any)
        {
            mixin(`
            asm pure nothrow @nogc
            {
                "fscsr %0" : : "r" (newState);
            }
            `);
        }
        else version (LDC)
        {
            version (PPC_Any)
            {
                ulong tmpState = newState;
                double fspr = *cast(double*) &tmpState;
                asm nothrow @nogc { "mtfsf 0x0f, %0" : : "f" (fspr); }
            }
            else version (MIPS_Any)
            {
                asm nothrow @nogc
                {
                    `.set noat
                     ctc1 %0, $31
                     .set at`
                    :
                    : "r" (newState);
                }
            }
            else version (AArch64)
            {
                asm nothrow @nogc { "msr FPCR, %0" : : "r" (newState); }
            }
            else version (ARM)
            {
                asm nothrow @nogc { "vmsr FPSCR, %0" : : "r" (newState); }
            }
            else
                assert(0, "Not yet supported");
        }
        else
            assert(0, "Not yet supported");
    }
}

///
@optStrategy("none") // LDC
@safe unittest
{
    import std.math.rounding : lrint;

    FloatingPointControl fpctrl;

    fpctrl.rounding = FloatingPointControl.roundDown;
    assert(lrint(1.5) == 1.0);

    fpctrl.rounding = FloatingPointControl.roundUp;
    assert(lrint(1.4) == 2.0);

    fpctrl.rounding = FloatingPointControl.roundToNearest;
    assert(lrint(1.5) == 2.0);
}

@safe unittest
{
    void ensureDefaults()
    {
        assert(FloatingPointControl.rounding
               == FloatingPointControl.roundToNearest);
        if (FloatingPointControl.hasExceptionTraps)
            assert(FloatingPointControl.enabledExceptions == 0);
    }

    {
        FloatingPointControl ctrl;
    }
    ensureDefaults();

    {
        FloatingPointControl ctrl;
        ctrl.rounding = FloatingPointControl.roundDown;
        assert(FloatingPointControl.rounding == FloatingPointControl.roundDown);
    }
    ensureDefaults();

    if (FloatingPointControl.hasExceptionTraps)
    {
        FloatingPointControl ctrl;
        ctrl.enableExceptions(FloatingPointControl.divByZeroException
                              | FloatingPointControl.overflowException);
        assert(ctrl.enabledExceptions ==
               (FloatingPointControl.divByZeroException
                | FloatingPointControl.overflowException));

        ctrl.rounding = FloatingPointControl.roundUp;
        assert(FloatingPointControl.rounding == FloatingPointControl.roundUp);
    }
    ensureDefaults();
}

version (LDC)
{
    // TODO: most likely issue #888 again, verify
    // Linux x86_64: debug works, release fails
    // Win64: debug and release fail
}
else
@safe unittest // rounding
{
    import std.meta : AliasSeq;

    static T addRound(T)(uint rm)
    {
        pragma(inline, false);
        FloatingPointControl fpctrl;
        fpctrl.rounding = rm;
        T x = 1;
        x = forceAddOp(x, 0.1L);
        return x;
    }

    static T subRound(T)(uint rm)
    {
        pragma(inline, false);
        FloatingPointControl fpctrl;
        fpctrl.rounding = rm;
        T x = -1;
        x = forceSubOp(x, 0.1L);
        return x;
    }

    static foreach (T; AliasSeq!(float, double, real))
    {{
        /* Be careful with changing the rounding mode, it interferes
         * with common subexpressions. Changing rounding modes should
         * be done with separate functions that are not inlined.
         */

        {
            T u = addRound!(T)(FloatingPointControl.roundUp);
            T d = addRound!(T)(FloatingPointControl.roundDown);
            T z = addRound!(T)(FloatingPointControl.roundToZero);

            assert(u > d);
            assert(z == d);
        }

        {
            T u = subRound!(T)(FloatingPointControl.roundUp);
            T d = subRound!(T)(FloatingPointControl.roundDown);
            T z = subRound!(T)(FloatingPointControl.roundToZero);

            assert(u > d);
            assert(z == u);
        }
    }}
}

} // FloatingPointControlSupport

version (StdUnittest)
{
    // These helpers are intended to avoid constant propagation by the optimizer.
    pragma(inline, false) private @safe
    {
        T forceAddOp(T)(T x, T y) { return x + y; }
        T forceSubOp(T)(T x, T y) { return x - y; }
        T forceMulOp(T)(T x, T y) { return x * y; }
        T forceDivOp(T)(T x, T y) { return x / y; }
    }
}
