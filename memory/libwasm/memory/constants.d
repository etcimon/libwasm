module libwasm.memory.constants;

import libwasm.memory.vector;
import std.traits : isNumeric;
import core.stdc.stdio : puts;
import libwasm.runtime.stdio;
nothrow @nogc:

void function(string) nothrow @safe writeln;

package:
enum { // overhead allocator definitions, lazily loaded
	NativeGC = 0x01, // instances are freed automatically when no references exist in the program's threads
	LocklessFreeList = 0x02, // instances are owned by the creating thread thus must be freed by it
	CryptoSafe = 0x03, // Same as above, but zeroise is called upon freeing
}

enum Mallocator = 0x05; // For use by the DebugAllocator.
enum Ctfe = 0x06; 
const LogLevel = Error;

enum { // LogLevel
	Trace,
	Info,
	Debug,
	Error,
	None
}
nothrow:

string charFromInt = "0123456789";
__gshared bool recursing = true;

void logTrace(ARGS...)(ARGS args) {
	static if (LogLevel <= Trace) {
		if (recursing) return;
		recursing = true;
		scope(exit) recursing = false;
		formatOut(args);
		printOut("\n");
	}
}

void logInfo(ARGS...)(ARGS args) {
	static if (LogLevel <= Info) {
		if (recursing) return;
		recursing = true;
		scope(exit) recursing = false;
		formatOut(args);
		printOut("\n");
	}
}

void logDebug(ARGS...)(ARGS args) {
	
	static if (LogLevel <= Debug) {
		if (recursing) return;
		recursing = true;
		scope(exit) recursing = false;
		formatOut(args);
		printOut("\n");
	}
}

void logError(ARGS...)(ARGS args) {
	static if (LogLevel <= Error) {
		if (recursing) return;
		recursing = true;
		scope(exit) recursing = false;
		formatOut(args);
		printOut("\n");
	}
}
