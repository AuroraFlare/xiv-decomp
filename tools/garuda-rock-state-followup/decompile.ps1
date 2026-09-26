param(
    [string]$OutputName = 'native-rock-mask.txt',
    [string[]]$Addresses = @('00825b20', '0065e5b0', '0065c020')
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$outputDir = Join-Path $repoRoot 'outputs/garuda-rock-state-followup-20260907'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData = $env:APPDATA
$priorLocalAppData = $env:LOCALAPPDATA
$priorJavaHome = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/garuda-rock-state-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/garuda-rock-state-ghidra/localappdata'
    $env:JAVA_HOME = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    & 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC/support/analyzeHeadless.bat' `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $repoRoot 'tools/ghidra') `
        -postScript DecompileGarudaTargets.java `
        (Join-Path $outputDir $OutputName) @Addresses
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
}
finally {
    $env:APPDATA = $priorAppData
    $env:LOCALAPPDATA = $priorLocalAppData
    $env:JAVA_HOME = $priorJavaHome
}
