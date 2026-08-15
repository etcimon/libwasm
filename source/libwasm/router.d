module libwasm.router;

import memutils.hashmap;
import libwasm.promise;
import libwasm.types;
import libwasm.bindings.MouseEvent;
import libwasm.bindings.Event;
import std.traits : isPointer, isAggregateType;
import memutils.vector;
import memutils.scoped;
import optional;
// std.complex is not in druntime-wasm (LDC 1.36 Phobos subset); unused here.

// Match setup in compile

@safe nothrow:

enum Direction
{
    Entering,
    Leaving,
    Always
}

struct RouterEvent
{
    HashMap!(string, string) parameters;
    string prevURL;
    string newURL;
}
/*
@entering!"/this/path/:id/" Promise!Any routeHandler(RouterEvent ev) {

}

todo: Write Promise on ThreadMemAllocator



https://github.com/CyberShadow/ae/blob/master/utils/promise/package.d

*/

private enum maxRouteParameters = 64;

private class Route
{
@safe nothrow:

    Array!char pattern;
    Array!char active_url;
    Optional!(Promise!void) delegate(ref RouterEvent ev) entering_cb;
    Optional!(Promise!void) delegate(ref RouterEvent ev) leaving_cb;
    Optional!(Promise!void) delegate(ref RouterEvent ev) always_cb;
    this(Array!char _pattern) { pattern = _pattern; }
    ~this() {
        //console.log("Route destroyed for pattern");
        //console.log(pattern[]);
    }

    bool matches(string url, ref HashMap!(string, string) params) @trusted
    {
        size_t i, j;
        //console.log("Matches");
        //console.log(url);
        // store parameters until a full match is confirmed
        import memutils.ct;

        Tuple!(string, string)[maxRouteParameters] tmpparams;
        size_t tmppparams_length = 0;

        for (i = 0, j = 0; i < url.length && j < pattern.length;)
        {
            if (pattern[j] == '*')
            {
                foreach (t; tmpparams[0 .. tmppparams_length])
                    params[cast(string) t[0]] = cast(string) t[1];
                return true;
            }
            if (url[i] == pattern[j])
            {
                i++;
                j++;
            }
            else if (pattern[j] == ':')
            {
                j++;
                string name = skipPathNode(pattern[], j);
                string match = skipPathNode(url, i);
                assert(tmppparams_length < maxRouteParameters, "Maximum number of route parameters exceeded.");
                tmpparams[tmppparams_length++] = tuple(name, match);
            }
            else
                return false;
        }

        if ((j < pattern.length && pattern[j] == '*') || (i == url.length && j == pattern.length))
        {
            foreach (t; tmpparams[0 .. tmppparams_length])
                params[cast(string) t[0]] = cast(string) t[1];
            return true;
        }

        return false;
    }

    bool matches(string url)
    {
        //console.log("matches");
        //console.log(url);
        size_t i, j;

        for (i = 0, j = 0; i < url.length && j < pattern.length;)
        {
            if (pattern[j] == '*')
            {
                return true;
            }
            if (url[i] == pattern[j])
            {
                i++;
                j++;
            }
            else if (pattern[j] == ':')
            {
                j++;
                while (i < url.length && url[i] != '/')
                    i++;
                while (j < pattern.length && pattern[j] != '/')
                    j++;
            }
            else
                return false;
        }

        if ((j < pattern.length && pattern[j] == '*') || (i == url.length && j == pattern.length))
        {
            return true;
        }

        return false;
    }

static:
    private string skipPathNode()(string str, ref size_t idx)
    {
        size_t start = idx;
        while (idx < str.length && str[idx] != '/')
            idx++;
        return str[start .. idx];
    }

    private string skipPathNode()(ref string str)
    {
        size_t idx = 0;
        auto ret = skipPathNode(str, idx);
        str = str[idx .. $];
        return ret;
    }
}

/// Higher is more specific. Static chars >> `:param` >> `*`.
private int patternSpecificity(string pattern)
{
    int s;
    for (size_t i = 0; i < pattern.length; i++)
    {
        if (pattern[i] == '*')
            s += 1;
        else if (pattern[i] == ':')
        {
            s += 10;
            while (i + 1 < pattern.length && pattern[i + 1] != '/')
                i++;
        }
        else if (pattern[i] != '/')
            s += 100;
    }
    return s;
}

class URLRouter
{
@safe nothrow:

    private
    {
        bool m_is_setup;
        Array!char m_base_path;
        Array!Route m_routes;
        // Array!Route m_routesForAlways;

        Array!Route m_activeRoutes;
        Array!char m_currentURL;

        // defined when concurrent URL changes occur and promises are still pending
        bool m_busy;
        Array!char m_pendingURL;

        Array!char m_title;
        ManagedPool m_pool;
    }

    this() {
        m_pool = ManagedPool(64*1024);
        setupRouter();
    }

    ~this()
    {

        //console.error("Destroying router");

    }

    void setTitle()(string title) @trusted
    {
        m_title = Array!char(title);
    }

    string getTitle()() @trusted
    {
        return m_title[];
    }

    void setBasePath()(string base_url)
    {
        m_base_path = Array!char(base_url);
    }

    string getBasePath()() @trusted
    {
        return m_base_path[];
    }

    void delegate(Handle) getDelegate() {
        return (Handle hndl) {
                //console.log("In delegate");
                string path = libwasm_get__string(hndl);
                //console.log("Got path");
                //console.log(path);
                navigateTo(path);
                //console.log("Done");
                libwasm_removeObject(hndl);
            };
    }

    private void setupRouter()
    {
        if (!m_is_setup)
        {
            import libwasm.dom : document, window;
            import libwasm.bindings.Location;
            import libwasm.bindings.Window;
            import libwasm.bindings.EventHandler;
            //console.log("Allocating delegate");
            exportDelegate("navigate_to", getDelegate());
            //console.log("Allocated delegate");

            auto onpopstate = EventHandler(cast(EventHandlerNonNull)(&onPopState));
            window().onpopstate(onpopstate);
            m_is_setup = true;
        }
    }

    // struct PromiseIterator {
    private
    {
    @safe nothrow:

        Array!Route leaving_candidates;
        Array!Route entering_candidates;
        Array!char newPath;

        void setupIterator(Array!Route _leaving_candidates, Array!Route _entering_candidates, Array!char _newPath)
        {
            leaving_candidates = _leaving_candidates;
            //console.log("Setting up iterator with n entering candidates");
            //console.log(_entering_candidates.length);
            entering_candidates = _entering_candidates;
            newPath = _newPath;
        }

        /// Kit: one page @entering per path. Static segments beat :params
        /// so `/:slug` does not steal `/admin`.
        void keepBestEntering(string url)
        {
            Route best;
            int bestScore = int.min;
            foreach (r; entering_candidates[])
            {
                if (!r.matches(url))
                    continue;
                auto s = patternSpecificity(r.pattern[]);
                if (s > bestScore)
                {
                    bestScore = s;
                    best = r;
                }
            }
            entering_candidates.clear();
            if (best !is null)
                entering_candidates ~= best;
        }

        /// Drop a left route so a later visit can @entering again
        /// (back/forward and callNative to a previously shown page).
        void dropActive(Route r)
        {
            Array!Route kept;
            foreach (route; m_activeRoutes[])
            {
                if (route !is r)
                    kept ~= route;
            }
            m_activeRoutes = kept;
        }

        void iterate()() @trusted
        {
            bool still_busy;
            import libwasm.bindings.Console;

            auto scoped = ScopedPool(m_pool);
            //console.log("Iterate: ");
            //console.log(m_title[]);
            //console.log(newPath[]);
            //console.log(newPath[] == "/home");
            if (!leaving_candidates.empty)
            {
                //console.log("Leaving candidates n:");
                //console.log(leaving_candidates.length);
                auto r = leaving_candidates.back;
                leaving_candidates.removeBack();
                if (!r.matches(newPath[]))
                {
                    RouterEvent ev;
                    ev.newURL = newPath[];
                    ev.prevURL = m_currentURL[];
                    r.matches(r.active_url[], ev.parameters);

                    Optional!(Promise!void) promise;
                    if (r.leaving_cb) promise = r.leaving_cb(ev);
                    r.active_url.clear();
                    dropActive(r);
                    if (!promise.empty)
                    {
                        promise.front.then(&iterate);
                        still_busy = true;
                    }
                }
            }
            else if (!entering_candidates.empty)
            {
                //console.log("We have entering candidates");
                RouterEvent ev;
                auto r = entering_candidates.front;
                entering_candidates.removeFront();

                //console.log(newPath[]);
                bool found;
                foreach (route; m_activeRoutes[]) {
                    if (route.pattern[] == r.pattern[]) {
                        found = true;
                        break;
                    }
                }
                // Re-fire @entering even when the route is still active so
                // kit setVisible + applyKitParams run on back/forward and
                // on /users/:id param changes.
                if (r.matches(newPath[], ev.parameters))
                {
                    ev.newURL = newPath[];
                    ev.prevURL = m_currentURL[];
                    Optional!(Promise!void) promise;
                    if (r.entering_cb) promise = r.entering_cb(ev);
                    r.active_url[] = cast(char[]) newPath[];
                    if (!found)
                        m_activeRoutes ~= r;
                    if (!promise.empty)
                    {
                        promise.front.then(&iterate);
                        still_busy = true;
                    }
                }
            }
            else
            {
                    //console.log("Both entering and leaving candidates were empty");
                m_busy = false;
                m_currentURL = Array!char(newPath[]);

                import libwasm.bindings.Window;
                import libwasm.bindings.History;
                import libwasm.dom : window, document;

                // Do not pushState when the browser already has this path
                // (popstate / callNative after history.pushState).
                string here;
                auto loc = document().location();
                if (!loc.empty)
                    here = loc.front.pathname();
                if (m_is_setup && here != newPath[])
                    window().history().pushState(null, m_title[], Optional!string(newPath[]));

                // we finished iteration
                if (!m_pendingURL.empty())
                {
                    auto url = m_pendingURL;
                    m_pendingURL.clear();
                    navigateTo(url[]);
                }
                return;
            }

            if (!still_busy)
                iterate();

            // todo: detect finished iteration and start over for the pendingURL if need be

        }
        //}
    }

    /// Adds a new route for requests matching the specified HTTP method and pattern.
    void register(string path)(Optional!(Promise!void) delegate(
            ref RouterEvent ev) nothrow @safe cb, Direction direction)
    {
        auto scoped = ScopedPool(m_pool);
        //console.log("Registering");
        //console.log(path);
        //static assert(path.count(':') <= maxRouteParameters, "Too many route parameters");
        bool found;
        foreach (route; m_routes[])
        {
            if (route.pattern[] == path)
            {
                final switch (direction)
                {
                case Direction.Entering:
                     //console.log("Is entering cb");
                    route.entering_cb = cb;
                    break;
                case Direction.Leaving:
                    route.leaving_cb = cb;
                    break;
                case Direction.Always:
                    route.always_cb = cb;
                    break;
                }
                found = true;
                break;
            }
        }
        if (!found)
        {
            auto route = new Route(Array!char(path));
            final switch (direction)
            {
            case Direction.Entering:
                     //console.log("Is entering cb");
                route.entering_cb = cb;
                break;
            case Direction.Leaving:
                     //console.log("Is leaving cb");
                route.leaving_cb = cb;
                break;
            case Direction.Always:
                route.always_cb = cb;
                break;
            }
            m_routes ~= route;
        }

    }

    /// Handles a HTTP request by dispatching it to the registered route handlers.
    void navigateTo(string new_url)
    {
        //console.log("navigating to1");
        auto scoped = ScopedPool(m_pool);
        //console.log("navigating to");
        //console.log(new_url);
        //console.log(m_base_path.length);
        if (new_url.length < m_base_path.length || (m_base_path.length > 0 && new_url[0 .. m_base_path.length] != m_base_path[]))
            return;
        new_url = new_url[m_base_path.length .. $];

        // queue path changes due to promises
        if (m_busy)
        {
            m_pendingURL = Array!char(new_url);
            return;
        }

        m_busy = true;

        //console.log("Setup Iterator");
        //console.log(m_routes.length);
        setupIterator(Array!Route(m_activeRoutes[]), Array!Route(m_routes[]), Array!char(new_url));
        keepBestEntering(new_url);
        //console.log("Iterate");
        iterate();

    }

    void handleLinkEvent()(MouseEvent ev)
    {
        auto scoped = ScopedPool(m_pool);
        import libwasm.bindings.HTMLLinkElement;
        import libwasm.bindings.Node;

        auto pool = ScopedPool();
        auto target = Node(ev.target().front);
        if (target.nodeName() == "A")
        {
            auto el = target.as!HTMLLinkElement;
            if (!el.getAttribute("internal").empty())
            {
                string link_url = el.href();
                navigateTo(link_url);
                ev.preventDefault();
            }
        }
    }

    Any onPopState(Event ev)
    {
        import libwasm.dom : document;
        import libwasm.bindings.Location;
        import libwasm.bindings.Window;

        auto scoped = ScopedPool(m_pool);
        navigateTo(document().location().front.pathname());
        return Any.init;
    }

}

void registerRoutes(T, Ts...)(return auto ref T t, return auto ref Ts ts) @trusted
{
    import std.meta : AliasSeq;
    import std.traits : hasUDA, isCallable, getUDAs, PointerTarget, FieldNameTuple;
    import libwasm.dom : compile;
    //console.log("Registering routes for ");
    //console.log(t.stringof);
    //console.log(T.tupleof.stringof);
    static foreach (i; __traits(allMembers, T))
    {
        {
            import std.traits : isSomeFunction;
            static if (AliasSeq!(__traits(getOverloads, T, i)).length > 0)
            {
                alias sym = AliasSeq!(__traits(getOverloads, T, i))[0];
            }
            else
            {
                alias sym = AliasSeq!(__traits(getMember, T, i))[0];
            }
            enum isPublic = __traits(compiles, __traits(getProtection, sym)) &&  __traits(getProtection, sym) == "public";
            
            static if (isPublic && isSomeFunction!sym && !__traits(isTemplate, sym) && isCallable!(sym) && (hasUDA!(sym, entering) || hasUDA!(sym, leaving)))
            {
                static if (isPointer!(typeof(sym)))
                    alias ChildType = PointerTarget!(typeof(sym));
                else
                    alias ChildType = typeof(sym);

                //enum i = sym.stringof; // TODO: can this be fieldName = __traits(identifier, sym) instead of i = sym.stringof ??
                enum isImmutable = is(typeof(sym) : immutable(T), T);
                static if (hasUDA!(sym, entering))
                {
                    alias enteringUDAs = getUDAs!(sym, entering);
                    static foreach (enteringUDA; enteringUDAs)
                    {{
                        //console.log("Found entering UDA for ");
                        //console.log(i);
                        static if (is(enteringUDA : entering!path, string path))
                        {
                            // callMember behind the scenes
                            g_router.register!path(cast(Optional!(Promise!void) delegate(
                                    ref RouterEvent ev) nothrow @safe)&__traits(getMember, t, i), Direction
                                    .Entering);
                        }
                    }}
                }
                else static if (hasUDA!(sym, leaving))
                {
                    alias leavingUDAs = getUDAs!(sym, leaving);
                    static foreach (leavingUDA; leavingUDAs)
                    {{
                        static if (is(leavingUDA : leaving!path, string path))
                        {
                            // callMember behind the scenes
                            g_router.register!path(cast(Optional!(Promise!void) delegate(
                                    ref RouterEvent ev) nothrow @safe)&__traits(getMember, t, i), Direction
                                    .Leaving);
                        }
                    }}
                }
                /*
            else static if (hasUDA!(sym, always)) {
                alias udas = getUDAs!(field, always);
                static foreach (uda; udas) {
                    static if (is(uda : always!path, string path)) {
                        // callMember behind the scenes
                        g_router.register!path(__traits(getMember, t, sym), Direction.Always);
                    }
                }
            }*/
            }
        }
    }
    static foreach (i; FieldNameTuple!T)
    {
        {
            alias sym = AliasSeq!(__traits(getMember, T, i))[0];
            enum isPublic = __traits(compiles, __traits(getProtection, sym)) &&  __traits(getProtection, sym) == "public";
            
            static if (isPublic && !isCallable!(sym) && hasUDA!(sym, child))
            {                
                import libwasm.spa;
                alias Params = getUDAs!(sym, Parameters);
                static if (Params.length > 0)
                {
                    verifyChildParams!(T, i, Params);
                    auto params = createParameterTuple!(Params)(AliasSeq!(t, ts));
                }
                else
                    alias params = AliasSeq!();
                    
                static if (isPointer!(typeof(sym)))
                    alias ChildType = PointerTarget!(typeof(sym));
                else
                    alias ChildType = typeof(sym);
                static if (isAggregateType!(ChildType))
                { // recurse through the child members

                    static if (isPointer!(typeof(sym)))
                    {
                        if (__traits(getMember, t, i) !is null)
                        {
                            static if (!is(ChildType == T))
                                registerRoutes(*__traits(getMember, t, i), AliasSeq!(params, t, ts));
                        }
                    }
                    else
                        registerRoutes(__traits(getMember, t, i), AliasSeq!(params, t, ts));
                }
                
            }
        }
    }
}

void setupRouter()()
{
    g_router = new URLRouter();
}

URLRouter router()
{
    return g_router;
}

private URLRouter g_router;
