# Rebuild spa-phobos without re-carry (runtime-v1.43.0 already present).
$ErrorActionPreference = 'Stop'
Remove-Item Env:DFLAGS -ErrorAction SilentlyContinue
$Libwasm = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$ldc2 = Join-Path $Libwasm '..\ldc2-build\bin\ldc2.exe'
$HostLdc = 'E:\cva6\riscv-dev\toolchains\ldc2-1.42.0-windows-x64'
$env:PATH = "$(Split-Path $ldc2 -Parent);$(Join-Path $HostLdc 'bin');$env:PATH"
$raw = Join-Path $PSScriptRoot 'public\spa-phobos-raw.wasm'
if (Test-Path $raw) { Remove-Item -Force $raw }
Push-Location $PSScriptRoot
try {
    & dub build --arch=wasm32-unknown-wasi --compiler=$ldc2 --config=ldc-master --build=release --force
    if ($LASTEXITCODE -ne 0) { throw "dub build failed: $LASTEXITCODE" }
} finally {
    Pop-Location
}
if (-not (Test-Path $raw)) { throw "no raw.wasm" }
Write-Host "raw $($(Get-Item $raw).Length) bytes"
& node (Join-Path $PSScriptRoot 'run-node.mjs')
exit $LASTEXITCODE
