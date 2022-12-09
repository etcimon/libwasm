module diet.internal.string;

import std.ascii : isWhite;
import memutils.vector;
import memutils.scoped;
import diet.defs;
pragma(msg, "diet.internal.string");

@safe nothrow:
Vector!string ctsplit(string s, char c) {
	Vector!string ret;
	int i, j;
	for (i = 0; i < s.length; i++) {
		if (s[i] == c) {
			if (i > j+1) // ignore consecutive instances of c
				ret ~= s[j .. i];
			i++;
			j = i;
		}
	}
	if (j != s.length) ret ~= ret[j .. $]; // remainder
	return ret.move();
}

string dstringEscape(in string str)
{
	Vector!char ret;
	foreach( ch; str ) {
		switch (ch) {
			default: ret ~= ch; break;
			case '\\': ret ~=  "\\\\"; break;
			case '\r': ret ~=  "\\r"; break;
			case '\n': ret ~=  "\\n"; break;
			case '\t': ret ~=  "\\t"; break;
			case '\"': ret ~=  "\\\""; break;
		}
	}
	return ret[].copy();
}

string dstringUnescape(in string str)
{
	Vector!char ret;
	size_t i, start = 0;
	for( i = 0; i < str.length; i++ )
		if( str[i] == '\\' ){
			if( i > start ){
				if( start > 0 ) ret ~= str[start .. i];
				else ret[] = str[0 .. i];
			}
			assert(i+1 < str.length, format!"The string ends with the escape char: %s"(str));
			switch(str[i+1]){
				default: ret ~= str[i+1]; break;
				case 'r': ret ~= '\r'; break;
				case 'n': ret ~= '\n'; break;
				case 't': ret ~= '\t'; break;
			}
			i++;
			start = i+1;
		}

	if( i > start ){
		if( start == 0 ) return str;
		else ret ~= str[start .. i];
	}
	return ret[].copy();
}
string sanitizeEscaping(string str)
{
	str = dstringUnescape(str);
	return dstringEscape(str);
}
pure:


bool ctcanFind(T, U)(T items, U needle) {
	foreach(item; items) {
		if (item == needle) {
			return true;
		}
	}
	return false;
}


string ctstrip(string s)
{
	size_t strt = 0, end = s.length;
	while (strt < s.length && s[strt].isWhite) strt++;
	while (end > 0 && s[end-1].isWhite) end--;
	return strt < end ? s[strt .. end] : null;
}

string ctstripLeft(string s)
{
	size_t i = 0;
	while (i < s.length && s[i].isWhite) i++;
	return s[i .. $];
}

bool ctstartsWith(string s, string compare) {
	if (s.length < compare.length) return false;
	return s[0 .. compare.length] == compare;
}
bool ctstartsWith(string s, char compare) {
	if (s.length < 1) return false;
	return s[0] == compare;
}
bool ctendsWith(string s, string compare) {
	if (s.length < compare.length) return false;
	return s[$-compare.length .. $] == compare;
}

string ctstripRight(string s)
{
	size_t i = s.length;
	while (i > 0 && s[i-1].isWhite) i--;
	return s[0 .. i];
}


string stripUTF8BOM(string input)
{
	char[3] comp = [0xEF, 0xBB, 0xBF];
	if (input.length >= 3 && input[0 .. 3] == comp)
		return input[3 .. $];
	return input;
}
