param([ValidateSet('prepare','baseline','install','check')][string]$Mode)
$ErrorActionPreference = 'Stop'
$repo = 'E:/PovcalNet/01.personal/wb384996/PIP/pipfun'
$run = $PSScriptRoot.Replace('\','/')
$runtime = "$run/runtime"
$scratchParent = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp'
$scratch = "$scratchParent/pipfun-cache-fix-20261110T152620Z"
$prior = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem/.tmp/one-survey/20261110T125325Z-completion-green'
$tools = 'E:/PovcalNet/01.personal/wb384996/R/win-library/4.5'
if (!(Test-Path -LiteralPath $run -PathType Container)) { throw 'Missing report parent' }
# Check existing ancestry before the only bulk-copy/bootstrap operations.
foreach ($path in @($run,$prior,"$prior/r",$tools,$scratchParent)) {
    $item = Get-Item -LiteralPath $path
    while ($null -ne $item) {
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Reparse point: $($item.FullName)" }
        $item = $item.Parent
    }
}
if ($Mode -eq 'prepare') {
    if (Test-Path -LiteralPath $runtime) { throw 'Runtime exists; preserve evidence' }
    foreach ($name in @('temp','home','cache','config','logs','library','store')) {
        [IO.Directory]::CreateDirectory("$runtime/$name") | Out-Null
    }
    Copy-Item -LiteralPath "$prior/r" -Destination "$runtime/r" -Recurse
    # Use the original base profile, not the prior attempt's log-writing profile.
    Copy-Item -LiteralPath 'C:/Program Files/R/R-4.5.2/library/base/R/Rprofile' -Destination "$runtime/r/library/base/R/Rprofile" -Force
    return
}
if (!(Test-Path -LiteralPath "$runtime/r/bin/Rscript.exe")) { throw 'Prepare first' }
[IO.Directory]::CreateDirectory("$scratch/temp") | Out-Null
$settings = @{
    TEMP="$scratch/temp"; TMP="$scratch/temp"; TMPDIR="$scratch/temp"
    HOME="$runtime/home"; R_USER="$runtime/home"; USERPROFILE="$runtime/home"
    APPDATA="$runtime/config"; LOCALAPPDATA="$runtime/cache"
    XDG_CACHE_HOME="$runtime/cache"; XDG_CONFIG_HOME="$runtime/config"
    XDG_DATA_HOME="$runtime/home"; XDG_STATE_HOME="$runtime/logs"
    R_LIBS="$runtime/library;$prior/library;$tools"; R_LIBS_USER='NULL'; R_LIBS_SITE='NULL'
    R_ENVIRON_USER="$runtime/config/disabled-Renviron"; R_ENVIRON="$runtime/config/disabled-Renviron-site"
    R_PROFILE_USER="$runtime/config/disabled-Rprofile"; R_PROFILE="$runtime/config/disabled-Rprofile-site"
    R_TESTS=''; R_HISTFILE="$runtime/logs/history"; R_DEFAULT_PACKAGES='utils,stats,methods'
    R_USER_CACHE_DIR="$runtime/cache"; R_USER_CONFIG_DIR="$runtime/config"; R_USER_DATA_DIR="$runtime/home"
    R_MAKEVARS_USER="$runtime/config/disabled-Makevars"; R_MAKEVARS_SITE="$runtime/config/disabled-Makevars-site"
    PIP_ROOT_DIR="$runtime/store"; DLW_local_dir="$runtime/store/dlw"
    RENV_PATHS_ROOT="$runtime/cache/renv"; RENV_CONFIG_AUTOLOADER_ENABLED='FALSE'
    R_PKG_CACHE_DIR="$runtime/cache/pkg"; GIT_CONFIG_GLOBAL="$runtime/config/disabled-gitconfig"; GIT_CONFIG_NOSYSTEM='1'
    R_HOME="$runtime/r"; R_ARCH='/x64'; R_SHARE_DIR="$runtime/r/share"
    R_INCLUDE_DIR="$runtime/r/include"; R_DOC_DIR="$runtime/r/doc"; R_SESSION_TMPDIR=''
    PIPFUN_FIX_RUN=$run; PIPFUN_FIX_REPO=$repo
}
$previous = @{}
try {
    foreach ($key in $settings.Keys) {
        $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        [Environment]::SetEnvironmentVariable($key,$settings[$key],'Process')
    }
    $ErrorActionPreference = 'Continue'
    $log = "$runtime/logs/$Mode-$([DateTime]::UtcNow.ToString('yyyyMMddTHHmmssfffZ')).log"
    "Evidence log: $log"
    if ($Mode -eq 'install') {
        & "$runtime/r/bin/R.exe" CMD INSTALL --no-test-load "--library=$runtime/library" $repo 2>&1 | Tee-Object -FilePath $log
    } else {
        & "$runtime/r/bin/Rscript.exe" --vanilla "$run/checks.R" $Mode 2>&1 | Tee-Object -FilePath $log
    }
    $result = $LASTEXITCODE
    if ($result -ne 0) { throw "$Mode failed with exit $result" }
} finally {
    foreach ($key in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($key,$previous[$key],'Process')
    }
}
