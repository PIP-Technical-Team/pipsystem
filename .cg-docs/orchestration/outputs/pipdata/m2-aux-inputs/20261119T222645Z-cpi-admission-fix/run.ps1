param([ValidateSet('red', 'green')][string]$Stage, [string]$Attempt = '')
$ErrorActionPreference = 'Stop'
$hub = 'E:/PovcalNet/01.personal/wb384996/PIP/pipsystem'
$repo = 'E:/PovcalNet/01.personal/wb384996/PIP/pipdata'
$scratch = "$hub/.tmp/m2-cpi-admission-20261119T222645Z"
$deps = 'E:/PovcalNet/01.personal/wb384996/R/win-library'
$r = 'C:/Program Files/R/R-4.5.2/bin/Rscript.exe'
. "$hub/experiments/one-survey/paths.ps1"
Assert-OneSurveyTree $PSScriptRoot -Output
Assert-OneSurveyTree $scratch -Output
if (!(Test-Path -LiteralPath "$hub/.tmp" -PathType Container)) {
    throw 'Missing E: scratch parent'
}
foreach ($part in @('tmp', 'home', 'cache')) {
    [void][IO.Directory]::CreateDirectory("$scratch/$part")
}
if ($Attempt -notmatch '^[a-z0-9-]*$') { throw 'Invalid log suffix' }
$log = "$PSScriptRoot/$Stage$Attempt.log"
if (Test-Path -LiteralPath $log) { throw "Log already exists: $log" }
$info = New-Object Diagnostics.ProcessStartInfo
$info.FileName = $r
$info.Arguments = '--vanilla "' + "$PSScriptRoot/check.R" + '" ' + $Stage
$info.WorkingDirectory = $scratch
$info.UseShellExecute = $false
$info.RedirectStandardOutput = $true
$info.RedirectStandardError = $true
$info.EnvironmentVariables.Clear()
foreach ($name in @('SystemRoot','WINDIR','COMSPEC','PATHEXT',
                    'NUMBER_OF_PROCESSORS','PROCESSOR_ARCHITECTURE','OS')) {
    $info.EnvironmentVariables[$name] = [Environment]::GetEnvironmentVariable($name)
}
$settings = @{
    TEMP = "$scratch/tmp"; TMP = "$scratch/tmp"; TMPDIR = "$scratch/tmp"
    HOME = "$scratch/home"; R_USER = "$scratch/home"; USERPROFILE = "$scratch/home"
    HOMEDRIVE = 'E:'; HOMEPATH = $scratch.Substring(2).Replace('/','\') + '\home'
    APPDATA = "$scratch/cache"; LOCALAPPDATA = "$scratch/cache"
    XDG_CACHE_HOME = "$scratch/cache"; XDG_CONFIG_HOME = "$scratch/cache"
    XDG_DATA_HOME = "$scratch/home"; XDG_STATE_HOME = "$scratch/cache"
    R_USER_CACHE_DIR = "$scratch/cache"; R_USER_CONFIG_DIR = "$scratch/cache"
    R_USER_DATA_DIR = "$scratch/home"; R_HISTFILE = "$scratch/home/history"
    R_LIBS = "$deps/4.5-pipapi;$deps/4.5"
    R_LIBS_USER = 'NULL'; R_LIBS_SITE = 'NULL'; OTEL_SDK_DISABLED = 'true'
    PATH = "$deps/4.5-pipapi/RcppParallel/lib/x64;C:/Windows/System32;C:/Windows"
    CPI_REPO = $repo; PKGLOAD_PARENT_TEMPDIR = "$scratch/tmp"
}
foreach ($name in $settings.Keys) { $info.EnvironmentVariables[$name] = $settings[$name] }
$child = [Diagnostics.Process]::Start($info)
$out = $child.StandardOutput.ReadToEndAsync()
$err = $child.StandardError.ReadToEndAsync()
$child.WaitForExit()
$result = "Rscript --vanilla check.R $Stage`r`n" +
    $out.GetAwaiter().GetResult() + $err.GetAwaiter().GetResult() +
    "Exit: $($child.ExitCode)`r`n"
[IO.File]::WriteAllText($log, $result, (New-Object Text.UTF8Encoding($false)))
$result
if ($child.ExitCode -ne 0) { exit $child.ExitCode }
