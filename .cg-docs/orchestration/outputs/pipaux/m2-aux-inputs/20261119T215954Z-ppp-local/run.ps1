param([switch]$Stage, [switch]$Verify)

$ErrorActionPreference = 'Stop'
$root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$scratch = "$root/.tmp/m2ppp"
$bundle = "$root/.cg-docs/orchestration/outputs/pipaux/m2-aux-inputs/20261119T215954Z-ppp-local"
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$rscript = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
$csv = "$scratch/ppp.csv"
$countries = "$root/.tmp/cp26/inputs/country_list.qs2"
$countrySha = '1435fd020da520aaa920950cb784ee6df0b0fcfd27643f6aedef3fcc5a8d6c9f'
$commit = 'ab55d3ff0d6efddf8b06f1ee8886fc6c08c63c19'
$blob = '5f0de04df833c01c85fe91069d243740202188bd'
$url = "https://raw.githubusercontent.com/PIP-Technical-Team/aux_ppp/$commit/ppp.csv"
if ($Stage -and $Verify) { throw 'Stage and verify are separate steps.' }

. "$root/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $bundle -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree $countries -Output
if ($PSScriptRoot.Replace('\','/') -ne $bundle -or
    (Get-Location).ProviderPath.Replace('\','/') -ne $scratch) {
    throw 'Expected the exact run folder and E: scratch working directory.'
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
    R_PROFILE = "$scratch/h/absent"; R_PROFILE_USER = "$scratch/h/absent"
    R_ENVIRON = "$scratch/h/absent"; R_ENVIRON_USER = "$scratch/h/absent"
    R_SESSION_TMPDIR = ''; R_TESTS = ''
    R_DEFAULT_PACKAGES = 'datasets,utils,grDevices,graphics,stats,methods'
    R_LIBS = "$root/.tmp/sq1/l;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_SITE = 'NULL'; R_LIBS_USER = 'NULL'
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
    PSModuleAnalysisCachePath = "$scratch/c/ModuleAnalysisCache"
    PPP_ROOT = $root; PPP_BUNDLE = $bundle; PPP_SCRATCH = $scratch
    PPP_COMMIT = $commit; PPP_BLOB = $blob; PPP_URL = $url
    PPP_COUNTRIES = $countries; PPP_COUNTRY_SHA = $countrySha
}
$original = @{}
try {
    foreach ($name in $settings.Keys) {
        $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
        [Environment]::SetEnvironmentVariable($name, $settings[$name], 'Process')
    }
    if ((Get-FileHash -LiteralPath $countries -Algorithm SHA256).Hash -ne $countrySha) {
        throw 'Staged country-list SHA256 does not match its pinned copy.'
    }
    if ($Stage) {
        if (Test-Path -LiteralPath $csv) { throw 'PPP stage is not fresh.' }
        $ErrorActionPreference = 'Continue'
        & 'C:/Windows/System32/curl.exe' -q -fsS --noproxy '*' --proto '=https' `
            --max-time 60 --output $csv -- $url
        $curlExit = $LASTEXITCODE
        $ErrorActionPreference = 'Stop'
        if ($curlExit -ne 0) { throw "Pinned anonymous curl exit: $curlExit" }
    }

    # Hash the Git blob header and payload without invoking Git configuration.
    $bytes = [IO.File]::ReadAllBytes($csv)
    $header = [Text.Encoding]::ASCII.GetBytes("blob $($bytes.Length)`0")
    $sha1 = [Security.Cryptography.SHA1]::Create()
    try { $actual = [BitConverter]::ToString($sha1.ComputeHash([byte[]]($header + $bytes))) }
    finally { $sha1.Dispose() }
    if ($actual.Replace('-','') -ne $blob) { throw 'Pinned PPP Git blob mismatch.' }
    $env:PPP_CSV_SHA = (Get-FileHash -LiteralPath $csv -Algorithm SHA256).Hash.ToLowerInvariant()
    "Verified raw PPP Git blob: $blob; SHA256: $env:PPP_CSV_SHA; bytes: $($bytes.Length)"
    "Verified staged country-list SHA256: $countrySha"
    if ($Stage) { return }

    $job = if ($Verify) { 'verify' } else { 'rebuild' }
    $log = "$bundle/$job.log"
    if ((Test-Path -LiteralPath $log) -or
        (!$Verify -and (Test-Path -LiteralPath "$scratch/store"))) {
        throw 'Refusing a second producer attempt in this run folder.'
    }
    $ErrorActionPreference = 'Continue'
    & $rscript --vanilla "$bundle/$job.R" 2>&1 |
        ForEach-Object { $_.ToString() } | Out-File -LiteralPath $log -Encoding utf8
    $result = $LASTEXITCODE
    if ($result -ne 0) { throw "PPP $job exit: $result; see $log" }
    "PPP $job exit: $result; log: $log"
} finally {
    [Environment]::SetEnvironmentVariable('PPP_CSV_SHA', $null, 'Process')
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
}
