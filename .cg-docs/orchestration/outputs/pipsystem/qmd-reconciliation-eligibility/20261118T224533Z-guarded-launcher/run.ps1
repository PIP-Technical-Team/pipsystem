param([switch]$RunSharedDryRun, [switch]$RunSharedPinDiagnosis)

# Shared mode is user-only. The default runs local synthetic checks only.
$ErrorActionPreference = 'Stop'
$checkout = [IO.Path]::GetFullPath("$PSScriptRoot/../../../../../..").Replace('\','/')
$bundle = $PSScriptRoot
$qualification = "$checkout/.cg-docs/orchestration/outputs/pipsystem/stamp-path-binding-fix/20261119T151908Z-tool-qualification"
$installed = "$checkout/.tmp/sq1/l"
$deps = [IO.Path]::GetFullPath("$checkout/../../R/win-library").Replace('\','/')
$rHome = 'C:/Program Files/R/R-4.5.2'
$id = [guid]::NewGuid().ToString('N').Substring(0,12)
$scratch = "$checkout/.tmp/qre/$id"
$mode = 'local'
if ($RunSharedDryRun -and $RunSharedPinDiagnosis) {
    throw 'Choose one user-only shared mode, not both'
}
if ($RunSharedDryRun) { $mode = 'shared' }
if ($RunSharedPinDiagnosis) { $mode = 'pin-diagnosis' }
$log = "$scratch/$mode-$id.log"
$output = "$scratch/$mode-$id.tsv"
$processRecord = "$scratch/$mode-$id-process.json"
$started = [DateTime]::UtcNow.ToString('o')

. "$checkout/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $bundle -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree "$installed/stamp"
$actualRoot = & git -C $checkout rev-parse --show-toplevel
if ($LASTEXITCODE -ne 0 -or $actualRoot -ne $checkout) {
    throw 'Expected pipsystem checkout; no environment switch was attempted'
}
$branch = & git -C $checkout branch --show-current
if ($LASTEXITCODE -ne 0) {
    throw 'Could not identify the current checkout branch'
}

$environment = @{
    TEMP = "$scratch/temp"
    TMP = "$scratch/temp"
    TMPDIR = "$scratch/temp"
    HOME = "$scratch/home"
    R_USER = "$scratch/home"
    USERPROFILE = "$scratch/home"
    APPDATA = "$scratch/config"
    LOCALAPPDATA = "$scratch/cache"
    XDG_CACHE_HOME = "$scratch/cache"
    XDG_CONFIG_HOME = "$scratch/config"
    XDG_DATA_HOME = "$scratch/home"
    XDG_STATE_HOME = "$scratch/cache"
    R_USER_CACHE_DIR = "$scratch/cache"
    R_USER_CONFIG_DIR = "$scratch/config"
    R_USER_DATA_DIR = "$scratch/home"
    R_HISTFILE = "$scratch/cache/history"
    R_PROFILE = "$scratch/config/no-profile"
    R_PROFILE_USER = "$scratch/config/no-profile"
    R_ENVIRON = "$scratch/config/no-environ"
    R_ENVIRON_USER = "$scratch/config/no-environ"
    R_LIBS = "$installed;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_SITE = 'NULL'
    R_LIBS_USER = 'NULL'
    R_TESTS = ''
    R_SESSION_TMPDIR = ''
    R_HOME = $rHome
    R_ARCH = '/x64'
    R_SHARE_DIR = "$rHome/share"
    R_INCLUDE_DIR = "$rHome/include"
    R_DOC_DIR = "$rHome/doc"
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
    PSModuleAnalysisCachePath = "$scratch/cache/ModuleAnalysisCache"
    QRE_CHECKOUT = $checkout
    PIP_CHECKOUT = $checkout
    QRE_SCRATCH = $scratch
    QRE_BUNDLE = $bundle
    QRE_QUALIFICATION = $qualification
    QRE_MODE = $mode
    QRE_OUTPUT = $output
}
$originalEnvironment = @{}
$result = $null
foreach ($name in $environment.Keys) {
    $originalEnvironment[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
try {
    foreach ($name in $environment.Keys) {
        [Environment]::SetEnvironmentVariable($name, $environment[$name], 'Process')
    }
    foreach ($name in @('temp', 'home', 'cache', 'config')) {
        [IO.Directory]::CreateDirectory("$scratch/$name") | Out-Null
    }
    Assert-OneSurveyTree $scratch -Output
    $ErrorActionPreference = 'Continue'
    & "$rHome/bin/Rscript.exe" --vanilla "$bundle/worker.R" *> $log
    $result = $LASTEXITCODE
} finally {
    try {
        $record = @{
            mode = $mode
            run_id = $id
            started_utc = $started
            finished_utc = [DateTime]::UtcNow.ToString('o')
            launcher_pid = $PID
            r_exit = $result
            r_executable = "$rHome/bin/Rscript.exe"
            checkout = $checkout
            branch = $branch
            scratch = $scratch
            log = $log
            results = $output
        }
        if ([IO.Directory]::Exists($scratch)) {
            [IO.File]::WriteAllText($processRecord, ($record | ConvertTo-Json))
        }
    } finally {
        foreach ($name in $originalEnvironment.Keys) {
            [Environment]::SetEnvironmentVariable($name, $originalEnvironment[$name], 'Process')
        }
        $ErrorActionPreference = 'Stop'
    }
}
"Mode: $mode; R exit: $result"
"Log: $log"
"Process record: $processRecord"
if (Test-Path -LiteralPath $output) { "Technical rows: $output" }
if ($result -ne 0) {
    throw 'Check failed; inspect the log. No apply or survey processing was requested.'
}
