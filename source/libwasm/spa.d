module libwasm.spa;

version (LDC) import ldc.attributes;
public import libwasm.types;
public import libwasm.dom;
public import libwasm.node;
public import libwasm.event;
public import libwasm.array;
public import libwasm.css;
public import libwasm.router;

nothrow:
@safe void log_info(string msg)
{
  import libwasm.bindings.Console;

  console.info(msg);
}

@safe void log_error(string msg)
{
  import libwasm.bindings.Console;

  console.error(msg);
}

char[] parse_int(long num) nothrow @trusted
{
  import libwasm.rt.allocator : ThreadMemAllocator;

  // used only for debugging memutils (for now)
  import fast.format;

  char[] buf = cast(char[]) ThreadMemAllocator.allocate(decCharsVal(num));
  return formattedWrite!"%d"(buf.ptr, num);
}

extern (C)
{
  Handle getRoot();
}

version (unittest)
{
  auto assumeNoThrow(T)(lazy T block)
  {
    try
    {
      return block();
    }
    catch (Exception e)
    {
      assert(false, e.msg);
    }
  }

  auto renderToNode(T)(auto ref T t) @trusted
  {
    import unit_threaded;

    Handle rootIdx = cast(Handle) unittest_dom_nodes.data.length;
    auto rootNode = new UnittestDomNode(NodeType.root, rootIdx + 1);
    unittest_dom_nodes.put(rootNode);
    t.compile();
    libwasm.dom.render(JsHandle(rootIdx + 1), t);
    assert(t.getNamedNode().node != invalidHandle);
    assert(t.getNamedNode().mounted == true);
    return rootNode;
  }

  string renderToString(T)(auto ref T t)
  {
    import std.format : format;

    static if (is(T : UnittestDomNode))
    {
      auto node = t;
    }
    else
      auto node = t.renderToNode;
    return format("%s", node).assumeNoThrow;
  }

  string renderToString(T)()
  {
    T t;
    return t.renderToString();
  }
}

void addApplicationCss(Application, Theme)()
{
  enum css = GetCss!(Application, Theme);
  static if (css.length > 0)
    addCss(css);
}

mixin template Spa(Application)
{
  struct Empty
  {
  }

  mixin Spa!(Application, Empty);
}

mixin template Spa(Application, Theme)
{
  __gshared Application application;
  pragma(mangle, "_start")
  extern (C)
  export
  @trusted void _start(uint heap_base)
  {
    import libwasm.rt.memory;
    import fast.internal.helpers : logInfo, logError;
    import memutils.constants : writeln, parseInt;
    import memutils.scoped;
    alloc_init(heap_base);
    PoolStack.initialize();
    auto root = getRoot();
    addApplicationCss!(Application, Theme)();
    writeln = &log_info;
    parseInt = &parse_int;
    logInfo = &log_info;
    logError = &log_error;
    static if (__traits(hasMember, Application, "main"))
    {
      application.main();
    }
    application.compile();
    setupRouter();
    application.registerRoutes();
    libwasm.dom.render(root, application);
    static if (__traits(hasMember, Application, "ready"))
    {
      application.ready();
    }
    else router().navigateTo(document().location().front.pathname());
  }

  version (hmr)
  {
    //pragma(msg, "libwasm with HMR");
    import libwasm.hmr;
    import libwasm.types : console;

    pragma(mangle, "dumpApp")
    extern (C) export string dumpApp() @system
    {
      return application.dumpState();
    }

    pragma(mangle, "loadApp")
    extern (C) export void loadApp(string state) @system
    {
      application.loadState(state);
    }
  }
}

struct Parameters(Ps...)
{
  static template opDispatch(string name)
  {
    alias opDispatch(alias P) = Parameters!(Ps, Param!(name, P)); // does this use only public fields?
  }
}

auto param()
{
  return Parameters!()();
}

struct Param(string name, alias field)
{
  alias Name = name;
  alias Field = field;
}
