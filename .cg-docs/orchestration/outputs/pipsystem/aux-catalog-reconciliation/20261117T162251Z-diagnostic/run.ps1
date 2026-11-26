param(
    [ValidateSet('prepare','red','first','second','dossier')][string]$Mode = 'prepare',
    [ValidatePattern('^[1-9][0-9]*$')][string]$Attempt = '1'
)
$ErrorActionPreference = 'Stop'
$checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$sourceRoot = "$checkout/.tmp/one-survey/qmd-acceptance-20261113"
$scratch = "$checkout/.tmp/aux-catalog-reconciliation/20261117T162251Z-diagnostic"
$output = "$checkout/.cg-docs/orchestration/outputs/pipsystem/aux-catalog-reconciliation/20261117T162251Z-diagnostic"
. "$checkout/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $output -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree "$sourceRoot/r"
Assert-OneSurveyTree "$sourceRoot/library"
if (!(Test-Path -LiteralPath $output)) { throw 'Missing evidence parent' }
$previous = @{}
try {
    # Set initial process caches before invoking preparation cmdlets.
    $initial = @{
        TEMP=$output; TMP=$output; TMPDIR=$output
        PSModuleAnalysisCachePath="$output/ps-modulecache"
    }
    foreach ($key in $initial.Keys) {
        $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        [Environment]::SetEnvironmentVariable($key,$initial[$key],'Process')
    }
    if ($Mode -eq 'prepare') {
        if (Test-Path -LiteralPath $scratch) { throw 'Preparation requires a fresh run' }
        $parent = [IO.Path]::GetDirectoryName($scratch)
        if (!(Test-Path -LiteralPath $parent)) {
            if (!(Test-Path -LiteralPath "$checkout/.tmp")) { throw 'Missing E temp parent' }
            New-Item -ItemType Directory -Path $parent | Out-Null
        }
        New-Item -ItemType Directory -Path $scratch | Out-Null
        foreach ($name in @('temp','home','cache','config','logs')) {
            New-Item -ItemType Directory -Path "$scratch/$name" | Out-Null
        }
        $originalProfile = "$sourceRoot/r/library/base/R/Rprofile"
        $originalHash = (Get-FileHash -LiteralPath $originalProfile -Algorithm SHA256).Hash
        Copy-Item -LiteralPath "$sourceRoot/r" -Destination "$scratch/r" -Recurse
        Assert-OneSurveyTree "$scratch/r" -Output
        $copiedProfile = "$scratch/r/library/base/R/Rprofile"
        $text = [IO.File]::ReadAllText($copiedProfile)
        $old = 'expected <- c(file.path(root, "library"), file.path(root, "r/library"))'
        $new = 'expected <- c(Sys.getenv("AUX_DIAG_LIBRARY"), file.path(root, "r/library"))'
        if ([regex]::Matches($text, [regex]::Escape($old)).Count -ne 1) {
            throw 'Copied startup audit does not match the reviewed hook'
        }
        [IO.File]::WriteAllText($copiedProfile, $text.Replace($old,$new),
                               [Text.UTF8Encoding]::new($false))
        if ((Get-FileHash -LiteralPath $originalProfile -Algorithm SHA256).Hash -ne $originalHash) {
            throw 'Original runtime profile changed during preparation'
        }
        $sourceExeHash = (Get-FileHash -LiteralPath "$sourceRoot/r/bin/Rscript.exe" -Algorithm SHA256).Hash
        $copyExeHash = (Get-FileHash -LiteralPath "$scratch/r/bin/Rscript.exe" -Algorithm SHA256).Hash
        if ($sourceExeHash -ne $copyExeHash) { throw 'Copied Rscript differs from source' }
        $preparation = [ordered]@{
            sourceRoot=$sourceRoot; copiedRHome="$scratch/r"
            originalProfileSha256=$originalHash
            copiedRscriptSha256=$copyExeHash; modifiedAuditLines=1
            contributedLibrary="$sourceRoot/library"
            baseLibrary="$scratch/r/library"; startupAudit="$scratch/logs/child-startup.log"
        }
        [IO.File]::WriteAllText("$output/preparation.json",
            ($preparation | ConvertTo-Json), [Text.UTF8Encoding]::new($false))
        'PASS: copied existing R home; only copied startup-audit expectation adapted.'
        return
    }
    if (!(Test-Path -LiteralPath "$scratch/r/bin/Rscript.exe")) {
        throw 'Prepare the fresh copied runtime first'
    }
    $settings = @{
        TEMP="$scratch/temp"; TMP="$scratch/temp"; TMPDIR="$scratch/temp"
        HOME="$scratch/home"; R_USER="$scratch/home"; USERPROFILE="$scratch/home"
        APPDATA="$scratch/config"; LOCALAPPDATA="$scratch/cache"
        XDG_CACHE_HOME="$scratch/cache"; XDG_CONFIG_HOME="$scratch/config"
        XDG_DATA_HOME="$scratch/home"; XDG_STATE_HOME="$scratch/logs"
        R_LIBS="$sourceRoot/library"; R_LIBS_USER='NULL'; R_LIBS_SITE='NULL'
        R_ENVIRON_USER="$scratch/config/disabled-Renviron"
        R_ENVIRON="$scratch/config/disabled-Renviron-site"
        R_PROFILE_USER="$scratch/config/disabled-Rprofile"
        R_PROFILE="$scratch/config/disabled-Rprofile-site"; R_TESTS=''
        R_HISTFILE="$scratch/logs/history"; R_DEFAULT_PACKAGES='utils,stats,methods'
        R_USER_CACHE_DIR="$scratch/cache"; R_USER_CONFIG_DIR="$scratch/config"
        R_USER_DATA_DIR="$scratch/home"; R_USER_DATA_DIR_BASE="$scratch/home"
        R_MAKEVARS_USER="$scratch/config/disabled-Makevars"
        R_MAKEVARS_SITE="$scratch/config/disabled-Makevars-site"
        RENV_PATHS_ROOT="$scratch/cache/renv"; RENV_CONFIG_AUTOLOADER_ENABLED='FALSE'
        R_PKG_CACHE_DIR="$scratch/cache/pkg"
        GIT_CONFIG_GLOBAL="$scratch/config/disabled-gitconfig"; GIT_CONFIG_NOSYSTEM='1'
        GIT_TERMINAL_PROMPT='0'; GCM_INTERACTIVE='Never'
        R_HOME="$scratch/r"; R_ARCH='/x64'
        R_SHARE_DIR="$scratch/r/share"; R_INCLUDE_DIR="$scratch/r/include"
        R_DOC_DIR="$scratch/r/doc"; R_SESSION_TMPDIR=''
        ONE_SURVEY_ROOT=$scratch; AUX_DIAG_SOURCE_ROOT=$sourceRoot
        AUX_DIAG_LIBRARY="$sourceRoot/library"; AUX_DIAG_OUTPUT=$output
        AUX_DIAG_MODE=$Mode; AUX_DIAG_ATTEMPT=$Attempt
        PIP_ROOT_DIR="$scratch/no-pipeline-root"; DLW_local_dir="$scratch/no-dlw-root"
        PSModuleAnalysisCachePath="$scratch/cache/ModuleAnalysisCache"
    }
    foreach ($key in $settings.Keys) {
        if (!$previous.ContainsKey($key)) {
            $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        }
        [Environment]::SetEnvironmentVariable($key,$settings[$key],'Process')
    }
    Assert-OneSurveyTree $scratch -Output
    $script = switch ($Mode) {
        'first' { 'create.R' }
        'dossier' { 'check-dossier.R' }
        default { 'verify.R' }
    }
    $log = "$output/$Mode-$Attempt.log"
    if (Test-Path -LiteralPath $log) { throw 'Do not overwrite an executed attempt log' }
    $ErrorActionPreference = 'Continue'
    & "$scratch/r/bin/Rscript.exe" --vanilla "$output/$script" *> $log
    $result = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    "Mode $Mode attempt $Attempt exit $result; log $log"
    if ($Mode -eq 'red') {
        if ($result -eq 0 -or ![IO.File]::ReadAllText($log).Contains(
            'Diagnostic save receipt is unavailable; creation has not run.')) {
            throw 'Red baseline did not fail for the required missing-result reason'
        }
        if (Test-Path -LiteralPath "$scratch/store-$Attempt") {
            throw 'Missing-result verifier unexpectedly initialized a store'
        }
        'Red-phase confirmed: independent verifier rejects absent save evidence.'
    } elseif ($result -ne 0) {
        throw "Required local diagnostic $Mode failed"
    }
} finally {
    foreach ($key in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($key,$previous[$key],'Process')
    }
}
