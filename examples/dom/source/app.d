import libwasm.dom;
import libwasm.types;
import libwasm.spa;
import libwasm.bindings.KeyboardEvent;
import libwasm.bindings.Console;
import libwasm.bindings.Request;
import libwasm.bindings.Node;
import libwasm.bindings.Function;
import libwasm.rt.allocator;

import memutils.utils;
import memutils.vector;
import memutils.scoped;
import fast.json;
import fast.format;
import libwasm.moment;
nothrow:
@safe:

mixin Spa!App;

struct A {
  @serialize string App;
  @serialize double num;
  @serialize ulong numa;
}

struct User {
  static struct Data {
    int id;
    string email;
    string first_name;
    string last_name;
    string avatar;
  }
  static struct Support {
    string url;
    string text;
  }
  Data data;
  Support support;
}

struct Input {
  @style!"new-todo" mixin NodeDef!"input";
  mixin Slot!"enter";
  mixin Slot!"input";
  @prop string value;
  @attr string placeholder = "What needs to be done?";
  @callback void onKeyPress(KeyboardEvent event) {
    value = node.value;
    console.log("Got event");
    console.log(event);
    console.log(event.key);
    if (event.key == "Enter")
      this.emit(enter);
    this.emit(input);
  }
}

struct SomeText {
  mixin NodeDef!"p";
  @prop auto textContent = "Some text";
}

auto A() {
  return string.init;
}
string returnsStringForReal() {
  return null;
}

struct Main {
  nothrow:
  @style!"main" mixin NodeDef!"section";
  @child Input field;
  @child SomeText some_text;
  private ManagedPool m_pool;
  private bool m_construct_called;

  void construct() {
    m_pool = ManagedPool(64*1024);
    m_construct_called = true;
    returnsString().length;
  }

  @connect!("field.enter") void enter() @trusted {
    console.log("Construct called? ");
    console.log(m_construct_called ? "yes":"no");
    auto sp = ScopedPool(m_pool);
    //string nums = "0123456789";

    auto date = moment().format();
    console.log(date);
    JSON parsed = JSON.parse("[56542654262544562,452345435345423,34352435245254,243253254352435,1345242534543254,23452345342543243425430]");
    setTimeout(() { console.log("setTimeout called"); }, 10000);
    console.log("Returned from setTimeout");
    import libwasm.rt.allocator : ThreadMemAllocator;
    // used only for debugging memutils (for now)
    //auto ld = parsed.lodash();
/*    
    auto start = getTimeStamp();
    long valadd = 0;
    for(int i = 0; i < 50000; i++) {
      auto sp1 = ScopedPool(128);
      
      string json_str = `{"App": "SΛNNO\"𐍈€한", "num": 1011.654364536545, "numa": 134234232315000}`;
      auto json = parseJSON!(PoolStackAllocator)(json_str);
      A a = json.read!A;
      valadd += a.numa;

      Vector!char vec;
      size_t serlen = serializationLength(a) + 1; // + \0
      vec.resize(128);
      auto serialized_str = serializeJSON(vec[], a);
    }
    
    auto end = getTimeStamp();
console.log(start-end);
    
console.log(valadd);


    start = getTimeStamp();
    valadd = 0;
    for(int i = 0; i < 50000; i++) {
      string json_str = `{"App": "SΛNNO\"𐍈€한", "num": 1011.654364536545, "numa": 134234232315000}`;
      auto json = JSON(JSON.parse(json_str));
      valadd += json["numa"].as!long;
      auto str = JSON.stringify(json);
    }
    
    end = getTimeStamp();
console.log(start-end);
console.log(valadd);
    
    
    console.log(a.App);
    console.log(a.num);
    console.log(a.numa);
    console.log(cast(ulong)13431);
    console.log(json.hasError);
    bool failed = validateJSON!(PoolStackAllocator)(json_str);
    console.log(failed);

    double f = -120.12342232;
    auto str = decStr(f);
    console.log(cast(string)str[]);
    auto decimals = decCharsVal(f);
    console.log(decimals);
    Vector!char vec;
    size_t serlen = serializationLength(a) + 1; // + \0
    console.log(serlen);
    vec.resize(serlen);
    auto serialized_str = serializeJSON(vec[], a);
    console.log(serialized_str.length);
    console.log(cast(string)serialized_str);
    */
    RequestInit ri = RequestInit(JSON.parse(`{
      "method": "POST",
      "headers": {
        "Content-Type": "application/json;charset=utf-8"
      },
      "body": "{\"user\": 123}"
    }`));
    auto requestInfo = RequestInfo("https://reqres.in/api/users/2");
    auto promise = window.fetch(requestInfo, ri);
    promise.then(r => r.text).then((scope data){
      console.log("Resolved");
        console.log(typeof(data).stringof);
        auto sp = ScopedPool(m_pool);
        auto user_json = parseJSON!PoolStackAllocator(data.as!string);
        User user = user_json.read!User;
        console.log(user.data.avatar);
      }).error((scope reason) {
        console.log("Caught error");
        console.log(reason);
      });
/*
    auto sections = document().getElementsByTagName("section");
    
    console.log(sections);
    
    
    */
    JSON parsed = JSON.parse("[56542654262544562,452345435345423,34352435245254,243253254352435,1345242534543254,23452345342543243425430]");
    auto ld = parsed.lodash();
    for(int i = 0; i < 10000; i++) {
      JSON same_json = ld.forEach(delegate(long val, long key) { valadd += val; keyadd += key; return true; }).execute!JSON();
    }
    
    auto end = getTimeStamp();
    console.log(start - end);

    start = getTimeStamp();
    long test2;
    for(int i = 0; i < 10000; i++) {
      auto test = getTimeStamp();
      test2 += test;
    }
    
    
    console.log(test2);
    end = getTimeStamp();
    console.log(start - end);
    start = getTimeStamp();
    for(int i = 0; i < 100000; i++) {
      auto test = window().scrollMaxY();
      
      test2 += test;
    }
    console.log(test2);
    end = getTimeStamp();
    console.log(start-end);
    
/*
    import fast.format;
    import std.typecons : tuple;
    
    start = getTimeStamp();
    for(int i = 0; i < 10000; i++) {
      char[] buf = cast(char[]) ThreadMemAllocator.allocate(serializationLength(tuple("Some")));
      auto args = serializeJSON(buf, tuple("Some"));
      Object_VarArgCall__string(window()._parent.handle.handle, "btoa", "string", cast(string)args);
      ThreadMemAllocator.deallocate(buf);
    }
    end = getTimeStamp();
    console.log("Spread btoa");
    console.log(start-end);
    
    
    start = getTimeStamp();
    for(int i = 0; i < 10000; i++) {
      window().btoa("some");
    }
    end = getTimeStamp();
    console.log("window.btoa");
    console.log(start-end);
    */
    
    import diet.html : compileHTMLDietString;
    Vector!char output;
    string ret = compileHTMLDietString!(`doctype html
- auto title = "Hello, <World>";
html
	head
		title #{title} - example page
	body
		h1= title
		h2 Index
		ol.pageindex
			- foreach (i; 0 .. 3)
				li: a(href="##{i}") Point #{i}
		- foreach (i; 0 .. 3)
			h2(id=i) Point #{i}
			p.
				These are the #[em contents] of point #{i}. Multiple
				lines of text are contained in this paragraph.`)(output);
        console.log(format!"Output length is %d"(output.length)[]);
      console.log(output[]);
      console.log(ret);
  }
  @connect!("field.input") void input() {
    console.log("Input pressed");
    
    logObjects();
  }
}
extern(C) void logObjects();


struct App {
  nothrow:

  @style!"todoapp" mixin NodeDef!"section";
  @child Main main_section;

  ManagedPool m_pool;
  
  void construct() {
    m_pool = ManagedPool(64*1024);
    PoolStack.push(m_pool);
  }

  @trusted static void _start() {
    // mem for js promises
  }
}