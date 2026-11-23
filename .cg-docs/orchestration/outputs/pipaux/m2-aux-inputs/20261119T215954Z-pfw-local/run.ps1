param([switch]$StageOnly)

$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$run = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-pfw-local"
$scratch = "$root/.tmp/m2pfw"
$country = "$root/.tmp/cp26/inputs/country_list.qs2"
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$commit = '9e0fbb33aefdfb5daecb00f024052fa75741b940'
$expectedBlob = '83bc9738cd45ad7e60bc14f5ca837b0075f052b1'
$raw = "$scratch/pfw.dta"
$log = "$run/rebuild.log"
if (Test-Path -LiteralPath $log) { $log = "$run/rebuild-reader.log" }

. "$root/experiments/one-survey/paths.ps1"
if ($PSScriptRoot.Replace('\','/') -cne $run) { throw 'Unexpected run path' }
Assert-OneSurveyTree $run -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree $country
foreach ($dir in @($run, $scratch, "$scratch/t", "$scratch/h", "$scratch/c")) {
    if (!(Test-Path -LiteralPath $dir -PathType Container)) {
        throw "Missing preflighted directory: $dir"
    }
}

$envs = @{
    TEMP = "$scratch/t"; TMP = "$scratch/t"; TMPDIR = "$scratch/t"
    HOME = "$scratch/h"; R_USER = "$scratch/h"; USERPROFILE = "$scratch/h"
    HOMEDRIVE = 'E:'; HOMEPATH = $scratch.Substring(2).Replace('/','\') + '\h'
    APPDATA = "$scratch/c"; LOCALAPPDATA = "$scratch/c"; CURL_HOME = "$scratch/h"
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
    SSLKEYLOGFILE = $null; CURL_CA_BUNDLE = $null
    SSL_CERT_FILE = $null; SSL_CERT_DIR = $null
    GIT_OPTIONAL_LOCKS = '0'; GIT_TERMINAL_PROMPT = '0'
    GIT_CONFIG_NOSYSTEM = '1'; GIT_CONFIG_GLOBAL = "$scratch/h/absent"
    PFW_ROOT = $root; PFW_SCRATCH = $scratch; PFW_RUN = $run
    PFW_RAW_SHA256 = $null
}
$original = @{}
Push-Location -LiteralPath $scratch
try {
    foreach ($name in $envs.Keys) {
        $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $envs[$name], 'Process')
    }
    if ($StageOnly) {
        if (Test-Path -LiteralPath $raw) { throw 'PFW input already exists' }
        $url = "https://raw.githubusercontent.com/PIP-Technical-Team/aux_pfw/$commit/pfw.dta"
        & "$env:SystemRoot/System32/curl.exe" -q --noproxy '*' --proto '=https' `
            --fail --silent --show-error --max-time 60 --output $raw $url
        if ($LASTEXITCODE -ne 0) { throw "Pinned PFW download failed (curl $LASTEXITCODE)" }
    }

    $blob = & git --no-pager --no-optional-locks hash-object --no-filters -- $raw
    if ($LASTEXITCODE -ne 0 -or $blob -cne $expectedBlob) {
        throw 'Downloaded bytes do not match the pinned Git blob'
    }
    $env:PFW_RAW_SHA256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $raw).Hash.ToLowerInvariant()
    'UTC: ' + [DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ')
    "PFW blob: $blob; SHA256: $env:PFW_RAW_SHA256; bytes: $((Get-Item -LiteralPath $raw).Length)"
    if ($StageOnly) { return }

    foreach ($path in @($log, "$run/candidate.tsv", "$scratch/store")) {
        if (Test-Path -LiteralPath $path) { throw "Proof already attempted: $path" }
    }
    $ErrorActionPreference = 'Continue'
    & $r --vanilla "$run/rebuild.R" *> $log
    $result = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    "R exit: $result; log: $log"
    if ($result -ne 0) { throw 'PFW proof failed; see saved log' }
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
    Pop-Location
}
