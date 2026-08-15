module libwasm.bridge;

nothrow:

import libwasm.lodash;
import libwasm.types;

/// Call a TS export at `window.__svelteD.ts` path `module.fn`.
/// Only the arguments you pass are forwarded; omitted ones keep the JS default.
T callTs(T = Any, ARGS...)(string path, auto ref ARGS args)
{
	auto ld = Lodash();
	ld.defaultTo(eval("window.__svelteD.ts"));
	static if (ARGS.length)
		ld.invoke(path, args);
	else
		ld.invoke(path);
	return ld.execute!T();
}

/// Same as `callTs`, but the JS value is a Promise handle (then `.await`).
JsPromise!T callTsPromise(T = Any, ARGS...)(string path, auto ref ARGS args)
{
	return JsPromise!T(callTs!Handle(path, args));
}

/// Store a D→TS return on the host registry (`callNative` reads it).
void setDRet(T)(auto ref T value)
{
	Lodash().defaultTo(eval("window.__svelteD")).invoke("setRet", value).execute!Any();
}
