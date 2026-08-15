# Host: unit-test runtime-adapt, then run the spa-phobos cell.
$ErrorActionPreference = 'Stop'
$HostLdcBin = 'E:\cva6\riscv-dev\toolchains\ldc2-1.42.0-windows-x64\bin'
$env:PATH = "$HostLdcBin;$env:PATH"
$Libwasm = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$Adapt = Join-Path $Libwasm 'tools\runtime-adapt'

Write-Host "==> dub test tools/runtime-adapt"
Push-Location $Adapt
try {
    & dub test --compiler=ldc2
    if ($LASTEXITCODE -ne 0) { throw "runtime-adapt unittest failed: $LASTEXITCODE" }
} finally {
    Pop-Location
}

Write-Host "==> tests/spa-phobos/run.ps1"
& (Join-Path $PSScriptRoot 'run.ps1')
if ($LASTEXITCODE -ne 0) { throw "spa-phobos failed: $LASTEXITCODE" }
