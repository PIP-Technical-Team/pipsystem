$ErrorActionPreference = 'Stop'
$checkout = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$bundle = $PSScriptRoot
$scratch = "$checkout/.tmp/qre/$([guid]::NewGuid().ToString('N').Substring(0,12))"
$installed = 'E:/strec/r125434/full-c1/library'
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$rHome = 'C:/Program Files/R/R-4.5.2'
. "$checkout/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $bundle -Output
Assert-OneSurveyTree $scratch -Output
Assert-OneSurveyTree "$installed/stamp"
if (!(Test-Path -LiteralPath "$checkout/.tmp" -PathType Container)) { throw 'Missing scratch parent' }
foreach ($name in @('temp','home','cache','config')) {
    [IO.Directory]::CreateDirectory("$scratch/$name") | Out-Null
}
$env:TEMP = "$scratch/temp"; $env:TMP = $env:TEMP; $env:TMPDIR = $env:TEMP
$env:HOME = "$scratch/home"; $env:R_USER = $env:HOME; $env:USERPROFILE = $env:HOME
$env:APPDATA = "$scratch/config"; $env:LOCALAPPDATA = "$scratch/cache"
$env:XDG_CACHE_HOME = "$scratch/cache"; $env:XDG_CONFIG_HOME = "$scratch/config"
$env:XDG_DATA_HOME = $env:HOME; $env:XDG_STATE_HOME = "$scratch/cache"
$env:R_USER_CACHE_DIR = "$scratch/cache"; $env:R_USER_CONFIG_DIR = "$scratch/config"
$env:R_USER_DATA_DIR = $env:HOME; $env:R_HISTFILE = "$scratch/cache/history"
$env:R_PROFILE = "$scratch/config/no-profile"; $env:R_PROFILE_USER = $env:R_PROFILE
$env:R_ENVIRON = "$scratch/config/no-environ"; $env:R_ENVIRON_USER = $env:R_ENVIRON
$env:R_LIBS = "$installed;$deps/4.5-pipapi;$deps/4.5"
$env:R_LIBS_SITE = 'NULL'; $env:R_LIBS_USER = 'NULL'; $env:R_TESTS = ''
$env:R_SESSION_TMPDIR = ''; $env:R_HOME = $rHome; $env:R_ARCH = '/x64'
$env:R_SHARE_DIR = "$rHome/share"; $env:R_INCLUDE_DIR = "$rHome/include"; $env:R_DOC_DIR = "$rHome/doc"
$env:PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;$env:PATH"
$env:PSModuleAnalysisCachePath = "$scratch/cache/ModuleAnalysisCache"
$env:QRE_CHECKOUT = $checkout; $env:QRE_SCRATCH = $scratch; $env:QRE_BUNDLE = $bundle
Assert-OneSurveyTree $scratch -Output
$log = "$bundle/local-$([IO.Path]::GetFileName($scratch)).log"
$ErrorActionPreference = 'Continue'
& "$rHome/bin/Rscript.exe" --vanilla "$bundle/local-check.R" *> $log
$result = $LASTEXITCODE
"Local qualification exit $result; log: $log"
if ($result -ne 0) { throw 'Local checks failed; shared eligibility NOT RUN.' }
