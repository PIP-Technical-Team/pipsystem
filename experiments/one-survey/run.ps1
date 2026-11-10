param([ValidateSet('baseline','setup','check','inspect','forced-failure','diagnose')]
      [string]$Mode = 'check',
      [Parameter(Mandatory=$true)][ValidatePattern('^[a-zA-Z0-9-]+$')]
      [string]$RunId)
$previousPreference = $ErrorActionPreference
$previous = @{}
try {
    $ErrorActionPreference = 'Stop'
    $root = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
    $runtime = "$root/.tmp/one-survey/$RunId"
    if ((Get-Location).Path.Replace('\','/') -ne $root) { throw 'Wrong checkout' }
    . "$PSScriptRoot/paths.ps1"
    Assert-OneSurveyTree $runtime -Output
    if ($Mode -in @('baseline','setup') -and (Test-Path -LiteralPath $runtime)) {
        throw 'Attempt already exists; use a new run ID (no source/library overlays)'
    }
    if ($Mode -notin @('baseline','setup') -and !(Test-Path -LiteralPath $runtime)) {
        throw 'Missing attempt'
    }
    $original = 'C:/Program Files/R/R-4.5.2'
    # Validate every recursive copy source before creating destinations.
    if ($Mode -in @('baseline','setup')) {
        foreach ($name in @('bin','etc','include','modules','share')) { Assert-OneSurveyTree "$original/$name" }
        $basePackages = @()
        foreach ($directory in [IO.Directory]::EnumerateDirectories("$original/library")) {
            $description = "$directory/DESCRIPTION"
            if ([IO.File]::Exists($description) -and
                [IO.File]::ReadAllText($description) -match '(?m)^Priority: (base|recommended)\s*$') {
                Assert-OneSurveyTree $directory
                $basePackages += $directory
            }
        }
        if (!$basePackages.Count) { throw 'No base/recommended packages found' }
    }
    foreach ($name in @('temp','home','cache','config','logs','library','sources','store','manifest')) {
        [IO.Directory]::CreateDirectory("$runtime/$name") | Out-Null
    }
    $settings = @{
        TEMP="$runtime/temp"; TMP="$runtime/temp"; TMPDIR="$runtime/temp"
        HOME="$runtime/home"; R_USER="$runtime/home"; USERPROFILE="$runtime/home"
        APPDATA="$runtime/config"; LOCALAPPDATA="$runtime/cache"
        XDG_CACHE_HOME="$runtime/cache"; XDG_CONFIG_HOME="$runtime/config"
        XDG_DATA_HOME="$runtime/home"; XDG_STATE_HOME="$runtime/logs"
        R_LIBS="$runtime/library"; R_LIBS_USER='NULL'; R_LIBS_SITE='NULL'
        R_ENVIRON_USER="$runtime/config/disabled-Renviron"
        R_ENVIRON="$runtime/config/disabled-Renviron-site"
        R_PROFILE_USER="$runtime/config/disabled-Rprofile"
        R_PROFILE="$runtime/config/disabled-Rprofile-site"; R_TESTS=''
        R_HISTFILE="$runtime/logs/history"; R_DEFAULT_PACKAGES='utils,stats,methods'
        R_USER_CACHE_DIR="$runtime/cache"; R_USER_CONFIG_DIR="$runtime/config"
        R_USER_DATA_DIR="$runtime/home"; R_MAKEVARS_USER="$runtime/config/disabled-Makevars"
        R_MAKEVARS_SITE="$runtime/config/disabled-Makevars-site"
        PIP_ROOT_DIR="$runtime/store"; DLW_local_dir="$runtime/store/dlw"
        RENV_PATHS_ROOT="$runtime/cache/renv"; RENV_CONFIG_AUTOLOADER_ENABLED='FALSE'
        R_PKG_CACHE_DIR="$runtime/cache/pkg"; GIT_CONFIG_GLOBAL="$runtime/config/disabled-gitconfig"
        GIT_CONFIG_NOSYSTEM='1'; ONE_SURVEY_ROOT=$runtime
        R_HOME="$runtime/r"; R_ARCH='/x64'; R_USER_DATA_DIR_BASE="$runtime/home"
        R_SHARE_DIR="$runtime/r/share"; R_INCLUDE_DIR="$runtime/r/include"
        R_DOC_DIR="$runtime/r/doc"; R_SESSION_TMPDIR=''
    }
    foreach ($key in $settings.Keys) {
        $previous[$key] = [Environment]::GetEnvironmentVariable($key,'Process')
        [Environment]::SetEnvironmentVariable($key,$settings[$key],'Process')
    }
    if ($Mode -in @('baseline','setup')) {
        [IO.Directory]::CreateDirectory("$runtime/r") | Out-Null
        foreach ($name in @('bin','etc','include','modules','share')) {
            Copy-Item -LiteralPath "$original/$name" -Destination "$runtime/r/$name" -Recurse
        }
        [IO.Directory]::CreateDirectory("$runtime/r/library") | Out-Null
        foreach ($package in $basePackages) {
            Copy-Item -LiteralPath $package -Destination "$runtime/r/library" -Recurse
        }
        # Only this private copy changes: audit every real R child before resolution.
        $profile = "$runtime/r/library/base/R/Rprofile"
        [IO.File]::AppendAllText($profile, @'

local({
  root <- Sys.getenv("ONE_SURVEY_ROOT")
  expected <- c(file.path(root, "library"), file.path(root, "r/library"))
  actual <- normalizePath(.libPaths(), winslash = "/", mustWork = TRUE)
  cat("pid=", Sys.getpid(), " args=", paste(commandArgs(), collapse=" | "),
      " libraries=", paste(actual, collapse=" | "), "\n",
      file=file.path(root, "logs/child-startup.log"), append=TRUE)
  # INSTALL prepends 00LOCK-*/00new under the dedicated library for staging.
  stopifnot(all(tolower(actual) %in% tolower(expected) |
    startsWith(tolower(actual), paste0(tolower(expected[1L]), "/"))),
    tolower(actual[length(actual)]) == tolower(expected[2L]))
  options(pipfun.log.auto = FALSE, pipfun.verbose = FALSE)
})
'@)
    }
    $ErrorActionPreference = 'Continue'
    & "$runtime/r/bin/Rscript.exe" --vanilla "$root/experiments/one-survey/setup.R" $Mode 2>&1 |
        Tee-Object -FilePath "$runtime/logs/$Mode.log"
    $result = $LASTEXITCODE
    if ($result -ne 0) { throw "R $Mode failed with exit $result; see $runtime/logs/$Mode.log" }
} finally {
    foreach ($key in $previous.Keys) {
        [Environment]::SetEnvironmentVariable($key,$previous[$key],'Process')
    }
    $ErrorActionPreference = $previousPreference
}
