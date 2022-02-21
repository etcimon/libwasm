module spasm.spa;

version (LDC)
import ldc.attributes;
public import spasm.types;
public import spasm.dom;
public import spasm.node;
public import spasm.event;
public import spasm.array;
public import spasm.css;

nothrow:

extern(C) {
  Handle getRoot();
}

version (unittest) {
  auto assumeNoThrow(T)(lazy T block) {
    try {
      return block();
    } catch (Exception e) {
      assert(false, e.msg);
    }
  }
  auto renderToNode(T)(auto ref T t) {
    import unit_threaded;
    Handle rootIdx = cast(Handle)unittest_dom_nodes.data.length;
    auto rootNode = new UnittestDomNode(NodeType.root, rootIdx + 1);
    unittest_dom_nodes.put(rootNode);
    t.setPointers();
    spasm.dom.render(JsHandle(rootIdx + 1), t);
    // assert(t.getNamedNode().node != invalidHandle);
    // assert(t.getNamedNode().mounted == true);
    return rootNode;
  }
  string renderToString(T)(auto ref T t) {
    import std.format : format;
    static if (is(T : UnittestDomNode)) {
      auto node = t;
    } else
      auto node = t.renderToNode;
    return format("%s", node).assumeNoThrow;
  }
  string renderToString(T)() {
    T t;
    return t.renderToString();
  }
}

void addApplicationCss(Application, Theme)() {
  enum css = GetCss!(Application, Theme);
  static if (css.length > 0)
    addCss(css);
}

mixin template Spa(Application) {
  struct Empty{}
  mixin Spa!(Application,Empty);
}

mixin template Spa(Application, Theme) {
  __gshared Application application;
  pragma(mangle, "_start")
  extern(C)
  export
  @trusted void _start(uint heap_base) {
    import spasm.rt.memory;
    alloc_init(heap_base);
    auto root = getRoot();
    addApplicationCss!(Application, Theme)();
    static if (__traits(hasMember, Application, "_start")) {
      application._start();
    }
    application.setPointers();
    spasm.dom.render(root, application);
  }
  version(hmr) {
    pragma(msg, "spasm with HMR");
    import spasm.hmr;
    pragma(mangle, "dumpApp")
    extern(C) export string dumpApp() {
      return application.dumpState();
    }
    pragma(mangle, "loadApp")
    extern(C) export void loadApp(string state) {
      application.loadState(state);
    }
  }
}

struct Parameters(Ps...) {
  static template opDispatch(string name) {
    alias opDispatch(alias P) = Parameters!(Ps, Param!(name, P));
  }
}

auto param() {
  return Parameters!()();
}

struct Param(string name, alias field) {
  alias Name = name;
  alias Field = field;
}
