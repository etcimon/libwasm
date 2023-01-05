/**
	HTML character entity escaping - taken from the vibe.d project.

	TODO: Make things @safe once Appender is.

	Copyright: © 2012-2014 RejectedSoftware e.K.
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Sönke Ludwig
*/
module diet.internal.html;

import std.traits;
import memutils.vector;
import memutils.scoped;
import diet.defs;
nothrow:
/** Returns the HTML escaped version of a given string.
*/
string htmlEscape(R)(R str)
{
	StringAppender dst;
	filterHTMLEscape(dst, str);
	return dst[].copy();
}

///
unittest {
	assert(htmlEscape(`"Hello", <World>!`) == `"Hello", &lt;World&gt;!`);
}


/** Writes the HTML escaped version of a given string to an output range.
*/
void filterHTMLEscape(R, S)(ref R dst, S str, HTMLEscapeFlags flags = HTMLEscapeFlags.escapeNewline)
	if (isSomeString!S)
{
	foreach (c; str)
		filterHTMLEscape(dst, c, flags);
}


/** Returns the HTML escaped version of a given string (also escapes double quotes).
*/
string htmlAttribEscape(R)(R str)
	if (isSomeString!R)
{
	StringAppender dst;
	filterHTMLAttribEscape(dst, str);
	return dst.data[].copy();
}

///
unittest {
	assert(htmlAttribEscape(`"Hello", <World>!`) == `&quot;Hello&quot;, &lt;World&gt;!`);
}


/** Writes the HTML escaped version of a given string to an output range (also escapes double quotes).
*/
void filterHTMLAttribEscape(R, S)(ref R dst, S str)
	if (isSomeString!S)
{
	foreach (c; str)
		filterHTMLEscape(dst, c, HTMLEscapeFlags.escapeNewline|HTMLEscapeFlags.escapeQuotes);
}


/** Returns the HTML escaped version of a given string (escapes every character).
*/
string htmlAllEscape(R)(R str)
	if (isInputRange!R)
{
	if (__ctfe) { // appender is a performance/memory hog in ctfe
		StringAppender dst;
		filterHTMLAllEscape(dst, str);
		return dst.data;
	} else {
		auto dst = appender!string();
		filterHTMLAllEscape(dst, str);
		return dst.data;
	}
}

///
unittest {
	assert(htmlAllEscape("Hello!") == "&#72;&#101;&#108;&#108;&#111;&#33;");
}


/** Writes the HTML escaped version of a given string to an output range (escapes every character).
*/
void filterHTMLAllEscape(R, S)(ref R dst, S str)
	if (isOutputRange!(R, dchar) && isInputRange!S)
{
	for (; !str.empty; str.popFront()) {
		dst.put("&#");
		dst.put(to!string(cast(uint)str.front));
		dst.put(';');
	}
}


/**
	Minimally escapes a text so that no HTML tags appear in it.
*/
string htmlEscapeMin(R)(R str)
	if (isInputRange!R)
{
	StringAppender dst;
	for (; !str.empty; str.popFront())
		filterHTMLEscape(dst, str.front, HTMLEscapeFlags.escapeMinimal);
	return dst[].copy();
}


void htmlEscape(R, T)(ref R dst, T val)
{
	import std.format : formattedWrite;
	auto r = HTMLEscapeOutputRange!R(dst, HTMLEscapeFlags.defaults);
	r.put(format!"%s"(val));
}

@safe unittest {
	static struct R { @safe @nogc nothrow: void put(char) {} void put(dchar) {} void put(in char[]) {}}
	R r;
	r.htmlEscape("foo");
	r.htmlEscape(12);
	r.htmlEscape(12.4);
}

void htmlAttribEscape(R, T)(ref R dst, T val)
{
	import std.format : formattedWrite;
	auto r = HTMLEscapeOutputRange!R(dst, HTMLEscapeFlags.attribute);
	r.put(format!"%s"(val));
}

/**
	Writes the HTML escaped version of a character to an output range.
*/
void filterHTMLEscape(R, S)(ref R dst, S ch, HTMLEscapeFlags flags = HTMLEscapeFlags.escapeNewline )
	if (isSomeChar!S)
{
	switch (ch) {
		default:
			if (flags & HTMLEscapeFlags.escapeUnknown) {
				dst.put("&#");
				dst.put(format!"%d"(cast(uint)ch));
				dst.put(';');
			} else dst.put(ch);
			break;
		case '"':
			if (flags & HTMLEscapeFlags.escapeQuotes) dst.put("&quot;");
			else dst.put('"');
			break;
		case '\'':
			if (flags & HTMLEscapeFlags.escapeQuotes) dst.put("&#39;");
			else dst.put('\'');
			break;
		case '\r', '\n':
			if (flags & HTMLEscapeFlags.escapeNewline) {
				dst.put("&#");
				dst.put(format!"%d"(cast(uint)ch));
				dst.put(';');
			} else dst.put(ch);
			break;
		case 'a': .. case 'z': goto case;
		case 'A': .. case 'Z': goto case;
		case '0': .. case '9': goto case;
		case ' ', '\t', '-', '_', '.', ':', ',', ';',
			 '#', '+', '*', '?', '=', '(', ')', '/', '!',
			 '%' , '{', '}', '[', ']', '`', '´', '$', '^', '~':
			dst.put(cast(char)ch);
			break;
		case '<': dst.put("&lt;"); break;
		case '>': dst.put("&gt;"); break;
		case '&': dst.put("&amp;"); break;
	}
}


enum HTMLEscapeFlags {
	escapeMinimal = 0,
	escapeQuotes = 1<<0,
	escapeNewline = 1<<1,
	escapeUnknown = 1<<2,
	defaults = escapeNewline,
	attribute = escapeNewline|escapeQuotes
}

@safe @nogc pure nothrow
bool isValidDchar(dchar c)
{
    /* Note: FFFE and FFFF are specifically permitted by the
     * Unicode standard for application internal use, but are not
     * allowed for interchange.
     * (thanks to Arcane Jill)
     */

    return c < 0xD800 ||
        (c > 0xDFFF && c <= 0x10FFFF /*&& c != 0xFFFE && c != 0xFFFF*/);
}
/* =================== Decode ======================= */

/***************
 * Decodes and returns character starting at s[idx]. idx is advanced past the
 * decoded character. If the character is not well formed, a ? byte is returned
 */
@safe pure
dchar decode(const scope char[] s, ref size_t idx)
    in
    {
        assert(idx >= 0 && idx < s.length);
    }
    out (result)
    {
        assert(isValidDchar(result));
    }
    do
    {
        size_t len = s.length;
        dchar V;
        size_t i = idx;
        char u = s[i];

        if (u & 0x80)
        {   uint n;
            char u2;

            /* The following encodings are valid, except for the 5 and 6 byte
             * combinations:
             *  0xxxxxxx
             *  110xxxxx 10xxxxxx
             *  1110xxxx 10xxxxxx 10xxxxxx
             *  11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
             *  111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
             *  1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
             */
            for (n = 1; ; n++)
            {
                if (n > 4)
                    goto Lerr;          // only do the first 4 of 6 encodings
                if (((u << n) & 0x80) == 0)
                {
                    if (n == 1)
                        goto Lerr;
                    break;
                }
            }

            // Pick off (7 - n) significant bits of B from first byte of octet
            V = cast(dchar)(u & ((1 << (7 - n)) - 1));

            if (i + (n - 1) >= len)
                goto Lerr;                      // off end of string

            /* The following combinations are overlong, and illegal:
             *  1100000x (10xxxxxx)
             *  11100000 100xxxxx (10xxxxxx)
             *  11110000 1000xxxx (10xxxxxx 10xxxxxx)
             *  11111000 10000xxx (10xxxxxx 10xxxxxx 10xxxxxx)
             *  11111100 100000xx (10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx)
             */
            u2 = s[i + 1];
            if ((u & 0xFE) == 0xC0 ||
                (u == 0xE0 && (u2 & 0xE0) == 0x80) ||
                (u == 0xF0 && (u2 & 0xF0) == 0x80) ||
                (u == 0xF8 && (u2 & 0xF8) == 0x80) ||
                (u == 0xFC && (u2 & 0xFC) == 0x80))
                goto Lerr;                      // overlong combination

            for (uint j = 1; j != n; j++)
            {
                u = s[i + j];
                if ((u & 0xC0) != 0x80)
                    goto Lerr;                  // trailing bytes are 10xxxxxx
                V = (V << 6) | (u & 0x3F);
            }
            if (!isValidDchar(V))
                goto Lerr;
            i += n;
        }
        else
        {
            V = cast(dchar) u;
            i++;
        }

        idx = i;
        return V;

      Lerr:
	  	i++;
      	return '?';
    }


static immutable UTF8stride =
[
    cast(ubyte)
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
    2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
    3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
    4,4,4,4,4,4,4,4,5,5,5,5,6,6,0xFF,0xFF,
];

/**
 * stride() returns the length of a UTF-8 sequence starting at index i
 * in string s.
 * Returns:
 *      The number of bytes in the UTF-8 sequence or
 *      0xFF meaning s[i] is not the start of of UTF-8 sequence.
 */
@safe @nogc pure nothrow
uint stride(char[] s)
{
    return UTF8stride[s[0]];
}

private struct HTMLEscapeOutputRange(R)
{
	nothrow:
	R* dst;
	HTMLEscapeFlags flags;
	char[4] u8seq;
	uint u8seqfill;

	this(ref R dst, HTMLEscapeFlags flags)
	@safe nothrow @nogc {
		() @trusted { this.dst = &dst; } ();
		this.flags = flags;
	}

	@disable this(this);

	void put(char ch)
	{
		assert(u8seqfill < u8seq.length);
		u8seq[u8seqfill++] = ch;
		if (u8seqfill >= 4 || stride(u8seq.ptr[0 .. 4]) <= u8seqfill) {
			char[] str = u8seq[0 .. u8seqfill];
			put(str[0 .. u8seqfill]);
			u8seqfill = 0;
		}
	}
	void put(dchar ch) { filterHTMLEscape(*dst, ch, flags); }
	void put(in char[] str) { 
		
		for (size_t i = 0; i < str.length; )
		{
			dchar d = str[i];
			if (d & 0x80)
				d = decode(str, i);
			else
				++i;
			put(d);
		}
	}

	//static assert(isOutputRange!(HTMLEscapeOutputRange, char));
}

unittest { // issue #36
	auto dst = appender!string();
	auto rng = HTMLEscapeOutputRange!(typeof(dst))(dst, HTMLEscapeFlags.attribute);
	rng.put("foo\"bar");
	assert(dst.data == "foo&quot;bar");
}

private struct StringAppender {
	Vector!char data;
	@safe: nothrow:
	void put(string s) { data ~= s; }
	void put(char ch) { data ~= ch; }
	/*
	void put(dchar ch) {
		import std.utf;
		char[4] dst;
		data ~= dst[0 .. encode(dst, ch)];
	}
	*/
}
