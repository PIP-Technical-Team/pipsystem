param(
    [ValidateSet('Cpi','Ppp','Population','Pfw','SelectedKeys','Joint','JointFixed')]
    [string]$Mode = 'Cpi'
)

$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$scratch = "$root/.tmp/m2ai"
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$rscript = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
. "$root/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $PSScriptRoot -Output
Assert-OneSurveyTree $scratch -Output
if (!(Test-Path -LiteralPath "$root/.tmp" -PathType Container)) {
    throw 'Missing checkout scratch parent'
}
$entryPoint = switch ($Mode) {
    { $_ -in @('Pfw', 'SelectedKeys') } { 'pfw-projection.R'; break }
    { $_ -in @('Joint','JointFixed') } { 'joint-projection.R'; break }
    'Ppp' { 'ppp-projection.R' }
    'Population' { 'pop-duplicate-summary.R' }
    default { 'probe.R' }
}
$settings = @{
    TEMP = "$scratch/t"; TMP = "$scratch/t"; TMPDIR = "$scratch/t"
    HOME = "$scratch/h"; R_USER = "$scratch/h"; USERPROFILE = "$scratch/h"
    HOMEDRIVE = 'E:'; HOMEPATH = $scratch.Substring(2).Replace('/','\') + '\h'
    APPDATA = "$scratch/c"; LOCALAPPDATA = "$scratch/c"
    XDG_CACHE_HOME = "$scratch/c"; XDG_CONFIG_HOME = "$scratch/c"
    XDG_DATA_HOME = "$scratch/h"; XDG_STATE_HOME = "$scratch/c"
    R_USER_CACHE_DIR = "$scratch/c"; R_USER_CONFIG_DIR = "$scratch/c"
    R_USER_DATA_DIR = "$scratch/h"; R_HISTFILE = "$scratch/h/history"
    PSModuleAnalysisCachePath = "$scratch/c/ModuleAnalysisCache"
    R_SESSION_TMPDIR = ''; R_TESTS = ''
    R_LIBS = "$root/.tmp/sq1/l;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_USER = 'NULL'; R_LIBS_SITE = 'NULL'
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
    AUX_PROBE_ROOT = $root; AUX_PROBE_SCRATCH = $scratch
    AUX_PROBE_BUNDLE = $PSScriptRoot
    AUX_PROBE_MODE = $Mode
}
$original = @{}
try {
    foreach ($name in $settings.Keys) {
        $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $settings[$name], 'Process')
    }
    foreach ($part in @('t', 'h', 'c')) {
        [void][IO.Directory]::CreateDirectory("$scratch/$part")
    }
    Push-Location -LiteralPath $scratch
    try {
        # In PowerShell 5.1, keep R stderr in the captured log and check exit.
        $ErrorActionPreference = 'Continue'
        & $rscript --vanilla "$PSScriptRoot/$entryPoint"
        $result = $LASTEXITCODE
        $ErrorActionPreference = 'Stop'
        if ($result -ne 0) { throw "Local auxiliary check failed: $result" }
    } finally {
        Pop-Location
    }
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
}
