# Build the identified development input, not a release or submission archive.
$ErrorActionPreference = 'Stop'
$checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$source = 'E:/PovcalNet/01.personal/wb384996/Rpackages/stamp/.kilo/worktrees/feat-catalog-latest-reconcile-33bd6bef6c270bbc'
$manifest = "$source/.stamp-binding-source.Rcheck/green-c1-source.sha256"
$expected = '5c9fd6893d259bdf8613641fb2762ffeca40df27534d675220547d73d1ed5546'
$scratch = "$checkout/.tmp/sq1"
$rHome = 'C:/Program Files/R/R-4.5.2'
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$bundle = $PSScriptRoot

. "$checkout/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $bundle -Output
Assert-OneSurveyTree $scratch -Output
if (!(Test-Path -LiteralPath "$checkout/.tmp" -PathType Container) -or
    (Test-Path -LiteralPath $scratch)) { throw 'Expected a fresh E: scratch root' }
if ((& git -C $checkout rev-parse HEAD) -ne 'e9c71e3190f1ce88a017ae25af7c373a64c655a2' -or
    (& git -C $checkout branch --show-current) -ne 'main' -or
    (& git -C $source rev-parse HEAD) -ne 'db1b29cd248a3a6cb737c71db176ae6bd76d2a1d' -or
    (& git -C $source branch --show-current) -ne 'feat/catalog-latest-reconcile') {
    throw 'Checkout or source identity mismatch'
}
Assert-OneSurveyTree $manifest
if ((Get-FileHash -LiteralPath $manifest).Hash -ne $expected) {
    throw 'Tested source manifest fingerprint mismatch'
}
$entries = [IO.File]::ReadAllLines($manifest)
if ($entries.Count -ne 144) { throw 'Unexpected source manifest length' }

$environment = @{
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
    R_MAKEVARS_USER = "$scratch/h/absent"; R_MAKEVARS_SITE = "$scratch/h/absent"
    R_LIBS = "$scratch/l;$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_SITE = 'NULL'; R_LIBS_USER = 'NULL'; R_TESTS = ''; R_SESSION_TMPDIR = ''
    R_HOME = $rHome; R_ARCH = '/x64'
    R_SHARE_DIR = "$rHome/share"; R_INCLUDE_DIR = "$rHome/include"; R_DOC_DIR = "$rHome/doc"
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$rHome/bin/x64;C:/Windows/System32;C:/Windows"
    PSModuleAnalysisCachePath = "$scratch/c/ModuleAnalysisCache"
    RENV_PATHS_CACHE = "$scratch/c"; RENV_CONFIG_AUTOLOADER_ENABLED = 'FALSE'
    R_COVR = ''; NOT_CRAN = 'true'; CI = ''
    SQ_SCRATCH = $scratch; SQ_OUTPUT = $bundle
}
$original = @{}
foreach ($name in $environment.Keys) {
    $original[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
try {
    foreach ($name in $environment.Keys) {
        [Environment]::SetEnvironmentVariable($name, $environment[$name], 'Process')
    }
    foreach ($name in @('t','h','c','l','stamp')) {
        [IO.Directory]::CreateDirectory("$scratch/$name") | Out-Null
    }
    foreach ($entry in $entries) {
        if ($entry -cnotmatch '^([a-f0-9]{64})  ((?:R/|man/|tests/)?[A-Za-z0-9][A-Za-z0-9_./-]*)$') {
            throw 'Unexpected source manifest entry'
        }
        $hash = $Matches[1]
        $file = $Matches[2]
        if ($file.Split('/') -contains '..') { throw 'Invalid manifest path' }
        Assert-OneSurveyTree "$source/$file"
        $target = "$scratch/stamp/$file"
        [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($target)) | Out-Null
        [IO.File]::Copy("$source/$file", $target)
        if ((Get-FileHash -LiteralPath $target).Hash -ne $hash) {
            throw "Tested source byte mismatch: $file"
        }
    }
    [IO.File]::Copy($manifest, "$bundle/staged-source.sha256")
    'PASS: all 144 staged files match the reviewed source manifest.'
    Push-Location -LiteralPath $scratch
    try {
        $ErrorActionPreference = 'Continue'
        & "$rHome/bin/R.exe" CMD build --no-build-vignettes --no-manual stamp *> "$bundle/build.log"
        $build = $LASTEXITCODE
        "Build exit: $build"
        if ($build -ne 0) { throw 'Build failed; see build.log' }
        $archive = "$scratch/stamp_0.1.1.tar.gz"
        & "$rHome/bin/R.exe" CMD INSTALL --install-tests --library="$scratch/l" $archive *> "$bundle/install.log"
        $install = $LASTEXITCODE
        "Install exit: $install"
        if ($install -ne 0) { throw 'Install failed; see install.log' }
        $files = @('R/stamp.rdb', 'R/stamp.rdx', 'Meta/package.rds', 'NAMESPACE')
        $images = @($archive) + @($files | ForEach-Object { "$scratch/l/stamp/$_" })
        $rows = @($images | ForEach-Object { '{0}  {1}' -f (Get-FileHash -LiteralPath $_).Hash.ToLowerInvariant(), $_ })
        [IO.File]::WriteAllLines("$bundle/tool.sha256", [string[]]$rows)
        & "$rHome/bin/Rscript.exe" --vanilla "$bundle/test-installed.R" *> "$bundle/suite.log"
        $suite = $LASTEXITCODE
        "Suite exit: $suite"
        if ($suite -ne 0) { throw 'Installed suite did not pass; see suite.log' }
    } finally {
        Pop-Location
    }
} finally {
    foreach ($name in $original.Keys) {
        [Environment]::SetEnvironmentVariable($name, $original[$name], 'Process')
    }
    $ErrorActionPreference = 'Stop'
}
