param(
    [string]$GhidraRoot = 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC',
    [string]$JavaHomePath = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot',
    [string[]]$Targets = @(),
    [switch]$Xrefs,
    [string]$OutputName = 'play-xrefs.txt'
)
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot 'outputs/gc-transition-20260916'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData = $env:APPDATA
$priorLocalAppData = $env:LOCALAPPDATA
$priorJavaHome = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/gc-transition-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/gc-transition-ghidra/localappdata'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    $env:JAVA_HOME = $JavaHomePath
    $exportScript = 'DecompileGarudaVerifiedTargets.java'
    if ($Xrefs) { $exportScript = 'DecompileVfxStringXrefs.java' }
    if ($Targets.Count -eq 0) {
        $exportScript = 'DecompileVfxStringXrefs.java'
        $Targets = @('_play_cpp', '_replay_cpp', 'CutScene')
    }
    & (Join-Path $GhidraRoot 'support/analyzeHeadless.bat') `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $PSScriptRoot 'ghidra') `
        -postScript $exportScript (Join-Path $outputDir $OutputName) @Targets
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
}
finally {
    $env:APPDATA = $priorAppData
    $env:LOCALAPPDATA = $priorLocalAppData
    $env:JAVA_HOME = $priorJavaHome
}
