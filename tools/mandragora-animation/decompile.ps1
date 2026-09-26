param(
    [ValidateSet('DecompileVfxStringXrefs.java','DecompileGarudaVerifiedTargets.java','DumpVfxVtables.java')]
    [string]$Script = 'DecompileVfxStringXrefs.java',
    [ValidatePattern('^[a-z0-9_-]+\.txt$')]
    [string]$OutputName = 'motion-xrefs.txt',
    [string[]]$Targets = @('MotionCommandClip', 'SpuBinary', 'MotionClip')
)
$ErrorActionPreference = 'Stop'
$motionRepo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$motionOut = Join-Path $motionRepo 'outputs/mandragora-controller-review-20260913'
New-Item -ItemType Directory -Force -Path $motionOut | Out-Null
$motionOldApp = $env:APPDATA
$motionOldLocal = $env:LOCALAPPDATA
$motionOldJava = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $motionRepo '.tmp/mandragora-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $motionRepo '.tmp/mandragora-ghidra/localappdata'
    $env:JAVA_HOME = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    & 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC/support/analyzeHeadless.bat' `
        (Join-Path $motionRepo 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $motionRepo 'tools/ghidra') `
        -postScript $Script (Join-Path $motionOut $OutputName) @Targets
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited: $LASTEXITCODE" }
} finally {
    $env:APPDATA = $motionOldApp
    $env:LOCALAPPDATA = $motionOldLocal
    $env:JAVA_HOME = $motionOldJava
}
