$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$run = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-predicate-proof"
$scratch = "$root/.tmp/m2popfix"
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$inputs = [ordered]@{
    '.tmp/m2pop/inputs/pop.xlsx' = '4d5febb535435d55de1eae4ad011f5b3d8282b0508dec9d06884e97b65277708'
    '.tmp/m2pop/inputs/spop.csv' = '21e9dcee0bc5c75347fe9569066d9815f25f0d6d151cec509aea0706776d0098'
    '.tmp/cp26/inputs/country_list.qs2' = '1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f'
}

. "$root/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $run -Output
Assert-OneSurveyTree $scratch -Output
if ([IO.Path]::GetFullPath($PSScriptRoot).Replace('\','/') -ine $run -or
    !(Test-Path -LiteralPath "$run/handoff.md" -PathType Leaf) -or
    !(Test-Path -LiteralPath "$scratch/t" -PathType Container) -or
    (Test-Path -LiteralPath "$scratch/store") -or
    (Test-Path -LiteralPath "$run/proof.log")) {
    throw 'Expected the assigned run, handoff, unused log and fresh scratch'
}
foreach ($path in $inputs.Keys) {
    Assert-OneSurveyTree "$root/$path"
    $hash = (Get-FileHash -LiteralPath "$root/$path" -Algorithm SHA256).Hash
    if ($hash -ine $inputs[$path]) { throw "Staged SHA256 mismatch: $path" }
}

# Use the same R runtime and libraries, with all writable state in new scratch.
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
    R_TESTS = ''; R_SESSION_TMPDIR = ''; R_DEFAULT_PACKAGES = 'NULL'
    R_LIBS = "$root/.tmp/sq1/l;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_SITE = 'NULL'; R_LIBS_USER = 'NULL'
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
    PSModuleAnalysisCachePath = "$scratch/c/ModuleAnalysisCache"
    POP_ROOT = $root; POP_SCRATCH = $scratch; POP_RUN = $run
}
$previous = @{}
try {
    foreach ($name in $envs.Keys) {
        $previous[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $envs[$name], 'Process')
    }
    foreach ($part in @('h','c')) { [void][IO.Directory]::CreateDirectory("$scratch/$part") }
    $log = "$run/proof.log"
    & {
        'Started UTC: ' + [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fff'Z'")
        'PASS: three local input SHA256 checks; no network acquisition.'
        $ErrorActionPreference = 'Continue'
        & $r --vanilla "$run/proof.R"
        $exitCode = $LASTEXITCODE
        "R exit: $exitCode"
        if ($exitCode -ne 0) { throw "Population diagnostic stopped; see $log" }
        $ErrorActionPreference = 'Stop'
        $receipt = Import-Csv -LiteralPath "$run/candidate.tsv" -Delimiter "`t"
        $retained = "$scratch/store/pop.qs2/versions/$($receipt.version)/artifact"
        Assert-OneSurveyTree $retained -Output
        $hash = (Get-FileHash -LiteralPath $retained -Algorithm SHA256).Hash
        if ($hash -ine $receipt.retained_sha256) { throw 'Retained SHA256 mismatch' }
        'PASS: independent retained SHA256.'
        'Finished UTC: ' + [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fff'Z'")
    } *>&1 | Out-File -LiteralPath $log -Encoding utf8 -Width 200
    "Population diagnostic passed; log: $log"
} finally {
    foreach ($name in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($name, $previous[$name], 'Process')
    }
}
