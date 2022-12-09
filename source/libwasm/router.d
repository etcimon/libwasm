module libwasm.router;

import memutils.hashmap;
import libwasm.promise;
import libwasm.types;
import libwasm.bindings.MouseEvent;
import libwasm.bindings.Event;
import std.traits : isPointer,isAggregateType;
import memutils.vector;
import memutils.scoped;
import optional;

// Match setup in compile

@safe nothrow:

enum Direction {
    Entering, Leaving, Always
}

struct RouterEvent {
    URLRouter* router;
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

private struct Route {
    @safe nothrow: 

	Array!char pattern;
    Array!char active_url;
	Optional!(Promise!void) delegate(ref RouterEvent ev) entering_cb;
	Optional!(Promise!void) delegate(ref RouterEvent ev) leaving_cb;
	Optional!(Promise!void) delegate(ref RouterEvent ev) always_cb;

	bool matches(string url, ref HashMap!(string, string) params) @trusted
	{
		size_t i, j;

		// store parameters until a full match is confirmed
		import std.typecons;
		Tuple!(string, string)[maxRouteParameters] tmpparams;
		size_t tmppparams_length = 0;

		for (i = 0, j = 0; i < url.length && j < pattern.length;) {
			if (pattern[j] == '*') {
				foreach (t; tmpparams[0 .. tmppparams_length])
					params[cast(string)t[0]] = cast(string)t[1];
				return true;
			}
			if (url[i] == pattern[j]) {
				i++;
				j++;
			} else if(pattern[j] == ':') {
				j++;
				string name = skipPathNode(pattern[], j);
				string match = skipPathNode(url, i);
				assert(tmppparams_length < maxRouteParameters, "Maximum number of route parameters exceeded.");
				tmpparams[tmppparams_length++] = tuple(name, match);
			} else return false;
		}

		if ((j < pattern.length && pattern[j] == '*') || (i == url.length && j == pattern.length)) {
			foreach (t; tmpparams[0 .. tmppparams_length])
				params[cast(string)t[0]] = cast(string)t[1];
			return true;
		}

		return false;
	}
    
	bool matches(string url)
	{
		size_t i, j;

		for (i = 0, j = 0; i < url.length && j < pattern.length;) {
			if (pattern[j] == '*') {
				return true;
			}
			if (url[i] == pattern[j]) {
				i++;
				j++;
			} else if(pattern[j] == ':') {
				j++;
                while( i < url.length && url[i] != '/' ) i++;
                while( j < pattern.length && pattern[j] != '/' ) j++;
			} else return false;
		}

		if ((j < pattern.length && pattern[j] == '*') || (i == url.length && j == pattern.length)) {
			return true;
		}

		return false;
	}

    static:
    private string skipPathNode(string str, ref size_t idx)
    {
        size_t start = idx;
        while( idx < str.length && str[idx] != '/' ) idx++;
        return str[start .. idx];
    }

    private string skipPathNode(ref string str)
    {
        size_t idx = 0;
        auto ret = skipPathNode(str, idx);
        str = str[idx .. $];
        return ret;
    }
}



struct URLRouter {
    @safe nothrow:

	private {
        bool m_is_setup;
        Array!char m_base_path;
		Array!Route m_routes;
        // Array!Route m_routesForAlways;

        Array!Route m_activeRoutes;
        Array!char m_currentURL;

        // defined when concurrent URL changes occur and promises are still pending
        bool m_busy;
        Array!char m_pendingURL;
        PromiseIterator m_promiseIterator;

        Array!char m_title;
	}

    ~this() {
        import libwasm.bindings.Console;
        console.error("Destroying router");

    }

    void setTitle(string title) @trusted {
        m_title = Array!char(title);
    }

    string getTitle() @trusted {
        return m_title[];
    }

    void setBasePath(string base_url) {
        m_base_path = Array!char(base_url);
    }

    string getBasePath() @trusted {
        return m_base_path[];
    }

    void setupRouter() @trusted {
        if (!m_is_setup) {
            import libwasm.dom : document, window;
            import libwasm.bindings.Location;
            import libwasm.bindings.Window;
            import libwasm.bindings.EventHandler;
            auto scoped = ScopedPool();
            auto onpopstate = EventHandler(cast(EventHandlerNonNull)(&onPopState));
            window().onpopstate(onpopstate);
            navigateTo(document().location().front.pathname());
            m_is_setup = true;
        }        
    }

    struct PromiseIterator {
        @safe nothrow:

        Array!Route leaving_candidates;
        Array!Route entering_candidates;
        Array!char newPath;

        URLRouter* parent;

        void iterate() @trusted {
            bool still_busy;
                import libwasm.bindings.Console;
                
                console.log("Iterate: ");
                console.log(parent.m_title[]);
                console.log(newPath[]);
                console.log(newPath[] == "/home");
            if (!leaving_candidates.empty) {
                auto r = leaving_candidates.back;
                leaving_candidates.removeBack();
                if (!r.matches(newPath[])) {
                    RouterEvent ev;
                    ev.newURL = newPath[];
                    ev.prevURL = parent.m_currentURL[];
                    ev.router = parent;
                    r.matches(r.active_url[], ev.parameters);

                    Optional!(Promise!void) promise = r.leaving_cb(ev);
                    r.active_url.clear();
                    // remove from activeRoutes
                    if (!promise.empty) {
                        promise.front.then(&iterate);
                        still_busy = true;             
                    } 
                } 
            }
            else if (!entering_candidates.empty) {
                RouterEvent ev;
                auto r = entering_candidates.front;
                entering_candidates.removeFront();

                    console.log(newPath[]);
                import std.algorithm : canFind;
                if (!parent.m_activeRoutes[].canFind(r))  {
                        console.log(newPath[]);
                    if (r.matches(newPath[], ev.parameters)) {
                        console.log(newPath[]);
                        ev.newURL = newPath[];
                        ev.prevURL = parent.m_currentURL[];
                        ev.router = parent;
                        console.log(newPath[]);

                        Optional!(Promise!void) promise = r.entering_cb(ev);
                        r.active_url[] = cast(char[])newPath[];
                        console.log("Added to active url");
                        console.log(newPath[]);
                        parent.m_activeRoutes ~= r;
                        if (!promise.empty) {
                            console.log("Promise was not empty");
                            promise.front.then(&iterate);
                            still_busy = true;
                        } 
                    }
                }
            }
            else {
                parent.m_busy = false;
                
                import libwasm.bindings.Window;
                import libwasm.bindings.History;
                import libwasm.dom : window;
                
                console.log("Pushing state: ");
                console.log(parent.m_title[]);
                console.log(newPath[]);
                window().history().pushState(null, parent.m_title[], Optional!string(newPath[]));

                // we finished iteration
                if (!parent.m_pendingURL.empty()) {
                    auto url = parent.m_pendingURL;
                    parent.m_pendingURL.clear();
                    parent.navigateTo(url[]);
                }
                return;
            }

            if (!still_busy) iterate();

            // todo: detect finished iteration and start over for the pendingURL if need be

        }
    }
    
	/// Adds a new route for requests matching the specified HTTP method and pattern.
	void register(string path)(Optional!(Promise!void) delegate(ref RouterEvent ev) nothrow @safe cb, Direction direction)
	{
		//static assert(path.count(':') <= maxRouteParameters, "Too many route parameters");
        bool found;
        foreach (route; m_routes[]){
            if (route.pattern[] == path) {
                final switch (direction) 
                {
                    case Direction.Entering:
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
        if (!found) {
            auto route = Route(Array!char(path));
            final switch (direction) 
            {
                case Direction.Entering:
                    route.entering_cb = cb;
                    break;
                case Direction.Leaving:
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
        import libwasm.bindings.Console;
        console.log("navigating to");
        console.log(new_url);

		if (new_url.length < m_base_path.length || new_url[0 .. m_base_path.length] != m_base_path[]) return;
		new_url = new_url[m_base_path.length .. $];

        // queue path changes due to promises
        if (m_busy) {
            m_pendingURL = Array!char(new_url);
            return;
        }

        m_busy = true;

        m_promiseIterator = PromiseIterator(Array!Route(m_activeRoutes[]), Array!Route(m_routes[]), Array!char(new_url), &this);
        m_promiseIterator.iterate();
        
	}

    void handleLinkEvent(MouseEvent ev) {
        import libwasm.bindings.HTMLLinkElement;
        import libwasm.bindings.Node;
        
        auto pool = ScopedPool();
        auto target = Node(ev.target().front);
        if (target.nodeName() == "A") {
            auto el = target.as!HTMLLinkElement;
            if (!el.getAttribute("internal").empty()) {
                string link_url = el.href();
                navigateTo(link_url);
                ev.preventDefault();
            }
        }
    }

    Any onPopState(Event ev) {
        import libwasm.dom : document;
        import libwasm.bindings.Location;
        import libwasm.bindings.Window;

        auto scoped = ScopedPool();
        navigateTo(document().location().front.pathname());
        return Any.init;
    }

}  

void registerRoutes(T)(auto ref T t) @trusted {
  import std.meta : AliasSeq;
  import std.traits : hasUDA, isCallable, getUDAs;
  import libwasm.dom : compile;
  static foreach(i; __traits(allMembers, T)) {{
        alias sym = __traits(getMember, t, i); 
        static if (isPointer!(typeof(sym)))
            alias ChildType = PointerTarget!(typeof(sym));
        else
            alias ChildType = typeof(sym);
        enum isPublic = __traits(getProtection, sym) == "public";
        static if (hasUDA!(sym, entering)) {
            alias udas = getUDAs!(sym, entering);
            static foreach (uda; udas) {
                static if (is(uda : entering!path, string path)) {
                    // callMember behind the scenes
                    g_router.register!path(cast(Optional!(Promise!void) delegate(ref RouterEvent ev) nothrow @safe)&__traits(getMember, t, i), Direction.Entering);
                }
            }
        }
        else static if (hasUDA!(sym, leaving)) {
            alias udas = getUDAs!(sym, leaving);
            static foreach (uda; udas) {
                static if (is(uda : leaving!path, string path)) {
                    // callMember behind the scenes
                    g_router.register!path(cast(Optional!(Promise!void) delegate(ref RouterEvent ev) nothrow @safe)&__traits(getMember, t, i), Direction.Leaving);
                }
            }
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
        else static if (isPublic && isAggregateType!ChildType && hasUDA!(sym, child) && !isCallable!(typeof(sym))) {
            static if (isPointer!(typeof(sym)))
                registerRoutes(*__traits(getMember, t, i));
            else
                registerRoutes(__traits(getMember, t, i));
        }
    }}
}

void setupRouter() {
    g_router.setupRouter();
}

ref URLRouter router() {
    return g_router;
}
private URLRouter g_router;