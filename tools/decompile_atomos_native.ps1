param(
    [string]$GhidraRoot = 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC',
    [string]$JavaHomePath = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot',
    [string]$OutputName = 'effect-atob-native.txt',
    [string[]]$Addresses = @(
        '0063a560', '00821760', '00821820', '00821930',
        '0063c210', '0082fb30', '0082fe70', '0080a810', '0082eab0'
    )
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot 'outputs/atomos-deepvoid-decomp-20260907/native'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData = $env:APPDATA
$priorLocalAppData = $env:LOCALAPPDATA
$priorJavaHome = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/atomos-native-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/atomos-native-ghidra/localappdata'
    $env:JAVA_HOME = $JavaHomePath
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    & (Join-Path $GhidraRoot 'support/analyzeHeadless.bat') `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $PSScriptRoot 'ghidra') `
        -postScript DecompileGarudaTargets.java `
        (Join-Path $outputDir $OutputName) @Addresses
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
}
finally {
    $env:APPDATA = $priorAppData
    $env:LOCALAPPDATA = $priorLocalAppData
    $env:JAVA_HOME = $priorJavaHome
}
