param([switch]$UseStaged)

$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$run = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pop-local"
$scratch = "$root/.tmp/m2pop"
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$commit = '639613e9032e61c45b3f1dd8208cff0587d1b624'
$blobs = [ordered]@{
    'pop.xlsx' = '3326203c0ce359852633cf9da6bd49d24676723b'
    'spop.csv' = 'da1c247e66623145a8ebcee6a8046630c1e00b48'
}

. "$root/experiments/one-survey/paths.ps1"
if ([IO.Path]::GetFullPath($PSScriptRoot).Replace('\','/') -ine $run) {
    throw 'Population runner is outside its assigned run directory'
}
Assert-OneSurveyTree $run -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree "$root/.tmp/cp26/inputs/country_list.qs2"
$log = if ($UseStaged) { "$run/proof-retry.log" } else { "$run/proof.log" }
if (!(Test-Path -LiteralPath "$run/handoff.md" -PathType Leaf) -or
    !(Test-Path -LiteralPath "$scratch/t" -PathType Container) -or
    (!$UseStaged -and (Test-Path -LiteralPath "$scratch/inputs")) -or
    (Test-Path -LiteralPath "$scratch/store") -or
    (Test-Path -LiteralPath $log)) {
    throw 'Expected a running handoff, unused log, and no population store'
}

# Match the CPI pilot's R libraries while keeping all writable state local.
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
    SSLKEYLOGFILE = ''; CURL_SSL_BACKEND = ''; CURL_CA_BUNDLE = ''
}
$previous = @{}
$exitCode = 1
try {
    foreach ($name in $envs.Keys) {
        $previous[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $envs[$name], 'Process')
    }
    foreach ($part in @('h','c','inputs')) {
        [void][IO.Directory]::CreateDirectory("$scratch/$part")
    }
    & {
        'Started UTC: ' + [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fff'Z'")
        foreach ($name in $blobs.Keys) {
            $file = "$scratch/inputs/$name"
            if (!$UseStaged) {
                $url = "https://raw.githubusercontent.com/PIP-Technical-Team/aux_pop/$commit/$name"
                $http = & curl.exe -q -fsS --noproxy '*' --proto '=https' --max-time 60 `
                    --output $file --write-out '%{http_code}' $url
                if ($LASTEXITCODE -ne 0 -or $http -cne '200') {
                    throw "$name fetch failed: curl exit $LASTEXITCODE, HTTP $http"
                }
            }
            $blob = & git --no-optional-locks -C $root hash-object --no-filters -- $file
            if ($LASTEXITCODE -ne 0 -or $blob -cne $blobs[$name]) {
                throw "$name Git blob mismatch: $blob (expected $($blobs[$name]))"
            }
            $sha256 = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
            "$name Git blob $blob; SHA256 $sha256"
        }
        $ErrorActionPreference = 'Continue'
        & $r --vanilla "$run/proof.R"
        $exitCode = $LASTEXITCODE
        "R exit: $exitCode"
        if ($exitCode -ne 0) { throw "Population proof R exited $exitCode" }
        $receipt = Import-Csv -LiteralPath "$run/candidate.tsv" -Delimiter "`t"
        $retained = "$scratch/store/pop.qs2/versions/$($receipt.version)/artifact"
        Assert-OneSurveyTree $retained -Output
        $sha256 = (Get-FileHash -LiteralPath $retained -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($sha256 -cne $receipt.retained_sha256) { throw 'Retained SHA256 mismatch' }
        "PASS: independent retained SHA256 $sha256"
        'Finished UTC: ' + [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ss.fff'Z'")
    } *>&1 | Out-File -LiteralPath $log -Encoding utf8 -Width 200
    "Population proof passed; log: $log"
} finally {
    foreach ($name in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($name, $previous[$name], 'Process')
    }
}
