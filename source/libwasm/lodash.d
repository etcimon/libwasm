module libwasm.lodash;

import libwasm.types;
import libwasm.rt.memory;
import std.traits;

nothrow: @safe:
/*
public auto lodash(T = Any)(auto ref T init = T.init) {
  if (!init) return Lodash(JsHandle(0), VarType.handle);
  return Lodash(init, getVarType!T, 128);
}*/

enum VarType : short {
  handle = 1,
  boolean = 2,
  string_ = 3,
  number = 4,
  decimal = 5,
  eval = 6,
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

alias NoAttributes(T) = SetFunctionAttributes!(T, "D", FunctionAttribute.none);

union Callback {
  extern(C) bool delegate(Handle, string) iteratee_1;
  extern(C) bool delegate(Handle, long) iteratee_2;
  extern(C) bool delegate(string, string) iteratee_3;
  extern(C) bool delegate(string, long) iteratee_4;
  extern(C) bool delegate(long, long) iteratee_5;
  extern(C) bool delegate() any;
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
  else static if (isDelegate!T) {
    value_type = getTypeFromCallback!T();
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

VarType getTypeFromCallback(T)() {
  VarType type;
  static if (is(NoAttributes!T == bool delegate(Handle, string)))
    type = VarType.Handle_string__bool;
  else static if (is (NoAttributes!T == bool delegate(Handle, long)))
    type = VarType.Handle_long__bool;
  else static if (is(NoAttributes!T == bool delegate(string, string)))
    type = VarType.string_string__bool;
  else static if (is(NoAttributes!T == bool delegate(string, long)))
    type = VarType.string_long__bool;
  else static if (is(NoAttributes!T == bool delegate(long, long)))
    type = VarType.long_long__bool;
  return type;
}

struct Command {
  string func;
  Param[5] params;
  VarType[5] param_types;
  short param_count;
@trusted:
  void setAnyValue(T)(ref T any) {
    size_t idx = param_count;
    static if (is(T == Eval)) {
      params[idx].str = any.eval_str;
      param_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      //if (any.length > 64) {
      //  auto hndl = getOrCreateHandle(any);
      //  params[idx].handle = hndl;
      //  param_types[idx] = VarType.handle;
      //} else {
      if (any.length == 0) {
        params[idx].str = "null";
        param_types[idx] = VarType.eval;

      } else {
        params[idx].str = any;
        param_types[idx] = VarType.string_;
      }
      //}
    }
    else static if (isNumeric!T) {
      params[idx].number = cast(long) any;
      param_types[idx] = VarType.number;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = any.handle;
      param_types[idx] = VarType.handle;
    }
    else static if (is(T == bool)){
      params[idx].boolean = any;
      param_types[idx] = VarType.boolean;
    }
    else static if (isFloatingPoint!T) {
      params[idx].decimal = any;
      param_types[idx] = VarType.decimal;
    }
    else static if (isDelegate!T) {
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
      param_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      //if (any.length > 64) { need to destroy handle, maybe this should be handled by the caller
      //  auto hndl = getOrCreateHandle(any);
      //  params[idx].handle = hndl;
      //  param_types[idx] = VarType.handle;
      //} else {        
      if (str.length == 0) {
        params[idx].str = "null";
        param_types[idx] = VarType.eval;
      } else {
        params[idx].str = str;
        param_types[idx] = VarType.string_;
      }
      //}
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      param_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setString)");
    param_count++;
  }

  void setBoolean(T)(T number)
  {
    size_t idx = param_count;
    
    static if (is(T == bool)) {
      params[idx].boolean = number.boolean;
      param_types[idx] = VarType.boolean;      
    }
    static if (is(T == Eval)) {
      params[idx].str = number.eval_str;
      param_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = number;
      param_types[idx] = VarType.eval;
    }
    else static if (isNumeric!T) {
      params[idx].boolean = number != 0;
      param_types[idx] = VarType.boolean;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      param_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setNumber)");
    param_count++;
  }
  void setNumber(T)(T number)
  {
    size_t idx = param_count;
    
    static if (is(T == Eval)) {
      params[idx].str = number.eval_str;
      param_types[idx] = VarType.eval;
    } 
    else static if (isSomeString!T) {
      params[idx].str = number;
      param_types[idx] = VarType.eval;
    }
    else static if (isNumeric!T) {
      params[idx].number = cast(long) number;
      param_types[idx] = VarType.number;
    }
    else static if (is(T : JsHandle)) {
      params[idx].handle = number.handle;
      param_types[idx] = VarType.handle;
    } else static assert(false, "Unsupported type given to function (setNumber)");
    param_count++;
  }

  void setCallback(T)(size_t idx, T callback) {

    static if (is(NoAttributes!T == bool delegate(Handle, string))) {      
      params[idx].cb.iteratee_1 = cast(typeof(params[idx].cb.iteratee_1))callback;
      param_types[idx] = VarType.Handle_string__bool;
    }
    else static if (is (NoAttributes!T == bool delegate(Handle, long))){   
      params[idx].cb.iteratee_2 = cast(typeof(params[idx].cb.iteratee_2))callback;
      param_types[idx] = VarType.Handle_long__bool;
    }
    else static if (is(NoAttributes!T == bool delegate(string, string))) {   
      params[idx].cb.iteratee_3 = cast(typeof(params[idx].cb.iteratee_3))callback;
      param_types[idx] = VarType.string_string__bool;
    }
    else static if (is(NoAttributes!T == bool delegate(string, long))) {   
      params[idx].cb.iteratee_4 = cast(typeof(params[idx].cb.iteratee_4))callback;
      param_types[idx] = VarType.string_long__bool;
    }
    else static if (is(NoAttributes!T == bool delegate(long, long))) {   
      params[idx].cb.iteratee_5 = cast(typeof(params[idx].cb.iteratee_5))callback;
      param_types[idx] = VarType.long_long__bool;
    } else {
      pragma(msg, (NoAttributes!T).stringof);
      static assert(false, "Invalid callback type used as parameter");
    }
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
        param_types[idx] = VarType.handle;
      }
      else static if (isDelegate!T) {
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

  VarType m_initType = VarType.handle;

  size_t m_size_est = 128;

  char[] m_commands; // [{func: 'name', params:[function(){}, 2, 'str']}]
                      // [{local: 'a', value: function(){} }]
  char* m_ptr;

  // first cb is global
  Callback m_cb;
  CallbackType m_cbType;

  extern(C) void delegate(Handle reason) m_error;
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

@trusted:
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
    if (m_ptr + digits > m_commands.ptr + m_commands.length)
      return false;
    m_ptr += digits - 1;
    while(u > 0) {
      *(m_ptr--) = char('0' + u % 10);
		  u /= 10;
    }
    if (i < 0) *(m_ptr--) = '-';
    m_ptr += digits + 1;
    return true;
  }

  bool put(bool istrue) {
    if (istrue) return put("true");
    else return put("false");
    
  }

  bool putHandle(long handle) {
    //if (m_ptr + "nodes[]".sizeof  > m_commands.ptr + m_commands.length) return false;
    if (!put("nodes[")) return false;
    if (!put(handle)) return false;
    if (!put("]")) return false;
    return true;
  }

  bool put(char c) {
    if (m_ptr + 1 > m_commands.ptr + m_commands.length)
      return false;
    *(m_ptr++) = c;
    return true;
  }


  bool putEval(T)(T arr) if (isSomeString!T) {
    // starts with =
    size_t escape_count;

    foreach(el; arr) if (hasEscape(el)) escape_count++;

    if (m_ptr + arr.length + 3 + escape_count > m_commands.ptr + m_commands.length) 
      return false;

    *(m_ptr++) = '"';
    *(m_ptr++) = '='; // eval condition, escaped in strings
    foreach (ref val; arr) {
      if (val <= 0x1F || val == '"' || val == '\\') {
        putEscape(val);
      }
      else *(m_ptr++) = val;
    }
    *(m_ptr++) = '"';
    return true;
  }

  void putEscape(char c) {
    if (c == '\t') { *(m_ptr++) = '\\'; *(m_ptr++) = 't'; }
    else if (c == '\b') { *(m_ptr++) = '\\'; *(m_ptr++) = 'b'; }
    else if (c == '\n') { *(m_ptr++) = '\\'; *(m_ptr++) = 'n'; }
    else if (c == '\r') { *(m_ptr++) = '\\'; *(m_ptr++) = 'r'; }
    else if (c == '"') { *(m_ptr++) = '\\'; *(m_ptr++) = '"'; }
    else if (c == '\\') { m_ptr++; *(m_ptr++) = '\\'; }
    else { *(m_ptr++) = '?'; }
  }

  bool hasEscape(char c) {
    if ((c <= 0x1F && c > 0xC) || (c > 0x1F && c != '"' && c != '\\')) 
      return false;
    else if (c == '\t') return true;
    else if (c == '\b') return true;
    else if (c == '\n') return true;
    else if (c == '\r') return true;
    else if (c == '"') return true;
    else if (c == '\\') return true;
    else return false; // '?'
  }


  bool put(T)(T arr, bool to_json_string = false) if (isSomeString!T) {    
    size_t escape_count;
    if (arr[0] == '=') {
      if (!put('\\')) return false;
    }
    if (to_json_string) foreach(el; arr) if (hasEscape(el)) escape_count++;

    if (m_ptr + arr.length + (to_json_string ? 2 + escape_count : 0)  > m_commands.ptr + m_commands.length) 
      return false;

    if (to_json_string)
      *(m_ptr++) = '"';
    foreach (ref val; arr) {
      if (to_json_string && (val <= 0x1F || val == '"' || val == '\\')) {
        putEscape(val);
      }
      else *(m_ptr++) = val;
    }
    if (to_json_string)
      *(m_ptr++) = '"';
    return true;
  }

  bool putCommand(ref Command command) {
    // check locals
    
    foreach (i, ref param; command.params)
    {
      if (i == command.param_count) break;

      switch (command.param_types[i]) {
        case VarType.Handle_string__bool:
          //assert(m_cb.any is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_1)) local;
          local.local_name = "cb";
          local.value = param.cb.iteratee_1;
          local.value_type = command.param_types[i];
          if(!putLocal(local)) return false;
          break;
        case VarType.Handle_long__bool:
          //assert(m_cb.any is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_2)) local;
          local.local_name = "cb";
          local.value = param.cb.iteratee_2;
          local.value_type = command.param_types[i];
          if(!putLocal(local)) return false;
          break;
        case VarType.string_string__bool:
          //assert(m_cb.any is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_3)) local;
          local.local_name = "cb";
          local.value = param.cb.iteratee_3;
          local.value_type = command.param_types[i];
          if(!putLocal(local)) return false;
          break;
        case VarType.string_long__bool:
          //assert(m_cb.any is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_4)) local;
          local.local_name = "cb";
          local.value = param.cb.iteratee_4;
          local.value_type = command.param_types[i];
          if(!putLocal(local)) return false;
          break;
        case VarType.long_long__bool:
          //assert(m_cb.any is null, "You can only have one callback");
          Local!(typeof(Callback.iteratee_5)) local;
          local.local_name = "cb";
          local.value = param.cb.iteratee_5;
          local.value_type = command.param_types[i];
          if(!putLocal(local)) return false;
          break;
        default: 
          
          break;
      }
    }
    if (!put(`{"func":`)) return false;
    if (!put(command.func, true)) return false;
    if (!put(`,"params":[`)) return false;
    foreach (i, ref param; command.params)
    {
      if (i == command.param_count) break;

      if (i > 0) if (!put(',')) return false;
      switch (command.param_types[i]) {
        case VarType.handle:
          if (!putHandle(param.number)) return false;
          break;
        case VarType.boolean:
          if (!put(param.boolean)) return false;
          break;
        case VarType.string_:
          if (!put(param.str, true)) return false;
          break;
        case VarType.eval:
          if (!putEval(param.str)) return false;
          break;
        case VarType.number:
          if (!put(param.number, false)) return false;
          break;
        //case VarType.decimal:
          // todo
        //  break;
        case VarType.Handle_string__bool:
          if (!putEval("cb")) return false;
          break;
        case VarType.Handle_long__bool:
          if (!putEval("cb")) return false;
          break;
        case VarType.string_string__bool:
          if (!putEval("cb")) return false;
          break;
        case VarType.string_long__bool:
          if (!putEval("cb")) return false;
          break;
        case VarType.long_long__bool:
          if (!putEval("cb")) return false;
          break;
        default: assert(false, "Command parameter type not implemented");
      }
        
    }
    if (!put("]},")) return false;
    return true;
  }

  bool putLocal(T)(ref Local!T local) {
    if (!put(`{"local":`)) return false;
    if (!put(local.local_name, true)) return false;
    if (!put(`,"value":`)) return false;

    switch(local.value_type) {
      case VarType.handle:
        static if (isImplicitlyConvertible!(T, JsHandle)) {
          if (!put(local.value.handle)) return false;
        }
        else static if (!isDelegate!T) {
          if (!put(local.value)) return false;
        } 
        break;
      case VarType.string_:
         static if (!isDelegate!T) if (!put(local.value, true)) return false;
        break;
      case VarType.eval:
         static if (!isDelegate!T) if (!putEval(local.value)) return false;
        break;
      case VarType.boolean:
      case VarType.number:
        static if (!isDelegate!T) if (!put(local.value)) return false;
      case VarType.Handle_string__bool:
      // generate boilerplate
        static if (is(NoAttributes!(typeof(local.value)) == bool delegate(Handle, string))) {
          __gshared immutable cb_boilerplate_1 = `(o,s)=>{let hndl=ao(o);let str=es(0,s,null,true);return !!sifg(cbPtr)(cbCtx,str[0],str[1],hndl);}`;
          m_cb.iteratee_1 = cast(typeof(m_cb.iteratee_1))local.value;
          if (!putEval(cb_boilerplate_1)) return false;
        }
        // handler must touch Handle with any type that implements JsObject
        break;
      case VarType.Handle_long__bool:
        static if (is(NoAttributes!(typeof(local.value)) == bool delegate(Handle, long))) {
          __gshared immutable cb_boilerplate_2 = `(o,i)=>{let hndl=ao(o);return !!sifg(cbPtr)(cbCtx,BigInt(i),hndl);}`;
          m_cb.iteratee_2 = cast(typeof(m_cb.iteratee_2))local.value;
          if (!putEval(cb_boilerplate_2)) return false;
        }
        break;
      case VarType.string_string__bool:
        static if (is(NoAttributes!(typeof(local.value)) == bool delegate(string,string))) {
          __gshared immutable cb_boilerplate_3 = `(s1,s2)=>{let str1=es(0,s1,null,true);let str2=es(0,s2,null,true);return !!sifg(cbPtr)(cbCtx,str2[0],str2[1],str1[0],str1[1]);}`;
          m_cb.iteratee_3 = cast(typeof(m_cb.iteratee_3))local.value;
          if (!putEval(cb_boilerplate_3)) return false;
        }
        break;
      case VarType.string_long__bool:
        static if (is(NoAttributes!(typeof(local.value)) == bool delegate(string, long))) {
          __gshared immutable cb_boilerplate_4 = `(s,i)=>{let str=es(0,s,null,true);return !!sifg(cbPtr)(cbCtx,BigInt(i),str[0],str[1]);}`;
          m_cb.iteratee_4 = cast(typeof(m_cb.iteratee_4))local.value;
          if (!putEval(cb_boilerplate_4)) return false;
        }
        break;
      case VarType.long_long__bool:
        static if (is(NoAttributes!(typeof(local.value)) == bool delegate(long, long))) {
          __gshared immutable cb_boilerplate_5 = `(i1,i2)=>{return !!sifg(cbPtr)(cbCtx, BigInt(i2), BigInt(i1));}`;
          m_cb.iteratee_5 = cast(typeof(m_cb.iteratee_5))local.value;
          if (!putEval(cb_boilerplate_5)) return false;
        }
        break;
      
      default: 
        
      break;//assert(false, "Local variable type not implemented");
    }

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
    char* restore = m_ptr;
    while (!putLocal(local)) {
      m_ptr = restore;
      char[] alloc = cast(char[])FL_reallocate(m_commands, m_commands.length * 2);
      m_ptr = alloc.ptr + (m_ptr - m_commands.ptr);
      restore = m_ptr;
      m_commands = alloc;
    }
  }

  /++
    Adds a command to the compute queue.
    Will increase memory using Allocator if need be.

    Params: 
      - Command Object
  +/
  void tryPut(ref Command command) {
    char* restore = m_ptr;
    while (!putCommand(command)) {
      m_ptr = restore;
      char[] alloc = cast(char[])FL_reallocate(m_commands, m_commands.length * 2);
      m_ptr = alloc.ptr + (m_ptr - m_commands.ptr);
      restore = m_ptr;
      m_commands = alloc;
    }
  }

  void setupMemory() {
    if (!m_commands)
    {
      m_commands = cast(char[]) FL_allocate(m_size_est);
      m_ptr = m_commands.ptr;
      put('[');
    }
  }

@safe:
public:

  /++
    Initialize the Lodash chaining with VarType
  +/
  this(T)(auto ref T val, VarType init_type, int size_estimate) 
  {
    // init with a string
    m_initType = init_type;
    m_size_est = size_estimate;

    switch (init_type) {
      case VarType.string_:
      case VarType.eval:
        static if (isImplicitlyConvertible!(T, string))
          m_initVal.str = val;        
        break;
      case VarType.handle:
        static if (isImplicitlyConvertible!(T,JsHandle))
          m_initVal.handle = val.handle;
        else m_initVal.handle = val;
        break;

       case VarType.number:       
        static if (isNumeric!T)
          m_initVal.number = cast(long)val;
        break;
      default: assert(false, "Not implemented");
    }
  }

  auto ref initialize(T)(auto ref T val, VarType init_type = VarType.handle, int size_estimate = 128)
  {
        // init with a string
    m_initType = init_type;
    m_size_est = size_estimate;
    switch (init_type) {
      case VarType.string_:
      case VarType.eval:
        static if (isImplicitlyConvertible!(T, string))
          m_initVal.str = val;        
        break;
      case VarType.handle:
        static if (isImplicitlyConvertible!(T,JsHandle))
          m_initVal.handle = val.handle;
        else m_initVal.handle = val;
        break;

       case VarType.number:       
        static if (isNumeric!T)
          m_initVal.number = cast(long)val;
        break;
      default: assert(false, "Not implemented"); break;
    }
    return this;
  }

  /++
    Adds a variable accessible through the javascript context
    If it's a callback and one exists, will fail with assert failure

    Params:
      - The variable name to be defined in Javascript VM
      - Value of the variable
      - VarType for handling logic to define the value correctly for the Javascript VM
  +/
  auto ref addLocal(T)(string var_name, auto ref T val) 
    if (!isFloatingPoint!T) //todo
  {
    setupMemory();

    auto ref local = Local!T(var_name, val);

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
  auto ref onError()(void delegate(Handle) errcb) @trusted {
    m_error = cast(typeof(m_error))errcb;
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
  auto ref chunk(T = Any)(auto ref T size = T.init) if (isNumeric!T) {
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
  auto ref compact()() {    
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
  auto ref concat(ARGS...)(auto ref ARGS values) {
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
  auto ref difference(T)(auto ref T values) {
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
  auto ref differenceBy(T, U = Any)(auto ref T values, auto ref U iteratee = U.init) 
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
  auto ref differenceWith(T, U)(auto ref T values, auto ref U comparator) 
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
  auto ref drop(T = Any)(auto ref T size = T.init) if (isNumeric!T) {
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
  auto ref dropRightWhile(T = Any)(auto ref T predicate = T.init) {
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
  auto ref dropWhile(T = Any)(auto ref T predicate = T.init) {
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
  auto ref fill(T, U = Any, V = Any)(auto ref T fill_value, auto ref U start = U.init, auto ref V end = V.init) {
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
  auto ref findIndex(T = Any, U = Any)(auto ref T predicate = T.init, auto ref U fromIndex = U.init) {
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
  auto ref findLastIndex(T = Any, U = Any)(auto ref T predicate = T.init, auto ref U fromIndex = U.init) {
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
  auto ref flatten()() {
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
  auto ref flattenDeep()() {
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
  auto ref flattenDepth(T = Any)(auto ref T depth = T.init) {
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
  auto ref fromPairs()() {
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
  auto ref head()() {
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
  auto ref indexOf(T, U = Any)(auto ref T value, auto ref U fromIndex = U.init) {
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
  auto ref initial()() {
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
  auto ref intersection()() {
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
  auto ref intersectionBy(T = Any)(auto ref T iteratee = T.init) 
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
  auto ref intersectionWith(T)(auto ref T comparator) 
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
  auto ref join(T)(auto ref T separator) 
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
  auto ref last()() {
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
  auto ref lastIndexOf(T, U = Any)(auto ref T value, auto ref U fromIndex = U.init) {
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
  auto ref nth(T = Any)(auto ref T n = T.init) {
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
  auto ref pull(ARGS...)(auto ref ARGS values) {
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
  auto ref pullAll(T)(auto ref T values) {
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
  auto ref pullAllBy(T, U = Any)(auto ref T values, auto ref U iteratee = U.init) {
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
  auto ref pullAllWith(T, U = Any)(auto ref T values, auto ref U iteratee = U.init) {
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
  auto ref pullAt(ARGS...)(auto ref ARGS values) {
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
  auto ref remove(T = Any)(auto ref T predicate = T.init) {
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
  auto ref reverse()() {
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
  auto ref slice(T = Any, U = Any)(auto ref T start = T.init, auto ref U end = U.init) {
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
  auto ref sortedIndex(T)(auto ref T value) {
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
  auto ref sortedIndexBy(T, U)(auto ref T value, auto ref U iteratee = U.init) {
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
  auto ref sortedIndexOf(T)(auto ref T value) {
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
  auto ref sortedLastIndex(T)(auto ref T value) {
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
  auto ref sortedLastIndexBy(T, U)(auto ref T value, auto ref U iteratee = U.init) {
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
  auto ref sortedLastIndexOf(T)(auto ref T value) {
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
  auto ref sortedUniq()() {
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
  auto ref sortedUniqBy(T)(auto ref T iteratee) {
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
  auto ref tail()() {
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
  auto ref take(T = Any)(auto ref T n = T.init) {
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
  auto ref takeRight(T = Any)(auto ref T n = T.init) {
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
  auto ref takeRightWhile(T = Any)(auto ref T predicate = T.init) {
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
  auto ref takeWhile(T = Any)(auto ref T predicate = T.init) {
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
  auto ref union_(ARGS...)(auto ref ARGS values) {
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
  auto ref unionBy(T)(auto ref T values, auto ref U iteratee = U.init) {
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
  auto ref unionWith(T)(auto ref T values, auto ref U comparator = U.init) {
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
  auto ref uniq()() {
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
  auto ref uniqBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref uniqWith(T)(auto ref T comparator = T.init) {
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
  auto ref unzip()() {
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
  auto ref unzipWith(T)(auto ref T iteratee = T.init) {
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
  auto ref without(ARGS...)(auto ref ARGS values) {
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
  auto ref xor(ARGS...)(auto ref ARGS arrays) {
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
  auto ref xorBy(T, U = Any)(auto ref T values, auto ref U iteratee = U.init) {
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
  auto ref xorWith(T, U)(auto ref T values, auto ref U comparator) {
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
  auto ref zip(ARGS...)(auto ref ARGS arrays) {
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
  auto ref zipObject(T)(auto ref T values) {
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
  auto ref zipObjectDeep(T)(auto ref T values) {
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
  auto ref zipWith(T, U = Any)(auto ref T arrays, auto ref U iteratee = U.init) {
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
  auto ref countBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref every(T = Any)(auto ref T predicate = T.init) {
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
  auto ref filter(T = Any)(auto ref T predicate = T.init) {
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
  auto ref find(T = Any, U = Any)(auto ref T predicate = T.init, auto ref U fromIndex = U.init) {
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
  auto ref findLast(T = Any, U = Any)(auto ref T predicate = T.init, auto ref U fromIndex = U.init) {
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
  auto ref flatMap(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref flatMapDeep(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref flatMapDepth(T = Any, U = Any)(auto ref T iteratee = T.init, auto ref U depth = U.init) {
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
  auto ref forEach(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref forEachRight(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref groupBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref includes(T, U = Any)(auto ref T value, auto ref U fromIndex = U.init) {
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
  auto ref invokeMap(T, U = Any)(auto ref T path, auto ref U args = U.init) {
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
  auto ref keyBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref map(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref orderBy(T, U)(auto ref T iteratees, auto ref U orders) {
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
  auto ref partition(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref reduce(T, U)(auto ref T iteratee, auto ref U accumulator) {
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
  auto ref reduceRight(T, U)(auto ref T iteratee, auto ref U accumulator) {
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
  auto ref reject(T = Any)(auto ref T predicate = T.init) {
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
  auto ref sample()() {
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
  auto ref sampleSize(T = Any)(auto ref T n = T.init) {
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
  auto ref shuffle()() {
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
  auto ref size()() {
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
  auto ref some(T = Any)(auto ref T predicate = T.init) {
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
  auto ref sortBy(ARGS...)(auto ref ARGS iteratees) {
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
  auto ref now()() {
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
  auto ref castArray()() {
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
  auto ref clone()() {
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
  auto ref cloneDeep()() {
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
  auto ref cloneDeepWith(T)(auto ref T customizer) {
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
  auto ref cloneWith(T)(auto ref T customizer) {
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
  auto ref conformsTo(T)(auto ref T source) {
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
  auto ref eq(T)(auto ref T other) {
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
  auto ref gt(T)(auto ref T other) {
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
  auto ref gte(T)(auto ref T other) {
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
  auto ref isArguments()() {
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
  auto ref isArray()() {
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
  auto ref isArrayBuffer()() {
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
  auto ref isArrayLike()() {
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
  auto ref isArrayLikeObject()() {
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
  auto ref isBoolean()() {
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
  auto ref isBuffer()() {
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
  auto ref isDate()() {
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
  auto ref isElement()() {
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
  auto ref isEmpty()() {
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
  auto ref isEqual(T)(auto ref T other) {
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
  auto ref isEqualWith(T, U)(auto ref T other, auto ref U customizer) {
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
  auto ref isError()() {
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
  auto ref isFinite()() {
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
  auto ref isFunction()() {
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
  auto ref isInteger()() {
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
  auto ref isLength()() {
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
  auto ref isMap()() {
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
  auto ref isMatch(T)(auto ref T other) {
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
  auto ref isMatchWith(T, U)(auto ref T other, auto ref U customizer) {
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
  auto ref isNaN()() {
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
  auto ref isNative()() {
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
  auto ref isNil()() {
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
  auto ref isNull()() {
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
  auto ref isNumber()() {
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
  auto ref isObject()() {
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
  auto ref isObjectLike()() {
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
  auto ref isPlainObject()() {
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
  auto ref isRegExp()() {
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
  auto ref isSafeInteger()() {
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
  auto ref isSet()() {
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
  auto ref isString()() {
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
  auto ref isSymbol()() {
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
  auto ref isTypedArray()() {
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
  auto ref isUndefined()() {
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
  auto ref isWeakMap()() {
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
  auto ref isWeakSet()() {
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
  auto ref lt(T)(auto ref T other) {
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
  auto ref lte(T)(auto ref T other) {
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
  auto ref toArray()() {
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
  auto ref toFinite()() {
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
  auto ref toInteger()() {
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
  auto ref toLength()() {
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
  auto ref toNumber()() {
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
  auto ref toPlainObject()() {
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
  auto ref toSafeInteger()() {
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
  auto ref toString()() {
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
  auto ref add(T)(auto ref T other) {
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
  auto ref ceil(T = Any)(auto ref T precision = T.init) {
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
  auto ref divide(T)(auto ref T other) {
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
  auto ref floor(T = Any)(auto ref T precision = T.init) {
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
  auto ref max()() {
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
  auto ref maxBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref mean()() {
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
  auto ref meanBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref min()() {
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
  auto ref minBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref multiply(T)(auto ref T other) {
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
  auto ref round(T = Any)(auto ref T precision = T.init) {
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
  auto ref subtract(T)(auto ref T other) {
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
  auto ref sum()() {
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
  auto ref sumBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref clamp(T, U)(auto ref T lower, auto ref U upper) {
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
  auto ref inRange(T, U)(auto ref T start, auto ref U end) {
    setupMemory();
    Command c = Command("inRange");
    c.setNumber(start);
    c.setNumber(end);
    tryPut(c);
    return this;
  }

  auto ref inRange(T)(auto ref T end) {
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
  auto ref random(T)(auto ref T upper, auto ref U floating) {
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
  auto ref assign(ARGS...)(auto ref ARGS sources) {
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
  auto ref assignIn(ARGS...)(auto ref ARGS sources) {
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
  auto ref assignInWith(T, U)(auto ref T sources, auto ref U customizer) {
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
  auto ref assignWith(T, U)(auto ref T sources, auto ref U customizer) {
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
  auto ref at(ARGS...)(auto ref ARGS paths) {
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
  auto ref create(T)(auto ref T properties) {
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
  auto ref defaults(ARGS...)(auto ref ARGS sources) {
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
  auto ref defaultsDeep(ARGS...)(auto ref ARGS sources) {
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
  auto ref findKey(T = Any)(auto ref T predicate = T.init) {
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
  auto ref findLastKey(T = Any)(auto ref T predicate = T.init) {
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
  auto ref forIn(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref forInRight(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref forOwn(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref forOwnRight(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref functions()() {
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
  auto ref functionsIn()() {
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
  auto ref get(T, U = Any)(auto ref T path, auto ref U defaultValue = U.init) {
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
  auto ref has(T)(auto ref T path) {
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
  auto ref hasIn(T)(auto ref T path) {
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
  auto ref invert()() {
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
  auto ref invertBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref invoke(T, ARGS...)(auto ref T path, auto ref ARGS args) {
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
  auto ref keys()() {
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
  auto ref keysIn()() {
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
  auto ref mapKeys(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref mapValues(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref merge(ARGS...)(auto ref ARGS args) {
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
  auto ref mergeWith(T, U)(auto ref T source, auto ref T customizer) {
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
  auto ref omit(ARGS...)(auto ref ARGS paths) {
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
  auto ref omitBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref pick(ARGS...)(auto ref ARGS paths) {
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
  auto ref pickBy(T = Any)(auto ref T iteratee = T.init) {
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
  auto ref result(T, U)(auto ref T path, auto ref U defaultValue) {
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
  auto ref set(T, U)(auto ref T path, auto ref U value) {
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
  auto ref set(T, U, V)(auto ref T path, auto ref U value, auto ref V customizer) {
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
  auto ref toPairs()() {
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
  auto ref toPairsIn()() {
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
  auto ref transform(T, U)(auto ref T iteratee, auto ref U accumulator) {
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
  auto ref unset(T)(auto ref T path) {
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
  auto ref update(T, U)(auto ref T path, auto ref U updater) {
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
  auto ref updateWith(T, U)(auto ref T path, auto ref U updater) {
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
  auto ref values()() {
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
  auto ref valuesIn()() {
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
  auto ref camelCase()() {
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
  auto ref capitalize()() {
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
  auto ref deburr()() {
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
  auto ref endsWith(T, U = Any)(auto ref T target, auto ref U position = U.init) {
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
  auto ref escape()() {
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
  auto ref escapeRegExp()() {
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
  auto ref kebabCase()() {
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
  auto ref lowerCase()() {
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
  auto ref lowerFirst()() {
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
  auto ref pad(T = Any, U = Any)(auto ref T length = T.init, auto ref U chars = U.init) {
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
  auto ref padEnd(T = Any, U = Any)(auto ref T length = T.init, auto ref U chars = U.init) {
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
  auto ref padStart(T = Any, U = Any)(auto ref T length = T.init, auto ref U chars = U.init) {
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
  auto ref parseInt(T = Any)(auto ref T radix = T.init) {
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
  auto ref repeat(T = Any)(auto ref T radix = T.init) {
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
  auto ref replace(T, U)(auto ref T pattern, auto ref U replacement) {
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
  auto ref snakeCase()() {
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
  auto ref split(T, U)(auto ref T separator, auto ref U limit) {
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
  auto ref startCase()() {
    setupMemory();
    Command c = Command("startCase");
    tryPut(c);
    return this;
  }


  /++ 

    Checks if string starts with the given target string.

    Params:
      - [target] (string): The string to search for.
      - [position=0] (number): The position to search from.

    Returns:
      - Lodash chained on (boolean): true if string starts with target, else false.

  +/
  auto ref startsWith(T, U = Any)(auto ref T target, auto ref U position = U.init) {
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
  auto ref template_(T = Any)(auto ref T options = T.init) {
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
  auto ref attempt(ARGS...)(auto ref ARGS args) {
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
  auto ref toLower()() {
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
  auto ref toUpper()() {
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
  auto ref trim(T = Any)(auto ref T chars = T.init) {
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
  auto ref trimEnd(T = Any)(auto ref T chars = T.init) {
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
  auto ref trimStart(T = Any)(auto ref T chars = T.init) {
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
  auto ref truncate(T = Any)(auto ref T options = T.init) {
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
  auto ref unescape()() {
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
  auto ref upperCase()() {
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
  auto ref upperFirst()() {
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
  auto ref words(T = Any)(auto ref T pattern = T.init) {
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
  auto ref uniqueId()() {
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
  auto ref mixin_(T, U = Any)(auto ref T source, auto ref U options = U.init) {
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
  auto ref bindAll(ARGS...)(auto ref ARGS methodNames) {
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
  auto ref defaultTo(T)(auto ref T defaultValue) {
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
  auto ref toPath()() {
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
  auto ref runInContext()() {
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
  @trusted T execute(T)() {
    m_ptr--; *(m_ptr++) = ']'; // replace the last comma
    scope(exit) {
      // reset
      m_ptr = m_commands.ptr;
      m_cb.any = null;
      m_cbType = VarType.init;
      m_error = null;
      FL_deallocate(m_commands);
      m_commands = null;

      // we keep the init val?
    }
    string commands = cast(string) m_commands[0 .. m_commands.length - (m_commands.length - (m_ptr - m_commands.ptr))];
    switch (m_initType) {
      case VarType.handle:
        static if (isSomeString!T)
          return ldexec_Handle__string(m_initVal.handle, commands, m_cb.any, m_error);
        else static if (isNumeric!T && !is(T == Handle) && !isFloatingPoint!T)
          return ldexec_Handle__long(m_initVal.handle, commands, m_cb.any, m_error);
        else static if (isFloatingPoint!T)
          return ldexec_Handle__double(m_initVal.handle, commands, m_cb.any, m_error);
        else
          return T(ldexec_Handle__Handle(m_initVal.handle, commands, m_cb.any, m_error));
      
      // fast path for D Strings operations
      case VarType.string_:
      case VarType.eval:
        bool is_eval_init = m_initType == VarType.eval;
        static if (isSomeString!T)
          return ldexec_string__string(m_initVal.str, commands, m_cb.any, m_error, is_eval_init);
        else static if (isNumeric!T && !is(T == Handle) && !isFloatingPoint!T)
          return ldexec_string__long(m_initVal.str, commands, m_cb.any, m_error, is_eval_init);
        else static if (isFloatingPoint!T)
          return ldexec_string__double(m_initVal.str, commands, m_cb.any, m_error, is_eval_init);
        else
          return T(ldexec_string__Handle(m_initVal.str, commands, m_cb.any, m_error, is_eval_init));
      
      // fast path for D Numeric operations
      case VarType.number:
        static if (isSomeString!T)
          return ldexec_long__string(m_initVal.number, commands, m_cb.any, m_error);
        else static if (isNumeric!T && !is(T == Handle) && !isFloatingPoint!T)
          return ldexec_long__long(m_initVal.number, commands, m_cb.any, m_error);
        else static if (isFloatingPoint!T)
          return ldexec_long__double(m_initVal.number, commands, m_cb.any, m_error);
        else
          return T(ldexec_long__Handle(m_initVal.number, commands, m_cb.any, m_error));
      
      default: assert(false, "Init type not implemented");   
      
    }

  }



}