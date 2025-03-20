/** Contains common types and constants.
*/
module diet.defs;

import diet.dom;
import memutils.vector;
import std.traits;
import memutils.scoped;

nothrow:
/** The name of the output range variable within a Diet template.

	D statements can access the variable with this name to directly write to the
	output.
*/
enum dietOutputRangeName = "_diet_output";


/// Thrown by the parser for malformed input.
alias DietParserException = Exception;

void put(T, S)(ref T dst, S content) {
	dst.insertBack(content);
}

string formattedWrite(string format, T, Args...)(ref T buffer, Args args) @trusted
{
	import fast.format;
	import ldc.intrinsics;
	int sz = format.length;
	sz -= (args.length*2);
	static foreach(arg; args) {
		static if (isIntegral!(typeof(arg)) || isFloatingPoint!(typeof(arg))) {
			sz += decCharsVal(arg);
		}
		else static if (isSomeString!(typeof(arg))) {
			sz += arg.length;
		}
		else static if (isSomeChar!(typeof(arg))) {
			sz += 1;
		}

	}

	buffer.length = sz;

	auto buf = fast.format.formattedWrite!format(buffer.ptr, args);
	return cast(string)buf;	
}

string format(string fmt, Args...)(Args args) @trusted {
	Vector!char ret;
	formattedWrite!fmt(ret, args);
	return ret[].copy();
}

/** Throws an exception if the condition evaluates to `false`.

	This function will generate a proper error message including file and line
	number when called at compile time. An assertion is used in this case
	instead of an exception:

	Throws:
		Throws a `DietParserException` when called with a `false` condition at
		run time.
*/

void enforcep(bool cond, string text, in Location loc) @trusted
{
	Vector!char err;
	err.formattedWrite!"%s (%d): %s"(loc.file[], loc.line+1, text);
	assert(cond, err[]);
}
