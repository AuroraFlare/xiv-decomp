param(
    [string]$GhidraRoot = 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC',
    [string]$JavaHomePath = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot 'outputs/consumable-return-animation-decomp-20260904'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData = $env:APPDATA
$priorLocalAppData = $env:LOCALAPPDATA
$priorJavaHome = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/consumable-return-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/consumable-return-ghidra/localappdata'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    $env:JAVA_HOME = $JavaHomePath
    $addresses = @(
        '0058cad0', '0058c690', '00585800', '0058b2a0', '0058adc0',
        '005878a0', '0058a090', '0065aab0', '0065aad0', '00661ab0',
        '007982d0', '00798640', '00798470', '00798bf0', '00799c90',
        '00844330'
    )
    & (Join-Path $GhidraRoot 'support/analyzeHeadless.bat') `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $PSScriptRoot 'ghidra') `
        -postScript DecompileGarudaTargets.java `
        (Join-Path $outputDir 'native-verified-targets.txt') @addresses
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
}
finally {
    $env:APPDATA = $priorAppData
    $env:LOCALAPPDATA = $priorLocalAppData
    $env:JAVA_HOME = $priorJavaHome
}
