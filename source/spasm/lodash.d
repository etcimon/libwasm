module spasm.lodash;

import spasm.types;
import std.string : indexOf;
import std.traits : isSomeString;

enum VarType : short {
  handle = 1,
  boolean = 2,
  string_ = 3,
  number = 4,
  decimal = 5,
  eval = 6,
  json = 6,  
  Handle_string__bool = 7, // objects
  Handle_long__bool = 8, // array
  string_string__bool = 9, // string collection
  string_long__bool = 10, // string array
  long_long__bool = 11, // number array
}

union Param {
  Handle handle;
  string str;
  long number;
  bool boolean;
  double decimal;
  Callback cb;
}

union Callback {
  bool delegate(Handle, string) iteratee_1;
  bool delegate(Handle, int) iteratee_2;
  bool delegate(string, string) iteratee_3;
  bool delegate(string, int) iteratee_4;
  bool delegate(int, int) iteratee_5;
}


VarType getVarType(T)() {
  VarType value_type;
  static if (is(T == Eval)) {
    value_type = VarType.eval;
  } 
  else static if (isSomeString!T) {
    value_type = VarType.string_;
  }
  else static if (isNumeric!T) {
    value_type = VarType.number;
  }
  else static if (is(T : delegate)) {
    value_type = getTypeFromCallback(val);
  }
  else static if (is(T : JsHandle)) {
    value_type = VarType.handle;
  }
  else static if (is(T == bool)){
    value_type = VarType.boolean;
  }
  else static if (isFloatingPoint!T) {
    value_type = VarType.decimal;
  }
  return value_type;
}

alias CallbackType = VarType;

union InitVal {
  string str;
  Handle handle;
  long number;
}

VarType getTypeFromCallback(T)(T del) {
  VarType type;
  static if (is(T == bool delegate(Handle, string)))
    type = VarType.Handle_string__bool;
  else static if (is (T == bool delegate(Handle, long)))
    type = VarType.Handle_long__bool;
  else static if (is(T == bool delegate(string, string)))
    type = VarType.string_string__bool;
  else static if (is(T == bool delegate(string, long)))
    type = VarType.string_long__bool;
  else static if (is(T == bool delegate(long, long)))
    type = VarType.long_long__bool;
  return type;
}

struct Command {
  string func;
  Param[5] params;
  VarType[5] param_types;
  short param_count;

  void setAnyValue(T)(ref T any) {
    size_t idx = param_count;
    static if (is(T == Eval)) {
      params[idx].str = any.eval_str;
      params_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = any;
      params_types[idx] = VarType.string_;
    }
    else static if (isNumeric!T) {
      params[idx].number = cast(long) any;
      params_types[idx] = VarType.number;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = any.handle;
      params_types[idx] = VarType.handle;
    }
    else static if (is(T == bool)){
      params[idx].boolean = any;
      params_types[idx] = VarType.boolean;
    }
    else static if (isFloatingPoint!T) {
      params[idx].decimal = any;
      params_types[idx] = VarType.decimal;
    }
    else static if (is(T  : delegate)) {
      setCallback(idx, any);
    } else static assert(false, "Unsupported parameter supplied");
    param_count++;
  }


  void setHandleOrEval(T)(ref T values) {    
    size_t idx = param_count;
    static if (is(T == Eval)) {
      params[idx].str = values.eval_str;
      param_types[idx] = VarType.eval;  
    }
    static if (isTOrPointer!(T, JsHandle))
    {
      params[idx].handle = values.handle;
      param_types[idx] = VarType.handle;
    }    
    else static if (isSomeString!T) {
      params[idx].str = values;
      param_types[idx] = VarType.eval;
    } else static assert(false, "Unsupported type given to function (setHandleOrEval)");
    param_count++;
  }


  void setString(T)(T str)
  {
    size_t idx = param_count;
    
    static if (is(T == Eval)) {
      params[idx].str = str.eval_str;
      params_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = str;
      params_types[idx] = VarType.string_;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      params_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setString)");
    param_count++;
  }

  void setBoolean(T)(T number)
  {
    size_t idx = param_count;
    
    static if (is(T == bool)) {
      params[idx].boolean = number.boolean;
      params_types[idx] = VarType.boolean;      
    }
    static if (is(T == Eval)) {
      params[idx].str = number.eval_str;
      params_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = number;
      params_types[idx] = VarType.eval;
    }
    else static if (isNumeric!T) {
      params[idx].boolean = number != 0;
      params_types[idx] = VarType.boolean;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      params_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setNumber)");
    param_count++;
  }
  void setNumber(T)(T number)
  {
    size_t idx = param_count;
    
    static if (is(T == Eval)) {
      params[idx].str = number.eval_str;
      params_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = number;
      params_types[idx] = VarType.eval;
    }
    else static if (isNumeric!T) {
      params[idx].number = cast(long) number;
      params_types[idx] = VarType.number;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      params_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setNumber)");
    param_count++;
  }

  void setCallback(T)(size_t idx, T callback) {
    static if (is(T == bool delegate(Handle, string))) {      
      params[idx].cb.iteratee_1 = callback;
      params_types[idx] = VarType.Handle_string__bool;
    }
    else static if (is (T == bool delegate(Handle, long))){   
      params[idx].cb.iteratee_2 = callback;
      params_types[idx] = VarType.Handle_long__bool;
    }
    else static if (is(T == bool delegate(string, string))) {   
      params[idx].cb.iteratee_3 = callback;
      params_types[idx] = VarType.string_string__bool;
    }
    else static if (is(T == bool delegate(string, long))) {   
      params[idx].cb.iteratee_4 = callback;
      params_types[idx] = VarType.string_long__bool;
    }
    else static if (is(T == bool delegate(long, long))) {   
      params[idx].cb.iteratee_5 = callback;
      params_types[idx] = VarType.long_long__bool;
    } else static assert(false, "Invalid callback type used as parameter");
  }

  // Used for iteratee. Missing a lot of delegate types
  void setCallback(T)(T callback) {    
    if (callback) {
      size_t idx = param_count;
      param_count++;
      static if (is(T == Eval)) {
        params[idx].str = callback.eval_str;
        param_types[idx] = VarType.eval;  
      }
      else static if (isSomeString!T) {
        params[idx].str = callback;
        param_types[idx] = VarType.eval;
      }
      else static if (is(T : JsHandle)) { // delegate registered or object
        /* Predicates:  
                  
          var users = [
            { 'user': 'barney',  'active': true },
            { 'user': 'fred',    'active': false },
            { 'user': 'pebbles', 'active': false }
          ];

          // The `_.matches` iteratee shorthand.
          _.findLastIndex(users, { 'user': 'barney', 'active': true });
          // => 0
          
          // The `_.matchesProperty` iteratee shorthand.
          _.findLastIndex(users, ['active', false]);
          // => 2
          
          // The `_.property` iteratee shorthand.
          _.findLastIndex(users, 'active');
          // => 0
        */
        params[idx].handle = any.handle;
        params_types[idx] = VarType.handle;
      }
      else static if (is(T : delegate)) {
        setCallback(idx, callback);
      } else static assert(false, "Unsupported type given to function (setCallback)");

    }
  }
}
/++

    Creates a _. javascript compute object. Any function that
    returns a primary type rather than Lodash will execute
    the chaining sequence.

+/
struct Lodash {
  nothrow:
  private:

  InitVal m_initVal;
  VarType m_initType;

  size_t m_size_est;

  char[] m_commands; // [{func: 'name', params:[function(){}, 2, 'str']}]
                      // [{local: 'a', value: function(){} }]
  char* m_ptr;

  // first cb is global
  Callback m_cb;
  CallbackType m_cbType;

  void delegate(Handle reason) m_error;
/*
  // next cb are Handles
  Handle[] m_owns;
  Handle* m_owns_ptr;
*/


  
  static struct Local(T) {
    string local_name;
    T value;
    VarType value_type;

    this(T)(string name, T val) {
      local_name = name;
      value = val;
      value_type = getVarType!T();
    }
  }

  /++
    Initialize the Lodash chaining with VarType
  +/
  this(T)(ref T val, VarType init_type = VarType.handle, int size_estimate = 128) 
  {
    // init with a string
    m_initType = init_type;

    switch (init_type) {
      case VarType.string_:
        m_initVal.str = val;        
        break;
      case VarType.handle:
        static if (is(T : struct))
          m_initVal.handle = val.handle;
        else m_initVal.handle = val;
        break;

       case VarType.number:
          m_initVal.number = cast(long)val;
        break;
      default: assert(false, "Not implemented"); break;
    }


  }

  void setupMemory() {
    if (!m_commands)
    {
      m_commands = cast(char[]) FL_allocate(m_size_est);
      put('[');
    }
  }

  bool put(long i, bool noop = true) {
    long u = i;
    long maxsize = 10;
    size_t digits = i < 0 ? 2 : 1;
    while (digits < 20) {
      if (u < maxsize) {
        break;
      }
      maxsize *= 10;
      digits++;
    }
    
    ptr += digits;
    while(u > 0) {
      *(ptr--) = char('0' + u % 10);
		  u /= 10;
    }
    if (i < 0) *(ptr--) = '-';
    ptr += digits;
  }

  bool put(bool istrue) {
    if (istrue) return put("true");
    else return put("false");
    
  }

  bool putHandle(long handle) {
    if (m_ptr + "nodes[]".sizeof  > &m_commands[$-1]) return false;
    put("nodes[");
    put(handle);
    put("]");
  }

  bool put(char c) {
    *(m_ptr++) = c;
    if (m_ptr > &m_commands[$-1])
      return false;
    return true;
  }

  bool put(T)(T arr, bool add_quotes = false) if (isSomeString!T) {
    import std.string : count;
    if (m_ptr + arr.length + (add_quotes ? 2 + arr.count('\'') : 0)  > &m_commands[$-1]) return false;
    if (add_quotes)
      *(m_ptr++) = '\'';
    foreach (val; arr) {
      if (add_quotes && val == '\'') *(m_ptr++) // escape for quotes
      *(m_ptr++) = val;
    }
    if (add_quotes)
      *(m_ptr++) = '\'';
    return true;
  }

  bool put(Command command) {
    // check locals
    
    foreach (i, param; command.params)
    {
      if (i == command.param_count) break;

      switch (command.param_types[i]) {

        case VarType.Handle_string__bool:
          assert(m_cb is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_1)) local;
          local.local_name = 'cb';
          local.value = param.cb.iteratee_1;
          local.value_type = command.param_types[i];
          put(local);
          break;
        case VarType.Handle_long__bool:
          assert(m_cb is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_2)) local;
          local.local_name = 'cb';
          local.value = param.cb.iteratee_2;
          local.value_type = command.param_types[i];
          put(local);
          break;
        case VarType.string_string__bool:
          assert(m_cb is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_3)) local;
          local.local_name = 'cb';
          local.value = param.cb.iteratee_3;
          local.value_type = command.param_types[i];
          put(local);
          break;
        case string_long__bool:
          assert(m_cb is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_4)) local;
          local.local_name = 'cb';
          local.value = param.cb.iteratee_4;
          local.value_type = command.param_types[i];
          put(local);
          break;
        case long_long__bool:
          assert(m_cb is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_5)) local;
          local.local_name = 'cb';
          local.value = param.cb.iteratee_5;
          local.value_type = command.param_types[i];
          put(local);
          break;
        default: break;
      }
    }
    if (!put('{')) return false;
    if (!put(command.func)) return false;
    if (!put(", params: [")) return false;
    foreach (i, param; command.params)
    {
      if (i == command.param_count) break;

      if (i > 0) if (!put(',')) return false;
      switch (command.param_types[i]) {
        case VarType.handle:
          if (!putHandle(param.number)) return false;
          break;
        case VarType.boolean:
          if (!put(param.boolean)) return false;
        case VarType.string_:
          if (!put(param.str, true)) return false;
          break;
        case VarType.eval:
        case VarType.json:
          if (!put(param.str, false)) return false;
          break;
        case VarType.number:
          if (!put(param.number, false)) return false;
          break;
        //case VarType.decimal:
          // todo
        //  break;
        case VarType.Handle_string__bool:
          if (!put("cb", false)) return false;
          break;
        case VarType.Handle_long__bool:
          if (!put("cb", false)) return false;
          break;
        case VarType.string_string__bool:
          if (!put("cb", false)) return false;
          break;
        case string_long__bool:
          if (!put("cb", false)) return false;
          break;
        case long_long__bool:
          if (!put("cb", false)) return false;
          break;
        default: assert(false, "Command parameter type not implemented"); break;
      }
        
    }
    if (!put("]},")) return false;
    return true;
  }

  bool put(T)(ref Local!T local) {
    if (!put("{local:")) return false;
    if (!put(local.local, true)) return false;
    if (!put(", value: ")) return false;

    switch(local.value_type) {
      case VarType.handle:
        if (!put(local.value.handle)) return false;
        break;
      case VarType.string_:
         if (!put(local.value, true)) return false;
        break;
      case VarType.eval:
      case VarType.json:
         if (!put(local.value, false)) return false;
        break;
      case VarType.boolean:
      case VarType.number:
        if (!put(local.value)) return false;
      case VarType.Handle_string__bool:
      // generate boilerplate
        __gshared immutable cb_boilerplate_1 = `(o,s)=>{let ri=0;let ci=0;let ci2=512;
eh(ci, o); es(ci2, s); sifg(cbPtr)(ri, cbCtx, ci, ci2); return gB(ri);}`;
        m_cb.iteratee_1 = local.value;
        if (!put(cb_boilerplate_1, false)) return false;
        // handler must touch Handle with any type that implements JsObject
        break;
      case VarType.Handle_long__bool:
        __gshared immutable cb_boilerplate_2 = `(o,i)=>{let ri=0;let ci=0;let ci2=512;
eh(ci, o); sL(ci2, i); sifg(cbPtr)(ri, cbCtx, ci, ci2); return gB(ri);}`;
        m_cb.iteratee_2 = local.value;
        if (!put(cb_boilerplate_2, false)) return false;
        break;
      case VarType.string_string__bool:
        __gshared immutable cb_boilerplate_3 = `(s1,s2)=>{let ri=0;let ci=0;let ci2=512;
es(ci, s1); es(ci2, s2); sifg(cbPtr)(ri, cbCtx, ci, ci2); return gB(ri);}`;
        m_cb.iteratee_3 = local.value;
        if (!put(cb_boilerplate_3, false)) return false;
      case VarType.string_long__bool:
        __gshared immutable cb_boilerplate_4 = `(s,i)=>{let ri=0;let ci=0;let ci2=512;
es(ci, s); sL(ci2, i); sifg(cbPtr)(ri, cbCtx, ci, ci2); return gB(ri);}`;
        m_cb.iteratee_4 = local.value;
        if (!put(cb_boilerplate_4, false)) return false;
      case VarType.long_long__bool:
        __gshared immutable cb_boilerplate_5 = `(i1,i2)=>{let ri=0;let ci=0;let ci2=512;
sL(ci, i1); sL(ci2, i2); sifg(cbPtr)(ri, cbCtx, ci, ci2); return gB(ri);}`;
        m_cb.iteratee_5 = local.value;
        if (!put(cb_boilerplate_5, false)) return false;
        break;
      
      default: assert(false, "Local variable type not implemented"); break;
    }
    if (!put(local.value, local.value_type == VarType.string_)) return false;

    if (!put("},")) return false;
    return true;

  }

  /++
    Adds a local js variable to the compute queue.
    Will increase memory using Allocator if need be.

    Params: 
      - Local(T) Object
  +/
  void tryPut(T)(ref Local!T local) {
    char* restore;
    while (!put(local)) {
      m_ptr = restore;
      char[] alloc = cast(char[])FL_reallocate(m_commands.length * 2);
      m_ptr = alloc.ptr + (m_ptr - m_commands.ptr);
      m_commands = alloc;
    }
  }

  /++
    Adds a command to the compute queue.
    Will increase memory using Allocator if need be.

    Params: 
      - Command Object
  +/
  void tryPut(Command command) {
    char* restore;
    while (!put(command)) {
      m_ptr = restore;
      char[] alloc = cast(char[])FL_reallocate(m_commands.length * 2);
      m_ptr = alloc.ptr + (m_ptr - m_commands.ptr);
      m_commands = alloc;
    }
  }

public:
  /++
    Adds a variable accessible through the javascript context
    If it's a callback and one exists, will fail with assert failure

    Params:
      - The variable name to be defined in Javascript VM
      - Value of the variable
      - VarType for handling logic to define the value correctly for the Javascript VM
  +/
  auto addLocal(T)(string var_name, auto ref T val) 
    if (!isFloatingPoint!T) //todo
  {
    setupMemory();

    auto local = Local!T(var_name, val);

    assert(local.value_type != 0, "Local has no value type");

    tryPut(local);

    return this;
  }

  /++
    Callback will be executed if javascript throws during execution

    Params:
      - The delegate which receives the error object

    Returns:
      - Unexecuted Lodash compute object with chaining capability
  +/
  auto onError()(void delegate(Handle) errcb) {
    m_error = errcb;
    return this;
  }  
  
  /++ 
    Creates an array of elements split into groups the length of size. 
    If array can't be split evenly, the final chunk will be the remaining elements.
    
    Params:
      - [size=1] (number): The length of each chunk

    Returns:
      - Lodash chained on (Array): the new array of chunks.
  +/
  auto chunk(T = Any)(auto ref T size = null) if (isNumeric!T) {
    setupMemory();
    Command c = Command("chunk");
    if (size) c.setNumber(size);
    tryPut(c);
    return this;
  }

  /++
    Creates an array with all falsey values removed. The values false, null, 0, "", undefined, and NaN are falsey.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.
  +/
  auto compact()() {    
    setupMemory();
    Command c = Command("compact");
    tryPut(c);
    return this;
  }

  /++
    Creates a new array concatenating array with any additional arrays and/or values.
  
    Params:
      - [values] (...*): The values to concatenate.

    Returns:
      - Lodash chained on (Array): the new concatenated array.

  +/
  auto concat(ARGS...)(auto ref ARGS values) {
    setupMemory();
    Command c = Command("concat");
    foreach(ref val; values) c.setAnyValue(val);
    tryPut(c);
    return this;
  }

  /++
    Creates an array of array values not included in the other given arrays 
    using SameValueZero for equality comparisons. 
    The order and references of result values are determined by the first array.
    
    Params:
      - (...Array): The values to exclude. May be an evaled string or a Handle.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto difference(T)(auto ref T values) {
    setupMemory();
    Command c = Command("difference");
    c.setHandleOrEval(values);
    tryPut(c);
    return this;
  }

  /++
    This method is like _.difference except that it accepts iteratee 
    which is invoked for each element of array and values to generate the 
    criterion by which they're compared. The order and references of result 
    values are determined by the first array. The iteratee is invoked with 
    one argument: (value).

    Params:
      - [values] (...Array): The values to exclude. 
          May be an evaled string or a Handle.
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto differenceBy(T, U = Any)(auto ref T values, auto ref U iteratee = null) 
  {
    setupMemory();
    Command c = Command("differenceBy");
    c.setHandleOrEval(values);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++
    This method is like _.difference except that it accepts comparator 
    which is invoked to compare elements of array to values. 
    The order and references of result values are determined by 
    the first array. The comparator is invoked with two 
    arguments: (arrVal, othVal).
    
    Params:
      - [values] (...Array): The values to exclude. 
          May be an evaled string or a Handle.
      - [comparator] (Function): The comparator invoked per element.
    
    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/  
  auto differenceWith(T, U)(auto ref T values, auto ref U comparator) 
  {
    setupMemory();
    Command c = Command("differenceWith");
    c.setHandleOrEval(values);
    c.setCallback(comparator);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array with n elements dropped from the beginning.

    Params:
      - [size=1] (number): The number of elements to drop.

    Returns:
      - Lodash chained on (Array): the slice of array.
  +/
  auto drop(T = Any)(T size = null) if (isNumeric!T) {
    setupMemory();
    Command c = Command("drop");
    if (size) c.setNumber(size);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array excluding elements dropped from the end. 
    Elements are dropped until predicate returns falsey. 
    The predicate is invoked with three arguments: (value, index, array).

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the slice of array.
  +/
  auto dropRightWhile(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("dropRightWhile");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array excluding elements dropped from the beginning. 
    Elements are dropped until predicate returns falsey. 
    The predicate is invoked with three arguments: (value, index, array).

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the slice of array.
  +/
  auto dropWhile(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("dropWhile");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  
  /++ 
    Fills elements of array with value from start up to, but not including, end.

    Params:
      - value (*): The value to fill array with.
      - [start=0] (number): The start position.
      - [end=array.length] (number): The end position.

    Returns:
      - Lodash chained on (Array): the filled array.
  +/
  auto fill(T, U = Any, V = Any)(auto ref T fill_value, auto ref U start = null, auto ref V end = null) {
    setupMemory();
    Command c = Command("fill");
    c.setAnyValue(fill_value);
    if (start) c.setNumber(start);
    if (end) c.setNumber(end);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.find except that it returns the index of the first element predicate returns truthy for instead of the element itself.
        
    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.
      - [fromIndex=0] (number): The index to search from.

    Returns:
      - Lodash chained on (number): the index of the found element, else -1.
  +/
  auto findIndex(T = Any, U = Any)(auto ref T predicate = null, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("findIndex");
    if (predicate) c.setCallback(predicate);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.findIndex except that it iterates over elements of collection from right to left.

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.
      - [fromIndex=array.length-1] (number): The index to search from.

    Returns:
      - Lodash chained on (number): the index of the found element, else -1.
  +/
  auto findLastIndex(T = Any, U = Any)(auto ref T predicate = null, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("findLastIndex");
    if (predicate) c.setCallback(predicate);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    Flattens array a single level deep.
    
    Returns:
      - Lodash chained on (Array): the new flattened array.
  +/
  auto flatten()() {
    setupMemory();
    Command c = Command("flatten");
    tryPut(c);
    return this;
  }

  /++ 
    Recursively flattens array.
    
    Returns:
      - Lodash chained on (Array): the new flattened array.
  +/
  auto flattenDeep()() {
    setupMemory();
    Command c = Command("flattenDeep");
    tryPut(c);
    return this;
  }

    
  /++ 
    Recursively flatten array up to depth levels.
    
    Params:
      - [depth=1] (number): The maximum recursion depth.

    Returns:
      - Lodash chained on (Array): the new flattened array.
  +/
  auto flattenDepth(T = Any)(auto ref T depth = null) {
    setupMemory();
    Command c = Command("flattenDepth");
    if (depth) c.setNumber(depth);
    tryPut(c);
    return this;
  }

  /++ 
    The inverse of _.toPairs; this method returns an object composed from key-value pairs.
    
    Params:
      - [depth=1] (number): The maximum recursion depth.

    Returns:
      - Lodash chained on (Object): the new object.
  +/
  auto fromPairs()() {
    setupMemory();
    Command c = Command("fromPairs");
    tryPut(c);
    return this;
  }
  
  /++ 
    Gets the first element of array.

    Returns:
      - Lodash chained on (*): the first element of array.
  +/
  auto head()() {
    setupMemory();
    Command c = Command("head");
    tryPut(c);
    return this;
  }

  /++ 
    Gets the index at which the first occurrence of value is found in 
    array using SameValueZero for equality comparisons. If fromIndex is 
    negative, it's used as the offset from the end of array.

    Params:
      - value (*): The value to search for.
      - [fromIndex=0] (number): The index to search from.

    Returns:
      - Lodash chained on (number): the index of the matched value, else -1.
  +/
  auto indexOf(T, U = Any)(auto ref T value, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("indexOf");
    c.setAnyValue(value);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    Gets all but the last element of array.

    Returns:
      - Lodash chained on (Array): the slice of array.
  +/
  auto initial()() {
    setupMemory();
    Command c = Command("initial");
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of unique values that are included in all
    given arrays using SameValueZero for equality comparisons. 
    The order and references of result values are determined by the first array.

    Returns:
      - Lodash chained on (Array): the new array of intersecting values.
  +/
  auto intersection()() {
    setupMemory();
    Command c = Command("intersection");
    tryPut(c);
    return this;
  }


  /++
    This method is like _.intersection except that it accepts iteratee 
    which is invoked for each element of each arrays to generate the 
    criterion by which they're compared. The order and references of 
    result values are determined by the first array. The iteratee is 
    invoked with one argument: (value).
    
    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of intersecting values.

  +/
  auto intersectionBy(T = Any)(auto ref T iteratee = null) 
  {
    setupMemory();
    Command c = Command("intersectionBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++
    This method is like _.intersection except that it accepts comparator 
    which is invoked to compare elements of arrays. The order and references 
    of result values are determined by the first array. 
    The comparator is invoked with two arguments: (arrVal, othVal).
    
    Params:
      - [comparator] (Function): The comparator invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of intersecting values.

  +/
  auto intersectionWith(T)(auto ref T comparator) 
  {
    setupMemory();
    Command c = Command("intersectionWith");
    if (comparator) c.setCallback(comparator);
    tryPut(c);
    return this;
  }

  /++
    Converts all elements in array into a string separated by separator.
    
    Params:
      - [separator=','] (string): The element separator.

    Returns:
      - Lodash chained on (string): the joined string.

  +/
  auto join(T)(auto ref T separator) 
  {
    setupMemory();
    Command c = Command("join");
    if (separator) c.setString(separator);
    tryPut(c);
    return this;
  }

  
  /++ 
    Gets the last element of array.

    Returns:
      - Lodash chained on (*): the last element of array.
  +/
  auto last()() {
    setupMemory();
    Command c = Command("last");
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.indexOf except that it iterates over elements 
    of array from right to left.

    Params:
      - value (*): The value to search for.
      - [fromIndex=array.length-1] (number): The index to search from.

    Returns:
      - Lodash chained on (number): the index of the matched value, else -1.
  +/
  auto lastIndexOf(T, U = Any)(auto ref T value, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("lastIndexOf");
    c.setAnyValue(value);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    Gets the element at index n of array. If n is negative, the nth element 
    from the end is returned.
    
    Params:
      - [n=0] (number): The index of the element to return.

    Returns:
      - Lodash chained on (*): the nth element of array.
  +/
  auto nth(T = Any)(auto ref T n = null) {
    setupMemory();
    Command c = Command("nth");
    if (n) c.setNumber(n);
    tryPut(c);
    return this;
  }


  /++ 
    Removes all given values from array using SameValueZero for equality 
    comparisons.

    Note: Unlike _.without, this method mutates array. Use _.remove to 
    remove elements from an array by predicate.
    
    Params:
      - [values] (...*): The values to remove.

    Returns:
      - Lodash chained on (Array): array.
  +/
  auto pull(ARGS...)(auto ref ARGS values) {
    setupMemory();
    Command c = Command("pull");
    foreach(ref val; values) c.setAnyValue(val);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.pull except that it accepts an array of values to 
    remove.

    Note: Unlike _.difference, this method mutates array.
    
    Params:
      - values (Array): The values to remove. May be a handle to an array or evaled string

    Returns:
      - Lodash chained on (Array): array.
  +/
  auto pullAll(T)(auto ref T values) {
    setupMemory();
    Command c = Command("pullAll");
    c.setHandleOrEval(values);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.pullAll except that it accepts iteratee which is
    invoked for each element of array and values to generate the criterion 
    by which they're compared. The iteratee is invoked with one argument: 
    (value).

    Note: Unlike _.differenceBy, this method mutates array.
    
    Params:
      - values (Array): The values to remove. May be a handle to an array or evaled string
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): array.
  +/
  auto pullAllBy(T, U = Any)(auto ref T values, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("pullAllBy");
    c.setHandleOrEval(values);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.pullAll except that it accepts iteratee which is
    invoked for each element of array and values to generate the criterion 
    by which they're compared. The iteratee is invoked with one argument: 
    (value).

    Note: Unlike _.differenceWith, this method mutates array.
    
    Params:
      - values (Array): The values to remove. May be a handle to an array or evaled string
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): array.
  +/
  auto pullAllWith(T, U = Any)(auto ref T values, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("pullAllWith");
    c.setHandleOrEval(values);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Removes elements from array corresponding to indexes and returns an 
    array of removed elements.

    Note: Unlike _.at, this method mutates array.
    
    Params:
      - [indexes] (...(number|number[])): The indexes of elements to remove.

    Returns:
      - Lodash chained on (Array): the new array of removed elements.
  +/
  auto pullAt(ARGS...)(auto ref ARGS values) {
    setupMemory();
    Command c = Command("pullAt");
    foreach(ref val; values) c.setNumber(val); // could be a JsHandle to an array too
    tryPut(c);
    return this;
  }

  /++ 
    Removes all elements from array that predicate returns truthy for and 
    returns an array of the removed elements. The predicate is invoked with 
    three arguments: (value, index, array).
    
    Note: Unlike _.filter, this method mutates array. Use _.pull to pull 
    elements from an array by value.
    
    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new array of removed elements.
  +/
  auto remove(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("remove");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Reverses array so that the first element becomes the last, the second 
    element becomes the second to last, and so on.

    Note: This method mutates array and is based on Array#reverse.

    Returns:
      - Lodash chained on (Array): array.
  +/
  auto reverse()() {
    setupMemory();
    Command c = Command("reverse");
    tryPut(c);
    return this;
  }

  /++ 
    Fills elements of array with value from start up to, but not including, end.

    Params:
      - [start=0] (number): The start position.
      - [end=array.length] (number): The end position.

    Returns:
      - Lodash chained on (Array): the slice of array.
  +/
  auto slice(T = Any, U = Any)(auto ref T start = null, auto ref U end = null) {
    setupMemory();
    Command c = Command("slice");
    if (start) c.setNumber(start);
    if (end) c.setNumber(end);
    tryPut(c);
    return this;
  }

  /++ 
    Uses a binary search to determine the lowest index at which value 
    should be inserted into array in order to maintain its sort order.

    Params:
      - value (*): The value to evaluate.

    Returns:
      - Lodash chained on (number): the index at which value should be inserted into array.

  +/
  auto sortedIndex(T)(auto ref T value) {
    setupMemory();
    Command c = Command("sortedIndex");
    c.setAnyValue(value);
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.sortedIndex except that it accepts iteratee which is
    invoked for value and each element of array to compute their sort ranking. 
    The iteratee is invoked with one argument: (value).

    Params:
      - value (*): The value to evaluate.
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (number): the index at which value should be inserted into array.

  +/
  auto sortedIndexBy(T, U)(auto ref T value, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("sortedIndexBy");
    c.setAnyValue(value);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.indexOf except that it performs a binary search on a sorted array.

    Params:
      - value (*): The value to search for.

    Returns:
      - Lodash chained on (number): the index of the matched value, else -1.

  +/
  auto sortedIndexOf(T)(auto ref T value) {
    setupMemory();
    Command c = Command("sortedIndexOf");
    c.setAnyValue(value);
    tryPut(c);
    return this;
  }
  
  /++ 
    This method is like _.sortedIndex except that it returns the highest index 
    at which value should be inserted into array in order to maintain its 
    sort order.

    Params:
      - value (*): The value to evaluate.

    Returns:
      - Lodash chained on (number): the index at which value should be inserted into array.

  +/
  auto sortedLastIndex(T)(auto ref T value) {
    setupMemory();
    Command c = Command("sortedLastIndex");
    c.setAnyValue(value);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.sortedLastIndex except that it accepts iteratee 
    which is invoked for value and each element of array to compute their 
    sort ranking. The iteratee is invoked with one argument: (value).

    Params:
      - value (*): The value to evaluate.
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (number): the index at which value should be inserted into array.

  +/
  auto sortedLastIndexBy(T, U)(auto ref T value, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("sortedLastIndexBy");
    c.setAnyValue(value);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.lastIndexOf except that it performs a binary search on a sorted array.

    Params:
      - value (*): The value to search for.

    Returns:
      - Lodash chained on (number): the index of the matched value, else -1.

  +/
  auto sortedLastIndexOf(T)(auto ref T value) {
    setupMemory();
    Command c = Command("sortedLastIndexOf");
    c.setAnyValue(value);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.uniq except that it's designed and optimized for sorted arrays.
    
    Returns:
      - Lodash chained on (Array): the new duplicate free array.

  +/
  auto sortedUniq()() {
    setupMemory();
    Command c = Command("sortedUniq");
    tryPut(c);
    return this;
  }
  
  /++ 
    This method is like _.uniqBy except that it's designed and optimized for sorted arrays.

    Params: 
      - [iteratee] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new duplicate free array.

  +/
  auto sortedUniqBy(T)(auto ref T iteratee) {
    setupMemory();
    Command c = Command("sortedUniqBy");
    c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++ 
    Gets all but the first element of array.

    Returns:
      - Lodash chained on (Array): the slice of array.

  +/
  auto tail()() {
    setupMemory();
    Command c = Command("tail");
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array with n elements taken from the beginning.

    Params: 
      - [n=1] (number): The number of elements to take.

    Returns:
      - Lodash chained on (Array): the slice of array.

  +/
  auto take(T = Any)(auto ref T n = null) {
    setupMemory();
    Command c = Command("take");
    if (n) c.setNumber(n);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array with n elements taken from the end.

    Params: 
      - [n=1] (number): The number of elements to take.

    Returns:
      - Lodash chained on (Array): the slice of array.

  +/
  auto takeRight(T = Any)(auto ref T n = null) {
    setupMemory();
    Command c = Command("takeRight");
    if (n) c.setNumber(n);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array with elements taken from the end. 
    Elements are taken until predicate returns falsey. 
    The predicate is invoked with three arguments: (value, index, array).

    Params: 
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the slice of array.

  +/
  auto takeRightWhile(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("takeRightWhile");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a slice of array with elements taken from the beginning. 
    Elements are taken until predicate returns falsey. 
    The predicate is invoked with three arguments: (value, index, array).

    Params: 
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the slice of array.

  +/
  auto takeWhile(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("takeWhile");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of unique values, in order, from all given arrays using 
    SameValueZero for equality comparisons.
    
    Params:
      - [arrays] (...Array): The arrays to inspect.

    Returns:
      - Lodash chained on (Array): the new array of combined values.
  +/
  auto union_(ARGS...)(auto ref ARGS values) {
    setupMemory();
    Command c = Command("union");
    foreach(ref val; values) c.setHandleOrEval(val); // could be a JsHandle to an array too
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.union except that it accepts iteratee which is 
    invoked for each element of each arrays to generate the criterion by 
    which uniqueness is computed. Result values are chosen from the first 
    array in which the value occurs. The iteratee is invoked with one argument:
    (value).
    
    Params:
      - [arrays] (...Array): The arrays to inspect.
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of combined values.
  +/
  auto unionBy(T)(auto ref T values, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("unionBy");
    c.setHandleOrEval(values);
    if (iteratee) c.setHandleOrEval(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.union except that it accepts comparator which is 
    invoked to compare elements of arrays. Result values are chosen from 
    the first array in which the value occurs. The comparator is invoked 
    with two arguments: (arrVal, othVal).
    
    Params:
      - [arrays] (...Array): The arrays to inspect.
      - [comparator] (Function): The comparator invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of combined values.
  +/
  auto unionWith(T)(auto ref T values, auto ref U comparator = null) {
    setupMemory();
    Command c = Command("unionWith");
    c.setHandleOrEval(values);
    if (comparator) c.setHandleOrEval(comparator);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a duplicate-free version of an array, using SameValueZero for 
    equality comparisons, in which only the first occurrence of each element 
    is kept. The order of result values is determined by the order they occur
    in the array.

    Returns:
      - Lodash chained on (Array): the new duplicate free array.

  +/
  auto uniq()() {
    setupMemory();
    Command c = Command("uniq");
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.uniq except that it accepts iteratee which is 
    invoked for each element in array to generate the criterion by which 
    uniqueness is computed. The order of result values is determined by 
    the order they occur in the array. The iteratee is invoked with one 
    argument: (value).

    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new duplicate free array.

  +/
  auto uniqBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("uniqBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.uniq except that it accepts comparator which is 
    invoked to compare elements of array. The order of result values is 
    determined by the order they occur in the array.The comparator is 
    invoked with two arguments: (arrVal, othVal).

    Params:
      - [comparator] (Function): The comparator invoked per element.

    Returns:
      - Lodash chained on (Array): the new duplicate free array.

  +/
  auto uniqWith(T)(auto ref T comparator = null) {
    setupMemory();
    Command c = Command("uniqWith");
    c.setCallback(comparator);
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.zip except that it accepts an array of grouped 
    elements and creates an array regrouping the elements to their pre-zip 
    configuration.

    Returns:
      - Lodash chained on (Array): the new array of regrouped elements.

  +/
  auto unzip()() {
    setupMemory();
    Command c = Command("unzip");
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.unzip except that it accepts iteratee to specify 
    how regrouped values should be combined. The iteratee is invoked with 
    the elements of each group: (...group).

    Params:
      - [iteratee=_.identity] (Function): The function to combine regrouped values.

    Returns:
      - Lodash chained on (Array): the new array of regrouped elements.

  +/
  auto unzipWith(T)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("unzipWith");
    c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.unzip except that it accepts iteratee to specify 
    how regrouped values should be combined. The iteratee is invoked with 
    the elements of each group: (...group).

    Params:
      - [values] (...*): The values to exclude.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto without(ARGS...)(auto ref ARGS values) {
    setupMemory();
    Command c = Command("without");
    foreach(ref val; values) c.setAnyValue(val);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of unique values that is the symmetric difference of 
    the given arrays. The order of result values is determined by the order
    they occur in the arrays.

    Params:
      - [arrays] (...Array): The arrays to inspect.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto xor(ARGS...)(auto ref ARGS arrays) {
    setupMemory();
    Command c = Command("xor");
    foreach(ref val; arrays) c.setHandleOrEval(val);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.xor except that it accepts iteratee which is 
    invoked for each element of each arrays to generate the criterion by 
    which by which they're compared. The order of result values is 
    determined by the order they occur in the arrays. The iteratee is 
    invoked with one argument: (value).

    Params:
      - [arrays] (...Array): The arrays to inspect.
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto xorBy(T, U = Any)(auto ref T values, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("xorBy");
    c.setHandleOrEval(values);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.xor except that it accepts comparator which is 
    invoked to compare elements of arrays. The order of result values is
    determined by the order they occur in the arrays. The comparator is 
    invoked with two arguments: (arrVal, othVal).

    Params:
      - [arrays] (...Array): The arrays to inspect.
      - [comparator] (Function): The comparator invoked per element.

    Returns:
      - Lodash chained on (Array): the new array of filtered values.

  +/
  auto xorWith(T, U)(auto ref T values, auto ref U comparator) {
    setupMemory();
    Command c = Command("xorWith");
    c.setHandleOrEval(values);
    c.setCallback(comparator);
    tryPut(c);
    return this;
  }

  
  /++ 
    Creates an array of grouped elements, the first of which contains the 
    first elements of the given arrays, the second of which contains the 
    second elements of the given arrays, and so on.

    Params:
      - [arrays] (...Array): The arrays to process.

    Returns:
      - Lodash chained on (Array): the new array of grouped elements.

  +/
  auto zip(ARGS...)(auto ref ARGS arrays) {
    setupMemory();
    Command c = Command("zip");
    foreach(ref val; arrays) c.setHandleOrEval(val);
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.fromPairs except that it accepts two arrays, 
    one of property identifiers and one of corresponding values.

    Params:
      - [values=[]] (Array): The property values.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto zipObject(T)(auto ref T values) {
    setupMemory();
    Command c = Command("zipObject");
    c.setHandleOrEval(values);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.zipObject except that it supports property paths.

    Params:
      - [values=[]] (Array): The property values.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto zipObjectDeep(T)(auto ref T values) {
    setupMemory();
    Command c = Command("zipObjectDeep");
    c.setHandleOrEval(values);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.zip except that it accepts iteratee to specify 
    how grouped values should be combined. The iteratee is invoked with 
    the elements of each group: (...group).

    Params:
      - [arrays] (...Array): The arrays to process.
      - [iteratee=_.identity] (Function): The function to combine grouped values.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto zipWith(T, U = Any)(auto ref T arrays, auto ref U iteratee = null) {
    setupMemory();
    Command c = Command("zipWith");
    c.setHandleOrEval(arrays);
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an object composed of keys generated from the results of running 
    each element of collection thru iteratee. The corresponding value of 
    each key is the number of times the key was returned by iteratee. The iteratee is invoked with one argument: (value).

    Params:
      - [iteratee=_.identity] (Function): The iteratee to transform keys.

    Returns:
      - Lodash chained on (Object): the composed aggregate object.

  +/
  auto countBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("countBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Checks if predicate returns truthy for all elements of collection. 
    Iteration is stopped once predicate returns falsey. The predicate is 
    invoked with three arguments: (value, index|key, collection).

    Note: This method returns true for empty collections because everything
    is true of elements of empty collections.

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (boolean): true if all elements pass the predicate check, else false.

  +/
  auto every(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("every");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Iterates over elements of collection, returning an array of all elements 
    predicate returns truthy for. The predicate is invoked with three 
    arguments: (value, index|key, collection).

    Note: Unlike _.remove, this method returns a new array.

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new filtered array.

  +/
  auto filter(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("filter");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Iterates over elements of collection, returning the first element 
    predicate returns truthy for. The predicate is invoked with three 
    arguments: (value, index|key, collection).

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.
      - [fromIndex=0] (number): The index to search from.

    Returns:
      - Lodash chained on (*): the matched element, else undefined.

  +/
  auto find(T = Any, U = Any)(auto ref T predicate = null, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("find");
    if (predicate) c.setCallback(predicate);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.find except that it iterates over elements of 
    collection from right to left.

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.
      - [fromIndex=collection.length-1] (number): The index to search from.

    Returns:
      - Lodash chained on (*): the matched element, else undefined.

  +/
  auto findLast(T = Any, U = Any)(auto ref T predicate = null, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("findLast");
    if (predicate) c.setCallback(predicate);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    Creates a flattened array of values by running each element in collection
    thru iteratee and flattening the mapped results. The iteratee is invoked 
    with three arguments: (value, index|key, collection).

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new flattened array.

  +/
  auto flatMap(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("flatMap");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.flatMap except that it recursively flattens the 
    mapped results.

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new flattened array.

  +/
  auto flatMapDeep(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("flatMapDeep");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.flatMap except that it recursively flattens the 
    mapped results up to depth times.

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.
      - [depth=1] (number): The maximum recursion depth.

    Returns:
      - Lodash chained on (Array): the new flattened array.

  +/
  auto flatMapDepth(T = Any, U = Any)(auto ref T iteratee = null, auto ref U depth = null) {
    setupMemory();
    Command c = Command("flatMapDepth");
    if (iteratee) c.setCallback(iteratee);
    if (depth) c.setNumber(depth);
    tryPut(c);
    return this;
  }

  
  /++ 
    Iterates over elements of collection and invokes iteratee for each 
    element. The iteratee is invoked with three arguments: 
    (value, index|key, collection). Iteratee functions may exit iteration 
    early by explicitly returning false.

    Note: As with other "Collections" methods, objects with a "length" 
    property are iterated like arrays. To avoid this behavior use _.forIn 
    or _.forOwn for object iteration.

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (*): collection.

  +/
  auto forEach(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forEach");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    This method is like _.forEach except that it iterates over elements of 
    collection from right to left.

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (*): collection.

  +/
  auto forEachRight(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forEachRight");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    Creates an object composed of keys generated from the results of running 
    each element of collection thru iteratee. The order of grouped values is 
    determined by the order they occur in collection. The corresponding value
    of each key is an array of elements responsible for generating the key.
    The iteratee is invoked with one argument: (value).

    Params:
      - [iteratee=_.identity] (Function): The iteratee to transform keys.

    Returns:
      - Lodash chained on (Object): the composed aggregate object.

  +/
  auto groupBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("groupBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is in collection. If collection is a string, it's checked 
    for a substring of value, otherwise SameValueZero is used for equality 
    comparisons. If fromIndex is negative, it's used as the offset from the 
    end of collection.

    Params:
      - value (*): The value to search for.
      - [fromIndex=0] (number): The index to search from.

    Returns:
      - Lodash chained on (boolean): true if value is found, else false.

  +/
  auto includes(T, U = Any)(auto ref T value, auto ref U fromIndex = null) {
    setupMemory();
    Command c = Command("includes");
    c.setAnyValue(value);
    if (fromIndex) c.setNumber(fromIndex);
    tryPut(c);
    return this;
  }

  /++ 
    Invokes the method at path of each element in collection, returning an 
    array of the results of each invoked method. Any additional arguments 
    are provided to each invoked method. If path is a function, it's invoked 
    for, and this bound to, each element in collection.

    Params:
      - path (Array|Function|string): The path of the method to invoke or the function invoked per iteration.
      - [args] (...*): The arguments to invoke each method with.

    Returns:
      - Lodash chained on (Array): the array of results.

  +/
  auto invokeMap(T, U = Any)(auto ref T path, auto ref U args = null) {
    setupMemory();
    Command c = Command("invokeMap");
    c.setAnyValue(path);
    if (args) c.setAnyValue(args);
    tryPut(c);
    return this;
  }


  /++ 
    Creates an object composed of keys generated from the results of running 
    each element of collection thru iteratee. The corresponding value of 
    each key is the last element responsible for generating the key. The 
    iteratee is invoked with one argument: (value).

    Params:
      - [iteratee=_.identity] (Function): The iteratee to transform keys.

    Returns:
      - Lodash chained on (Object): the composed aggregate object.

  +/
  auto keyBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("keyBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of values by running each element in collection thru 
    iteratee. The iteratee is invoked with three arguments: 
    (value, index|key, collection).

    Many lodash methods are guarded to work as iteratees for methods like 
    _.every, _.filter, _.map, _.mapValues, _.reject, and _.some.

    The guarded methods are:
    ary, chunk, curry, curryRight, drop, dropRight, every, fill, invert, 
    parseInt, random, range, rangeRight, repeat, sampleSize, slice, some, 
    sortBy, split, take, takeRight, template, trim, trimEnd, trimStart, 
    and words

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): the composed aggregate object.

  +/
  auto map(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("map");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++ 
    This method is like _.sortBy except that it allows specifying the sort 
    orders of the iteratees to sort by. If orders is unspecified, all values 
    are sorted in ascending order. Otherwise, specify an order of "desc" for 
    descending or "asc" for ascending sort order of corresponding values.

    Params:
      - [iteratees=[_.identity]] (Array[]|Function[]|Object[]|string[]): The iteratees to sort by.
      - [orders] (string[]): The sort orders of iteratees.

    Returns:
      - Lodash chained on (Array): the new sorted array.

  +/
  auto orderBy(T, U)(auto ref T iteratees, auto ref U orders) {
    setupMemory();
    Command c = Command("orderBy");
    c.setCallback(iteratees);
    c.setHandleOrEval(orders);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of elements split into two groups, the first of which 
    contains elements predicate returns truthy for, the second of which 
    contains elements predicate returns falsey for. The predicate is invoked 
    with one argument: (value).

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): the array of grouped elements.

  +/
  auto partition(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("partition");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    Reduces collection to a value which is the accumulated result of running 
    each element in collection thru iteratee, where each successive invocation
     is supplied the return value of the previous. If accumulator is not 
     given, the first element of collection is used as the initial value. 
     The iteratee is invoked with four arguments:
      (accumulator, value, index|key, collection).

    Many lodash methods are guarded to work as iteratees for methods like
     _.reduce, _.reduceRight, and _.transform.

    The guarded methods are:
    assign, defaults, defaultsDeep, includes, merge, orderBy, and sortBy

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.
      - [accumulator] (*): The initial value.

    Returns:
      - Lodash chained on (*): the accumulated value.

  +/
  auto reduce(T, U)(auto ref T iteratee, auto ref U accumulator) {
    setupMemory();
    Command c = Command("reduce");
    c.setCallback(iteratee);
    c.setHandleOrEval(orders);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.reduce except that it iterates over elements of collection from right to left.

    Params:
      - [iteratee=_.identity] (Function): The function invoked per iteration.
      - [accumulator] (*): The initial value.

    Returns:
      - Lodash chained on (*): the accumulated value.

  +/
  auto reduceRight(T, U)(auto ref T iteratee, auto ref U accumulator) {
    setupMemory();
    Command c = Command("reduceRight");
    c.setCallback(iteratee);
    c.setHandleOrEval(orders);
    tryPut(c);
    return this;
  }

  /++ 
    The opposite of _.filter; this method returns the elements of collection that predicate does not return truthy for.

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new filtered array.

  +/
  auto reject(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("reject");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }


  /++ 
    Gets a random element from collection.

    Returns:
      - Lodash chained on (*): the random element.

  +/
  auto sample()() {
    setupMemory();
    Command c = Command("sample");
    tryPut(c);
    return this;
  }

  /++ 
    Gets n random elements at unique keys from collection up to the size of collection.

    Params:
      - [n=1] (number): The number of elements to sample.

    Returns:
      - Lodash chained on (Array): the random elements.

  +/
  auto sampleSize(T = Any)(auto ref T n = null) {
    setupMemory();
    Command c = Command("sampleSize");
    if (n) c.setNumber(n);
    tryPut(c);
    return this;
  }
  
  /++ 
    Creates an array of shuffled values, using a version of the
    Fisher-Yates shuffle.

    Returns:
      - Lodash chained on (Array): the new shuffled array.

  +/
  auto shuffle()() {
    setupMemory();
    Command c = Command("shuffle");
    tryPut(c);
    return this;
  }

  /++ 
    Gets the size of collection by returning its length for array-like values 
    or the number of own enumerable string keyed properties for objects.

    Returns:
      - Lodash chained on (number): the collection size.

  +/
  auto size()() {
    setupMemory();
    Command c = Command("size");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if predicate returns truthy for any element of collection. 
    Iteration is stopped once predicate returns truthy. The predicate is 
    invoked with three arguments: (value, index|key, collection).

    Params:
      - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Array): the new filtered array.

  +/
  auto some(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("some");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
    Creates an array of elements, sorted in ascending order by the results 
    of running each element in a collection thru each iteratee. This 
    method performs a stable sort, that is, it preserves the original 
    sort order of equal elements. The iteratees are invoked with one 
    argument: (value).

    Params:
      - [iteratees=[_.identity]] (...(Function|Function[])): The iteratees to sort by.

    Returns:
      - Lodash chained on (Array): the new sorted array.

  +/
  auto sortBy(ARGS...)(auto ref ARGS iteratees) {
    setupMemory();
    Command c = Command("sortBy");
    foreach (ref iteratee; iteratees) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  
  /++ 
    Gets the timestamp of the number of milliseconds that have elapsed since 
    the Unix epoch (1 January 1970 00:00:00 UTC).

    Returns:
      - Lodash chained on (number): the timestamp.

  +/
  auto now()() {
    setupMemory();
    Command c = Command("now");
    tryPut(c);
    return this;
  }

  /++ 
    Gets the timestamp of the number of milliseconds that have elapsed since 
    the Unix epoch (1 January 1970 00:00:00 UTC).

    Returns:
      - Lodash chained on (Array): the cast array.

  +/
  auto castArray()() {
    setupMemory();
    Command c = Command("castArray");
    tryPut(c);
    return this;
  }

  /++ 
    Creates a shallow clone of value.

    Note: This method is loosely based on the structured clone algorithm and 
    supports cloning arrays, array buffers, booleans, date objects, maps, 
    numbers, Object objects, regexes, sets, strings, symbols, and typed arrays. The own enumerable properties of arguments objects are cloned as plain objects. An empty object is returned for uncloneable values such as error objects, functions, DOM nodes, and WeakMaps.

    Returns:
      - Lodash chained on (*): the cloned value

  +/
  auto clone()() {
    setupMemory();
    Command c = Command("clone");
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.clone except that it recursively clones value.

    Returns:
      - Lodash chained on (*): the deep cloned value.

  +/
  auto cloneDeep()() {
    setupMemory();
    Command c = Command("cloneDeep");
    tryPut(c);
    return this;
  }
  
  /++ 
    This method is like _.cloneWith except that it recursively clones value.

    Params:
      - [customizer] (Function): The function to customize cloning.

    Returns:
      - Lodash chained on (*): the deep cloned value.

  +/
  auto cloneDeepWith(T)(auto ref T customizer) {
    setupMemory();
    Command c = Command("cloneDeepWith");
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }
  
  /++ 
    This method is like _.clone except that it accepts customizer which is 
    invoked to produce the cloned value. If customizer returns undefined, 
    cloning is handled by the method instead. The customizer is invoked 
    with up to four arguments; (value [, index|key, object, stack]).

    Params:
      - [customizer] (Function): The function to customize cloning.

    Returns:
      - Lodash chained on (*): the cloned value.

  +/
  auto cloneWith(T)(auto ref T customizer) {
    setupMemory();
    Command c = Command("cloneWith");
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }

  /++ 
    Checks if object conforms to source by invoking the predicate properties
    of source with the corresponding property values of object.

    Note: This method is equivalent to _.conforms when source is partially 

    Params:
      - source (Object): The object of property predicates to conform to.

    Returns:
      - Lodash chained on (boolean): true if object conforms, else false.

  +/
  auto conformsTo(T)(auto ref T source) {
    setupMemory();
    Command c = Command("conformsTo");
    c.setHandleOrEval(source);
    tryPut(c);
    return this;
  }
  
  /++ 
    Performs a SameValueZero comparison between two values to determine if they are equivalent.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if the values are equivalent, else false.

  +/
  auto eq(T)(auto ref T other) {
    setupMemory();
    Command c = Command("eq");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }
  
  /++ 
    Checks if value is greater than other.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if value is greater than other, else false.

  +/
  auto gt(T)(auto ref T other) {
    setupMemory();
    Command c = Command("gt");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is greater than or equal to other.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if value is greater than or equal to other, else false.

  +/
  auto gte(T)(auto ref T other) {
    setupMemory();
    Command c = Command("gte");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is likely an arguments object.

    Returns:
      - Lodash chained on (boolean): true if value is an arguments object, else false.

  +/
  auto isArguments()() {
    setupMemory();
    Command c = Command("isArguments");
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is classified as an Array object.

    Returns:
      - Lodash chained on (boolean): true if value is an array, else false.

  +/
  auto isArray()() {
    setupMemory();
    Command c = Command("isArray");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as an ArrayBuffer object.

    Returns:
      - Lodash chained on (boolean): true if value is an array buffer, else false.

  +/
  auto isArrayBuffer()() {
    setupMemory();
    Command c = Command("isArrayBuffer");
    tryPut(c);
    return this;
  }
  
  /++ 
    Checks if value is array-like. A value is considered array-like if it's not a 
    function and has a value.length that's an integer greater than or equal to 0 
    and less than or equal to Number.MAX_SAFE_INTEGER.

    Returns:
      - Lodash chained on (boolean): true if value is array-like, else false.

  +/
  auto isArrayLike()() {
    setupMemory();
    Command c = Command("isArrayLike");
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.isArrayLike except that it also checks if value is an object.

    Returns:
      - Lodash chained on (boolean): true if value is an array-like object, else false.

  +/
  auto isArrayLikeObject()() {
    setupMemory();
    Command c = Command("isArrayLikeObject");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as a boolean primitive or object.

    Returns:
      - Lodash chained on (boolean): true if value is a boolean, else false.

  +/
  auto isBoolean()() {
    setupMemory();
    Command c = Command("isBoolean");
    tryPut(c);
    return this;
  }
  
  /++ 
    Checks if value is a buffer.

    Returns:
      - Lodash chained on (boolean): true if value is a buffer, else false.

  +/
  auto isBuffer()() {
    setupMemory();
    Command c = Command("isBuffer");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as a Date object.

    Returns:
      - Lodash chained on (boolean): true if value is a date object, else false.

  +/
  auto isDate()() {
    setupMemory();
    Command c = Command("isDate");
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is likely a DOM element.

    Returns:
      - Lodash chained on (boolean): true if value is a DOM element, else false.

  +/
  auto isElement()() {
    setupMemory();
    Command c = Command("isElement");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is an empty object, collection, map, or set.

    Objects are considered empty if they have no own enumerable string keyed properties.

    Array-like values such as arguments objects, arrays, buffers, strings, or 
    jQuery-like collections are considered empty if they have a length of 0. Similarly, 
    maps and sets are considered empty if they have a size of 0.

    Returns:
      - Lodash chained on (boolean): true if value is empty, else false.

  +/
  auto isEmpty()() {
    setupMemory();
    Command c = Command("isEmpty");
    tryPut(c);
    return this;
  }
  
  /++ 
    Performs a deep comparison between two values to determine if they are equivalent.

    Note: This method supports comparing arrays, array buffers, booleans, date objects,
     error objects, maps, numbers, Object objects, regexes, sets, strings, symbols, and 
     typed arrays. Object objects are compared by their own, not inherited, enumerable 
     properties. Functions and DOM nodes are compared by strict equality, i.e. ===.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if the values are equivalent, else false.

  +/
  auto isEqual(T)(auto ref T other) {
    setupMemory();
    Command c = Command("isEqual");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.isEqual except that it accepts customizer which is 
    invoked to compare values. If customizer returns undefined, comparisons 
    are handled by the method instead. The customizer is invoked with up to 
    six arguments: (objValue, othValue [, index|key, object, other, stack]).

    Params:
      - other (*): The other value to compare.
      - [customizer] (Function): The function to customize comparisons.

    Returns:
      - Lodash chained on (boolean): true if the values are equivalent, else false.

  +/
  auto isEqualWith(T, U)(auto ref T other, auto ref U customizer) {
    setupMemory();
    Command c = Command("isEqual");
    c.setAnyValue(other);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is an Error, EvalError, RangeError, ReferenceError, 
    SyntaxError, TypeError, or URIError object.

    Returns:
      - Lodash chained on (boolean): true if value is an error object, else false.

  +/
  auto isError()() {
    setupMemory();
    Command c = Command("isError");
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is a finite primitive number.

    Returns:
      - Lodash chained on (boolean): true if value is a finite number, else false.

  +/
  auto isFinite()() {
    setupMemory();
    Command c = Command("isFinite");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as a Function object.

    Returns:
      - Lodash chained on (boolean): true if value is a function, else false.

  +/
  auto isFunction()() {
    setupMemory();
    Command c = Command("isFunction");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is an integer.

    Returns:
      - Lodash chained on (boolean): true if value is an integer, else false.

  +/
  auto isInteger()() {
    setupMemory();
    Command c = Command("isInteger");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is a valid array-like length.

    Note: This method is loosely based on ToLength.

    Returns:
      - Lodash chained on (boolean): true if value is a valid length, else false.

  +/
  auto isLength()() {
    setupMemory();
    Command c = Command("isLength");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a Map object.

    Note: This method is loosely based on ToLength.

    Returns:
      - Lodash chained on (boolean): true if value is a map, else false.

  +/
  auto isMap()() {
    setupMemory();
    Command c = Command("isMap");
    tryPut(c);
    return this;
  }


  /++ 
    Performs a partial deep comparison between object and source to 
    determine if object contains equivalent property values.

    Note: This method is equivalent to _.matches when source is partially 
    applied.

    Partial comparisons will match empty array and empty object source values 
    against any array or object value, respectively. See _.isEqual for a list
    of supported value comparisons.

    Params:
      - source (Object): The object of property values to match.

    Returns:
      - Lodash chained on (boolean): true if object is a match, else false.

  +/
  auto isMatch(T)(auto ref T other) {
    setupMemory();
    Command c = Command("isMatch");
    c.setHandleOrEval(other);
    tryPut(c);
    return this;
  }
  /++ 
    This method is like _.isMatch except that it accepts customizer which is 
    invoked to compare values. If customizer returns undefined, comparisons 
    are handled by the method instead. The customizer is invoked with five 
    arguments: (objValue, srcValue, index|key, object, source).

    Params:
      - source (Object): The object of property values to match.
      - [customizer] (Function): The function to customize comparisons.

    Returns:
      - Lodash chained on (boolean): true if object is a match, else false.

  +/
  auto isMatchWith(T, U)(auto ref T other, auto ref U customizer) {
    setupMemory();
    Command c = Command("isMatchWith");
    c.setHandleOrEval(other);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }
  
  /++ 
    Checks if value is NaN.

    Note: This method is based on Number.isNaN and is not the same as 
    global isNaN which returns true for undefined and other non-number 
    values.

    Returns:
      - Lodash chained on (boolean): true if value is NaN, else false.

  +/
  auto isNaN()() {
    setupMemory();
    Command c = Command("isNaN");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is a pristine native function.

    Note: This method can't reliably detect native functions in the 
    presence of the core-js package because core-js circumvents this
     kind of detection. Despite multiple requests, the core-js 
     maintainer has made it clear: any attempt to fix the detection 
     will be obstructed. As a result, we're left with little choice 
     but to throw an error. Unfortunately, this also affects packages, 
     like babel-polyfill, which rely on core-js.

    Returns:
      - Lodash chained on (boolean): true if value is a native function, else false.

  +/
  auto isNative()() {
    setupMemory();
    Command c = Command("isNative");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is null or undefined.

    Returns:
      - Lodash chained on (boolean): true if value is nullish, else false.

  +/
  auto isNil()() {
    setupMemory();
    Command c = Command("isNil");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is null or undefined.

    Returns:
      - Lodash chained on (boolean): true if value is null, else false.

  +/
  auto isNull()() {
    setupMemory();
    Command c = Command("isNull");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a Number primitive or object.

    Note: To exclude Infinity, -Infinity, and NaN, which are classified 
    as numbers, use the _.isFinite method.

    Returns:
      - Lodash chained on (boolean): true if value is a number, else false.

  +/
  auto isNumber()() {
    setupMemory();
    Command c = Command("isNumber");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is the language type of Object. 
    (e.g. arrays, functions, objects, regexes, new Number(0), and new String(''))

    Returns:
      - Lodash chained on (boolean): true if value is an object, else false.

  +/
  auto isObject()() {
    setupMemory();
    Command c = Command("isObject");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is object-like. A value is object-like if it's not 
    null and has a typeof result of "object".

    Returns:
      - Lodash chained on (boolean): true if value is object-like, else false.

  +/
  auto isObjectLike()() {
    setupMemory();
    Command c = Command("isObjectLike");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is a plain object, that is, an object created by the Object 
    constructor or one with a [[Prototype]] of null.

    Returns:
      - Lodash chained on (boolean): true if value is a plain object, else false.

  +/
  auto isPlainObject()() {
    setupMemory();
    Command c = Command("isPlainObject");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a RegExp object.

    Returns:
      - Lodash chained on (boolean): true if value is a regexp, else false.

  +/
  auto isRegExp()() {
    setupMemory();
    Command c = Command("isRegExp");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is a safe integer. An integer is safe if it's an IEEE-754 
    double precision number which isn't the result of a rounded unsafe integer.
    
    Note: This method is based on Number.isSafeInteger.
    
    Returns:
      - Lodash chained on (boolean): true if value is a safe integer, else false.

  +/
  auto isSafeInteger()() {
    setupMemory();
    Command c = Command("isSafeInteger");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a Set object.
    
    Returns:
      - Lodash chained on (boolean): true if value is a set, else false.

  +/
  auto isSet()() {
    setupMemory();
    Command c = Command("isSet");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as a String primitive or object.
    
    Returns:
      - Lodash chained on (boolean): true if value is a string, else false.

  +/
  auto isString()() {
    setupMemory();
    Command c = Command("isString");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a Symbol primitive or object.
    
    Returns:
      - Lodash chained on (boolean): true if value is a symbol, else false.

  +/
  auto isSymbol()() {
    setupMemory();
    Command c = Command("isSymbol");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a typed array.
    
    Returns:
      - Lodash chained on (boolean): true if value is a typed array, else false.

  +/
  auto isTypedArray()() {
    setupMemory();
    Command c = Command("isTypedArray");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is undefined.
    
    Returns:
      - Lodash chained on (boolean): true if value is undefined, else false.

  +/
  auto isUndefined()() {
    setupMemory();
    Command c = Command("isUndefined");
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is classified as a WeakMap object.
    
    Returns:
      - Lodash chained on (boolean): true if value is a weak map, else false.

  +/
  auto isWeakMap()() {
    setupMemory();
    Command c = Command("isWeakMap");
    tryPut(c);
    return this;
  }

  /++ 
    Checks if value is classified as a WeakSet object.
    
    Returns:
      - Lodash chained on (boolean): true if value is a weak set, else false.

  +/
  auto isWeakSet()() {
    setupMemory();
    Command c = Command("isWeakSet");
    tryPut(c);
    return this;
  }


  /++ 
    Checks if value is less than other.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if value is less than other, else false.

  +/
  auto lt(T)(auto ref T other) {
    setupMemory();
    Command c = Command("lt");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }
  /++ 
    Checks if value is less than or equal to other.

    Params:
      - other (*): The other value to compare.

    Returns:
      - Lodash chained on (boolean): true if value is less than or equal to other, else false.

  +/
  auto lte(T)(auto ref T other) {
    setupMemory();
    Command c = Command("lte");
    c.setAnyValue(other);
    tryPut(c);
    return this;
  }


  /++ 
    Converts value to an array.
      _.toArray({ 'a': 1, 'b': 2 });
      // => [1, 2]
      
      _.toArray('abc');
      // => ['a', 'b', 'c']
      
      _.toArray(1);
      // => []
    Returns:
      - Lodash chained on (Array): the converted array.

  +/
  auto toArray()() {
    setupMemory();
    Command c = Command("toArray");
    tryPut(c);
    return this;
  }
  /++ 
    Converts value to a finite number.

      _.toFinite(Number.MIN_VALUE);
      // => 5e-324
      
      _.toFinite(Infinity);
      // => 1.7976931348623157e+308

    Returns:
      - Lodash chained on (number): the converted number.

  +/
  auto toFinite()() {
    setupMemory();
    Command c = Command("toFinite");
    tryPut(c);
    return this;
  }
  /++ 
    Converts value to an integer.

      _.toInteger(Number.MIN_VALUE);
      // => 0
      _.toInteger(Infinity);
      // => 1.7976931348623157e+308

    Returns:
      - Lodash chained on (number):  the converted integer.

  +/
  auto toInteger()() {
    setupMemory();
    Command c = Command("toInteger");
    tryPut(c);
    return this;
  }
  /++ 
    Converts value to an integer suitable for use as the length of an array-like object.
    
    Note: This method is based on ToLength.
      
      _.toLength(Number.MIN_VALUE);
      // => 0

      _.toLength(Infinity);
      // => 4294967295

    Returns:
      - Lodash chained on (number):  the converted integer.

  +/
  auto toLength()() {
    setupMemory();
    Command c = Command("toLength");
    tryPut(c);
    return this;
  }

  /++ 
    Converts value to a number.
    
    Note: This method is based on ToLength.

      _.toNumber(Number.MIN_VALUE);
      // => 5e-324

      _.toNumber(Infinity);
      // => Infinity

    Returns:
      - Lodash chained on (number): the number.

  +/
  auto toNumber()() {
    setupMemory();
    Command c = Command("toNumber");
    tryPut(c);
    return this;
  }
  /++ 
    Converts value to a plain object flattening inherited enumerable string 
    keyed properties of value to own properties of the plain object.
    
      function Foo() {
        this.b = 2;
      }
      
      Foo.prototype.c = 3;
      
      _.assign({ 'a': 1 }, new Foo);
      // => { 'a': 1, 'b': 2 }
      
      _.assign({ 'a': 1 }, _.toPlainObject(new Foo));
      // => { 'a': 1, 'b': 2, 'c': 3 }
      
    Returns:
      - Lodash chained on (Object): the converted plain object.

  +/
  auto toPlainObject()() {
    setupMemory();
    Command c = Command("toPlainObject");
    tryPut(c);
    return this;
  }
  /++ 
    Converts value to a safe integer. A safe integer can be compared and 
    represented correctly.
    
      _.toSafeInteger(Number.MIN_VALUE);
      // => 0

      _.toSafeInteger(Infinity);
      // => 9007199254740991
      
    Returns:
      - Lodash chained on (number): the converted integer.

  +/
  auto toSafeInteger()() {
    setupMemory();
    Command c = Command("toSafeInteger");
    tryPut(c);
    return this;
  }

  /++ 
    
    Converts value to a string. An empty string is returned for null 
    and undefined values. The sign of -0 is preserved.        
      
    Returns:
      - Lodash chained on (string): the converted string.

  +/
  auto toString()() {
    setupMemory();
    Command c = Command("toString");
    tryPut(c);
    return this;
  }

  /++ 
    
    Adds two numbers.
      
      Params:
      - (number): The second number in an addition.

    Returns:
      - Lodash chained on (number): the total.

  +/
  auto add(T)(auto ref T other) {
    setupMemory();
    Command c = Command("number");
    c.setNumber(other);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes number rounded up to precision.
      
      Params:
      - [precision=0] (number): The precision to round up to.

    Returns:
      - Lodash chained on (number): the rounded up number.

  +/
  auto ceil(T = Any)(auto ref T precision = null) {
    setupMemory();
    Command c = Command("ceil");
    if (precision) c.setNumber(precision);
    tryPut(c);
    return this;
  }

  /++ 
    
    Divide two numbers.
      
      Params:
      - (number): The second number in a division.

    Returns:
      - Lodash chained on (number): the quotient.

  +/
  auto divide(T)(auto ref T other) {
    setupMemory();
    Command c = Command("divide");
    c.setNumber(other);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes number rounded down to precision.
      
      Params:
      - [precision=0] (number): The precision to round down to.

    Returns:
      - Lodash chained on (number): the rounded down number.

  +/
  auto floor(T = Any)(auto ref T precision = null) {
    setupMemory();
    Command c = Command("floor");
    if (precision) c.setNumber(precision);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes the maximum value of array. If array is empty or falsey, undefined is returned.
      
    Returns:
      - Lodash chained on (*): the maximum value.

  +/
  auto max()() {
    setupMemory();
    Command c = Command("max");
    tryPut(c);
    return this;
  }

  /++ 
    
    This method is like _.max except that it accepts iteratee which is invoked for each 
    element in array to generate the criterion by which the value is ranked. The 
    iteratee is invoked with one argument: (value).
      
    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (*): the maximum value.

  +/
  auto maxBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("maxBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes the mean of the values in array.
      
    Returns:
      - Lodash chained on (number): the mean.

  +/
  auto mean()() {
    setupMemory();
    Command c = Command("mean");
    tryPut(c);
    return this;
  }
  
  /++ 
    
    This method is like _.mean except that it accepts iteratee which is
    invoked for each element in array to generate the value to be averaged. 
    The iteratee is invoked with one argument: (value).
      
    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (number): the mean.

  +/
  auto meanBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("meanBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes the minimum value of array. If array is empty or falsey, 
    undefined is returned.
      
    Returns:
      - Lodash chained on (*): the minimum value.

  +/
  auto min()() {
    setupMemory();
    Command c = Command("min");
    tryPut(c);
    return this;
  }

  
  /++ 
    
    This method is like _.min except that it accepts iteratee which is invoked 
    for each element in array to generate the criterion by which the value is 
    ranked. The iteratee is invoked with one argument: (value).
      
    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (*): the minimum value.

  +/
  auto minBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("minBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    
    Multiply two numbers.
      
      Params:
      - (number): The second number in a multiplication.

    Returns:
      - Lodash chained on (number): the product.

  +/
  auto multiply(T)(auto ref T other) {
    setupMemory();
    Command c = Command("multiply");
    c.setNumber(other);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes number rounded to precision.
      
      Params:
      - [precision=0] (number): The precision to round to.

    Returns:
      - Lodash chained on (number): the rounded number.

  +/
  auto round(T = Any)(auto ref T precision = null) {
    setupMemory();
    Command c = Command("round");
    if (precision) c.setNumber(precision);
    tryPut(c);
    return this;
  }

  
  /++ 
    
    Substract two numbers.
      
      Params:
      - (number): The second number in a subtraction.

    Returns:
      - Lodash chained on (number): the difference.

  +/
  auto subtract(T)(auto ref T other) {
    setupMemory();
    Command c = Command("subtract");
    c.setNumber(other);
    tryPut(c);
    return this;
  }

  /++ 
    
    Computes the sum of the values in array.
      
    Returns:
      - Lodash chained on (number): the sum.

  +/
  auto sum()() {
    setupMemory();
    Command c = Command("sum");
    tryPut(c);
    return this;
  }

  /++ 
    
    This method is like _.sum except that it accepts iteratee which is invoked 
    for each element in array to generate the value to be summed. The iteratee 
    is invoked with one argument: (value).
          
    Params:
      - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (number): the sum.

  +/
  auto sumBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("sumBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
    
    Clamps number within the inclusive lower and upper bounds.
      
      Params:
      - [lower] (number): The lower bound.
      - upper (number): The upper bound.

    Returns:
      - Lodash chained on (number): the clamped number.

  +/
  auto clamp(T, U)(auto ref T lower, auto ref U upper) {
    setupMemory();
    Command c = Command("clamp");
    c.setNumber(lower);
    c.setNumber(upper);
    tryPut(c);
    return this;
  }

  /++ 
    
    Checks if n is between start and up to, but not including, end. 
    If end is not specified, it's set to start with start then set to 0. 
    If start is greater than end the params are swapped to support 
    negative ranges.
      
      Params:
      - [start=0] (number): The start of the range.
      - end (number): The end of the range.

    Returns:
      - Lodash chained on (boolean): true if number is in the range, else false

  +/
  auto inRange(T, U)(auto ref T start, auto ref U end) {
    setupMemory();
    Command c = Command("inRange");
    c.setNumber(start);
    c.setNumber(end);
    tryPut(c);
    return this;
  }

  auto inRange(T)(auto ref T end) {
    setupMemory();
    Command c = Command("inRange");
    c.setNumber(end);
    tryPut(c);
    return this;
  }

  /++ 
    
      Produces a random number between the inclusive lower and upper bounds. 
      If only one argument is provided a number between 0 and the given number
       is returned. If floating is true, or either lower or upper are floats, 
       a floating-point number is returned instead of an integer.

      Note: JavaScript follows the IEEE-754 standard for resolving floating-point 
      values which can produce unexpected results.
            
      Params:
      - chained [lower=0] (number): The lower bound.
      - [upper=1] (number): The upper bound.
      - [floating] (boolean): Specify returning a floating-point number.

    Returns:
      - Lodash chained on (number): the random number.

  +/
  auto random(T)(auto ref T upper, auto ref U floating) {
    setupMemory();
    Command c = Command("random");
    c.setNumber(upper);
    c.setBoolean(floating);
    tryPut(c);
    return this;
  }

  /++ 
    
    Assigns own enumerable string keyed properties of source objects to the destination object. Source objects are applied from left to right. Subsequent sources overwrite property assignments of previous sources.

    Note: This method mutates object and is loosely based on Object.assign.
                
    Params:
    - [sources] (...Object): The source objects.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto assign(ARGS...)(auto ref ARGS sources) {
    setupMemory();
    Command c = Command("assign");
    foreach(ref obj; sources) { c.setHandleOrEval(obj); }
    tryPut(c);
    return this;
  }

  /++ 
    
    This method is like _.assign except that it iterates over own and inherited source properties.

    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto assignIn(ARGS...)(auto ref ARGS sources) {
    setupMemory();
    Command c = Command("assignIn");
    foreach(ref obj; sources) { c.setHandleOrEval(obj); }
    tryPut(c);
    return this;
  }
  /++ 
    
    This method is like _.assignIn except that it accepts customizer which is 
    invoked to produce the assigned values. If customizer returns undefined, assignment 
    is handled by the method instead. The customizer is invoked with five arguments:
    (objValue, srcValue, key, object, source).

    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.
    - [customizer] (Function): The function to customize assigned values.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto assignInWith(T, U)(auto ref T sources, auto ref U customizer) {
    setupMemory();
    Command c = Command("assignInWith");
    c.setHandleOrEval(sources);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }
  /++ 
    
    This method is like _.assign except that it accepts customizer which is 
    invoked to produce the assigned values. If customizer returns undefined,
    assignment is handled by the method instead. The customizer is invoked
    with five arguments: (objValue, srcValue, key, object, source).

    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.
    - [customizer] (Function): The function to customize assigned values.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto assignWith(T, U)(auto ref T sources, auto ref U customizer) {
    setupMemory();
    Command c = Command("assignWith");
    c.setHandleOrEval(sources);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }


  /++ 
    
    Creates an array of values corresponding to paths of object.

    Note: This method mutates object.

    Params:
    - [paths] (...(string|string[])): The property paths to pick.

    Returns:
      - Lodash chained on (Array): the picked values.

  +/
  auto at(ARGS...)(auto ref ARGS paths) {
    setupMemory();
    Command c = Command("at");
    foreach(ref path; paths) { c.setString(path); }
    tryPut(c);
    return this;
  }

  /++ 
    
    Creates an object that inherits from the prototype object. If a properties 
    object is given, its own enumerable string keyed properties are assigned 
    to the created object.

    Params:
    - [properties] (Object): The properties to assign to the object.

    Returns:
      - Lodash chained on (Object): new object.

  +/
  auto create(T)(auto ref T properties) {
    setupMemory();
    Command c = Command("create");
    c.setHandleOrEval(properties);
    tryPut(c);
    return this;
  }

  /++ 
    
    Assigns own and inherited enumerable string keyed properties of source objects 
    to the destination object for all destination properties that resolve to 
    undefined. Source objects are applied from left to right. Once a property is 
    set, additional values of the same property are ignored.

    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto defaults(ARGS...)(auto ref ARGS sources) {
    setupMemory();
    Command c = Command("defaults");
    foreach(ref source; sources) c.setHandleOrEval(source);
    tryPut(c);
    return this;
  }


  /++ 
        
    This method is like _.defaults except that it recursively assigns default properties.

    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto defaultsDeep(ARGS...)(auto ref ARGS sources) {
    setupMemory();
    Command c = Command("defaultsDeep");
    foreach(ref source; sources) c.setHandleOrEval(source);
    tryPut(c);
    return this;
  }

  /++ 
        
    This method is like _.find except that it returns the key of the first element
    predicate returns truthy for instead of the element itself.

    Params:
    - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (*): the key of the matched element, else undefined.

  +/
  auto findKey(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("findKey");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }


  /++ 
        
    This method is like _.findKey except that it iterates over elements of a 
    collection in the opposite order.

    Params:
    - [predicate=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (*): the key of the matched element, else undefined.

  +/
  auto findLastKey(T = Any)(auto ref T predicate = null) {
    setupMemory();
    Command c = Command("findLastKey");
    if (predicate) c.setCallback(predicate);
    tryPut(c);
    return this;
  }

  /++ 
        
    This method is like _.findKey except that it iterates over elements of a 
    collection in the opposite order.

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto forIn(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forIn");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
        
    This method is like _.forIn except that it iterates over properties of object in 
    the opposite order.

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto forInRight(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forInRight");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
        
    Iterates over own enumerable string keyed properties of an object and invokes 
    iteratee for each property. The iteratee is invoked with three arguments: (value, key, object).
    Iteratee functions may exit iteration early by explicitly returning false.

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto forOwn(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forOwn");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++ 
        
    This method is like _.forOwn except that it iterates over properties of object in the opposite order.

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto forOwnRight(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("forOwnRight");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }


  /++ 
        
    Creates an array of function property names from own enumerable properties of object.

    Returns:
      - Lodash chained on (Array): the function names.

  +/
  auto functions()() {
    setupMemory();
    Command c = Command("functions");
    tryPut(c);
    return this;
  }


  /++ 
        
    Creates an array of function property names from own and inherited enumerable properties of object.

    Returns:
      - Lodash chained on (Array): the function names.

  +/
  auto functionsIn()() {
    setupMemory();
    Command c = Command("functionsIn");
    tryPut(c);
    return this;
  }


  /++ 
        
    Creates an array of function property names from own and inherited enumerable properties of object.

    Params:
      - path (Array|string): The path of the property to get.
      - [defaultValue] (*): The value returned for undefined resolved values.

    Returns:
      - Lodash chained on (*):  the resolved value.

  +/
  auto get(T, U = Any)(auto ref T path, auto ref U defaultValue = null) {
    setupMemory();
    Command c = Command("get");
    c.setString(path);
    if (defaultValue) c.setAnyValue(defaultValue);
    tryPut(c);
    return this;
  }

  /++ 
        
    Checks if path is a direct property of object.

    Params:
      - path (Array|string): The path to check.

    Returns:
      - Lodash chained on (boolean): true if path exists, else false.

  +/
  auto has(T)(auto ref T path) {
    setupMemory();
    Command c = Command("has");
    c.setString(path);
    tryPut(c);
    return this;
  }
  /++ 
        
    Checks if path is a direct or inherited property of object.

    Params:
      - path (Array|string): The path to check.

    Returns:
      - Lodash chained on (boolean): true if path exists, else false.

  +/
  auto hasIn(T)(auto ref T path) {
    setupMemory();
    Command c = Command("hasIn");
    c.setString(path);
    tryPut(c);
    return this;
  }

  /++ 
        
    Creates an object composed of the inverted keys and values of object.
    If object contains duplicate values, subsequent values overwrite property
    assignments of previous values.

    Params:
      - path (Array|string): The path to check.

    Returns:
      - Lodash chained on (Object): the new inverted object.

  +/
  auto invert()() {
    setupMemory();
    Command c = Command("invert");
    tryPut(c);
    return this;
  }


  /++ 
        
    This method is like _.invert except that the inverted object is generated from 
    the results of running each element of object thru iteratee. The corresponding 
    inverted value of each inverted key is an array of keys responsible for generating 
    the inverted value. The iteratee is invoked with one argument: (value).

    Params:
    - [iteratee=_.identity] (Function): The iteratee invoked per element.

    Returns:
      - Lodash chained on (Object): the new inverted object.

  +/
  auto invertBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("invertBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }

  /++ 
        
    Invokes the method at path of object.

    Params:
      - path (Array|string): The path of the method to invoke.
      - [args] (...*): The arguments to invoke the method with.

    Returns:
      - Lodash chained on (*): the result of the invoked method.

  +/
  auto invoke(T, ARGS...)(auto ref T path, auto ref ARGS args) {
    setupMemory();
    Command c = Command("invoke");
    c.setString(path);
    foreach (ref arg; args) c.setAnyValue(arg);
    tryPut(c);
    return this;
  }
  
  /++ 
        
    Creates an array of the own enumerable property names of object.

    Note: Non-object values are coerced to objects. See the ES spec for more details.

    Params:
      - path (Array|string): The path to check.

    Returns:
      - Lodash chained on (Array): the array of property names.

  +/
  auto keys()() {
    setupMemory();
    Command c = Command("keys");
    tryPut(c);
    return this;
  }

  
  /++ 
        
    Creates an array of the own and inherited enumerable property names of object.

    Note: Non-object values are coerced to objects.

    Params:
      - path (Array|string): The path to check.

    Returns:
      - Lodash chained on (Array): the array of property names.

  +/
  auto keysIn()() {
    setupMemory();
    Command c = Command("keysIn");
    tryPut(c);
    return this;
  }

 
  /++ 
    The opposite of _.mapValues; this method creates an object with the same 
    values as object and keys generated by running each own enumerable string 
    keyed property of object thru iteratee. The iteratee is invoked with three
    arguments: (value, key, object).

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): the new mapped object.

  +/
  auto mapKeys(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("mapKeys");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }
  /++ 
    Creates an object with the same keys as object and values generated by running each own 
    enumerable string keyed property of object thru iteratee. The iteratee is invoked 
    with three arguments: (value, key, object).

    Params:
    - [iteratee=_.identity] (Function): The function invoked per iteration.

    Returns:
      - Lodash chained on (Object): the new mapped object.

  +/
  auto mapValues(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("mapValues");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  }
 
  /++ 
    This method is like _.assign except that it recursively merges own and inherited 
    enumerable string keyed properties of source objects into the destination object. 
    Source properties that resolve to undefined are skipped if a destination value 
    exists. Array and plain object properties are merged recursively. Other objects 
    and value types are overridden by assignment. Source objects are applied from 
    left to right. Subsequent sources overwrite property assignments of previous sources.
    
    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto merge(ARGS...)(auto ref ARGS args) {
    setupMemory();
    Command c = Command("merge");
    foreach (ref arg; args) c.setHandleOrEval(arg);
    tryPut(c);
    return this;
  }

  /++ 
    This method is like _.merge except that it accepts customizer which 
    is invoked to produce the merged values of the destination and source 
    properties. If customizer returns undefined, merging is handled by 
    the method instead. The customizer is invoked with six arguments:
    (objValue, srcValue, key, object, source, stack).
    
    Note: This method mutates object.

    Params:
    - [sources] (...Object): The source objects.
    - customizer (Function): The function to customize assigned values.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto mergeWith(T, U)(auto ref T source, auto ref T customizer) {
    setupMemory();
    Command c = Command("mergeWith");
    c.setHandleOrEval(source);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }

  /++ 
    The opposite of _.pick; this method creates an object composed of the own and 
    inherited enumerable property paths of object that are not omitted.
    
    Note: This method is considerably slower than _.pick.

    Params:
    - [paths] (...(string|string[])): The property paths to omit.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto omit(ARGS...)(auto ref ARGS paths) {
    setupMemory();
    Command c = Command("omit");
    foreach (ref path; paths) c.setString(path);
    tryPut(c);
    return this;
  }
 
  /++ 
    The opposite of _.pickBy; this method creates an object composed of the own 
    and inherited enumerable string keyed properties of object that predicate 
    doesn't return truthy for. The predicate is invoked with two arguments: (value, key).

    Params:
    - [predicate=_.identity] (Function): The function invoked per property.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto omitBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("omitBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  } 

  
  /++ 
    
    Creates an object composed of the picked object properties.

    Note: This method mutates object.

    Params:
    - [paths] (...(string|string[])): The property paths to pick.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto pick(ARGS...)(auto ref ARGS paths) {
    setupMemory();
    Command c = Command("pick");
    foreach(ref path; paths) { c.setString(path); }
    tryPut(c);
    return this;
  }


  /++ 
    Creates an object composed of the object properties predicate returns 
    truthy for. The predicate is invoked with two arguments: (value, key).

    Params:
    - [predicate=_.identity] (Function): The function invoked per property.

    Returns:
      - Lodash chained on (Object): the new object.

  +/
  auto pickBy(T = Any)(auto ref T iteratee = null) {
    setupMemory();
    Command c = Command("pickBy");
    if (iteratee) c.setCallback(iteratee);
    tryPut(c);
    return this;
  } 


  /++ 
        
    This method is like _.get except that if the resolved value is a function 
    it's invoked with the this binding of its parent object and its result 
    is returned.

    Params:
      - path (Array|string): The path of the property to resolve.
      - [defaultValue] (*): The value returned for undefined resolved values.

    Returns:
      - Lodash chained on (*): the resolved value.

  +/
  auto result(T, U)(auto ref T path, auto ref U defaultValue) {
    setupMemory();
    Command c = Command("result");
    c.setString(path);
    c.setAnyValue(defaultValue);
    tryPut(c);
    return this;
  }
  /++ 
        
    Sets the value at path of object. If a portion of path doesn't exist, 
    it's created. Arrays are created for missing index properties while 
    objects are created for all other missing properties. Use _.setWith 
    to customize path creation.

    Note: This method mutates object.

    Params:
      - path (Array|string): The path of the property to set.
      - value (*): The value to set.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto set(T, U)(auto ref T path, auto ref U value) {
    setupMemory();
    Command c = Command("set");
    c.setString(path);
    c.setAnyValue(value);
    tryPut(c);
    return this;
  }

  /++ 
        
    This method is like _.set except that it accepts customizer which is 
    invoked to produce the objects of path. If customizer returns undefined 
    path creation is handled by the method instead. The customizer is 
    invoked with three arguments: (nsValue, key, nsObject).

    Note: This method mutates object.

    Params:
      - path (Array|string): The path of the property to set.
      - value (*): The value to set.
      - [customizer] (Function): The function to customize assigned values.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto set(T, U, V)(auto ref T path, auto ref U value, auto ref V customizer) {
    setupMemory();
    Command c = Command("set");
    c.setString(path);
    c.setAnyValue(value);
    c.setCallback(customizer);
    tryPut(c);
    return this;
  }


  
  /++ 
        
    Creates an array of own enumerable string keyed-value pairs for object 
    which can be consumed by _.fromPairs. If object is a map or set, its 
    entries are returned.

    Returns:
      - Lodash chained on (Array): the key-value pairs.

  +/
  auto toPairs()() {
    setupMemory();
    Command c = Command("toPairs");
    tryPut(c);
    return this;
  }
  
  /++ 
        
    Creates an array of own and inherited enumerable string keyed-value pairs 
    for object which can be consumed by _.fromPairs. If object is a map or 
    set, its entries are returned.

    Returns:
      - Lodash chained on (Array): the key-value pairs.

  +/
  auto toPairsIn()() {
    setupMemory();
    Command c = Command("toPairsIn");
    tryPut(c);
    return this;
  }
  
  /++ 
    An alternative to _.reduce; this method transforms object to a new 
    accumulator object which is the result of running each of its own 
    enumerable string keyed properties thru iteratee, with each invocation 
    potentially mutating the accumulator object. If accumulator is not 
    provided, a new object with the same [[Prototype]] will be used. The 
    iteratee is invoked with four arguments: (accumulator, value, key, object). 
    Iteratee functions may exit iteration early by explicitly returning false.

    Params:
    - [predicate=_.identity] (Function): The function invoked per property.
    - [accumulator] (*): The custom accumulator value.

    Returns:
      - Lodash chained on (*): the accumulated value.

  +/
  auto transform(T, U)(auto ref T iteratee, auto ref U accumulator) {
    setupMemory();
    Command c = Command("transform");
    c.setCallback(iteratee);
    c.setAnyValue(accumulator);
    tryPut(c);
    return this;
  } 

  /++ 
        
    Removes the property at path of object.

    Params:
      - path (Array|string): The path of the property to unset.
      
    Returns:
      - Lodash chained on (boolean): true if the property is deleted, else false.

  +/
  auto unset(T)(auto ref T path) {
    setupMemory();
    Command c = Command("unset");
    c.setString(path);
    tryPut(c);
    return this;
  }

  /++ 
        
    This method is like _.set except that accepts updater to produce the 
    value to set. Use _.updateWith to customize path creation. The updater 
    is invoked with one argument: (value).

    Note: This method mutates object.

    Params:
      - path (Array|string): The path of the property to unset.
      - updater (Function): The function to produce the updated value.
      
    Returns:
      - Lodash chained on (Object): object.

  +/
  auto update(T, U)(auto ref T path, auto ref U updater) {
    setupMemory();
    Command c = Command("update");
    c.setString(path);
    c.setCallback(updater);
    tryPut(c);
    return this;
  }


  /++ 
        
    This method is like _.update except that it accepts customizer which 
    is invoked to produce the objects of path. If customizer returns 
    undefined path creation is handled by the method instead. The customizer 
    is invoked with three arguments: (nsValue, key, nsObject).

    Note: This method mutates object.

    Params:
      - path (Array|string): The path of the property to unset.
      - updater (Function): The function to produce the updated value.
      - [customizer] (Function): The function to customize assigned values.
      
    Returns:
      - Lodash chained on (Object): object.

  +/
  auto updateWith(T, U)(auto ref T path, auto ref U updater) {
    setupMemory();
    Command c = Command("updateWith");
    c.setString(path);
    c.setCallback(updater);
    tryPut(c);
    return this;
  }

  /++ 
        
    Creates an array of the own enumerable string keyed property values of object.

    Note: Non-object values are coerced to objects.

    Returns:
      - Lodash chained on (Array): the array of property values.

  +/
  auto values()() {
    setupMemory();
    Command c = Command("values");
    tryPut(c);
    return this;
  }

  
  /++ 

    Creates an array of the own and inherited enumerable string keyed property
    values of object.

    Note: Non-object values are coerced to objects

    Returns:
      - Lodash chained on (Array): the array of property values.

  +/
  auto valuesIn()() {
    setupMemory();
    Command c = Command("valuesIn");
    tryPut(c);
    return this;
  }

  /++ 

    Converts string to camel case.

    Returns:
      - Lodash chained on (string): the camel cased string.

  +/
  auto camelCase()() {
    setupMemory();
    Command c = Command("camelCase");
    tryPut(c);
    return this;
  }

  /++ 

    Converts the first character of string to upper case and the
    remaining to lower case.

    Returns:
      - Lodash chained on (string): the capitalized string.

  +/
  auto capitalize()() {
    setupMemory();
    Command c = Command("capitalize");
    tryPut(c);
    return this;
  }
  /++ 

    Deburrs string by converting Latin-1 Supplement and Latin 
    Extended-A letters to basic Latin letters and removing combining 
    diacritical marks.

    Returns:
      - Lodash chained on (string): the deburred string.

  +/
  auto deburr()() {
    setupMemory();
    Command c = Command("deburr");
    tryPut(c);
    return this;
  }

  /++ 

    Checks if string ends with the given target string.

    Params:
      - [target] (string): The string to search for.
      - [position=string.length] (number): The position to search up to.

    Returns:
      - Lodash chained on (boolean): true if string ends with target, else false.

  +/
  auto endsWith(T, U = Any)(auto ref T target, auto ref U position = null) {
    setupMemory();
    Command c = Command("endsWith");
    c.setString(target);
    if (position) c.setNumber(position);
    tryPut(c);
    return this;
  }


  /++ 

    Converts the characters "&", "<", ">", '"', and "'" in string to their 
    corresponding HTML entities.

    Note: No other characters are escaped. To escape additional characters 
    use a third-party library like he.

    Though the ">" character is escaped for symmetry, characters like ">" 
    and "/" don't need escaping in HTML and have no special meaning unless 
    they're part of a tag or unquoted attribute value. See Mathias Bynens's 
    article (under "semi-related fun fact") for more details.

    When working with HTML you should always quote attribute values to 
    reduce XSS vectors.

    Returns:
      - Lodash chained on (string): the escaped string.

  +/
  auto escape()() {
    setupMemory();
    Command c = Command("escape");
    tryPut(c);
    return this;
  }

  
  /++ 

    Escapes the RegExp special characters "^", "$", "", ".", "*", "+", "?", 
    "(", ")", "[", "]", "{", "}", and "|" in string.

    Returns:
      - Lodash chained on (string): the escaped string.

  +/
  auto escapeRegExp()() {
    setupMemory();
    Command c = Command("escapeRegExp");
    tryPut(c);
    return this;
  }

  /++ 

    Converts string to kebab case.

    Returns:
      - Lodash chained on (string): the kebab cased string.

  +/
  auto kebabCase()() {
    setupMemory();
    Command c = Command("kebabCase");
    tryPut(c);
    return this;
  }
  
  /++ 

    Converts string, as space separated words, to lower case.

    Returns:
      - Lodash chained on (string): the lower cased string.

  +/
  auto lowerCase()() {
    setupMemory();
    Command c = Command("lowerCase");
    tryPut(c);
    return this;
  }

  /++ 

    Converts the first character of string to lower case.

    Returns:
      - Lodash chained on (string): the converted string.

  +/
  auto lowerFirst()() {
    setupMemory();
    Command c = Command("lowerFirst");
    tryPut(c);
    return this;
  }

  /++ 

    Pads string on the left and right sides if it's shorter than length. 
    Padding characters are truncated if they can't be evenly divided by length.

    Params:
      - [length=0] (number): The padding length.
      - [chars=' '] (string): The string used as padding.

    Returns:
      - Lodash chained on (string): the padded string.

  +/
  auto pad(T = Any, U = Any)(auto ref T length = null, auto ref U chars = null) {
    setupMemory();
    Command c = Command("pad");
    if (length) c.setNumber(length);
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }


  /++ 

    Pads string on the right side if it's shorter than length. 
    Padding characters are truncated if they exceed length.

    Params:
      - [length=0] (number): The padding length.
      - [chars=' '] (string): The string used as padding.

    Returns:
      - Lodash chained on (string): the padded string.

  +/
  auto padEnd(T = Any, U = Any)(auto ref T length = null, auto ref U chars = null) {
    setupMemory();
    Command c = Command("padEnd");
    if (length) c.setNumber(length);
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }

  /++ 

    Pads string on the left side if it's shorter than length. Padding 
    characters are truncated if they exceed length.

    Params:
      - [length=0] (number): The padding length.
      - [chars=' '] (string): The string used as padding.

    Returns:
      - Lodash chained on (string): the padded string.

  +/
  auto padStart(T = Any, U = Any)(auto ref T length = null, auto ref U chars = null) {
    setupMemory();
    Command c = Command("padStart");
    if (length) c.setNumber(length);
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }

  /++ 

    Converts string to an integer of the specified radix. If radix is undefined 
    or 0, a radix of 10 is used unless value is a hexadecimal, in which case a 
    radix of 16 is used.

    Note: This method aligns with the ES5 implementation of parseInt.

    Params:
      - [radix=10] (number): The radix to interpret value by.

    Returns:
      - Lodash chained on (number): the converted integer.

  +/
  auto parseInt(T = Any)(auto ref T radix = null) {
    setupMemory();
    Command c = Command("parseInt");
    if (radix) c.setNumber(radix);
    tryPut(c);
    return this;
  }

  /++ 

    Repeats the given string n times.

    Params:
      - [n=1] (number): The number of times to repeat the string.

    Returns:
      - Lodash chained on (string): the repeated string.

  +/
  auto repeat(T = Any)(auto ref T radix = null) {
    setupMemory();
    Command c = Command("repeat");
    if (n) c.setNumber(n);
    tryPut(c);
    return this;
  }
  /++ 

    Replaces matches for pattern in string with replacement.

    Note: This method is based on String#replace.

    Params:
      - pattern (RegExp|string): The pattern to replace.
      - replacement (Function|string): The match replacement.

    Returns:
      - Lodash chained on (string): the modified string.

  +/
  auto replace(T, U)(auto ref T pattern, auto ref U replacement) {
    setupMemory();
    Command c = Command("replace");
    if (pattern) c.setNumber(pattern);
    if (replacement) c.setNumber(replacement);
    tryPut(c);
    return this;
  }


  /++ 

    Converts string to snake case.

    Returns:
      - Lodash chained on (string): the snake cased string.

  +/
  auto snakeCase()() {
    setupMemory();
    Command c = Command("snakeCase");
    tryPut(c);
    return this;
  }

  /++ 

    Splits string by separator.

    Params:
      - separator (RegExp|string): The separator pattern to split by.
      - [limit] (number): The length to truncate results to.

    Returns:
      - Lodash chained on (Array): the string segments.

  +/
  auto split(T, U)(auto ref T separator, auto ref U limit) {
    setupMemory();
    Command c = Command("split");
    if (separator) c.setString(separator);
    if (limit) c.setNumber(limit);
    tryPut(c);
    return this;
  }

  
  /++ 

    Converts string to start case.

    Returns:
      - Lodash chained on (string): the start cased string.

  +/
  auto startCase()() {
    setupMemory();
    Command c = Command("startCase");
    tryPut(c);
    return this;
  }


  /++ 

    Splits string by separator.

    Params:
      - [target] (string): The string to search for.
      - [position=0] (number): The position to search from.

    Returns:
      - Lodash chained on (boolean): true if string starts with target, else false.

  +/
  auto startsWith(T, U = Any)(auto ref T target, auto ref U position = null) {
    setupMemory();
    Command c = Command("startsWith");
    c.setString(target);
    if (position) c.setNumber(position);
    tryPut(c);
    return this;
  }

  /++ 

    Creates a compiled template function that can interpolate data properties 
    in "interpolate" delimiters, HTML-escape interpolated data properties in 
    "escape" delimiters, and execute JavaScript in "evaluate" delimiters. 
    Data properties may be accessed as free variables in the template. If a 
    setting object is given, it takes precedence over _.templateSettings values.

    Note: In the development build _.template utilizes sourceURLs for easier 
    debugging.

    For more information on precompiling templates see lodash's custom builds 
    documentation.

    For more information on Chrome extension sandboxes see Chrome's extensions 
    documentation.

    Params:
      - [options={}] (Object): The options object.
        - [options.escape=_.templateSettings.escape] (RegExp): The HTML "escape" delimiter.
        - [options.evaluate=_.templateSettings.evaluate] (RegExp): The "evaluate" delimiter.
        - [options.imports=_.templateSettings.imports] (Object): An object to import into the template as free variables.
        - [options.interpolate=_.templateSettings.interpolate] (RegExp): The "interpolate" delimiter.
        - [options.sourceURL='lodash.templateSources[n]'] (string): The sourceURL of the compiled template.
        - [options.variable='obj'] (string): The data object variable name.

    Returns:
      - Lodash chained on (Function): the compiled template function.

  +/
  auto template_(T = Any)(auto ref T options = null) {
    setupMemory();
    Command c = Command("template");
    if (options) c.setHandleOrEval(options);
    tryPut(c);
    return this;
  }

  /++ 

    Attempts to invoke func, returning either the result or the caught error object. 
    Any additional arguments are provided to func when it's invoked.

    Returns:
      - Lodash chained on (*): the func result or error object.

  +/
  auto attempt(ARGS...)(auto ref ARGS args) {
    setupMemory();
    Command c = Command("attempt");
    foreach(ref arg; args) c.setAnyValue(arg);
    tryPut(c);
    return this;
  }

  /++ 

    Converts string, as a whole, to lower case just like String#toLowerCase.

    Returns:
      - Lodash chained on (string): the lower cased string.

  +/
  auto toLower()() {
    setupMemory();
    Command c = Command("toLower");
    tryPut(c);
    return this;
  }


  /++ 

    Converts string, as a whole, to upper case just like String#toUpperCase.

    Returns:
      - Lodash chained on (string): the upper cased string.

  +/
  auto toUpper()() {
    setupMemory();
    Command c = Command("toUpper");
    tryPut(c);
    return this;
  }

  /++ 

    Removes leading and trailing whitespace or specified characters from string.

    Params:
      - [chars=whitespace] (string): The characters to trim.

    Returns:
      - Lodash chained on (string): the trimmed string.

  +/
  auto trim(T = Any)(auto ref T chars = null) {
    setupMemory();
    Command c = Command("trim");
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }

  /++ 

    Removes trailing whitespace or specified characters from string.

    Params:
      - [chars=whitespace] (string): The characters to trim.

    Returns:
      - Lodash chained on (string): the trimmed string.

  +/
  auto trimEnd(T = Any)(auto ref T chars = null) {
    setupMemory();
    Command c = Command("trimEnd");
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }

  /++ 

    Removes leading whitespace or specified characters from string.

    Params:
      - [chars=whitespace] (string): The characters to trim.

    Returns:
      - Lodash chained on (string): the trimmed string.

  +/
  auto trimStart(T = Any)(auto ref T chars = null) {
    setupMemory();
    Command c = Command("trimStart");
    if (chars) c.setString(chars);
    tryPut(c);
    return this;
  }

  /++ 

    Truncates string if it's longer than the given maximum string length. 
    The last characters of the truncated string are replaced with the omission 
    string which defaults to "...".

    Params:
      - [options={}] (Object): The options object.
        - [options.length=30] (number): The maximum string length.
        - [options.omission='...'] (string): The string to indicate text is omitted.
        - [options.separator] (RegExp|string): The separator pattern to truncate to.

    Returns:
      - Lodash chained on (string): the truncated string.

  +/
  auto truncate(T = Any)(auto ref T options = null) {
    setupMemory();
    Command c = Command("truncate");
    if (options) c.setHandleOrEval(options);
    tryPut(c);
    return this;
  }


  /++ 

    The inverse of _.escape; this method converts the HTML entities 
    &amp;, &lt;, &gt;, &quot;, and &#39; in string to their corresponding 
    characters.

    Note: No other HTML entities are unescaped. To unescape additional HTML 
    entities use a third-party library like he.

    Returns:
      - Lodash chained on (string): the unescaped string.

  +/
  auto unescape()() {
    setupMemory();
    Command c = Command("unescape");
    tryPut(c);
    return this;
  }  


  /++ 

    Converts string, as space separated words, to upper case.

    Returns:
      - Lodash chained on (string): the upper cased string.

  +/
  auto upperCase()() {
    setupMemory();
    Command c = Command("upperCase");
    tryPut(c);
    return this;
  }  

  /++ 

    Converts the first character of string to upper case.

    Returns:
      - Lodash chained on (string): the upper cased string.

  +/
  auto upperFirst()() {
    setupMemory();
    Command c = Command("upperFirst");
    tryPut(c);
    return this;
  }  

  /++ 

    Splits string into an array of its words.

    Params:
      - [pattern] (RegExp|string): The pattern to match words.

    Returns:
      - Lodash chained on (Array): the words of string.

  +/
  auto words(T = Any)(auto ref T pattern = null) {
    setupMemory();
    Command c = Command("words");
    if (pattern) c.setString(pattern);
    tryPut(c);
    return this;
  }  

  /++ 

    Generates a unique ID. If prefix is given, the ID is appended to it.

    Params:
      - Chained => [prefix=''] (string): The value to prefix the ID with.

    Returns:
      - Lodash chained on (string): the unique ID.

  +/
  auto uniqueId()() {
    setupMemory();
    Command c = Command("uniqueId");
    tryPut(c);
    return this;
  }  

  /++ 

    Adds all own enumerable string keyed function properties of a source object 
    to the destination object. If object is a function, then methods are added 
    to its prototype as well.

    Note: Use _.runInContext to create a pristine lodash function to avoid 
    conflicts caused by modifying the original.

    Params:
      - source (Object): The object of functions to add.
      - [options={}] (Object): The options object.
        - [options.chain=true] (boolean): Specify whether mixins are chainable.

    Returns:
      - Lodash chained on (*): object.

  +/
  auto mixin_(T, U = Any)(auto ref T source, auto ref U options = null) {
    setupMemory();
    Command c = Command("mixin");
    c.setHandleOrEval(source);
    if (options) c.setHandleOrEval(options);
    tryPut(c);
    return this;
  }  

  /++ 

    Binds methods of an object to the object itself, overwriting the existing method.

    Note: This method doesn't set the "length" property of bound functions.

    Params:
      - methodNames (...(string|string[])): The object method names to bind.

    Returns:
      - Lodash chained on (Object): object.

  +/
  auto bindAll(ARGS...)(auto ref ARGS methodNames) {
    setupMemory();
    Command c = Command("bindAll");
    foreach(ref method; methodNames) c.setString(method);
    tryPut(c);
    return this;
  }

  /++ 

    Checks value to determine whether a default value should be returned in its place. 
    The defaultValue is returned if value is NaN, null, or undefined.

    Params:
      - defaultValue (*): The default value.

    Returns:
      - Lodash chained on (*): the resolved value.

  +/
  auto defaultTo(T)(auto ref T defaultValue) {
    setupMemory();
    Command c = Command("defaultTo");
    c.setAnyValue(defaultValue);
    tryPut(c);
    return this;
  }  

  /++ 

    Converts value to a property path array.

    Returns:
      - Lodash chained on (Array): the new property path array.

  +/
  auto toPath()() {
    setupMemory();
    Command c = Command("toPath");
    tryPut(c);
    return this;
  }  

  /++ 

    Create a new pristine lodash function using the context object.

    Returns:
      - Lodash chained on (Function): a new lodash function.

  +/
  auto runInContext()() {
    setupMemory();
    Command c = Command("runInContext");
    tryPut(c);
    return this;
  }  

  /++
    Executes the compute commands accumulated so far

    Returns:
      A value cast to type T
  +/
  T execute(T) {
    ptr--; *(ptr++) = ']'; // replace the last comma
    scope(exit) {
      // reset
      m_ptr = m_commands.ptr;
      m_cb = null;
      m_cbType = 0;
      m_error = null;
      // we keep the init val
    }
    string m_commands = cast(string) m_commands[0 .. $ - (m_commands.length - (m_ptr - m_commands.ptr))];
    switch (m_initType) {
      case VarType.handle:
        static if (isSomeString!T)
          return T(ldexec__string(m_initVal.handle, commands, m_cb.iteratee_1, m_error));
        else static if (isNumeric!T && T.stringof != "Handle")
          return T(ldexec__long(m_initVal.handle, commands, m_cb.iteratee_1, m_error));
        else static if (is(T : struct) || T.stringof == "Handle")
          return T(ldexec__Handle(m_initVal.handle, commands, m_cb.iteratee_1, m_error));
      break;
      // fast path for D Strings operations
      case VarType.string_:
        static if (isSomeString!T)
          return T(ldexec_string__string(m_initVal.str, commands, m_cb.iteratee_1, m_error));
        else static if (isNumeric!T && T.stringof != "Handle")
          return T(ldexec_string__long(m_initVal.str, commands, m_cb.iteratee_1, m_error));
        else static if (is(T : struct) || T.stringof == "Handle")
          return T(ldexec_string__Handle(m_initVal.str, commands, m_cb.iteratee_1, m_error));
      break;
      // fast path for D Numeric operations
      case VarType.number:
        static if (isSomeString!T)
          return T(ldexec_long__string(m_initVal.str, commands, m_cb.iteratee_1, m_error));
        else static if (isNumeric!T && T.stringof != "Handle")
          return T(ldexec_long__long(m_initVal.str, commands, m_cb.iteratee_1, m_error));
        else static if (is(T : struct) || T.stringof == "Handle")
          return T(ldexec_long__Handle(m_initVal.str, commands, m_cb.iteratee_1, m_error));
      break;
      default: assert(false, "Init type not implemented"); break;    
      
    }

    FL_deallocate(m_commands);
    m_commands = null;
  }



}