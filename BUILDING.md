# Building

Try the dom-ts example and use it to start your project. If you move directories make sure you update the paths in dub.sdl

Edit your ldc2.conf file and remove the druntime imports from wasm builds, it should have:

```
"^wasm(32|64)-":
{
    post-switches = [ ]; // this removes druntime/std imports
  [..]
```

Use this version of dub which supports probing without importing druntime: https://github.com/etcimon/dub/tree/probe_with_betterc

A simple `dub build --arch=wasm32-unknown-wasi` should just work.

The only supported compiler is ldc >= 1.35.0
