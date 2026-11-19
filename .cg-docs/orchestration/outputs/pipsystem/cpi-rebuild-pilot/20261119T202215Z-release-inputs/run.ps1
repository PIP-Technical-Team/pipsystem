param([switch]$StageInputs)

$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath("$PSScriptRoot/../../../../../..").Replace('\','/')
$scratch = "$root/.tmp/cp26"
$deps = [IO.Path]::GetFullPath("$root/../../R/win-library").Replace('\','/')
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$commit = '7e96f769859bad9f8d98b8aa0e67250bf1b3e7a3'
. "$root/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $PSScriptRoot -Output
Assert-OneSurveyTree $scratch -Output
if (!(Test-Path -LiteralPath "$root/.tmp" -PathType Container)) {
    throw 'Missing checkout scratch parent'
}
if ($StageInputs -and (Test-Path -LiteralPath "$PSScriptRoot/inputs.tsv")) {
    throw 'Completed input stage; do not overwrite'
}
$envs = @{
    TEMP = "$scratch/t"; TMP = "$scratch/t"; TMPDIR = "$scratch/t"
    HOME = "$scratch/h"; R_USER = "$scratch/h"; USERPROFILE = "$scratch/h"
    HOMEDRIVE = 'E:'; HOMEPATH = $scratch.Substring(2).Replace('/','\') + '\h'
    APPDATA = "$scratch/c"; LOCALAPPDATA = "$scratch/c"
    XDG_CACHE_HOME = "$scratch/c"; XDG_CONFIG_HOME = "$scratch/c"
    XDG_DATA_HOME = "$scratch/h"; XDG_STATE_HOME = "$scratch/c"
    R_USER_CACHE_DIR = "$scratch/c"; R_USER_CONFIG_DIR = "$scratch/c"
    R_USER_DATA_DIR = "$scratch/h"; R_HISTFILE = "$scratch/h/history"
    R_PROFILE = "$scratch/h/absent"; R_PROFILE_USER = "$scratch/h/absent"
    R_ENVIRON = "$scratch/h/absent"; R_ENVIRON_USER = "$scratch/h/absent"
    R_TESTS = ''; R_SESSION_TMPDIR = ''
    R_LIBS = "$root/.tmp/sq1/l;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_SITE = 'NULL'; R_LIBS_USER = 'NULL'
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
    PSModuleAnalysisCachePath = "$scratch/c/ModuleAnalysisCache"
    CPI_ROOT = $root; CPI_SCRATCH = $scratch; CPI_BUNDLE = $PSScriptRoot
}
$original = @{}
try {
    foreach ($name in $envs.Keys) {
        $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $envs[$name], 'Process')
    }
    foreach ($part in @('t', 'h', 'c')) {
        [void][IO.Directory]::CreateDirectory("$scratch/$part")
    }
    $job = 'rebuild'
    if ($StageInputs) {
        $job = 'stage'
        [void][IO.Directory]::CreateDirectory("$scratch/inputs")
        $csv = "$scratch/inputs/cpi.csv"
        if (!(Test-Path -LiteralPath $csv -PathType Leaf)) {
            & curl.exe -q -fsS --proto '=https' --max-time 60 --output $csv "https://raw.githubusercontent.com/PIP-Technical-Team/aux_cpi/$commit/cpi.csv"
            if ($LASTEXITCODE -ne 0) { throw 'Pinned CPI download failed' }
        }
        $blob = & git -C $root hash-object --no-filters -- $csv
        if ($LASTEXITCODE -ne 0 -or $blob -cne 'adb5a6fdac90e0842e1989a76c9ede023d9e860d') {
            throw 'Downloaded bytes do not match the pinned CPI blob'
        }
    }
    $ErrorActionPreference = 'Continue'
    $log = "$PSScriptRoot/$job.log"
    if (Test-Path -LiteralPath $log) {
        $run = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
        $log = "$PSScriptRoot/$job-$run.log"
    }
    & $r --vanilla "$PSScriptRoot/$job.R" *> $log
    $result = $LASTEXITCODE
    "$job exit: $result; log: $log"
    if ($result -ne 0) { throw 'CPI stage or rebuild failed; see its saved log' }
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
}
