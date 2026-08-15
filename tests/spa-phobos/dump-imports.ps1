$ErrorActionPreference = 'Stop'
$bin = 'E:\cva6\riscv-dev\toolchains\binaryen-version_132-x86_64-windows\bin'
$env:PATH = "$bin;$env:PATH"
$wasm = Join-Path $PSScriptRoot 'public\spa-phobos-raw.wasm'
if (Get-Command wasm-objdump -ErrorAction SilentlyContinue) {
    & wasm-objdump -x -j Import $wasm
} elseif (Get-Command wasm-dis -ErrorAction SilentlyContinue) {
    & wasm-dis --enable-exception-handling --enable-reference-types --enable-multivalue $wasm | Select-String -Pattern 'import'
} else {
    throw 'no wasm-objdump or wasm-dis'
}
