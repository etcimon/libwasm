# JS error-handling stubs

`onAssertErrorMsg` is the model: D passes a file/line/msg, JS aborts.

`captureException` (today) and any wasm-eh landing-pad import must do the
same, not `console.log` and continue. Binaryen `--asyncify` plus LLVM 17
`--wasm-enable-eh` composition is still unverified; aborting is the safe
host policy until catch works.

See libwasm `architecture/js-events-memory.md` and `upgrade-ldc.md`.
