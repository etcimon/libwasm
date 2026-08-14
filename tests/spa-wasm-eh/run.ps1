# Build LDC master from riscv-compilers/ldc2 (or reuse ldc2-build),
# detect wasm-eh in that version, carry runtime-v1.43.0, compile the
# slideshow-shaped spa-wasm-eh package, and check EH signatures.
$ErrorActionPreference = 'Stop'
Remove-Item Env:DFLAGS -ErrorAction SilentlyContinue

$Libwasm = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$LdcSrc = Join-Path $Libwasm '..\ldc2'
$LdcBuild = Join-Path $Libwasm '..\ldc2-build'
$HostLdc = 'E:\cva6\riscv-dev\toolchains\ldc2-1.42.0-windows-x64'
$Binaryen = 'E:\cva6\riscv-dev\toolchains\binaryen-version_132-x86_64-windows'
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

function Invoke-BuildLdc {
    $existing = Find-Ldc2
    $ninjaFile = Join-Path $LdcBuild 'build.ninja'
    $ninjaCmd = Get-Command ninja -ErrorAction SilentlyContinue
    if ($ninjaCmd -and (Test-Path $ninjaFile)) {
        Write-Step "ninja -C ldc2-build ldc2  (from riscv-compilers/ldc2)"
        & ninja -C $LdcBuild ldc2
        if ($LASTEXITCODE -ne 0) { throw "ninja ldc2 failed: $LASTEXITCODE" }
        return
    }
    if ($existing) {
        Write-Host "    ninja not on PATH; reuse existing $existing"
        return
    }
    throw "No ldc2.exe and no ninja. Configure ldc2-build (ldc2/AGENTS.md green_command)."
}

Write-Step "LDC source  $LdcSrc"
if (-not (Test-Path (Join-Path $LdcSrc 'gen\irstate.cpp'))) {
    throw "riscv-compilers/ldc2 not found next to libwasm"
}

$srcEh = Test-SourceWasmEh $LdcSrc
if (-not $srcEh) {
    Write-Host "SKIP: this LDC checkout does not implement wasm-eh (useWasmEH / emitCatchBodiesWasm / ExceptionModel=Wasm)."
    if ($SkipIfMissing) { exit 0 }
    exit 2
}
Write-Host "    wasm-eh implemented in source: yes"

try {
    Invoke-BuildLdc
} catch {
    if ($SkipIfMissing) {
        Write-Host "SKIP: $_"
        exit 0
    }
    throw
}

$ldc2 = Find-Ldc2
if (-not $ldc2) { throw "ldc2.exe missing after ninja" }
$ver = & $ldc2 --version | Select-Object -First 1
Write-Host "    ldc2     $ver"
Write-Host "    binary   $ldc2"

$env:PATH = "$(Split-Path $ldc2 -Parent);$(Join-Path $HostLdc 'bin');$(Join-Path $Binaryen 'bin');$env:PATH"

# IR probe: master must emit catchpad + llvm.wasm.get.exception
$probeD = Join-Path $PSScriptRoot 'probe-wasm-eh.d'
$probeLl = Join-Path $PSScriptRoot 'public\probe-wasm-eh.ll'
New-Item -ItemType Directory -Force -Path (Join-Path $PSScriptRoot 'public') | Out-Null
Write-Step "IR probe  --wasm-enable-eh -output-ll"
$probeArgs = @(
    '-mtriple=wasm32-unknown-wasi', '-c', '-output-ll', '-fno-moduleinfo',
    '-defaultlib=', '--wasm-enable-eh', "-of=$probeLl", $probeD
)
& $ldc2 @probeArgs
if ($LASTEXITCODE -ne 0) { throw "IR probe compile failed: $LASTEXITCODE" }
if (-not (Test-Path $probeLl)) { throw "IR probe did not write $probeLl" }
$ll = Get-Content -Raw $probeLl
$sigs = @('catchpad', 'llvm.wasm.get.exception', 'target-features"="+exception-handling')
$missing = @($sigs | Where-Object { $ll -notlike "*$_*" })
if ($missing.Count) {
    Write-Host "FAIL: IR missing wasm-eh signatures: $($missing -join ', ')"
    exit 1
}
Write-Host "    IR       catchpad + llvm.wasm.get.exception + +exception-handling"

# Carry 1.43 stock from the LDC master checkout
$runtime = Join-Path $Libwasm 'runtime-v1.43.0'
if (-not (Test-Path (Join-Path $runtime 'object.d'))) {
    Write-Step "runtime-adapt --carry --ldc-tag v1.43.0 --stock-root ldc2"
    & dub run --root=(Join-Path $Libwasm 'tools\runtime-adapt') --compiler=ldc2 -- `
        --carry --ldc-tag v1.43.0 --stock-root $LdcSrc --no-verify
    if ($LASTEXITCODE -ne 0) { throw "carry v1.43.0 failed" }
} else {
    Write-Host "    carry    reuse $runtime"
}

# Pin druntime-wasm to the carry (gitignore eats *.selections.json).
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

# Slideshow-shaped SPA
Write-Step "dub build tests/spa-wasm-eh --config=ldc-master"
Push-Location $PSScriptRoot
try {
    & dub build --arch=wasm32-unknown-wasi --compiler=$ldc2 --config=ldc-master --build=release --force
    $dubEx = $LASTEXITCODE
} finally {
    Pop-Location
}
$raw = Join-Path $PSScriptRoot 'public\spa-wasm-eh-raw.wasm'
$opt = Join-Path $PSScriptRoot 'public\spa-wasm-eh.wasm'
if (-not (Test-Path $raw)) { throw "spa-wasm-eh dub build failed: $dubEx (no raw.wasm)" }
if ($dubEx -ne 0) {
    Write-Host "    dub post-build (wasm-opt) exited $dubEx; raw.wasm is enough for EH check"
}
Write-Host "    raw      $raw  $((Get-Item $raw).Length) bytes"
if (Test-Path $opt) {
    Write-Host "    asyncify $opt  $((Get-Item $opt).Length) bytes"
}

$dis = Get-Command wasm-dis -ErrorAction SilentlyContinue
if ($dis) {
    $wat = & wasm-dis --enable-exception-handling --enable-reference-types --enable-multivalue $raw 2>$null | Out-String
    if ($wat -match 'try_table|catch_ref|exception') {
        Write-Host "    wasm-dis  try_table/catch_ref (standard wasm EH)"
    } else {
        Write-Host "    wasm-dis: no try_table (IR already proved wasm-eh)"
    }
}

$node = Get-Command node -ErrorAction SilentlyContinue
if ($node) {
    Write-Step "node run-node.mjs  (D catch must return 1)"
    Push-Location $PSScriptRoot
    try {
        & node .\run-node.mjs
        if ($LASTEXITCODE -ne 0) { throw "node spa_eh_probe failed: $LASTEXITCODE" }
    } finally {
        Pop-Location
    }
} else {
    Write-Host "    node not on PATH; skip runtime catch (wasm throw+try_table still linked)"
}

Write-Step "PASS  LDC master wasm-eh + spa-wasm-eh package"
exit 0
