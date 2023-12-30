import libwasm.dom;
import libwasm.types;
import libwasm.spa;
import libwasm.bindings;
import libwasm.rt.allocator;
import libwasm.router;

import memutils.utils;
import memutils.vector;
import memutils.scoped;
import fast.json;
import fast.format;
import libwasm.moment;
import optional;
import object;
import libwasm.promise;
nothrow:
@safe:

mixin Spa!App;

struct A {
  @serialize string App;
  @serialize double num;
  @serialize ulong numa;
}

struct User {
    string id;
    int user;
    string createdAt;
}

struct Input {
  @style!"new-todo" mixin NodeDef!"input";
  mixin Slot!"enter";
  mixin Slot!"input";
  @prop string value;
  @attr string placeholder = "What needs to be done?";
  @callback void onKeyPress(KeyboardEvent event) {
    value = node.value;
    if (event.key == "Enter")
      this.emit(enter);
    this.emit(input);
  }
  @entering!"/home" Optional!(Promise!void) home(ref RouterEvent ev) {
    console.log("called promise");
    router().setTitle("Home");
    return Optional!(Promise!void)();
  }
}

  
struct SomeText {
  mixin NodeDef!"p";
  @prop auto textContent = "Some text";
  @prop string innerHTML;
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
  }

  void catchOnClick(Handle hndl) {
    MouseEvent ev = MouseEvent(hndl);
    console.log("Hello from D");
    console.log(ev);
  }

  @connect!("field.enter") void enter() @trusted {
    auto pool = ScopedPool(m_pool);
    import diet.html : compileHTMLDietFile;
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
        console.log(user.createdAt);
      }).error((scope reason) {
        console.log("Caught error");
        console.log(reason);
      });

    string s = new string(5);
    s = "hello";
    console.log(s);
    Vector!char output;
    unexportDelegate("on_click");
    exportDelegate("on_click", &catchOnClick);
    compileHTMLDietFile!(`home.dt`)(output);
        
        console.log(format!"Output length is %d"(output.length)[]);
      console.log(output[]);
    this.some_text.update.innerHTML = output[];    
    logObjects();
  }
  @connect!("field.input") void input() {    
    console.log("Hello");
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