# Rebuild runtime-adapt and re-carry LDC 1.42 stock + taught splices.
$ErrorActionPreference = 'Stop'
Remove-Item Env:DFLAGS -ErrorAction SilentlyContinue

$Ldc = 'E:\cva6\riscv-dev\toolchains\ldc2-1.42.0-windows-x64'
$env:PATH = "$(Join-Path $Ldc 'bin');$env:PATH"

Set-Location 'E:\cva6\riscv-compilers\libwasm\tools\runtime-adapt'
Write-Host "ldc2 $(& ldc2 --version | Select-Object -First 1)"

& dub test --compiler=ldc2
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& dub run --compiler=ldc2 -- --carry --ldc-tag v1.42.0
exit $LASTEXITCODE
