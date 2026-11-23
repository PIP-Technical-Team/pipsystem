$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$run = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pfw-predicate-proof"
$scratch = "$root/.tmp/m2pfwfix"
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$log = "$run/proof.log"
. "$root/experiments/one-survey/paths.ps1"
if ($PSScriptRoot.Replace('\','/') -cne $run -or
    (Test-Path -LiteralPath $log) -or (Test-Path -LiteralPath $scratch) -or
    !(Test-Path -LiteralPath "$root/.tmp" -PathType Container) -or
    !(Test-Path -LiteralPath $r -PathType Leaf)) {
    throw 'Expected fresh preflighted destinations and qualified R'
}
foreach ($path in @($run, $log, $scratch, "$scratch/t", "$scratch/h", "$scratch/c")) {
    Assert-OneSurveyTree $path -Output
}
foreach ($part in @('t','h','c')) {
    [void][IO.Directory]::CreateDirectory("$scratch/$part")
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
    PFW_ROOT = $root; PFW_SCRATCH = $scratch; PFW_RUN = $run
}
$original = @{}
Push-Location -LiteralPath $scratch
try {
    foreach ($name in $envs.Keys) {
        $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $envs[$name], 'Process')
    }
    $ErrorActionPreference = 'Continue'
    & $r --vanilla "$run/proof.R" *> $log
    $result = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    "R exit: $result; log: $log"
    [DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ')
    if ($result -ne 0) { throw 'Predicate proof failed; see the saved log' }
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
    Pop-Location
}
