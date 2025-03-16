module libwasm.hmr;
version(unittest) version = hmr;
version(hmr):

import libwasm.rt.array;
import libwasm.rt.allocator;
import libwasm.node;
import libwasm.event;
import libwasm.array;
import memutils.scoped;
import std.traits;
import libwasm.types : console;

@trusted:

string dumpState(T)(ref T app) @system {
  void recurse(T, Sink)(ref T app, ref Sink sink) {
    enum len = T.tupleof.length;
    bool first = true;
    static foreach(idx, t; T.tupleof) {{
      static if (isPointer!(typeof(t))) {
        //pragma(msg, "Pointer");
      } else static if (is(typeof(t) : EventEmitter!Params, Params...) || hasUDA!(typeof(t), eventemitter)) {
        //pragma(msg, "EventEmitter");
      } else static if (is(typeof(t) : NamedNode!(name, name), string name)) {
        //pragma(msg, "NamedNode1");
      } else static if (is(typeof(t) : NamedNode!(name, tag), string name, string tag)) {
        //pragma(msg, "NamedNode2");
      } else static if (is(typeof(t) : List!(Item, tag), Item, string tag)) {
        //pragma(msg, "List");
      } else static if (is(typeof(t) == ManagedPool)) {
        //pragma(msg, "ManagedPool");
      } else static if (is(typeof(t) : HTMLArray!(Item), Item)) {
        //pragma(msg, "HTMLArray");
      } else static if (isBoolean!(typeof(t))) {
        if (!first)
          sink.write(",");
        sink.write(__traits(identifier, t), ":b:");
        if (app.tupleof[idx] == true)
          sink.write("t");
        else
          sink.write("f");
        first = false;
      } else static if (isSomeString!(typeof(t))) {
        //console.log(app.tupleof[idx] ~ ": ");
        //console.log(cast(uint)app.tupleof[idx].ptr);
        //console.log(" <> ");
        //console.log(WasmAllocator.heapBase);
        //if (cast(uint)app.tupleof[idx].ptr >= WasmAllocator.heapBase) {
          //console.log("saving...");
          if (!first)
            sink.write(",");
          sink.write(__traits(identifier, t), ":s:", app.tupleof[idx].length, ":", app.tupleof[idx]);
          first = false;
       // }
      } else static if (is(typeof(t) == enum)) {
      } else static if (isAggregateType!(typeof(t))) {
        if (!first)
          sink.write(",");
        sink.write(__traits(identifier, t), `:a:{`);
        recurse(app.tupleof[idx], sink);
        sink.write('}');
        first = false;
      } else static if (isIntegral!(typeof(t))) {
        if (!first)
          sink.write(",");
        sink.write(__traits(identifier, t), `:i:`);
        sink.write(app.tupleof[idx]);
        first = false;
      }
    }}
  }
  StringAppender!() sink;
  sink.write('{');
  recurse(app, sink);
  sink.write('}');
  auto end = sink.length;
  //console.log(cast(string)sink[0..end]);
  //console.log(end);
  //console.log(cast(uint)sink.ptr);
  return cast(string)sink[0..end].idup;
}

ptrdiff_t countUntil(Range, Needle)(Range range, Needle needle) nothrow {
  foreach(idx, r; range)
    if (r == needle)
      return idx;
  return -1;
}

bool readBoolean(ref string state) nothrow {
  auto c = state[0];
  state = state[1..$];
  return c == 't';
}

unittest {
  import unit_threaded;
  string str = "t,";
  str.readBoolean.should == true;
  str.should == ",";
}

int readInt(ref string state) nothrow {
  size_t p = 0;
  int c = 0;
  while(true) {
    if (state[p] < '0' || state[p] > '9') {
      state = state[p..$];
      return c;
    }
    c = c * 10 + (state[p] - '0');
    p++;
  }
}

unittest {
  import unit_threaded;
  string str = "1234,";
  readInt(str).should == 1234;
  str.should == ",";
}

string readString(ref string state) nothrow {
  //console.log("readString");
  int size = readInt(state);
  string s = text(state[1..size+1]);
  //console.log(s);
  state = state[size+1..$];
  return s;
}

void skipField(ref string state) nothrow {
  //console.log("skipField");
  //console.log(state[0 .. 1]);
  char c = state[0];
  state = state[2 .. $];
  if (c == 'b')
    readBoolean(state);
  else if (c == 's')
    readString(state);
  else if (c == 'i')
    readInt(state);
  else if (c == 'a')
    skipObject(state);
  else if (c == '}')
    return;
  else {
    //console.log("End");
    state = "}";
  }

  //console.log(state);
}

void skipObject(ref string state) nothrow {
  //console.log("skipObject");
  while(1) {
    auto d = countUntil(state, ':');
    if (d == -1) {
      state = "}";
      return;
    }
    state = state[d+1..$];
    skipField(state);
    if (state.length == 0 || state == "}") return;
    if (state[0] == ',') {
      state = state[1..$];
    } else {
      if (state[0] == '}')
        state = state[1..$];
      else
        state = "}";
      return;
    }
  }
}

private void update(string field, T)(ref T t) nothrow {
  import libwasm.dom;
  alias member = __traits(getMember, t, field);
  libwasm.dom.update!(member)(t);
}

void loadState(T)(ref T app, string state) @system {
import std.traits : hasUDA;
  //console.log("loadstate");
  //console.log(state);
  void readObject(T)(ref T app, ref string state) {
    while(1) {
      //console.log("readObject");
      //console.log(state);
      auto d = countUntil(state, ':');
      if (d == -1) {
        state = "}";
        return;
      }
      auto field = state[0..d];
      //console.log("field: " ~ field);
      //console.log(state);
      //console.log(d);
      state = state[d+1..$];
      static foreach(idx, t; T.tupleof) {{
          //console.log("Handling: ");
          //console.log(__traits(identifier, t));
          //console.log(typeof(t).stringof);
          //pragma(msg, "Got type: " ~ typeof(t).stringof);
          if (field == __traits(identifier, t)) {
            //console.log(field);
            static if (isPointer!(typeof(t))) {
              //pragma(msg, "Pointer");
            } else static if (is(typeof(t) : EventEmitter!Params, Params...) || hasUDA!(typeof(t), eventemitter)) {
              //pragma(msg, "EventEmitter");
            } else static if (is(typeof(t) : NamedNode!(name, name), string name)) {
              //pragma(msg, "NamedNode1");
            } else static if (is(typeof(t) : NamedNode!(name, tag), string name, string tag)) {
              //pragma(msg, "NamedNode2");
            } else static if (is(typeof(t) : List!(Item, tag), Item, string tag)) {
              //pragma(msg, "List");
            } else static if (is(typeof(t) == ManagedPool)) {
              //pragma(msg, "ManagedPool");
            } else static if (is(typeof(t) : HTMLArray!(Item), Item)) {
              //pragma(msg, "HTMLArray");
            } else static if (isBoolean!(typeof(t))) {
              //console.log("Got bool");
              if (state[0] != 'b')
                skipField(state);
              else {
                state = state[2..$];
                app.tupleof[idx] = readBoolean(state);
                static if (hasMember!(typeof(t), "node")) update!(__traits(identifier, t),T)(app);
              }
            } else static if (isSomeString!(typeof(t))) {
              ////console.log("Got string");
              if (state[0] != 's')
                skipField(state);
              else {
                state = state[2..$];
                app.tupleof[idx] = readString(state);
                ////console.log("Got string: " ~ app.tupleof[idx]);
                static if (hasMember!(typeof(t), "node")) update!(__traits(identifier, t),T)(app);
              }
            } else static if (is(typeof(t) == enum)) {
            } else static if (isAggregateType!(typeof(t))) {
              //console.log("Got aggregate");
              if (state[0] != 'a')
                skipField(state);
              else {
                state = state[3..$];
                readObject(app.tupleof[idx],state);
              }
            } else static if (isIntegral!(typeof(t))) {
              //console.log("Got int");
              if (state[0] != 'i') {
                //console.log(state[0..1]);
                skipField(state);
              }
              else {
                state = state[2..$];
                app.tupleof[idx] = cast(typeof(t))readInt(state);
                static if (hasMember!(typeof(t), "node")) update!(__traits(identifier, t),T)(app);
              }
            }
          }
        }}
      //console.log(state);

      if (state.length == 0 || state == "}") return;

      if (state[0] == ',') {
        state = state[1..$];
      } else {
        if (state[0] == '}')
          state = state[1..$];
          
        else if (state[0] == 'a') {
          //console.log("Skipping unhandled aggregate");
          state = state[3 .. $];
          skipObject(state);
        }
        else {
          //console.log("No closing tag on " ~ state);
          state = "}";
        }
        return;
      }
      if (state.length == 0 || state == "}") return;
    }
  }
  state = state[1 .. $];
  readObject(app, state);
}

unittest {
  import unit_threaded;
  struct Bar {
    string str = "My Nested String";
    int number = 5678;
    bool boolean = false;
  }
  struct Foo {
    string str = "My String";
    int number = 1234;
    bool boolean = true;
    Bar bar;
    mixin NodeDef!"div";
  }
  struct Bar2 {
    string str;
    int number;
    bool boolean;
  }
  struct Foo2 {
    string str;
    int number;
    bool boolean;
    Bar2 bar;
    mixin NodeDef!"div";
  }
  Foo foo;
  string state = foo.dumpState();
  Foo2 foo2;
  foo2.loadState(state);
  foo2.str.should == "My String";
  foo2.number.should == 1234;
  foo2.boolean.should == true;
  foo2.bar.str.should == "My Nested String";
  foo2.bar.number.should == 5678;
  foo2.bar.boolean.should == false;
}
