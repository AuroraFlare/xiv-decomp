param(
    [ValidatePattern('^[a-z0-9_-]+\.cpp$')]
    [string]$OutputName = 'native-color-root.cpp',
    [string[]]$Addresses = @('00ba6460', '00ba65e0', '00e39dd0', '00e39e60', '00ba2030')
)
$ErrorActionPreference = 'Stop'
foreach ($colorAddress in $Addresses) {
    if ($colorAddress -notmatch '^[0-9a-fA-F]{8}$') { throw "Invalid function address: $colorAddress" }
}
$colorRepo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$colorOut = Join-Path $colorRepo 'outputs/garuda-plume-color-followup-20260908'
New-Item -ItemType Directory -Force -Path $colorOut | Out-Null
$colorTarget = Join-Path $colorOut $OutputName
$colorPriorAppData = $env:APPDATA
$colorPriorLocal = $env:LOCALAPPDATA
$colorPriorJava = $env:JAVA_HOME
try {
    $env:APPDATA = Join-Path $colorRepo '.tmp/garuda-plume-color-ghidra/appdata'
    $env:LOCALAPPDATA = Join-Path $colorRepo '.tmp/garuda-plume-color-ghidra/localappdata'
    $env:JAVA_HOME = 'C:/Program Files/Eclipse Adoptium/jdk-25.0.3.9-hotspot'
    New-Item -ItemType Directory -Force -Path $env:APPDATA, $env:LOCALAPPDATA | Out-Null
    $colorStarted = [DateTime]::UtcNow
    & 'C:/Users/drime/Downloads/ghidra_12.1_PUBLIC/support/analyzeHeadless.bat' `
        (Join-Path $colorRepo 'ghidra-projects') 'ghidra-ifrit-targeted' `
        -process 'ffxivgame-ifrit.exe' -readOnly -noanalysis `
        -scriptPath (Join-Path $colorRepo 'tools/ghidra') `
        -postScript DecompileGarudaVerifiedTargets.java $colorTarget @Addresses
    if ($LASTEXITCODE -ne 0) { throw "Ghidra exited: $LASTEXITCODE" }
    if (-not (Test-Path -LiteralPath $colorTarget) -or
        (Get-Item -LiteralPath $colorTarget).LastWriteTimeUtc -lt $colorStarted -or
        (Get-Content -LiteralPath $colorTarget -Tail 1) -ne 'export_complete=true') {
        throw 'Decompile export did not complete.'
    }
} finally {
    $env:APPDATA = $colorPriorAppData
    $env:LOCALAPPDATA = $colorPriorLocal
    $env:JAVA_HOME = $colorPriorJava
}
