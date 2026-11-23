# Internal, local-only diagnosis. No shared execution entry point.
$ErrorActionPreference = 'Stop'
$checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$bundle = $PSScriptRoot
$rHome = 'C:/Program Files/R/R-4.5.2'
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$id = [guid]::NewGuid().ToString('N').Substring(0,12)
$scratch = "$checkout/.tmp/qre/$id"
$log = "$bundle/local-$id.log"
. "$checkout/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $bundle -Output
Assert-OneSurveyTree $scratch -Output
if (!(Test-Path -LiteralPath "$checkout/.tmp/qre" -PathType Container)) {
    throw 'Missing existing E: scratch parent'
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
    R_LIBS = "E:/strec/r125434/full-c1/library;$deps/4.5-pipapi;$deps/4.5"
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
    QRE_SCRATCH = $scratch
}
$original = @{}
foreach ($name in $environment.Keys) {
    $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
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
    & "$rHome/bin/Rscript.exe" --vanilla "$bundle/diagnose.R" *> $log
    $result = $LASTEXITCODE
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
    $ErrorActionPreference = 'Stop'
}
"Local diagnosis R exit: $result"
"Log: $log"
if ($result -ne 0) { throw 'Local diagnosis failed; inspect its saved log' }
