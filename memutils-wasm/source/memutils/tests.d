﻿module memutils.tests;
import memutils.all;
version(none):
// Test hashmap, freelists
void hashmapFreeListTest(ALLOC)() {
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	{
		import std.stdio;
		HashMapRef!(string, string, ALLOC) hm;
		hm["hey"] = "you";
		assert(getAllocator!(ALLOC.ident)().bytesAllocated() > 0);
		void hello(HashMapRef!(string, string, ALLOC) map) {
			assert(map["hey"] == "you");
			map["you"] = "hey";
		}
		hello(hm);
		assert(hm["you"] == "hey");
		hm.clear();
		assert(hm.empty);
	}
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	
}

// Test Vector, FreeLists & Array
void vectorArrayTest(ALLOC)() {
	{
		assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
		Vector!(ubyte, ALLOC) data;
		data ~= "Hello there";
		
		assert(getAllocator!(ALLOC.ident)().bytesAllocated() > 0);
		assert(data[] == "Hello there");

		Vector!(Array!(ubyte, ALLOC), ALLOC) arr;
		arr ~= data.dupr;
		assert(arr[0] == data && arr[0][] == "Hello there");
		assert(arr[0] == data);
		assert(arr[0][] == "Hello there");
		{
			Vector!(ubyte, ALLOC) outbuf_;
			ubyte[] reference;
			int i;
			for (i = 0; i < 16; i++) {
				string abc = "abcdefghijklmnop";
				outbuf_ ~= cast(ubyte[])abc;
				reference ~= cast(ubyte[]) abc;

				assert(outbuf_[] == reference, "realloc error");
			}
		}
		Array!ubyte def_buf;
        def_buf.reserve(8);
	}
	scope(failure) getAllocator!(ALLOC.ident)().printMap();
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0, "we got " ~ getAllocator!(ALLOC.ident)().bytesAllocated().to!string ~ " bytes, expected 0");
}

// Test HashMap, FreeLists & Array
void hashmapComplexTest(ALLOC)() {
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	{
		HashMap!(string, Array!dchar, ALLOC) hm;
		hm["hey"] = array("you"d);
		hm["hello"] = hm["hey"];
		assert(*hm["hello"] is *hm["hey"]);
		hm["hello"] = hm["hey"].dupr;
		assert(*hm["hello"] !is *hm["hey"]);
		auto vec = hm["hey"].dup;
		assert(vec[] == hm["hey"][]);


		assert(!__traits(compiles, { void handler(HashMap!(string, Array!dchar, ALLOC) hm) { } handler(hm); }));
	}

	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
}

// Test RBTree
void rbTreeTest(ALLOC)() {
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	{
		RBTree!(int, "a < b", true, ALLOC) rbtree;

		rbtree.insert( [50, 51, 52, 53, 54] );
		auto vec = rbtree.lowerBoundRange(52).vector();
		assert(vec[] == [50, 51]);
	}
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
}

// Test Unique
void uniqueTest(ALLOC)() {
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	{
		class A { int a; }
		Unique!(A, ALLOC) a;
		auto inst = ObjectAllocator!(A, ALLOC).alloc();
		A a_check = inst;
		inst.a = 10;
		auto bytes = getAllocator!(ALLOC.ident)().bytesAllocated();
		assert(bytes > 0);
		a = inst;
		assert(!inst);
		assert(a.a == 10);
		a.free();
	}
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
}

// Test FreeList casting
void refCountedCastTest(ALLOC)() {
	class A {
		this() { a=0; }
		protected int a;
		protected void incr() {
			a += 1;
		}
		public final int get() {
			return a;
		}
	}
	class B : A {
		int c;
		int d;
		long e;
		override protected void incr() {
			a += 3;
		}
	}
	alias ARef = RefCounted!(A, ALLOC);
	alias BRef = RefCounted!(B, ALLOC);

	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
	{
		{
			ARef a = ARef();
			a.incr();
			assert(a.get() == 1);
			destructRecurse(a); /// destruction test
			assert(!a);
		}
		{
			ARef a;
			assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);

			{ /// cast test
				BRef b = BRef();
				a = cast(ARef) b;
				static void doIncr(ARef a_ref) { a_ref.incr(); }
				doIncr(a);
				assert(a.get() == 3, "Got: " ~ a.get().to!string);
			}
			ARef c = a;
			assert(c.get() == 3);
			destructRecurse(c);
			assert(a);
		}
	}
	// The B object allocates a lot more. If A destructor called B's dtor we get 0 here.
	assert(getAllocator!(ALLOC.ident)().bytesAllocated() == 0);
}

/// test Circular buffer
void circularBufferTest(ALLOC)() {
	auto buf1 = CircularBuffer!(ubyte, 0, ALLOC)(65536);
	ubyte[] data = new ubyte[150];
	data[50] = 'b';
	buf1.put(data);
	assert(buf1.length == 150);
	assert(buf1[50] == 'b');

	// pulled from vibe.d - vibe.utils.array
	auto buf = CircularBuffer!(int, 0, ALLOC)(5);
	assert(buf.length == 0 && buf.freeSpace == 5); buf.put(1); // |1 . . . .
	assert(buf.length == 1 && buf.freeSpace == 4); buf.put(2); // |1 2 . . .
	assert(buf.length == 2 && buf.freeSpace == 3); buf.put(3); // |1 2 3 . .
	assert(buf.length == 3 && buf.freeSpace == 2); buf.put(4); // |1 2 3 4 .
	assert(buf.length == 4 && buf.freeSpace == 1); buf.put(5); // |1 2 3 4 5
	assert(buf.length == 5 && buf.freeSpace == 0);
	assert(buf.front == 1);
	buf.popFront(); // .|2 3 4 5
	assert(buf.front == 2);
	buf.popFrontN(2); // . . .|4 5
	assert(buf.front == 4);
	assert(buf.length == 2 && buf.freeSpace == 3);
	buf.put([6, 7, 8]); // 6 7 8|4 5
	assert(buf.length == 5 && buf.freeSpace == 0);
	int[5] dst;
	buf.read(dst); // . . .|. .
	assert(dst == [4, 5, 6, 7, 8]);
	assert(buf.length == 0 && buf.freeSpace == 5);
	buf.put([1, 2]); // . . .|1 2
	assert(buf.length == 2 && buf.freeSpace == 3);
	buf.read(dst[0 .. 2]); //|. . . . .
	assert(dst[0 .. 2] == [1, 2]);
}

void dictionaryListTest(ALLOC)()
{
	DictionaryList!(string, int, ALLOC) a;
	a.insert("a", 1);
	a.insert("a", 2);
	assert(a["a"] == 1);
	assert(a.getValuesAt("a") == [1, 2]);
	//logTrace("Done getValuesAt");
	a["a"] = 3;
	assert(a["a"] == 3);
	assert(a.getValuesAt("a") == [3, 2]);
	a.removeAll("a");
	assert(a.getValuesAt("a").length == 0);
	assert(a.get("a", 4) == 4);
	a.insert("b", 2);
	a.insert("b", 1);
	a.remove("b");
	assert(a.getValuesAt("b") == [1]);
	
	DictionaryList!(string, int, ALLOC, false) b;
	b.insert("a", 1);
	b.insert("A", 2);
	assert(b["A"] == 1);
	assert(b.getValuesAt("a") == [1, 2]);

	foreach (int i; 0 .. 15_000) {
		b.insert("a", i);
	}

	// TODO: Fix case insensitive comparison on x86
	assert(b.getValuesAt("a").length >= 15_001, "Found " ~ b.getValuesAt("a").length.to!string);

}

void propagateTests(alias fct)() {
	logDebug("Testing ", fct.stringof);
	fct!ThreadMem();
}

void highLevelAllocTest() {
	logDebug("Testing High Level Allocators");
	class A {
		int a;

		~this() {
			a = 0;
		}
	}
	A a = ThreadMem.alloc!A();
	a.a = 10;
	ThreadMem.free(a);
	assert(!a);

	A appAllocated() {
		A c = ThreadMem.alloc!A();
		c.a = 10;
		return c;
	}

	assert(appAllocated().a == 10);

	ubyte[] ub = ThreadMem.alloc!(ubyte[])(150);
	
	assert(ub.length == 150);
	ub[50] = 'a';
	ThreadMem.free(ub);
	assert(ub is null);
}
struct A {
	int a;
	
	~this() {
		//logDebug("Dtor called");
		a = 0;
	}
}

void scopedTest() {


	logDebug("Testing ScopedPool");

	A* num;
	{ 
		PoolStack.push();
		num = alloc!A(0);
		num.a = 2;
		//logDebug("Freezing");
		PoolStack.disable(); PoolStack.enable();
		PoolStack.freeze(1);
		//logDebug("Frozen");
		assert(PoolStack.empty, "Stack is not empty");
		PoolStack.pop();
		assert(num.a == 0, "Dtor not called");
	}
	{
		auto pool1 = ScopedPool();
		num = alloc!A(0);
	}


}

alias StringObjRef = RefCounted!StringObj;
struct StringObj
{
	void check_value(ref StringObjRef str_obj) {
		assert(str_obj.m_str == m_str);
	}
	this(string a) {
		m_str = a;
	}
	string m_str = "abc";
}

void stringObjRefTest(ALLOC)() {
	StringObjRef str_ref = StringObjRef();
	StringObjRef str_ref2 = StringObjRef("abc");
	str_ref2 = str_ref;
	str_ref.check_value(str_ref2);
}
void rbTreeTestTwo(ALLOC)() {
	auto m_trusted_hashes = RBTree!string();


	m_trusted_hashes.insert("SHA-224");
	m_trusted_hashes.insert("SHA-256");
	m_trusted_hashes.insert("SHA-384");
	m_trusted_hashes.insert("SHA-512");
	string[] strings = ["SHA-224","SHA-256","SHA-384","SHA-512"];
	int i;
	foreach(str; m_trusted_hashes)
	{
		assert(str == strings[i], "invalid string: " ~ str);
		i++;
	}
}

unittest {
	propagateTests!stringObjRefTest();	
	propagateTests!hashmapFreeListTest();
	propagateTests!vectorArrayTest();
	propagateTests!hashmapComplexTest();
	propagateTests!rbTreeTest();
	propagateTests!uniqueTest();
	propagateTests!refCountedCastTest();
	propagateTests!circularBufferTest();
	propagateTests!dictionaryListTest();
	propagateTests!rbTreeTestTwo();

	scopedTest();

	highLevelAllocTest();

	
}