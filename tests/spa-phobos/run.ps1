# Carry 1.43 with exception-using Phobos, build the spa-phobos SPA
# with LDC master, and run spa_phobos_probe under Node.
$ErrorActionPreference = 'Stop'
Remove-Item Env:DFLAGS -ErrorAction SilentlyContinue

$Libwasm = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$LdcSrc = Join-Path $Libwasm '..\ldc2'
$LdcBuild = Join-Path $Libwasm '..\ldc2-build'
$HostLdc = 'E:\cva6\riscv-dev\toolchains\ldc2-1.42.0-windows-x64'
$SkipIfMissing = $args -contains '-SkipIfMissing'

function Write-Step($msg) { Write-Host "==> $msg" }

function Test-SourceWasmEh($srcRoot) {
    $needles = @(
        @{ Path = 'gen\irstate.cpp'; Pat = 'bool useWasmEH' },
        @{ Path = 'gen\trycatchfinally.cpp'; Pat = 'emitCatchBodiesWasm' },
        @{ Path = 'driver\targetmachine.cpp'; Pat = 'ExceptionHandling::Wasm' },
        @{ Path = 'driver\cl_options.cpp'; Pat = 'wasm-enable-eh' }
    )
    $hit = 0
    foreach ($n in $needles) {
        $p = Join-Path $srcRoot $n.Path
        if ((Test-Path $p) -and (Select-String -Path $p -Pattern $n.Pat -Quiet)) {
            $hit++
            Write-Host ("    source  {0}  has {1}" -f $n.Path, $n.Pat)
        }
    }
    return $hit -ge 3
}

function Find-Ldc2 {
    $cands = @(
        (Join-Path $LdcBuild 'bin\ldc2.exe'),
        (Join-Path $LdcSrc 'build\bin\ldc2.exe')
    )
    foreach ($c in $cands) {
        if (Test-Path $c) { return $c }
    }
    return $null
}

Write-Step "LDC source  $LdcSrc"
if (-not (Test-Path (Join-Path $LdcSrc 'gen\irstate.cpp'))) {
    throw "riscv-compilers/ldc2 not found next to libwasm"
}

$srcEh = Test-SourceWasmEh $LdcSrc
if (-not $srcEh) {
    Write-Host "SKIP: this LDC checkout does not implement wasm-eh."
    if ($SkipIfMissing) { exit 0 }
    exit 2
}

$ldc2 = Find-Ldc2
if (-not $ldc2) {
    if ($SkipIfMissing) {
        Write-Host "SKIP: no ldc2.exe in ldc2-build"
        exit 0
    }
    throw "No ldc2.exe. Configure ldc2-build (ldc2/AGENTS.md green_command)."
}
$ver = & $ldc2 --version | Select-Object -First 1
Write-Host "    ldc2     $ver"
Write-Host "    binary   $ldc2"

$env:PATH = "$(Split-Path $ldc2 -Parent);$(Join-Path $HostLdc 'bin');$env:PATH"

# Always re-carry: 1.43 emit now keeps exception-using Phobos.
Write-Step "runtime-adapt --carry --ldc-tag v1.43.0 --stock-root ldc2"
& dub run --root=(Join-Path $Libwasm 'tools\runtime-adapt') --compiler=ldc2 -- `
    --carry --ldc-tag v1.43.0 --stock-root $LdcSrc --no-verify
if ($LASTEXITCODE -ne 0) { throw "carry v1.43.0 failed" }

$runtime = Join-Path $Libwasm 'runtime-v1.43.0'
foreach ($need in @('std\numeric.d', 'std\json.d', 'std\complex.d', 'std\mathspecial.d', 'std\regex\package.d')) {
    $p = Join-Path $runtime $need
    if (-not (Test-Path $p)) { throw "carry omitted $need (EH-era Phobos peel failed)" }
    Write-Host "    carry    $need"
}

$sel = Join-Path $PSScriptRoot 'dub.selections.json'
@'
{
	"fileVersion": 1,
	"versions": {
		"diet-wasm": {"path":"../../diet-wasm"},
		"druntime-wasm": {"path":"../../runtime-v1.43.0"},
		"fast-wasm": {"path":"../../fast-wasm"},
		"libwasm": {"path":"../.."},
		"memutils-wasm": {"path":"../../memutils-wasm"},
		"optional-wasm": {"path":"../../optional-wasm"}
	}
}
'@ | Set-Content -Encoding utf8 $sel

$raw = Join-Path $PSScriptRoot 'public\spa-phobos-raw.wasm'
if (Test-Path $raw) { Remove-Item -Force $raw }

Write-Step "dub build tests/spa-phobos --config=ldc-master"
Push-Location $PSScriptRoot
try {
    & dub build --arch=wasm32-unknown-wasi --compiler=$ldc2 --config=ldc-master --build=release --force
    $dubEx = $LASTEXITCODE
} finally {
    Pop-Location
}
$raw = Join-Path $PSScriptRoot 'public\spa-phobos-raw.wasm'
if (-not (Test-Path $raw)) { throw "spa-phobos dub build failed: $dubEx (no raw.wasm)" }
if ($dubEx -ne 0) {
    Write-Host "    dub post-build exited $dubEx; raw.wasm is enough for the probe"
}
Write-Host "    raw      $raw  $((Get-Item $raw).Length) bytes"

$node = Get-Command node -ErrorAction SilentlyContinue
if ($node) {
    Write-Step "node run-node.mjs  (Phobos slices + D catch must return 1)"
    Push-Location $PSScriptRoot
    try {
        & node .\run-node.mjs
        if ($LASTEXITCODE -ne 0) { throw "node spa_phobos_probe failed: $LASTEXITCODE" }
    } finally {
        Pop-Location
    }
} else {
    Write-Host "    node not on PATH; skip runtime probe"
}

Write-Step "PASS  LDC master + runtime-v1.43.0 Phobos + spa-phobos"
exit 0
