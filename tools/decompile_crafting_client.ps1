param(
    [string]$GhidraRoot = 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC',
    [string]$JavaHomePath = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot',
    [string]$OutputName = 'native-craft-xrefs.txt',
    [string[]]$Targets = @('EID_CRAFT_MAT', 'CharaStatusCraft', 'RaptureActionSelectClip'),
    [switch]$Functions,
    [switch]$Scalars
)
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot 'outputs/crafting-client-evidence-20260910'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$priorAppData, $priorLocalAppData, $priorJavaHome = $env:APPDATA, $env:LOCALAPPDATA, $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $repoRoot '.tmp/crafting-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $repoRoot '.tmp/crafting-ghidra/localappdata'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    $env:JAVA_HOME = $JavaHomePath
    $scriptName = if ($Scalars) { 'FindScalarReferences.java' } elseif ($Functions) { 'DecompileGarudaTargets.java' } else { 'DecompileVfxStringXrefs.java' }
    & (Join-Path $GhidraRoot 'support/analyzeHeadless.bat') `
        (Join-Path $repoRoot 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $PSScriptRoot 'ghidra') `
        -postScript $scriptName (Join-Path $outputDir $OutputName) @Targets
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited with code $LASTEXITCODE" }
} finally {
    $env:APPDATA, $env:LOCALAPPDATA, $env:JAVA_HOME = $priorAppData, $priorLocalAppData, $priorJavaHome
}
