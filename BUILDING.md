# Building

Try the dom-ts example and use it to start your project. After building with dub, run `yarn install --dev` and then `yarn dev`

If you move directories make sure you update the paths in dub.sdl

To build with dub:

Edit your ldc2.conf file and remove the druntime imports from wasm builds, it should have:

```
"^wasm(32|64)-":
{
    post-switches = [ ]; // this removes druntime/std imports
  [..]
```

You must use a version of dub that was compiled from the ~master branch after 2024-01-10.

A simple `dub build --arch=wasm32-unknown-wasi` should just work.

The only supported compiler is ldc >= 1.35.0

You can .await() promises if you run `wasm-opt --asincify yourfile.wasm -o yourfile-opt.wasm`

Add the `-Oz` flag to optimize the wasm.