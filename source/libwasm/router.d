module libwasm.router;

// Match setup in compile

enum Direction {
    Entering, Leaving, Always
}

struct RouterEvent {
    Router* router;
    HashMap!(string, string) parameters;
    string prevURL;
    string currentURL;
}
/*
@enter!"/this/path/:id/" Promise!Any routeHandler(RouterEvent ev) {

}

todo: Write Promise on ThreadMemAllocator



https://github.com/CyberShadow/ae/blob/master/utils/promise/package.d

*/

private enum maxRouteParameters = 64;

private struct Route {
	string pattern;
	Optional!(Promise!void) delegate(RouterEvent ev) entering_cb;
	Optional!(Promise!void) delegate(RouterEvent ev) leaving_cb;
	Optional!(Promise!void) delegate(RouterEvent ev) always_cb;

	bool matches(string url, ref HashMap!(string, string) params)
	const {
		size_t i, j;

		// store parameters until a full match is confirmed
		import std.typecons;
		Tuple!(string, string)[maxRouteParameters] tmpparams;
		size_t tmppparams_length = 0;

		for (i = 0, j = 0; i < url.length && j < pattern.length;) {
			if (pattern[j] == '*') {
				foreach (t; tmpparams[0 .. tmppparams_length])
					params[t[0]] = t[1];
				return true;
			}
			if (url[i] == pattern[j]) {
				i++;
				j++;
			} else if(pattern[j] == ':') {
				j++;
				string name = skipPathNode(pattern, j);
				string match = skipPathNode(url, i);
				assert(tmppparams_length < maxRouteParameters, "Maximum number of route parameters exceeded.");
				tmpparams[tmppparams_length++] = tuple(name, match);
			} else return false;
		}

		if ((j < pattern.length && pattern[j] == '*') || (i == url.length && j == pattern.length)) {
			foreach (t; tmpparams[0 .. tmppparams_length])
				params[t[0]] = t[1];
			return true;
		}

		return false;
	}
    
	bool matches(string url)
	const {
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
}


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

struct URLRouter {
    
	private {
		Vector!Route m_routes;
        // Vector!Route m_routesForAlways;

        Vector!Router m_activeRoutes;
        string m_currentURL;
		string m_prefix;

        // defined when concurrent URL changes occur and promises are still pending
        bool m_busy;
        string m_pendingURL;
        PromiseIterator m_promiseIterator;
	}

    struct PromiseIterator {
        Vector!Router leaving_candidates;
        Vector!Router entering_candidates;

        URLRouter* parent;

        void iterate() {
            bool still_busy;
            if (!leaving_candidates.empty) {
                auto r = leaving_candidates.back;
                leaving_candidates.removeBack();
                if (!r.matches(path)) {
                    Optional!(Promise!void) promise = r.leaving_cb();
                    // remove from activeRoutes
                    if (!promise.empty) {
                        promise.then(&iterate);   
                        still_busy = true;             
                    } 
                } 
            }
            else if (!entering_candidates.empty) {
                RouterEvent ev;
                auto r = entering_candidates.front;
                entering_candidates.removeFront();
                if (!m_activeRoutes.canFind(r) && r.matches(path, ev.parameters))  {
                    Optional!(Promise!void) promise = r.entering_cb(ev);
                    parent.m_activeRoutes ~= r;
                    if (!promise.empty) {
                        promise.then(&iterate);
                    } 
                }
            }
            else {
                parent.m_busy = false;
                // we finished iteration
                if (parent.m_pendingURL) {
                    auto url = parent.m_pendingURL;
                    parent.m_pendingURL = null;
                    parent.handlePathChange(url);
                }
            }

            if (!still_busy) iterate();

            // todo: detect finished iteration and start over for the pendingURL if need be

        }
    }

	this(string prefix = null)
	{
		m_prefix = prefix;
	}

	@property string prefix() const { return m_prefix; }
    
	/// Adds a new route for requests matching the specified HTTP method and pattern.
	void register(string path, Optional!(Promise!void) delegate(RouterEvent ev) cb, Direction direction)
	{
		import std.algorithm : countUntil;
		assert(count(path, ':') <= maxRouteParameters, "Too many route parameters");
        if (auto idx = m_routes.countUntil!((a,b)=> a.pattern == b.pattern)()) {
            switch (direction) 
            {
                case Direction.Entering:
                    m_routes[idx].entering_cb = cb;
                    break;
                case Direction.Leaving:
                    m_routes[idx].leaving_cb = cb;
                    break;
                case Direction.Always:
                    m_routes[idx].always_cb = cb;
                    break;
            }
        }
        else {
            auto route = Route(path);
            switch (direction) 
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
	void handlePathChange(string new_url)
	{

        // queue path changes due to promises
		auto path = new_url;

		mixin(Trace);
		if (path.length < m_prefix.length || path[0 .. m_prefix.length] != m_prefix) return;
		path = path[m_prefix.length .. $];

        if (m_busy) {
            m_pendingURL = new_url;
            return;
        }

        m_busy = true;
        m_promiseIterator = PromiseIterator.init();
        m_promiseIterator.parent = &this;
        m_promiseIterator.entering_candidates[] = m_routes[];
        m_promiseIterator.leaving_candidates[] = m_activeRoutes[]; 
        m_promiseIterator.iterate();
        
	}

}  

void registerRoutes(T)(auto ref T t) {
  import std.meta : AliasSeq;
  import std.traits : hasUDA;
  static foreach(sym; T.tupleof) {
        static if (isPointer!(typeof(sym)))
            alias ChildType = PointerTarget!(typeof(sym));
        else
            alias ChildType = typeof(sym);
        enum i = sym.stringof; 
        enum isPublic = __traits(getProtection, sym) == "public";
        static if (hasUDA!(sym, enter)) {
            alias udas = getUDAs!(field, enter);
            static foreach (uda; udas) {
                static if (is(uda : enter!path, string path)) {
                    // callMember behind the scenes
                    g_router.register(path, __traits(getMember, t, sym), Direction.Entering);
                }
            }
        }
        else static if (hasUDA!(sym, leave)) {
            alias udas = getUDAs!(field, leave);
            static foreach (uda; udas) {
                static if (is(uda : leave!path, string path)) {
                    // callMember behind the scenes
                    g_router.register(path, __traits(getMember, t, sym), Direction.Leaving);
                }
            }
        }
        else static if (hasUDA!(sym, always)) {
            alias udas = getUDAs!(field, always);
            static foreach (uda; udas) {
                static if (is(uda : always!path, string path)) {
                    // callMember behind the scenes
                    g_router.register(path, __traits(getMember, t, sym), Direction.Always);
                }
            }
        }
        else static if (isPublic && isAggregateType!ChildType && hasUDA!(sym, child) && !isCallable!(typeof(sym))) {
            static if (isPointer!(typeof(sym)))
                compile(*__traits(getMember, t, i));
            else
                compile(__traits(getMember, t, i));
        }
    }

}
URLRouter g_router;