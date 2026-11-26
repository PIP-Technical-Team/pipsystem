param([switch]$RunSharedContext)
$ErrorActionPreference = 'Stop'
$checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$bundle = "$checkout/.cg-docs/orchestration/outputs/pipsystem/retained-candidate-validation/20261117T192911Z-clean-context"
$private = "$checkout/.tmp/one-survey/qmd-acceptance-20261113"
$previous = @{}
$credential = $null
$output = $null
$childStarted = $false
try {
    # Initial launcher output is already on E:, before any child process.
    foreach ($key in @('TEMP','TMP','TMPDIR','PSModuleAnalysisCachePath')) {
        $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        $value = if ($key -eq 'PSModuleAnalysisCachePath') {
            "$bundle/module-cache"
        } else { $bundle }
        [Environment]::SetEnvironmentVariable($key,$value,'Process')
    }
    if (!(Test-Path -LiteralPath $bundle)) { throw 'Missing E launcher directory' }
    . "$checkout/experiments/one-survey/paths.ps1"
    Assert-OneSurveyTree $bundle -Output
    Assert-OneSurveyTree "$private/library"
    $mode = if ($RunSharedContext) { 'shared-context' } else { 'preflight' }
    $started = (Get-Date).ToUniversalTime().ToString('o')
    # pipfun appends a long legacy output tree: keep its local base short.
    $invocation = [guid]::NewGuid().ToString('N').Substring(0,12)
    $scratch = "$checkout/.tmp/rcv/$invocation"
    $output = "$bundle/runs/$invocation"
    Assert-OneSurveyTree $scratch -Output
    Assert-OneSurveyTree $output -Output
    if (!(Test-Path -LiteralPath "$checkout/.tmp")) { throw 'Missing E temp parent' }
    foreach ($path in @($scratch,$output)) {
        [IO.Directory]::CreateDirectory($path) | Out-Null
    }
    foreach ($name in @('temp','home','cache','config','legacy')) {
        [IO.Directory]::CreateDirectory("$scratch/$name") | Out-Null
    }
    $settings = @{
        TEMP="$scratch/temp"; TMP="$scratch/temp"; TMPDIR="$scratch/temp"
        HOME="$scratch/home"; R_USER="$scratch/home"; USERPROFILE="$scratch/home"
        APPDATA="$scratch/config"; LOCALAPPDATA="$scratch/cache"
        XDG_CACHE_HOME="$scratch/cache"; XDG_CONFIG_HOME="$scratch/config"
        XDG_DATA_HOME="$scratch/home"; XDG_STATE_HOME="$scratch/cache"
        R_USER_CACHE_DIR="$scratch/cache"; R_USER_CONFIG_DIR="$scratch/config"
        R_USER_DATA_DIR="$scratch/home"; R_USER_DATA_DIR_BASE="$scratch/home"
        R_LIBS="$private/library"; R_LIBS_USER='NULL'; R_LIBS_SITE='NULL'
        R_DEFAULT_PACKAGES='utils,stats,methods'; R_SESSION_TMPDIR=''; R_TESTS=''
        R_ENVIRON="$scratch/config/disabled-site"; R_ENVIRON_USER="$scratch/config/disabled-user"
        R_PROFILE="$scratch/config/disabled-site-profile"
        R_PROFILE_USER="$scratch/config/disabled-user-profile"
        R_HISTFILE="$scratch/cache/history"
        R_MAKEVARS_USER="$scratch/config/disabled-Makevars"
        R_MAKEVARS_SITE="$scratch/config/disabled-Makevars-site"
        RENV_CONFIG_AUTOLOADER_ENABLED='FALSE'; RENV_PATHS_ROOT="$scratch/cache/renv"
        R_PKG_CACHE_DIR="$scratch/cache/pkg"; R_HOME='C:/Program Files/R/R-4.5.2'
        R_ARCH='/x64'; R_SHARE_DIR='C:/Program Files/R/R-4.5.2/share'
        R_INCLUDE_DIR='C:/Program Files/R/R-4.5.2/include'
        R_DOC_DIR='C:/Program Files/R/R-4.5.2/doc'
        PIP_ROOT_DIR="$scratch/legacy"; DLW_local_dir="$scratch/legacy/dlw"
        GIT_CONFIG_GLOBAL="$scratch/config/disabled-gitconfig"; GIT_CONFIG_NOSYSTEM='1'
        GIT_TERMINAL_PROMPT='0'; GCM_INTERACTIVE='Never'
        GIT_TRACE=''; GIT_TRACE_CURL=''; GIT_CURL_VERBOSE=''; GCM_TRACE=''
        GH_DEBUG=''; GH_PROMPT_DISABLED='1'; GH_CACHE_DIR="$scratch/cache/gh"
        PSModuleAnalysisCachePath="$scratch/cache/ModuleAnalysisCache"
        CLEAN_SOURCE_ROOT=$private; CLEAN_RUN_ROOT=$scratch; CLEAN_OUTPUT=$output
        CLEAN_BUNDLE=$bundle
    }
    foreach ($key in $settings.Keys) {
        if (!$previous.ContainsKey($key)) {
            $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        }
        [Environment]::SetEnvironmentVariable($key,$settings[$key],'Process')
    }
    Assert-OneSurveyTree $scratch -Output
    Assert-OneSurveyTree $output -Output

    # ONLY the user's explicit live switch reaches credentials or shared setup.
    if ($RunSharedContext) {
        foreach ($key in @('GH_CONFIG_DIR','GH_PASS','GITHUB_PAT_GITHUB_COM',
                           'GH_TOKEN','GITHUB_TOKEN')) {
            $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        }
        $env:GH_TOKEN = $null
        $env:GITHUB_TOKEN = $null
        $env:GH_CONFIG_DIR = 'C:/Users/wb384996/AppData/Roaming/GitHub CLI'
        $gh = 'C:/Users/wb384996/tools/gh/gh.exe'
        if (!(Test-Path -LiteralPath $gh)) { throw 'Existing GitHub CLI unavailable; no installation attempted' }
        $credential = & $gh auth token --hostname github.com 2>$null
        if ($LASTEXITCODE -ne 0 -or !$credential) {
            throw 'Existing GitHub credential unavailable; no login or credential change attempted'
        }
        $env:GH_PASS = ($credential -join '').Trim()
        $env:GITHUB_PAT_GITHUB_COM = $env:GH_PASS
        $credential = $null
        'User-authorized mode: existing-store context setup, then read-only candidate checks.'
    }
    $log = "$output/result.log"
    $ErrorActionPreference = 'Continue'
    $childStarted = $true
    & 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe' --vanilla "$bundle/worker.R" $mode *> $log
    $result = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
    Get-Content -LiteralPath $log
    "Exit: $result; evidence: $output"
    $receipt = [ordered]@{
        mode=$mode; exit=$result; log=$log; scratch=$scratch; started=$started; pid=$PID
    }
    [IO.File]::WriteAllText("$output/process.json", ($receipt | ConvertTo-Json),
                           [Text.UTF8Encoding]::new($false))
    if ($result -ne 0) { throw "Clean $mode run failed; retain the actual output above" }
} catch {
    if ($RunSharedContext -and !$childStarted) {
        'FAIL: launcher startup; dependent candidate checks NOT RUN.'
    } elseif ($RunSharedContext -and (!$output -or
        !(Test-Path -LiteralPath "$output/candidate-results.tsv"))) {
        'No candidate result table was produced; do not infer candidate acceptance.'
    }
    throw
} finally {
    $credential = $null
    foreach ($key in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($key,$previous[$key],'Process')
    }
}
