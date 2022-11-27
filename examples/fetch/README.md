# Fetch

This is a libwasm example to show how the browser's fetch api is called from D, as well as how to manipulate the json from the response.

```d
import libwasm.bindings;
import libwasm.dom;
import libwasm.types;

nothrow:
@safe:

extern (C) export void _start()
{
  auto requestInfo = RequestInfo("https://reqres.in/api/users/2");
  auto promise = window.fetch(requestInfo);
  promise.then(r => r.json).then((data){
      console.log(data);
      console.log(data.as!(Json).data.avatar.as!string);
    });
}
```

# Notes

* console.log accepts almost all primitive types (int, double, string, etc.) as well as any type from `libwasm.bindings`. But you can't put any D structs, classes or enums into it.
* the uri to `window.fetch` needs to be wrapped in a `RequestInfo`. This is because the first argument to fetch is actually a union type defined as `(Request or string)` and typedef'd to `RequestInfo`.
* the returned type of `r.json` is any. Therefor, before we can access any fields of `data`, we need to convert it to `Json`. Then when we access the `avatar` field we convert it to `string`, before passing it to console.log.
* remember to call `dub run libwasm:webidl -- --bindgen` after compiling, to generate the `./libwasm/modules/bindings.js` that contains the js glue code.
