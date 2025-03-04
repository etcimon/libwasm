﻿module memutils.vector;

import std.traits : isArray, ForeachType, isNumeric, isSomeString, hasElaborateDestructor, isPointer, hasIndirections;
import std.range : popFront, front, ElementEncodingType, empty, isInputRange, isForwardRange, isRandomAccessRange, ElementType, refRange, RefRange, hasLength;

import memutils.allocators;
import memutils.helpers;
import memutils.utils;
import memutils.refcounted;

@trusted:
template isImplicitlyConvertibleLegacy(From, To)
{
    enum bool isImplicitlyConvertibleLegacy = is(typeof({
        void fun(ref From v)
        {
            void gun(To) {}
            gun(v);
        }
    }));
}


template Array(T, ALLOC = ThreadMem) 
{
	alias Array = RefCounted!(Vector!(T, ALLOC), ALLOC);
}

// TODO: Remove implicit string casting for Vector!ubyte! Encourage use of Vector!char [].idup instead.

/// An array that uses a custom allocator.

struct Vector(T, ALLOC = ThreadMem)
{	
nothrow:
	enum NOGC = true;
	static enum TSize = T.sizeof;

	void opAssign()(ref T[] other) {
		this[] = other[];
	}
	
	// Payload cannot be copied
	private struct Payload
	{
		nothrow:
		size_t _capacity;
		T* _payload;
		size_t _length;
		
		// Convenience constructor
		this()(auto ref T[] p) 
		{ 
			if (p.length == 0) return;

			length = p.length;

			static if (isImplicitlyConvertibleLegacy!(T, T)) {
				if (_payload is p.ptr && _length == p.length) {
					if (!__ctfe) p = null;
				}
				else {
					foreach (i, ref item; _payload[0 .. _length]) {
						item = p[i];
					}
				}
			}
			else
			{
				foreach (i, ref item; _payload[0 .. _length]) {
					item = p[i];
				}
			}
		}
		
		// Destructor releases array memory
		~this() const nothrow
		{
			if (__ctfe) {
				return;
			} else {
			//try {
				if (_capacity == 0 || _payload is null)
					return;
				T[] data = cast(T[]) _payload[0 .. _capacity];
				freeArray!(T, ALLOC)(data, _length); // calls destructors and frees memory
			//} 
			//catch (Throwable e) { assert(false, "Vector.~this Exception: " ~ e.toString()); }
			}
		}
		
		void opAssign(Payload rhs)
		{
			assert(false);
		}
		
		// Duplicate data
		// @property Payload dup()
		// {
		//     Payload result;
		//     result._payload = _payload.dup;
		//     // Conservatively assume initial capacity == length
		//     result._capacity = result._length;
		//     return result;
		// }
		
		// length
		@property size_t length() const
		{
			return _length;
		}
		
		// length
		@property void length(size_t newLength)
		{
			logInfo("Set length: ", newLength);
			if (length > 0 && length >= newLength)
			{
				// shorten
				static if (hasElaborateDestructor!T) {
					foreach (ref e; _payload[newLength .. _length]) {
						static if (is(T == struct) && !isPointer!T) { // call destructors but not for indirections...
							logTrace("Destructing Vector item(s) ", T.stringof, " for newLength ", newLength);
							destructRecurse(e);
						}
					}
					
					// Zero out unused capacity to prevent gc from seeing
					// false pointers
					if (!__ctfe) memset(_payload + newLength, 0, (_length - newLength) * TSize);
				}
				_length = newLength;
				assert(_length == newLength, "Bad length attribution");
				return;
			}
			
			if (newLength > 0) {
				// enlarge
				auto startEmplace = length;
				reserve(newLength);
				_length = newLength;
				assert(_length == newLength, "Bad length attribution");
				if (!__ctfe) {
					static if (!isImplicitlyConvertibleLegacy!(T, T)) {					
						foreach (size_t i; startEmplace .. newLength) {
							T t = T();
							memmove(_payload + i, &t, TSize); 
						}
						
					} else {
						initializeAll(_payload[startEmplace .. newLength]);
					}
				}
			}
		}
		
		// capacity
		@property size_t capacity() const
		{
			return _capacity;
		}
		
		// reserve
		void reserve(size_t elements)
		{
			if (elements <= capacity) return;
			// TODO: allow vector to become smaller?

			logTrace("Reserve ", length, " => ", elements, " elements with capacity ", capacity);

			if (_capacity > 0) {
				size_t len = _length;
				_payload = reallocArray!(T, ALLOC)(_payload[0 .. _capacity], elements)[0 .. len].ptr;
			}
			else if (elements > 0) {
				size_t len = _length;
				_payload = allocArray!(T, ALLOC)(elements)[0 .. len].ptr;
			}
			_capacity = elements;
		}

		size_t pushBack(Stuff)(Stuff stuff) 
			if (isSomeString!Stuff)
		{
			logTrace("Vector.append @disabled this(this)");
			if (_capacity <= length + stuff.length)
			{
				reserve(1 + (length + stuff.length) * 3 / 2);
			}
			assert(capacity >= length + stuff.length && _payload);
						
			if (__ctfe) {
				assert(__ctfe);
				_length += stuff.length;
				_payload[_length - stuff.length .. _length] = stuff[0 .. stuff.length];
			} else {
				memmove(_payload + _length, stuff.ptr, stuff.length);
				_length += stuff.length;
			}
			
			return 1;
		}

		// Insert one item
		size_t pushBack(Stuff)(auto ref Stuff stuff)
			if (!isArray!Stuff && !isSomeString!Stuff)
		{
			logTrace("Vector.append");
			//logTrace("Capacity: ", _capacity, " length: ", length);
			if (_capacity == length)
			{
				reserve(1 + capacity * 3 / 2);
			}
			assert(capacity > length && _payload, "Payload pointer capacity is wrong");
			//emplace(_payload.ptr + _length, stuff);
			_length += 1;
			_payload[_length - 1] = stuff;
			return 1;
		}

		/// Insert a range of items
		size_t pushBack(Stuff)(auto ref Stuff stuff)
			if (isArray!Stuff && !isSomeString!Stuff)
		{
			logTrace("Vector.append 2");
			static if (hasLength!Stuff)
			{
				immutable oldLength = length;
				reserve(oldLength + stuff.length);
			}
			size_t result;
			foreach (ref item; stuff)
			{
				pushBack(item);
				++result;
			}
			static if (hasLength!Stuff)
			{
				assert(length == oldLength + stuff.length);
			}
			return result;
		}
	}
	
	private alias Data = Payload;
	private Data _data;
	
	this(size_t elms) {
		resize(elms);
	}
	
	/**
        Constructor taking a number of items
     */
	this(U)(U[] values...)
		if (isImplicitlyConvertibleLegacy!(U, T))
	{
		// TODO: This doesn't work with refcounted
		_data = Data(cast(T[])values);
	}

	/**
        Constructor taking an input range
     */
	this(Stuff)(Stuff stuff)
		if (isArray!Stuff && isImplicitlyConvertibleLegacy!(UnConst!(ElementType!Stuff), T) && !is(Stuff == T[]))
	{
		insertBack(stuff);
	}
	
	/**
	 * Move Constructor
	*/
	this()(auto ref typeof(this) other) {
		if (__ctfe) return;
		if (this.ptr !is other.ptr)
			this.swap(other);
		else {
			typeof(this) ini;
			other.swap(ini);
		}
	}

	void swap(ref Vector!(T, ALLOC) other) {
		import std.algorithm : swap;
		
		Vector!(T, ALLOC) vec = Vector!(T, ALLOC)(length);
		// swap each element with a duplicate
		foreach (size_t i, ref el; _data._payload[0 .. _data._length]) {
			T t = el;
			memmove(vec._data._payload + i, &t, TSize);
			memset(&t, 0, TSize);
		}
		this.swap(cast(T[])other[]);
		other.swap(cast(T[])vec[]);
				
		foreach (size_t i, ref el; vec._data._payload[0 .. _data._length]) {
			memset(vec._data._payload + i, 0, TSize);
		}
		vec._data._length = 0;
	}

	void swap(T[] other) {
		this[] = other;
	}
	/**
        Duplicates the container. The elements themselves are not transitively
        duplicated.

        Complexity: $(BIGOH n).
     */
	@property Vector!(T, ALLOC) dup() const
	{
		static if (__traits(compiles, { T a; T b; a = b; } ())) {
			auto ret = Vector!(T, ALLOC)(cast(T[])_data._payload[0 .. _data._length]);
			return ret.move;
		}
		else static if (__traits(hasMember, T, "dup")) // Element is @disable this(this) but has dup()
		{
			Vector!(T, ALLOC) vec = Vector!(T, ALLOC)(length);
			// swap each element with a duplicate
			foreach (size_t i, ref el; _data._payload[0 .. _data._length]) {
				T t = el.dup;
				memmove(vec._data._payload + i, &t, TSize);
				memset(&t, 0, TSize);
			}
			return vec.move();
		} else {
			static assert(false, "Cannot dup() the element" ~ T.stringof);
		}
	}
	
	/// ditto
	@property RefCounted!(Vector!(T, ALLOC), ThreadMem) dupr() const
	{
		return RefCounted!(Vector!(T, ALLOC), ThreadMem)(cast(T[])_data._payload[0 .. _data._length]);
	}
	
	@property Vector!(T, ALLOC) move() {
		return Vector!(T, ALLOC)(this);
	}
	
	/**
        Property returning $(D true) if and only if the container has no
        elements.

        Complexity: $(BIGOH 1)
     */
	@property bool empty() const
	{
		return !_data._payload[0 .. _data._length] || _data._payload[0 .. _data._length].empty;
	}
	
	/**
        Returns the number of elements in the container.

        Complexity: $(BIGOH 1).
     */
	@property size_t length() const
	{
		return _data._length;
	}
	
	/// ditto
	size_t opDollar() const
	{
		return length;
	}
	
	@property T* ptr() inout {
		return cast(T*) _data._payload;
	}
	
	@property T* end() inout {
		return this.ptr + this.length;
	}
	
	/**
        Returns the maximum number of elements the container can store without
           (a) allocating memory, (b) invalidating iterators upon insertion.

        Complexity: $(BIGOH 1)
     */
	@property size_t capacity() const
	{
		return _data._capacity;
	}

	/*
	@property auto range() {
		return refRange(&_data._payload);
	}
	*/
	
	/**
        Ensures sufficient capacity to accommodate $(D e) elements.

        Postcondition: $(D capacity >= e)

        Complexity: $(BIGOH 1)
     */
	void reserve(size_t elements)
	{
		_data.reserve(elements);
	}
	
	/**
        Returns an array that can be translated to a range using ($D refRange).

        Complexity: $(BIGOH 1)
     */
	auto opSlice() inout @trusted
	{
		static if (is(T[] == char[]))
			return cast(string) _data._payload[0 .. _data._length];
		else
			return _data._payload[0 .. _data._length];
	}
	
	/**
        Returns an array of the container from index $(D a) up to (excluding) index $(D b).

        Precondition: $(D a <= b && b <= length)

        Complexity: $(BIGOH 1)
     */
	T[] opSlice(size_t i, size_t j) const
	{
		logTrace("Slicing Vector i=", i, ", j=", j);
		assert(!(i > j || j > length), "invalid opslice attempt");
		static if (isPointer!T) {
			return cast() (&(cast()&(cast()**_data._payload)))[i .. j];
		} else return cast() (&(cast()*_data._payload))[i .. j];
	}
	
	/**
        Forward to $(D opSlice().front) and $(D opSlice().back), respectively.

        Precondition: $(D !empty)

        Complexity: $(BIGOH 1)
     */
	@property ref T front()
	{
		return _data._payload[0];
	}
	
	/// ditto
	@property ref T back()
	{
		return _data._payload[length - 1];
	}
	
	/**
        Indexing operators yield or modify the value at a specified index.

        Precondition: $(D i < length)

        Complexity: $(BIGOH 1)
     */	
	ref T opIndex(size_t i) const
	{
		if (__ctfe) {
			assert(__ctfe);
			static if (isPointer!T) {
				return &cast()*_data._payload[i];
			} else
			
			return cast()_data._payload[i];
		}
		else return *cast(T*)&_data._payload[i];
	}

	ref T getRef(size_t i) 
	{
		if (__ctfe) {
			assert(__ctfe);
			return _data._payload[i];
		}
		else return _data._payload[i];
	}
	
	
	void opIndexAssign(U)(auto ref U val, size_t i)
	{
		static enum USize = U.sizeof;
		static if (__traits(compiles, {_data._payload[i] = cast(T) val; }()))
			_data._payload[i] = cast(T) val;
		else { // swap
			memmove(_data._payload + i, &val, USize);
			memset(&val, 0, USize);
		}
	}
	/**
        Slicing operations execute an operation on an entire slice.

        Precondition: $(D i < j && j < length)

        Complexity: $(BIGOH slice.length)
     */
	void opSliceAssign(Stuff)(auto ref Stuff value)
	{
		/*static if (isRandomAccessRange!Stuff)
		{
			_data.length = value.length;
			foreach (i, ref item; value){
				_data._payload[i] = item;
			}
		} else */static if (is(UnConst!Stuff == Vector!(T, ALLOC))) {
			_data.length = value._data.length;
			
			foreach (i, ref item; value._data._payload[0 .. value._data._length]){
				_data._payload[i] = item;
			}
		}
		else static if (is(T[] == UnConst!Stuff) || isImplicitlyConvertibleLegacy!(T, ElementType!Stuff) || (is(T == char) && is(Stuff == string))) {
			_data.length = value.length;
			if (__ctfe) {
				assert(__ctfe);
				if (value.ptr != _data._payload)
					_data._payload[0 .. value.length] = value[0 .. $];
			} else {
				foreach (i, ref item; cast(T[])value){
					_data._payload[i] = item;
				}
			}
		} else static assert(false, "Can't convert " ~ Stuff.stringof ~ " to " ~ T.stringof ~ "[]");
	}
	
	/// ditto
	void opSliceAssign(Stuff)(Stuff value, size_t i, size_t j)
	{
		auto slice = _data._payload[0 .. _data._length];
		slice[i .. j] = value;
	}
	
	/// ditto
	void opSliceUnary(string op)()
		if(op == "++" || op == "--")
	{
		mixin(op~"_data._payload[];");
	}
	
	/// ditto
	void opSliceUnary(string op)(size_t i, size_t j)
		if(op == "++" || op == "--")
	{
		mixin(op~"slice[i .. j];");
	}
	
	/// ditto
	void opSliceOpAssign(string op)(T value)
	{
		mixin("_data._payload[] "~op~"= value;");
	}
	
	/// ditto
	void opSliceOpAssign(string op)(T value, size_t i, size_t j)
	{
		mixin("slice[i .. j] "~op~"= value;");
	}
	
	/**
        Returns a new container that's the concatenation of $(D this) and its
        argument. $(D opBinaryRight) is only defined if $(D Stuff) does not
        define $(D opBinary).

        Complexity: $(BIGOH n + m), where m is the number of elements in $(D
        stuff)
     */
	auto opBinary(string op, Stuff)(Stuff stuff)
		if (op == "~")
	{
		logTrace("Appending stuff");
		Vector!(T, ALLOC) result;
		// @@@BUG@@ result ~= this[] doesn't work
		result ~= this[];
		assert(result.length == length);
		static if (__traits(compiles, stuff[]))
			result ~= stuff[];
		else
			result ~= stuff;
		return result.move();
	}
	
	void opOpAssign(string op, U)(auto ref U input)
		if (op == "^")
	{
		if (this.length < input.length)
			this.resize(input.length);

		pure static void xorBuf(T)(T* output, const(T)* input, size_t length)
		{
			while (length >= 8)
			{
				output[0 .. 8] ^= input[0 .. 8];
				
				output += 8; input += 8; length -= 8;
			}
			
			output[0 .. length] ^= input[0 .. length];
		}

		xorBuf(this.ptr, input.ptr, input.length);
	}
	
	/**
        Forwards to $(D pushBack(stuff)).
     */
	void opOpAssign(string op, Stuff)(auto ref Stuff stuff)
		if (op == "~")
	{
		static if (is (Stuff == typeof(this))) {
			insertBack(cast(T[]) stuff[]);
		}
		else
		{
			insertBack(stuff);
		}
	}
	
	/**
        Removes all contents from the container. The container decides how $(D
        capacity) is affected.

        Postcondition: $(D empty)

        Complexity: $(BIGOH n)
     */
	void clear()
	{
		logTrace("Vector.clear()");
		_data.length = 0;
	}
	
	
	/**
        Sets the number of elements in the container to $(D newSize). If $(D
        newSize) is greater than $(D length), the added elements are added to
        unspecified positions in the container and initialized with $(D
        T.init).

        Complexity: $(BIGOH abs(n - newLength))

        Postcondition: $(D length == newLength)
     */
	@property void length(size_t newLength)
	{
		_data.length = newLength;
	}
	
	void resize(size_t newLength)
	{
		logInfo("Resize to ", newLength);
		this.length = newLength;
	}
	
	
	int opCmp(Alloc)(auto const ref Vector!(T, Alloc) other) const 
	{
		if (this[] == other[])
			return 0;
		else if (this[] < other[])
			return -1;
		else
			return 0;
	}
	size_t pushBack(Stuff...)(Stuff stuff) 
		if (!isNumeric!Stuff || !is ( T == ubyte ))
	{
		return insertBack(stuff);
	}
	
	size_t pushBack(Stuff...)(Stuff stuff) 
		if (isNumeric!Stuff && is(T == ubyte))
	{
		return insertBack(cast(T) stuff);
	}

	size_t insert(Stuff...)(Stuff stuff) {
		return insertBack(stuff);
	}
	
	/**
        Inserts $(D value) to the front or back of the container. $(D stuff)
        can be a value convertible to $(D T) or a range of objects convertible
        to $(D T). The stable version behaves the same, but guarantees that
        ranges iterating over the container are never invalidated.

        Returns: The number of elements inserted

        Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
        elements in $(D stuff)
    */
	size_t insertBack(Stuff)(auto ref Stuff stuff)
	{
		static if (isImplicitlyConvertibleLegacy!(Stuff, T[]))
			return _data.pushBack(cast(T[])stuff);
		else static if (isSomeString!(Stuff) && !isImplicitlyConvertibleLegacy!(Stuff, T)) {
			return _data.pushBack(cast(T[])stuff);
		}
		else static if (isSomeString!(Stuff) && isImplicitlyConvertibleLegacy!(Stuff, T)) {
			return _data.pushBack(cast(T)stuff);
		}
		else static if (isArray!(Stuff) && isImplicitlyConvertibleLegacy!(ForeachType!Stuff, T)) {
			return _data.pushBack(stuff);
		}
		else
			return _data.pushBack(cast(T) stuff);
	}

	/**
        Removes the value at the back of the container. The stable version
        behaves the same, but guarantees that ranges iterating over the
        container are never invalidated.

        Precondition: $(D !empty)

        Complexity: $(BIGOH log(n)).
    */
	void removeBack()
	{
		assert(!empty);
		static if (hasElaborateDestructor!T)
			destructRecurse(_data._payload[_data._length - 1]);
		if (__ctfe) {
			assert(__ctfe);
			_data._payload[_data._length - 1] = T.init;
		} else memset(_data._payload + _data._length - 1, 0, TSize);
		_data._length -= 1;
	}
	
	@trusted
	void removeFront() { 
	
		assert(!empty);
		static if (hasElaborateDestructor!T)
			destructRecurse(_data._payload[0]);
		
		if (_data._length > 1) {
			if (__ctfe) {
				assert(__ctfe);
				_data._payload[0 .. _data._length-1] = _data._payload[1 .. _data._length];
				_data._payload[_data._length-1] = T.init;
			} else {
				memmove(_data._payload, _data._payload + 1, TSize * (_data._length - 1));
				memset(_data._payload + _data._length - 1, 0, TSize);
			}
		}
		_data._length -= 1;
	}
	
	/**
        Removes $(D howMany) values at the front or back of the
        container. Unlike the unparameterized versions above, these functions
        do not throw if they could not remove $(D howMany) elements. Instead,
        if $(D howMany > n), all elements are removed. The returned value is
        the effective number of elements removed. The stable version behaves
        the same, but guarantees that ranges iterating over the container are
        never invalidated.

        Returns: The number of elements removed

        Complexity: $(BIGOH howMany).
    */
	size_t removeBack(size_t howMany)
	{
		if (howMany > length) howMany = length;
		static if (hasElaborateDestructor!T)
			foreach (ref e; _data._payload[_data._length - howMany .. _data._length])
				destructRecurse(e);
		memset(_data._payload + _data._length - howMany, 0, howMany*TSize);
		_data._length -= howMany;
		return howMany;
	}

	/**
        Inserts $(D stuff) before position i.

        Returns: The number of values inserted.

        Complexity: $(BIGOH n + m), where $(D m) is the length of $(D stuff)
     */
	void insertBefore(Stuff)(size_t i, Stuff stuff)
		if (isImplicitlyConvertibleLegacy!(Stuff, T))
	{
		assert(i <= length);
		reserve(length + 1);

		// Move elements over by one slot
		memmove(_data._payload + i + 1,
				_data._payload + i,
				TSize * (length - i));
		//emplace(_data._payload.ptr + i, stuff);
		T* slot = _data._payload + i;
		*slot = stuff;
		_data._length += 1;
	}
	
	/// ditto
	size_t insertBefore(Stuff)(size_t i, Stuff stuff)
		if (isArray!Stuff && isImplicitlyConvertibleLegacy!(ElementType!Stuff, T))
	{
		assert(i <= length);
		static if (isForwardRange!Stuff)
		{
			// Can find the length in advance
			auto extra = walkLength(stuff);
			if (!extra) return 0;
			reserve(length + extra);
			// Move elements over by extra slots
			memmove(_data._payload + i + extra,
				_data._payload + i,
				TSize * (length - i));
			foreach (p; _data._payload + i ..
				_data._payload + i + extra)
			{
				*p = stuff.front;
				//emplace(p, stuff.front);
				stuff.popFront();
			}
			_data._length += extra;
			return extra;
		}
		else
		{
			assert(_data);
			immutable offset = i;
			assert(offset <= length);
			auto result = pushBack(stuff);
			bringToFront(this[offset .. length - result],
						 this[length - result .. length]);
			return result;
		}
	}
	
	/// ditto
	size_t insertAfter(Stuff)(size_t i, Stuff stuff)
	{
		assert(r._outer._data is _data);
		// TODO: optimize
		immutable offset = i;
		assert(offset <= length);
		auto result = pushBack(stuff);
		bringToFront(this[offset .. length - result],
					 this[length - result .. length]);
		return result;
	}

	bool opEquals()(auto const ref Vector!(T, ALLOC) other_) const {
		if (other_.empty && empty())
			return true;
		else if (other_.empty)
			return false;
		if (other_.length != length)
			return false;

		return _data._payload[0 .. length] == other_._data._payload[0 .. length];
	}

	bool opEquals()(auto const ref T[] other) {
		logTrace("other: ", other, " this: ", _data._payload);
		return other == _data._payload[0 .. _data._length];
	}
	
}

auto array(T)(T[] val) 
{
	return Array!(Unqual!T)(val);
}

auto vector(T)(T[] val)
{
	return Vector!(Unqual!T)(val);
}
