param(
    [string]$GhidraRoot = 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC',
    [string]$JavaHomePath = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot',
    [ValidateSet('dispatch', 'event-block', 'notice-condition', 'rpc-continuation')]
    [string]$Section = 'dispatch'
)
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot 'outputs/ferry-scenes-20260916'
$targets = switch ($Section) {
    'dispatch' { '0089f180', '0078f840', '0089e200', '0089e450', '00896f70', '006fb830', '0076d610', '006fbc50', '00763dc0' }
    'event-block' { '0089d230', '00895a30', '00895d20', '008934a0', '00893520', '00893800', '00893ab0', '00893b00', '008947c0', '006ee680', '0076c0d0' }
    'notice-condition' { '006f2e80', '00892770', '008927f0', '0071ca50' }
    'rpc-continuation' { '00894090', '0075e670', '00894ab0', '00896090', '00892550' }
}
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData = $env:APPDATA
$priorLocalAppData = $env:LOCALAPPDATA
$priorJavaHome = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/ferry-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/ferry-ghidra/localappdata'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    $env:JAVA_HOME = $JavaHomePath
    & (Join-Path $GhidraRoot 'support/analyzeHeadless.bat') `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $PSScriptRoot 'ghidra') `
        -postScript DecompileGarudaVerifiedTargets.java `
        (Join-Path $outputDir "native-$Section.txt") @targets
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
}
finally {
    $env:APPDATA = $priorAppData
    $env:LOCALAPPDATA = $priorLocalAppData
    $env:JAVA_HOME = $priorJavaHome
}
