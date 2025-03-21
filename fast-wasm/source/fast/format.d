﻿/*******************************************************************************
 * 
 * Functions for formatting data into strings and back.
 * 
 * Authors:
 *   $(LINK2 mailto:Marco.Leise@gmx.de, Marco Leise)
 * 
 * Copyright:
 *   © 2017-2023 $(LINK2 mailto:Marco.Leise@gmx.de, Marco Leise), $(LINK2 mailto:etienne@cimons.com, Etienne Cimon)
 * 
 * License:
 *   $(LINK2 https://mit-license.org/, The MIT License (MIT))
 * 
 **************************************/
module fast.format;

//import core.stdc.stdlib;
//import core.stdc.string;
import core.bitop;
import std.traits;
import memutils.ct;
import std.typetuple;
import fast.internal.helpers;

/+
 ╔══════════════════════════════════════════════════════════════════════════════
 ║ ⚑ Hex String
 ╚══════════════════════════════════════════════════════════════════════════════
 +/

/**
 * Converts an unsigned type into a fixed width 8 digits hex string using lower-case letters.
 * 
 * Params:
 *   n = the number to convert
 * 
 * Returns:
 *   hexadecimal representation of $(D n), lower-case letters
 */
@safe pure nothrow @nogc
char[2 * U.sizeof] hexStrLower(U)(Unqual!U n) if (isUnsigned!U)
{
	char[2 * U.sizeof] hex = void;
	foreach_reverse (i; 0 .. 2 * U.sizeof)
	{
		U d = n & U(0xF);
		hex[i] = cast(char)(d < 10 ? '0' + d : 'a' + d - 10);
		n >>= 4;
	}
	return hex;
}

/**
 * Converts an unsigned type into a fixed width 8 digits hex string using upper-case letters.
 * 
 * Params:
 *   n = the number to convert
 * 
 * Returns:
 *   hexadecimal representation of $(D n), upper-case letters
 */
@safe pure nothrow @nogc
char[2 * U.sizeof] hexStrUpper(U)(U n) if (isUnsigned!U)
{
	char[2 * U.sizeof] hex = void;
	foreach_reverse (i; 0 .. 2 * U.sizeof)
	{
		U d = n & U(0xF);
		hex[i] = cast(char)(d < 10 ? '0' + d : 'A' + d - 10);
		n >>= 4;
	}
	return hex;
}

/+
 ╔══════════════════════════════════════════════════════════════════════════════
 ║ ⚑ Decimal String
 ╚══════════════════════════════════════════════════════════════════════════════
 +/

template decDigits(T) if (isIntegral!T)
{
	static if (is(T == ulong))
		enum decDigits = 20;
	else static if (is(T == long))
		enum decDigits = 19;
	else static if (is(T == uint) || is(T == int))
		enum decDigits = 10;
	else static if (is(T == ushort) || is(T == short))
		enum decDigits = 5;
	else static if (is(T == ubyte) || is(T == byte))
		enum decDigits = 3;
}

template decDigits(T) if (isFloatingPoint!T)
{
	static if (is(T == float))
		enum decDigits = 9;
	else static if (is(T == double))
		enum decDigits = 18;
}

enum decChars(T) = decDigits!T + isSigned!T;

@safe pure nothrow size_t decCharsVal(T)(T v)
		if (isIntegral!T && !isFloatingPoint!T)
{
	ulong maxsize = 10;
	size_t digits = 1;
	if (v < 0)
	{
		digits = 2;
		v *= -1;
	}

	// calculate left of the decimal
	while (digits < decChars!T)
	{
		if (v < maxsize)
		{
			return digits;
		}
		maxsize *= 10;
		digits++;
	}
	return decChars!T;
}

@safe nothrow size_t decCharsVal(T)(T v) if (isFloatingPoint!T)
{
	/*int maxsize = 10;
	uint u = cast(uint) (v < 0 ? -v : v);
	T dec = (v < 0 ? (-v) : (v)) - u;
	short digits = 1;
	if (dec != 0)
		digits++;
	if (v < 0)
		digits++;
	

	// calculate left of the decimal
	while (digits < decChars!uint) {
		if (u < maxsize) {
			break;
		}
		maxsize *= 10;
		digits++;
	}

	// calc decimals
	while (digits < decChars!T && dec > 0) {
		dec *= 10;
		uint val = cast(uint) dec;
		dec -= val;
		if (dec == 0.) {
			return digits;
		}
		digits++;
	}

	return digits;*/
	return decStr(v).length;
}

@safe pure nothrow @nogc
RevFillStr!(decChars!I) decStr(I)(I i) if (isFloatingPoint!I)
{
	RevFillStr!(decChars!I) str;

	bool signed = i < 0;
	uint u = cast(uint)(i < 0 ? -i : i);

	I dec = (i < 0 ? (-i) : (i)) - u;

	short digits = signed ? 2 : 1;
	int maxsize = 10;
	// calculate left of the decimal
	while (digits < decChars!uint)
	{
		if (u < maxsize)
		{
			break;
		}
		maxsize *= 10;
		digits++;
	}

	char[decDigits!I - 3] decimals = void;
	foreach (ref d; decimals)
		d = 0;
	if (dec != 0)
	{
		int j;
		do
		{
			dec *= 10;
			uint val = cast(uint) dec;
			decimals[j++] = char('0' + val % 10);
			dec -= val;
		}
		while (dec > 0 && j < decimals.length - digits);
		bool found_num;
		foreach_reverse (d; decimals)
		{
			if (d > 0 && d > '0' && d <= '9' && !found_num)
				found_num = true;

			if (found_num)
				str ~= d;

		}
		str ~= '.';
	}

	do
	{
		str ~= char('0' + u % 10);
		u /= 10;
	}
	while (u > 0);

	static if (isSigned!I)
		if (signed)
			str ~= '-';

	return str;
}

@safe pure nothrow @nogc
RevFillStr!(decChars!I) decStr(I)(I i) if (isIntegral!I)
{
	RevFillStr!(decChars!I) str;

	static if (isSigned!I)
	{
		bool signed = i < 0;
		UnsignedOf!I u = i < 0 ? -i : i;
	}
	else
		alias u = i;

	do
	{
		str ~= char('0' + u % 10);
		u /= 10;
	}
	while (u);

	static if (isSigned!I)
		if (signed)
			str ~= '-';

	return str;
}

/+
 ╔══════════════════════════════════════════════════════════════════════════════
 ║ ⚑ Formatting
 ╚══════════════════════════════════════════════════════════════════════════════
 +/

template hasKnownSpaceRequirement(T)
{
	static if (isIntegral!T || isPointer!T)
		enum hasKnownSpaceRequirement = true;
	else
		enum hasKnownSpaceRequirement = false;
}

template spaceRequirement(string format, T) if (hasKnownSpaceRequirement!T)
{
	static if (isIntegral!T)
	{
		static if (format == "%s" || format == "%d" || format == "%S")
			enum spaceRequirement = decChars!T;
		else static if (isUnsigned!T && (format == "%x" || format == "%X"))
			enum spaceRequirement = 2 * T.sizeof;
		else
			static assert(0, "Don't know how to handle " ~ T.stringof ~ " as " ~ format);
	}
	else static if (isPointer!T)
	{
		static if (format == "%s" || format == "%p" || format == "%S")
			enum spaceRequirement = 2 * T.sizeof;
		else
			static assert(0, "Don't know how to handle " ~ T.stringof ~ " as " ~ format);
	}
	else
		static assert(0, "Don't know how to handle " ~ T.stringof);
}

auto spaceRequirements(string format, Args...)()
			if (allSatisfy!(hasKnownSpaceRequirement, Args))
{
	size_t sum = 0;

	alias parts = tokenizedFormatString!format;
	foreach (i; staticIota!(0, parts.length))
	{
		static if (parts[i][1] == size_t.max)
			sum += parts[i][0].length;
		else
			sum += spaceRequirement!(parts[i][0], Args[parts[i][1]]);
	}

	return sum;
}

ptrdiff_t indexOf(T)(T s, string arr) pure nothrow
{
	ptrdiff_t i;
	foreach (const c2; s)
	{
		foreach (immutable c1; arr)
		{
			if (c1 == c2)
				return i;
		}
		++i;
	}
	return -1;
}

ptrdiff_t indexOf(T)(T s, char c) pure nothrow
{
	immutable c1 = c;

	ptrdiff_t i;
	foreach (const c2; s)
	{
		if (c1 == c2)
			return i;
		++i;
	}
	return -1;
}

template tokenizedFormatString(string fmt)
{
	auto impl()
	{
		Tuple!(string, size_t)[8] parts;
		size_t i = 0;
		size_t j = 0;
		string rest = fmt;
		while (1)
		{
			ptrdiff_t markerPos = indexOf(rest, '%');
			if (markerPos < 0)
			{
				if (rest.length)
					parts[j++] = tuple(rest, size_t.max);
				return parts;
			}
			if (markerPos)
			{
				parts[j++] = tuple(rest[0 .. markerPos], size_t.max);
				rest = rest[markerPos .. $];
			}

			// TODO: more complex formats
			parts[j++] = tuple(rest[0 .. 2], i++);
			rest = rest[2 .. $];
		}

	}

	enum result = impl();
	static immutable Tuple!(string, size_t)[result.length] tokenizedFormatString = result;
}

char[] formattedWrite(string format, Args...)(char* buffer, Args args)
{
	import ldc.intrinsics;

	char* it = buffer;

	alias parts = tokenizedFormatString!format;
	foreach (i; staticIota!(0, parts.length))
	{
		static if (parts[i][0] != null && parts[i][1] == size_t.max)
		{
			// Direct string copy
			if (__ctfe)
			{
				it[0 .. parts[i][0].length] = parts[i][0].ptr[0 .. parts[i][0].length];
			}
			else
				llvm_memcpy(it, parts[i][0].ptr, parts[i][0].length);
			it += parts[i][0].length;
		}
		else static if (parts[i][0] != null)
		{
			// Formatted argument
			formattedWriteItem!(parts[i][0])(it, args[parts[i][1]]);
		}
	}

	return buffer[0 .. it - buffer];
}

pure nothrow
void formattedWriteItem(string format, T)(ref char* buffer, T t)
		if (isUnsigned!T && format == "%x")
{
	alias RT = ReturnType!(hexStrLower!T);
	*cast(RT*) buffer = hexStrLower!T(t);
	buffer += RT.length;
}

pure nothrow
void formattedWriteItem(string format, T)(ref char* buffer, T t)
		if (isUnsigned!T && format == "%X")
{
	alias RT = ReturnType!(hexStrUpper!T);
	*cast(RT*) buffer = hexStrUpper!T(t);
	buffer += RT.length;
}

nothrow
void formattedWriteItem(string format, T)(ref char* buffer, T t)
		if (format == "%s" || format == "%d" || format == "%f" || format == "%S")
{
	import ldc.intrinsics;

	static if (isIntegral!T || isFloatingPoint!T)
		auto str = decStr(t);
	else static if (isSomeChar!T)
		auto str = t;
	else
		auto str = t.ptr[0 .. t.length];

	static if (is(typeof(str) : char) || isSomeChar!T)
	{
		if (__ctfe)
		{
			assert(__ctfe);
			buffer[0] = str;
		}
		else
			llvm_memcpy(buffer, &str, char.sizeof);
		buffer += char.sizeof;
	}
	else static if (format == "%S")
	{
		ptrdiff_t escape_idx = str.indexOf("\"\t\r\n\\\b\0");
		auto str_ptr = str.ptr;
		size_t remaining = str.length;
		while (escape_idx > -1)
		{
			if (__ctfe)
			{
				assert(__ctfe);
				buffer[0 .. escape_idx] = str_ptr[0 .. escape_idx];

			}
			else
				llvm_memcpy(buffer, str_ptr, escape_idx);
			buffer += escape_idx;
			str_ptr += escape_idx;
			remaining -= escape_idx;
			char c = *str_ptr;
			if (c == '\t')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = 't';
			}
			else if (c == '\b')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = 'b';
			}
			else if (c == '\n')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = 'n';
			}
			else if (c == '\r')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = 'r';
			}
			else if (c == '"')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = '"';
			}
			else if (c == '\\')
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '\\';
				*(buffer++) = '\\';
			}
			else if (c == 0x00)
			{
				str_ptr++;
				escape_idx++;
				remaining--;
				*(buffer++) = '?';
			}

			escape_idx = indexOf(str_ptr[0 .. remaining], "\"\t\r\n\\\b\0");
		}
		if (__ctfe)
		{
			buffer[0 .. remaining] = str_ptr[0 .. remaining];
		}
		else
			llvm_memcpy(buffer, str_ptr, remaining);
		buffer += remaining;
	}
	else
	{
		auto str_ptr = str.ptr;
		size_t remaining = str.length;
		if (__ctfe)
		{
			buffer[0 .. remaining] = str_ptr[0 .. remaining];
		}
		else
			llvm_memcpy(buffer, str_ptr, remaining);
		buffer += remaining;
	}
}

nothrow size_t escapedLength(string str)
{
	ptrdiff_t escape_idx = str.indexOf("\"\t\r\n\\\b\0");
	auto str_ptr = str.ptr;
	size_t sz = str.length;
	size_t remaining = str.length;
	while (escape_idx > -1)
	{
		remaining -= escape_idx;
		if (remaining > 0)
			remaining--;
		str_ptr += escape_idx;
		escape_idx = indexOf(str_ptr[0 .. remaining], "\"\t\r\n\\\b\0");
		sz++;
	}
	return sz;
}

pure nothrow
void formattedWriteItem(string format)(ref char* buffer, void* p)
		if (format == "%s" || format == "%p" || format == "%S")
{
	buffer.formattedWriteItem!"%X"(cast(size_t) p);
}

/+
 ╔══════════════════════════════════════════════════════════════════════════════
 ║ ⚑ Helper Structs
 ╚══════════════════════════════════════════════════════════════════════════════
 +/

struct RevFillStr(size_t n)
{
private:

	size_t offset = n;
	char[n] buffer = '\0';

public:

	alias opSlice this;

	@safe pure nothrow @nogc
	void opOpAssign(string op : "~")(char ch)
	in
	{
		assert(offset > 0);
	}
	body
	{
		buffer[--offset] = ch;
	}

	@safe pure nothrow @nogc
	@property inout(char)[] opSlice() inout
	{
		return buffer[offset .. n];
	}

	@safe pure nothrow @nogc
	@property inout(char)* ptr() inout
	{
		return &buffer[offset];
	}

	@safe pure nothrow @nogc
	@property size_t length() const
	{
		return n - offset;
	}
}

bool isValidDchar(dchar c) pure nothrow @safe @nogc
{
	return c < 0xD800 || (c > 0xDFFF && c <= 0x10FFFF);
}
